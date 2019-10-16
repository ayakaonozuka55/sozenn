#======================
# 記事の削除処理
#======================
unlink "$dir{'db'}/yoyaku/$in{'pk'}.dat";
rmtree "$dir{'yoyaku-image'}/$in{'pk'}/" if( $in{'pk'} ne '' );

my %koukai;
hash_IO ( \%koukai  ,"$dir{'db'}/yoyaku/koukai.ini", 'e' );
delete $koukai{"$in{'pk'}"};
hash_IO ( \%koukai  ,">$dir{'db'}/yoyaku/koukai.ini" );

#----------------------
# HTML出力
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
