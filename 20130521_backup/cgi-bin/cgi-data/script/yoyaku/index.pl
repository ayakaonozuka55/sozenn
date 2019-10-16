#--------------------
# ツアー一覧ページ
#--------------------

# カテゴリ絞込み検索
my (@category);
for my $category ( glob("$dir{'db'}/category/*.dat") ) {
    my %category;
    hash_IO( \%category, "$category", 'e' );
    push( @category, \%category );
}

# pkの降順で並び替え
@category = sort { $b->{'pk'} <=> $a->{'pk'} } @category;

{    # カテゴリのプルダウン作成
    my ( @pk, @text );
    for my $category (@category) {
        my %category = HTML_escape($category);
        push( @pk,   $category{'pk'} );
        push( @text, $category{'NAME'} );
    }
    $replace{'CATEGORY-select'} = '<SELECT NAME="c_pk" onChange="this.form.submit();">' . form_option( $in{'c_pk'}, [ '', @pk ], [ 'ご覧になりたい旅行プランをお選びください', @text ] );    # --全てのカテゴリ--
}

# 記事
my %koukai;
hash_IO( \%koukai, "$dir{'db'}/yoyaku/koukai.ini", 'e' );
my @koukai_key = keys %koukai;
my %cat_yoyaku_list;# 仮想配列用のハッシュ

# 締切日チェック
my $today = &YY.&MM.&DD;

for my $yoyaku_pk (@koukai_key) {
    my %yoyaku;
    hash_IO( \%yoyaku, "$dir{'db'}/yoyaku/$yoyaku_pk.dat", 'e' );
	# カテゴリ絞込みの場合
    if( $in{'c_pk'} ) {
    	next if( $in{'c_pk'} ne $yoyaku{'CATEGORY_pk'} );
    }
    
    # カテゴリ別の仮想配列にデータをためる
    $cat_yoyaku_list{ $yoyaku{'CATEGORY_pk'} } ||= []; # 仮想配列の初期化
    push( @{ $cat_yoyaku_list{ $yoyaku{'CATEGORY_pk'} } }, \%yoyaku );
}

my $list;
for my $category (@category) {
    next if ( !exists $cat_yoyaku_list{ $category->{'pk'} } ); # 配列を持たないカテゴリは無視
	
	# カテゴリ絞込みの場合
	if( $in{'c_pk'} ) {
		next if( $category->{'pk'} ne $in{'c_pk'});
	}
	

    $list .= qq|<h4>$category->{'NAME'}</h4>\n|;

    my @yoyaku = @{ $cat_yoyaku_list{ $category->{'pk'} } }; # 仮想配列からデリファレンス

	# SHIMEKIRI_DATEの昇順で予約データを呼び出し        sort { $a->{'SHIMEKIRI_DATE'} <=> $b->{'SHIMEKIRI_DATE'} } @yoyaku
    for my $yoyaku ( sort { $b->{'pk'} <=> $a->{'pk'} } @yoyaku ) {

        # 画像
        my $img;
        for my $i (1) {
            my @cgi_image = glob("$dir{'cgi-image'}/$yoyaku->{'pk'}/img$i.*");
            if ( $cgi_image[0] ) {
                $img = imgTag_pimg( $cgi_image[0], 160, '' );
            }else {
            	$img =qq|<IMG src="../../yoyaku/img/no_img.gif" width="160" height="120" border="0" class="pimg">|;
            }
            
        }

        $list .= qq|<div class="plan_midashi">$yoyaku->{'NAME'}</div>\n|;
        $list .= qq|<div class="plan">\n|;
        $list .= $img;
        $list .= qq|$yoyaku->{'HONBUN'}<br class="bc" />\n|;  # @{[norm_br( $yoyaku->{'HONBUN'} )]}
        $list .= qq|$yoyaku->{'SYUPATU_SYUKUHAKU'}\n|; # @{[norm_br( $yoyaku->{'SYUPATU_SYUKUHAKU'} )]}
        $list .= qq|<p class="dbtn"><a href="?c=zoom&pk=$yoyaku->{'pk'}"><img src="../../yoyaku/img/btn_detail.jpg" alt="詳細を見る"></a></p>\n|; # @{[norm_br( $yoyaku->{'SYUPATU_SYUKUHAKU'} )]}

        $list .= qq|</div>\n|;
    }
}

$list ||=qq|<div align="center" style="font-size:12px"><BR><BR>該当データはありません</div><BR><BR>|;

#----------------------
# HTML出力
#----------------------
$HTML = '_index.htm';
$replace{'LIST'} = $list;
1;


# ($IMG_TAG)=imgTag($path,$width_max,$height_max,$opt);
sub imgTag_pimg {
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
        :                     qq|<IMG src="$path" width="$w" height="$h" border="0" class="pimg">|;
}
