#======================
# 記事の公開切替処理
#======================
my %topics;
hash_IO ( \%topics ,"$dir{'db'}/topics/$in{'pk'}.dat", 'e' );

my %koukai;
hash_IO ( \%koukai  ,"$dir{'db'}/topics/koukai.ini", 'e' );

if( $topics{'MODE'} eq '非公開' ) {
	$topics{'MODE'}='公開';
	$koukai{$in{'pk'}} =$topics{'DATE'};
}elsif( $topics{'MODE'} eq '公開' ){
	$topics{'MODE'}='非公開';
	delete $koukai{$in{'pk'}};
}
hash_IO ( \%koukai  ,">$dir{'db'}/topics/koukai.ini" );

hash_IO ( \%topics ,">$dir{'db'}/topics/$in{'pk'}.dat" );

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


my $rand_str=rand_str(20);
print_refresh(qq|./index.cgi?c=topics&sk=$in{'sk'}&$rand_str|);

1;
