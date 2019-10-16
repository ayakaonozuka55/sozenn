#======================
# 記事の登録
#======================
$in{'pk'} ||= time;

for my $i ( 1 .. 5 ) {
    $in{"SYOKUJI$i"} = join( ", ", param("SYOKUJI$i") );
}

# エラーチェック
my (@error);
push( @error, 'ツアー名が入力されていません' )   if ( $in{'NAME'} eq '' );
push( @error, 'ツアー番号が入力されていません' ) if ( $in{'NO'}   eq '' );
push( @error, '実施期間を選択してください' )
    if ( $in{'START_YY'} eq ''
    || $in{'START_MM'} eq ''
    || $in{'START_DD'} eq ''
    || $in{'END_YY'}   eq ''
    || $in{'END_MM'}   eq ''
    || $in{'END_DD'}   eq '' );
push( @error, '申込締切日を選択してください' )
    if ( $in{'SHIMEKIRI_YY'} eq '' || $in{'SHIMEKIRI_MM'} eq '' || $in{'SHIMEKIRI_DD'} eq '' );

push( @error, 'カテゴリを選択してください' ) if ( $in{'CATEGORY_pk'} eq '' );

error_back( join( "\\n", @error ) ) if (@error);

$in{'START_DATE'}     = sprintf( "%04d%02d%02d", $in{'START_YY'},     $in{'START_MM'},     $in{'START_DD'} );
$in{'END_DATE'}       = sprintf( "%04d%02d%02d", $in{'END_YY'},       $in{'END_MM'},       $in{'END_DD'} );
$in{'SHIMEKIRI_DATE'} = sprintf( "%04d%02d%02d", $in{'SHIMEKIRI_YY'}, $in{'SHIMEKIRI_MM'}, $in{'SHIMEKIRI_DD'} );

#-------
# 画像
#-------

for my $i (1..3) {

    if ( $in{"img$i-DELETE"} ) {
        unlink glob("$dir{'yoyaku-image'}/$in{'pk'}/img$i.*");
    }

    if ( $in_bin{"img$i"} ) {
        mkdirs("$dir{'yoyaku-image'}/$in{'pk'}");
        unlink glob("$dir{'yoyaku-image'}/$in{'pk'}/img$i.*");
        my $ext = ( split( /\./, $in{"img$i"} ) )[-1];

        my_open( OUT, ">$dir{'yoyaku-image'}/$in{'pk'}/img$i.$ext" );
        binmode OUT;
        print OUT $in_bin{"img$i"};
        my_close(OUT);
        $in{"img$i"} = "img$i.$ext";
    }
}

# 保存
my %yoyaku;
hash_IO( \%yoyaku, "$dir{'db'}/yoyaku/$in{'pk'}.dat", 'e' );

# 文末の<BR>を取り除く
$in{'SYUPATU_SYUKUHAKU'} =~s/\n+$//;
$in{'SYUPATU_SYUKUHAKU'} =~s/(<BR>)+$//i;

%yoyaku = ( %yoyaku, %in );
$yoyaku{'MODE'} ||= '非公開';
hash_IO( \%yoyaku, ">$dir{'db'}/yoyaku/$in{'pk'}.dat" );

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

