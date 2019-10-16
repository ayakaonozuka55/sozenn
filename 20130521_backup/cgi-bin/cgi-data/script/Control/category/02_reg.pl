#======================
# 記事の登録
#======================
$in{'pk'} ||= time;

# エラーチェック
my ( @error );
push( @error, 'カテゴリ名を入力してください') if( $in{'NAME'} eq '' );

error_back( join( "\\n", @error ) ) if( @error ) ;


# 保存
my %category;
hash_IO( \%category, "$dir{'db'}/category/$in{'pk'}.dat", 'e' );
%category = ( %category, %in );
hash_IO( \%category, ">$dir{'db'}/category/$in{'pk'}.dat" );

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



