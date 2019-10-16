#======================
# 記事の登録
#======================
$in{'pk'} ||= time;

$in{'DATE'} = sprintf( "%04d%02d%02d", $in{'YY'}, $in{'MM'}, $in{'DD'} );

#-------
# 画像
#-------

for my $i (1) {

    if ( $in{"img$i-DELETE"} ) {
        unlink glob("$dir{'topics-image'}/$in{'pk'}/img$i.*");
    }

    if ( $in_bin{"img$i"} ) {
        mkdirs("$dir{'topics-image'}/$in{'pk'}");
        unlink glob("$dir{'topics-image'}/$in{'pk'}/img$i.*");
        my $ext = ( split( /\./, $in{"img$i"} ) )[-1];

        my_open( OUT, ">$dir{'topics-image'}/$in{'pk'}/img$i.$ext" );
        binmode OUT;
        print OUT $in_bin{"img$i"};
        my_close(OUT);
        $in{"img$i"} = "img$i.$ext";
    }
}

# 保存
my %topics;
hash_IO( \%topics, "$dir{'db'}/topics/$in{'pk'}.dat", 'e' );
%topics = ( %topics, %in );
hash_IO( \%topics, ">$dir{'db'}/topics/$in{'pk'}.dat" );

#------------------------
# 検索インデックス更新
#------------------------
my %koukai;
hash_IO( \%koukai, "$dir{'db'}/topics/koukai.ini", 'e' );

if ( $topics{'MODE'} eq '公開' ) {
    $koukai{"$in{'pk'}"} = $topics{'DATE'};
}
elsif ( $topics{'MODE'} eq '非公開' ) {
    delete $koukai{"$in{'pk'}"};
}
hash_IO( \%koukai, ">$dir{'db'}/topics/koukai.ini" );


# news/index.htmlの書き換え
{
	my %koukai;
	hash_IO( \%koukai, "$dir{'db'}/topics/koukai.ini", 'e' );
	my @koukai_key = keys %koukai;
	
	for my $key (@koukai_key){
	    my %topics;
	    hash_IO( \%topics, "$dir{'db'}/topics/$key.dat", 'e' );
	    push( @topics, \%topics );
	
	}
	@topics = sort { $b->{'DATE'} <=> $a->{'DATE'} or $b->{'pk'} <=> $a->{'pk'} } @topics;
	my $new_list;

	$new_list .=qq|<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">\n|;
	$new_list .=qq|<html>\n|;
	$new_list .=qq|<head>\n|;
	$new_list .=qq|<meta http-equiv="content-type" content="text/html;charset=Shift_JIS">\n|;
	$new_list .=qq|<link href="/_common/style_news.css" rel="stylesheet" type="text/css" media="all" />\n|;
	$new_list .=qq|<title>株式会社 ショーゼン：NEWS＆TOPICS</title>\n|;
	$new_list .=qq|</head>\n|;
	$new_list .=qq|<body bgcolor="#ffffff">\n|;
	$new_list .=qq|<table class="news" width="330" border="0" cellspacing="0" cellpadding="0">\n|;
	
	for my $topics (@topics[0..9]) {
        next if( $topics eq '' );
        my %topics = HTML_escape($topics);
        
        $new_list .=qq|<tr>\n|;
        $new_list .=qq|  <td valign="top">$topics{'YY'}.$topics{'MM'}.$topics{'DD'}　</td>\n|;
        if( $topics{'URL'} ) {
	        $new_list .=qq|  <td><A href="$topics{'URL'}" target="_blank">$topics{'TITLE'}</A></td>\n|;
        }elsif( $topics{'COMMENT'} ){
	        $new_list .=qq|  <td><A href="#" onclick="window.open('../cgi-bin/topics/index.cgi?c=zoom&pk=$topics{'pk'}','','resizable=0,toolbar=0,menubar=0,scrollbars=1');">$topics{'TITLE'}</A></td>\n|;
        }
        $new_list .=qq|</tr>\n|;
	}
	
	$new_list .=qq|</table>\n|;
	$new_list .=qq|</body>\n|;
	$new_list .=qq|</html>\n|;

    jcode::convert( \$new_list, 'sjis', 'euc' );
	my $path = "$dir{'htdocs'}/news/index.html";
	my_open (FILE, ">$path");
	print FILE $new_list;
	my_close(FILE);
	chmod 0666,$path;
}


#----------------------
# HTML出力
#----------------------
$HTML             = './_mini.htm';
$replace{'title'} = '記事';
$replace{'html'}  = <<EOF;
<SCRIPT language="JavaScript">
<!--
window.opener.location.reload(true);
window.parent.close();
// -->
</SCRIPT>
EOF
1;

