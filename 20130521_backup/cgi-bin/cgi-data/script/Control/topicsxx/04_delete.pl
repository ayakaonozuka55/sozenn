#======================
# ｵｭｻﾎｺ�ｽ�ｽ靉
#======================
unlink "$dir{'db'}/topics/$in{'pk'}.dat";
rmtree "$dir{'topics-image'}/$in{'pk'}/" if( $in{'pk'} ne '' );

my %koukai;
hash_IO ( \%koukai  ,"$dir{'db'}/topics/koukai.ini", 'e' );
delete $koukai{"$in{'pk'}"};
hash_IO ( \%koukai  ,">$dir{'db'}/topics/koukai.ini" );

# news/index.html､ﾎｽｭｴｹ､ｨ
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
	$new_list .=qq|<title>ｳｰｲﾒ ･ｷ･遑ｼ･ｼ･ｧNEWS｡OPICS</title>\n|;
	$new_list .=qq|</head>\n|;
	$new_list .=qq|<body bgcolor="#ffffff">\n|;
	$new_list .=qq|<table class="news" width="340" border="0" cellspacing="0" cellpadding="0">\n|;
	
	for my $topics (@topics[0..9]) {
        next if( $topics eq '' );
        my %topics = HTML_escape($topics);
        
        $new_list .=qq|<tr>\n|;
        $new_list .=qq|  <td valign="top">$topics{'YY'}.$topics{'MM'}.$topics{'DD'}｡｡</td>\n|;
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
# HTMLｽﾐﾎﾏ
#----------------------
$HTML='./_mini.htm';
$replace{'title'} ='';
$replace{'html'}=<<EOF;
<SCRIPT language="JavaScript">
<!--
window.opener.location.reload(true);
window.parent.close();
// -->
</SCRIPT>
EOF
1;
