#--------------------
# 詳細ページ
#--------------------
$in{'pk'} =~ tr/0-9//cd;
my %topics;
hash_IO( \%topics ,"$dir{'db'}/topics/$in{'pk'}.dat", 'e' );


# 画像
my $img;
for my $i (1) {
    my @cgi_image = glob("$dir{'cgi-image'}/$topics{'pk'}/img$i.*");
    if ( $cgi_image[0] ) {
        $img = imgTag( $cgi_image[0], 300, '' );
    }
}
my $img_list;
if( $img ) {
	$img_list.=qq|<TR>\n|;
	$img_list.=qq|  <TD align="center">\n|;
	$img_list.=qq|  <DIV align="center">$img</DIV>\n|;
	$img_list.=qq|  </TD>\n|;
	$img_list.=qq|</TR>\n|;
}


%replace = %topics;
$replace{'COMMENT'} = norm_br( $replace{'COMMENT'} );
$replace{'IMG'} = $img_list;

#----------------------
# HTML出力
#----------------------
$HTML = '_zoom.htm';
1;
