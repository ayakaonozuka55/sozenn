
sub exe {
    my $cmd =shift;
    die "$cmd command unknown!" if( !exists $cmd{$cmd} ) ;
    require "$dir{'script'}/$cmd{$cmd}";
#   do "$dir{'script'}/$cmd{$cmd}";
}

#------------------------------------------------------
# ($year,$mon,$day)=&Skip_day($year,$mon,$day,$stay); 
#------------------------------------------------------
sub Skip_day {
	my($year,$mon,$day,$stay)=@_;
	use Time::Local;
	my $tl= timelocal(0, 0, 0, $day, $mon-1, $year);
	$tl+=60*60*24*$stay;
	(YY($tl),MM($tl),DD($tl));
}


#-------------------
# FORM QUERY PARSE
#-------------------
# Parse();
sub Parse {
    my ($query, $key, $val);
    binmode(STDIN);
    ($ENV{'REQUEST_METHOD'} eq 'GET' )?{$query = $ENV{'QUERY_STRING'}}:
    ($ENV{'REQUEST_METHOD'} eq 'POST')?{read(STDIN, $query, $ENV{'CONTENT_LENGTH'})}:0;
    if($ENV{'CONTENT_TYPE'} =~/multipart/i) {
        my $separater=quotemeta ((split(/boundary=/, $ENV{'CONTENT_TYPE'}))[-1]);
        my @cell = split(/[-]*$separater/, $query);
        shift @cell;pop @cell;
        for (@cell){
            my ( $name,$value,$bin )= multipart_form ( $_ );
            $in{$name} .= "\0" if (defined($in{$name}));
            $value =~ s/\x0D\x0A/\n/g;
            $value =~ tr/\x0D\x0A/\n\n/;
            $in{$name} .= $value;
            $in_bin{$name}  = $bin;
        }
    }else {
        for (split(/&/, $query)){
            tr/+/ /;
            ($key, $val) = split(/=/);
            $key =~ s/%([A-Fa-f0-9][A-Fa-f0-9])/pack("H2",$1)/eg;
            $val =~ s/%([A-Fa-f0-9][A-Fa-f0-9])/pack("H2",$1)/eg;
            $val =~ s/\x0D\x0A/\n/g;
            $val =~ tr/\x0D\x0A/\n\n/;
            $in{$key} .= "\0" if (defined($in{$key}));
            $in{$key} .= $val;
        }
    }
    return (keys %in);
}
#---------------------------------------------
#  enctype="multipart/form-data"
#---------------------------------------------
sub multipart_form {
    my $str = shift;
    my ($br) =$str=~/(\s*)/sg;
    $str =~s/^$br(.*)$br$/$1/s;
    my %tmp;
    ($tmp{'head'},$tmp{'body'})=split(/$br$br/,$str,2 );
    ($tmp{'name'})  = $tmp{'head'} =~/name="(.+?)"/gi;
    ($tmp{'value'}) = $tmp{'head'} =~/filename="(.+?)"/gi;
    $tmp{'value'} ||=$tmp{'body'};
    return (@tmp{'name','value','body'});
}

#---------------------------------------------
# my @cmd_list=param('chekcbox');    # multi
#---------------------------------------------
sub param {
    my @result=split(/\0/,$in{$_[0]});
    return wantarray ?@result:$result[0];
}


#==============================================
sub Cookies {
    my ($cookie_name, $cookie_value, @values, $key, $value);
    undef %Cookies;
    my $tmp_name=shift;
    $tmp_name =~s/(\W)/'%'.uc unpack('H2', $1)/eg;
    for my $i (split(/; /,$ENV{'HTTP_COOKIE'})) {
        ($cookie_name,$cookie_value)=split(/=/,$i);
        next unless ($cookie_name eq $tmp_name);
        @values=map{s/%([0-9A-Fa-f][0-9A-Fa-f])/pack('H2', $1)/eg;$_}split(/&/,$cookie_value );
        $Cookies{$key}=$value while(($key, $value)=splice(@values,0 ,2));
        last;
    }
    %Cookies;
}

#==============================================
sub Write_Cookies {
    my($key, $value, %hash, @values, @list, %span);

    $hash{$key}=$value while(($key, $value)=splice(@_,0,2));
    $hash{'-name'} =~s/(\W)/'%'.uc unpack('H2', $1)/eg;
    ( ref($hash{'-value'}) eq 'HASH' )?map push(@values,$_,${$hash{'-value'}}{$_}),keys %{$hash{'-value'}}:
        push(@values,$hash{'-value'} );

    s/(\W)/'%'.uc unpack('H2', $1)/eg for(@values);

    map {($span{$_}) = $hash{'-expires'}=~/([+-]*\d+?)$_/ig} 'm','h','d','y';
    ($span{''}) = $hash{'-expires'}=~/^([+-]*\d+)$/ig;
    my ($sec,$min,$hour,$day,$mon,$year,$wday) = gmtime(
        time+
        $span{''}+
        $span{'m'}*60+
        $span{'h'}*60*60+
        $span{'d'}*60*60*24+
        $span{'y'}*60*60*24*365);

    $year+=1900;
    $wday=num2week(getWday($year,$mon));

    push(@list,"$hash{'-name'}=".join("&",@values));
    push(@list,"domain=$hash{'-domain'}") if($hash{'-domain'});
    push(@list,"path=$hash{'-path'}")     if($hash{'-path'});
    push(@list,sprintf("expires=%s, %02d-%s-%04d %02d:%02d:%02d GMT" ,
                      $wday,$day,num2mon($mon),$year,$hour,$min,$sec)) if($hash{'-expires'});
    push(@list,"secure")                  if($hash{'-secure'});
    print "Set-Cookie: ".join('; ',@list)."\n";
}

#==============================================
sub getWday{
    my($year,$mon,$mday)=@_;
    if($mon == 1 or $mon == 2){$year--;$mon+=12}
    int($year+int($year/4)-int($year/100)+int($year/400)+int((13*$mon+8)/5)+$mday)%7;
}

#==============================================
sub num2mon  {(qw(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec))[shift]}

#==============================================
sub num2week {(qw(Sun Mon Tue Wed Thu Fri Sat))[shift]}

#==============================================
sub getLastday{
    return ('','31','28','31','30','31','30','31','31','30','31','30','31')[$_[1]] if( $_[1] != 2 );
    return (($_[0] % 4 == 0 && $_[0] % 100 != 0) || $_[0] % 400 == 0)?29:28
}

#==============================================
sub norm_input {
    $_ = $_[0];
    s/&/&amp;/g;
    s/"/&quot;/g;# "
    s/</&lt;/g;
    s/>/&gt;/g;
    $_;
}

#==============================================
sub norm_br {
    $_ = $_[0];
    s/\x0D\x0A/<BR>/g;
    s/\x0D/<BR>/g;
    s/\x0A/<BR>/g;
    $_;
}

#==============================================
sub HTML_escape {
    my %object = %{$_[0]};
    my %replace;
    while( my($key,$val)=each %object) {
        $replace{$key} = norm_input($val);
    }
    %replace;
}

#==============================================
sub my_open {
    local(*FILE, $name) = @_;
    croak("$nameがオープンできません。") if(!open(FILE, $name));
    if(!$ENV{'WINDIR'}) {
        eval("flock(FILE, 2)");
        die("$@ - この環境では flock は使えません。") if($@)
    }
    seek(FILE, 0, 0);
}

#==============================================
sub my_close {
    local(*FILE) = @_;
    eval("flock(FILE, 8)") if(!$ENV{'WINDIR'});
    close(FILE);
}

#==============================================
sub hash_IO {
    my ( $hash,$path,$option ) =@_;
    return if( $option=~/e/ && !-e $path );

    my $path2=$path;

    if( $path=~tr/>//d ) {
        # write mode

        # check target dir
        if( !-e $path ) {
            use File::Path;
            my @dirs=split(/\//, $path);
            pop @dirs if($dirs[-1]=~/\./);
            mkpath ( join("/",@dirs) ,0,oct(777));
        }

        # execute output data
        my_open (HASH, ">$path.$$");
        binmode HASH;
        while(my ($key,$val)=each %{$hash}){
            $val=~s/(%|\s)/'%'.unpack('H2', $1)/eg;
            print HASH "$key\t$val\x0A"
        }
        my_close(HASH);

        rename "$path.$$", "$path";

        chmod 0666,$path;

    }else {
        # read mode
        my_open (HASH, $path);
        undef %{$hash};
        while (<HASH>) {
            chomp;
            my ($key,$val)=split(/\t/,$_,2);
            $val =~ s/%([0-9A-Fa-f][0-9A-Fa-f])/pack('H2', $1)/eg;
            $hash->{$key}=$val;
        }
        my_close(HASH);
    }
}

#==============================================
sub mkdirs {
    use File::Path;
    my $path=shift;
    my @dirs = split(/\//, $path);
    pop @dirs if($dirs[-1]=~/\./);
    mkpath ( join("/",@dirs) ,0,oct(777));
}

#==============================================
sub YY{(localtime(shift||time))[5]+1900}
sub MM{sprintf("%02d",(localtime(shift||time))[4]+1 )}
sub DD{sprintf("%02d",(localtime(shift||time))[3] )}
sub hh{sprintf("%02d",(localtime(shift||time))[2] )}
sub mm{sprintf("%02d",(localtime(shift||time))[1] )}
sub ss{sprintf("%02d",(localtime(shift||time))[0] )}
sub DATETIME {
    my $time =(shift||time);
    sprintf("%04d-%02d-%02d %02d:%02d:%02d",&YY($time),&MM($time),&DD($time),&hh($time),&mm($time),&ss($time));
}
sub YYMMDD {
    my $time =(shift||time);
    sprintf("%04d/%02d/%02d",&YY($time),&MM($time),&DD($time));
}
sub norm_date {
    sprintf("%04d%02d%02d",$_[0]=~/^(\d+)\D*(\d+)\D*(\d+)/ );
}

sub heisei{
	$yy-1988;
}



#==============================================
# $HTML=template('./template_path.html');
#==============================================
sub template {
    my $path = shift;
    my_open ( HTML, "$path" );
    binmode HTML if( $_[0] =~/b/ );
    my $HTML = join("",<HTML> );
    my_close( HTML );
    $HTML
}

#==============================================
# <!--%hoge%--> の置換
#==============================================
sub replace {
    while( my ($key,$val) =each %{$_[0]} ) {
        $key =quotemeta($key);
        $_[1] =~s/\<\!\-\-\%$key\%\-\-\>/$val/g;
    }
    $_[1]=~s/<\!\-\-%.*?\%\-\->//g;
    $_[1]
}

#==============================================
sub String_cut {
    my($str,$length) = @_;
    my $str2=substr($str,0,$length);

    $str2=substr($str,0,$length-1) if ($str2 =~ /\x8F$/ or $str2 =~ tr/\x8E\xA1-\xFE// % 2);
    $str2.=".." if( length $str > length $str2 );
    $str2
}

#==============================================
sub rand_str {
    my @str=(a..z,A..Z);
    my $str;
    $str .=$str[rand($#str)] for(1..$_[0]);
    return $str
}

#==============================================
# check_box ( キー,既入力値, 値 );
#==============================================
sub check_box {
    my ( $key,$the_key,$value ) =@_;
    my ( $modori );
    $value =1 if( $value eq '' );
    my $checked =($the_key eq $value )?' checked':'';
    $modori =qq|<INPUT type="checkbox" name="$key" value="$value"$checked id="$key-$value">|;
    $modori;
}

#==============================================
# radio_box ( キー, 既入力値, 値 );
#==============================================
sub radio_box {
    my ( $key,$the_key,$value,$view  ) =@_;
    my ( $modori );
    my $checked =($the_key eq $value )?' checked':'';
    $modori =qq|<INPUT type="radio" name="$key" value="$value"$checked id="$key-$value"><LABEL for="$key-$value">$view</LABEL>|;
    $modori;
}

#==============================================
# form_option( 既入力値, [value1,value2], [viee1,view2] )
#==============================================
sub form_option {
	my ( $the_key,$list_ref1,$list_ref2) =@_;
	my ( $modori );
	for my $i  ( 0..$#$list_ref1) {
		my $view = $list_ref2->[$i] || $list_ref1->[$i] || '';
		my $selected =($list_ref1->[$i] eq $the_key)?' selected':'';
		$modori .= qq|\n<OPTION value="$list_ref1->[$i]"$selected>$view</OPTION>|;
	}
	$modori.qq|\n</SELECT>|;
}
#-------------------------
# 三桁ごとにカンマを入れる
#-------------------------
sub Sanma {
    my ($num) = @_;
    my ($j,$i);
    if ($num =~ /^[-+]?\d\d\d\d+/g) {
        for ($i = pos($num) - 3, $j = $num =~ /^[-+]/; $i > $j; $i -= 3) {
            substr($num, $i, 0) = ',';
        }
    }
    $num
}
sub auto_link {
    my $str = shift;
    my $http_URL_regex=q|s?https?://[-_.!~*'()a-zA-Z0-9;/?:@&=+$,%#]+|; # ';
    my $ftp_URL_regex =q|s?ftp?://[-_.!~*'()a-zA-Z0-9;/?:@&=+$,%#]+|; # ';
    my $mail_regex =
        q{(?:[^(\040)<>@,;:".\\\\\[\]\000-\037\x80-\xff]+(?![^(\040)<>@,;:".\\\\} .
        q{\[\]\000-\037\x80-\xff])|"[^\\\\\x80-\xff\n\015"]*(?:\\\\[^\x80-\xff][} .
        q{^\\\\\x80-\xff\n\015"]*)*")(?:\.(?:[^(\040)<>@,;:".\\\\\[\]\000-\037\x} .
        q{80-\xff]+(?![^(\040)<>@,;:".\\\\\[\]\000-\037\x80-\xff])|"[^\\\\\x80-} .
        q{\xff\n\015"]*(?:\\\\[^\x80-\xff][^\\\\\x80-\xff\n\015"]*)*"))*@(?:[^(} .
        q{\040)<>@,;:".\\\\\[\]\000-\037\x80-\xff]+(?![^(\040)<>@,;:".\\\\\[\]\0} .
        q{00-\037\x80-\xff])|\[(?:[^\\\\\x80-\xff\n\015\[\]]|\\\\[^\x80-\xff])*} .
        q{\])(?:\.(?:[^(\040)<>@,;:".\\\\\[\]\000-\037\x80-\xff]+(?![^(\040)<>@,} .
        q{;:".\\\\\[\]\000-\037\x80-\xff])|\[(?:[^\\\\\x80-\xff\n\015\[\]]|\\\\[} .
        q{^\x80-\xff])*\]))*};

    $str =~ s/($http_URL_regex)/<A href="$1" target="_blank">$1<\/A>/go;
    $str =~ s/($ftp_URL_regex)/<A href="$1" target="_blank">$1<\/A>/go;
    $str =~ s/($mail_regex)/<A href="mailto:$1">$1<\/A>/go;
    return $str;
}

# TELﾘﾝｸ
$str =~ s/([0-9\(\)\-]+)/&tel_check($1)/eg;
sub tel_check {
    my ( $str )=shift;
    if( length $str <= 20 && length $str >= 10 ) {
        return qq|<A href="tel:$str">$str</A>|
    }else {
        return $str
    }
}

#========================
# URIｴｽｹｰﾌﾟ
#========================
sub URI_escape {
    my $str = shift;
    $str =~s/(\W)/'%'.unpack('H2',$1)/eg;
    $str;
}

sub GoogleSeek {
    my ($total,$seek,$turn,$a_ref)=@_;
    $seek+=$turn;

    my %a_ref;
    %a_ref=%{$a_ref} if( $a_ref );

    $a_ref{'href'}.=( $a_ref{'href'} eq '')?'?':'&';
    $a_ref{'hit_color'} ||='#A90A08';

    my $count=$seek/$turn-10;
    $count=1 if( $count < 1 );

    my @a_ref;
    for my $i ( 1..20 ) {
        my $text=$count;
        my $new_seek= ($count-1)*$turn ;

        if( $seek == $count*$turn ) {
            $text=qq|<FONT color="$a_ref{'hit_color'}">$text</FONT>| if( $a_ref{'hit_color'} ne '' );
        }else {
            if( $total <= $new_seek ) {
                last
            }elsif( ($seek*$turn + 10*$turn )==$count*$turn ) {
                last
            }else {
                $text=qq|<A href="$a_ref{'href'}sk=$new_seek"$a_ref{'option'}>$text</A>|;
            }
        }

        push( @a_ref, $text );
        $count++;

    }
    return @a_ref;
}

sub GoogleNext {
    my ($total,$seek,$turn,$a_ref)=@_;

    my %a_ref;
    %a_ref=%{$a_ref} if( $a_ref );

    $a_ref{'href'}.=( $a_ref{'href'} eq '')?'?':'&';

    my $new_seek= $seek+$turn ;

    if( $total <= $new_seek ) {
        return ;
    }else {
        $a_ref=qq|<A href="$a_ref{'href'}sk=$new_seek"$a_ref{'option'}>&gt;&gt;次の$turn件</A>|;
    }
}

sub GoogleBack {
    my ($total,$seek,$turn,$a_ref)=@_;

    my %a_ref;
    %a_ref=%{$a_ref} if( $a_ref );

    $a_ref{'href'}.=( $a_ref{'href'} eq '')?'?':'&';

    my $new_seek= $seek-$turn ;

    if( $new_seek < 0  ) { # >
        return ;
    }else {
        $a_ref=qq|<A href="$a_ref{'href'}sk=$new_seek"$a_ref{'option'}>&lt;&lt;前の$turn件</A>|;
    }
}

sub pwd {
	my @list=@_;
	for my $i (@list) {
		my($view,$link)=split(/:/,$i );
		if( $link ) {
			$i=qq|<A href="$ENV{'SCRIPT_NAME'}?$link">$view</A>|
		}else {
			$i=$view
		}
	}
	$list[-1]=qq|<B>$list[-1]</B>|;
	qq|<DIV id="pwd"> - $login{'NAME'} -|.
	join(" &gt; ",@list ).
	'</DIV>'.
	'<DIV class="lr10">　</DIV>';
}

#==============================================
sub error_back {
print "Content-Type: text/html\n\n";
print <<EOF;
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<META http-equiv="Content-Type" content="text/html; charset=EUC-JP">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>エラー</TITLE>
</HEAD>
<BODY>
<SCRIPT language="JavaScript">
<!--
	alert('$_[0]');
	history.back();
// -->
</SCRIPT>
</BODY>
</HTML>
EOF
exit;
}

sub cleanFile {
    my ( $dir, $term ) = @_;
    for my $file ( glob("$dir/*.*") ) {
        next if ( ( stat $file )[9] > ( time - $term ) );    # >
        unlink $file;
    }
}

sub Get_Category_Name {
    my ( $str )=@_;
    my $pass = "$dir{'db'}/category/$str.dat";
    my %category_tmp;
    hash_IO( \%category_tmp,$pass , 'e' );
    $get_category_name = $category_tmp{'NAME'};
    return;
}

sub print_refresh($) {
	print qq|Content-Type: text/html\n|;
	print qq|\n|;
	print qq|<HTML>\n|;
	print qq|<HEAD>\n|;
	print qq|<META http-equiv="refresh" content="0;URL=$_[0]">\n|;
	print qq|</HEAD>\n|;
	print qq|</HTML>\n|;
	exit;
}

# my( $PicWidth, $PicHeight )= GetImageSize( "xxxx.jpg" );
sub GetImageSize($) {
    my ($IMG) = shift;
    my ( $buf, $type, $format );
    my $mark   = pack( "C", 0xff );
    my $width  = -1;
    my $height = -1;

    open( IMAGESIZE, $IMG ) || return ( '', -1, -1 );
    binmode(IMAGESIZE);
    seek( IMAGESIZE, 0, 0 );
    read( IMAGESIZE, $buf, 6 );

    if ( $buf =~ /^GIF/i ) {
        read( IMAGESIZE, $buf, 2 );
        $width = unpack( "v*", $buf );
        read( IMAGESIZE, $buf, 2 );
        $height = unpack( "v*", $buf );
    }
    else {
        seek( IMAGESIZE, 0, 0 );
        read( IMAGESIZE, $buf, 2 );
        ( $buf, $type ) = unpack( "C*", $buf );
        if ( $buf == 0xFF && $type == 0xD8 ) {
            while ( read( IMAGESIZE, $buf, 1 ) ) {
                if ( ( $buf eq $mark ) && read( IMAGESIZE, $buf, 3 ) ) {
                    $type = unpack( "C*", substr( $buf, 0, 1 ) );
                    my $f_size = unpack( "n*", substr( $buf, 1, 2 ) );
                    last if ( $type == 0xD9 );
                    last if ( $type == 0xDA );
                    if ( $type == 0xC0 || $type == 0xC2 ) {
                        read( IMAGESIZE, $buf, $f_size - 2 );
                        $height = unpack( "n*", substr( $buf, 1, 2 ) );
                        $width  = unpack( "n*", substr( $buf, 3, 2 ) );
                        last if ( $format eq 'EXIF' );
                    }
                    elsif ( $type == 0xE1 ) {
                        read( IMAGESIZE, $buf, $f_size - 2 );
                        my $exif = unpack( "A4", substr( $buf, 0, 4 ) );
                        if ( $exif =~ /exif/i ) {
                            $format = 'EXIF';
                            last if ( $width > 0 && $height > 0 );
                        }
                    }
                    elsif ( $type == 0x01 || $type == 0xFF || ( $type >= 0xD0 && $type < 0xD9 ) ) {    # >
                        seek( IMAGESIZE, -2, 1 );
                    }
                    else {
                        read( IMAGESIZE, $buf, $f_size - 2 );
                    }
                }
            }
        }
    }

    close(IMAGESIZE);
    return ( $width, $height );
}

# ($IMG_TAG)=imgTag($path,$width_max,$height_max,$opt);
sub imgTag {
    my ( $path, $width, $height, $opt ) = @_;
    $width  ||= 300;
    $height ||= 300;
    my ( $w, $h ) = GetImageSize($path);
    if ( $w > $width )  { $h /= $w / $width;  $w = $width }
    if ( $h > $height ) { $w /= $h / $height; $h = $height }

    $h = int($h);
    $w = int($w);

    return wantarray ? ( $w, $h )
        : ( $opt =~ /win/ ) ? qq|<A href="$path" target="imgPreview"><IMG src="$path" width="$w" height="$h" border="0"></A>|
        :                     qq|<IMG src="$path" width="$w" height="$h" border="0">|;
}

# 古いフォルダの削除
sub cleanDir {
    my ( $dir, $term ) = @_;
    for my $my_dir ( grep {-d} glob("$dir/*") ) {
        for my $file ( sort { ( stat $b )[9] <=> ( stat $a )[9] } grep {-f} glob("$my_dir/*.*") ) {
            last if ( ( stat $file )[9] > ( time - $term ) );    # >
            rmtree $my_dir;
            last;
        }
    }
}

#=============================
# ﾌｧｲﾙ←→ｽｶﾗ
#=============================
# all_open(\$str,">$filepath");
sub all_open {
	my ( $str,$path )=@_;
	if( $path=~/>/ ) {
		my_open ( FH, "$path" );
		binmode FH;
		print FH ${$str};
		my_close( FH );
	}else {
		my_open ( FH, "$path" );
		binmode FH;
		${$str}=join("",<FH> );
		my_close( FH );
	}
return
}

#====================================
# 指定ｺﾒﾝﾄﾀｸﾞで囲まれた部分を置換
#====================================
sub areaRep {
	my ( $HTML,$target,$str )=@_;
	my @target =split(/<!--$target-->/,$HTML );
	$target[1]=$str;
	join("<!--$target-->",@target );
}

1;
