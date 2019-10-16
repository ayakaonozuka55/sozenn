#--------------------
# 詳細ページ
#--------------------
$in{'sk'} =~ tr/0-9//cd;

my %yoyaku;
hash_IO( \%yoyaku ,"$dir{'db'}/yoyaku/$in{'pk'}.dat", 'e' );


# 画像
my $img_list;
for my $i (1..3) {
    my @cgi_image = glob("$dir{'cgi-image'}/$yoyaku{'pk'}/img$i.*");
    if ( $cgi_image[0] ) {
        my $img = imgTag( $cgi_image[0], 216, '' ); # 216 162
        $img_list.=qq|<div class="photo">$img</div>|;
    }
}
if ( !$img_list ) {
    	$img_list=qq|<div class="photo"><IMG src="../../yoyaku/img/no_img.gif" width="216" border="0"></div>|;
}

# 行程表
my $KOUTEI_list;
my $list;
my $yado_list;
for my $i ( 1 .. 10 ) {
	next if( $yoyaku{"KOUTEI$i"} eq '' );
	$list.=qq|<tr>\n|;
	$list.=qq|  <th align="center">$i</th>\n|;
	$list.=qq|  <td valign="top">$yoyaku{"KOUTEI$i"}<br />\n|; # @{[norm_br( $yoyaku{"KOUTEI$i"} )]}
	$list.=qq|  </td>\n|;
	$list.=qq|  <td align="center">\n|;
	if( $yoyaku{"SYOKUJI$i"}=~/朝/ ) {
		$list.=qq|  朝<br />\n|;
	}else {
		$list.=qq|  -<br />\n|;
	}
	if( $yoyaku{"SYOKUJI$i"}=~/昼/ ) {
		$list.=qq|  昼<br />\n|;
	}else {
		$list.=qq|  -<br />\n|;
	}
	if( $yoyaku{"SYOKUJI$i"}=~/夕/ ) {
		$list.=qq|  夕<br />\n|;
	}else {
		$list.=qq|  -<br />\n|;
	}
	$list.=qq|  </td>\n|;
    $list.=qq|</tr>|;
    
    if( $yoyaku{"YADO$i"} ne '' ) {
	    $yado_list .=qq|■お宿/$i日目　$yoyaku{"YADO$i"}<br />\n|;
    }
    
}

%replace = %yoyaku;
# $replace{'HONBUN'} = norm_br( $replace{'HONBUN'} );
# $replace{'SYUPATU_SYUKUHAKU'} = norm_br( $replace{'SYUPATU_SYUKUHAKU'} );
# $replace{'RYOUKIN'} = norm_br( $replace{'RYOUKIN'} );
my $start_date = qq|$replace{'START_YY'}年$replace{'START_MM'}月$replace{'START_DD'}日|;
my $end_date =qq|$replace{'END_YY'}年$replace{'END_MM'}月$replace{'END_DD'}日|;

$end_date =~s/$replace{'START_YY'}年$replace{'START_MM'}月//;
$end_date =~s/$replace{'START_YY'}年//;

$replace{'KIKAN'} = qq|$start_date 〜 $end_date|;
$replace{'NINZUU'} .='人' if( $replace{'NINZUU'} );
# $replace{'IMG'} = $img;
$replace{'KOUTEI_LIST'} = $list;

$replace{'yoyaku_date'} = $yoyaku{'SHIMEKIRI_DATE'};
$replace{'now_date'} = &YY . &MM . &DD;
$replace{'YADO_LIST'} = $yado_list;
$replace{'IMG_LIST'} =$img_list;

#----------------------
# HTML出力
#----------------------
$HTML = '_zoom.htm';
1;
