#======================
# �����κ������
#======================
if( $in{'pk'} ) {
	unlink "$dir{'db'}/category/$in{'pk'}.dat";
	
	# ��Ϣ���Υĥ�������κ��
	for my $yoyaku (glob("$dir{'db'}/yoyaku/*.dat")) {
		%yoyaku_data;
	    hash_IO( \%yoyaku_data, $yoyaku, 'e' );
	    next if( $yoyaku_data{'pk'} eq '' );
	    if( $yoyaku_data{'CATEGORY_pk'} eq $in{'pk'} ) {
	    	unlink "$dir{'db'}/yoyaku/$yoyaku_data{'pk'}.dat";
	    }
	}
}


#----------------------
# HTML����
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
