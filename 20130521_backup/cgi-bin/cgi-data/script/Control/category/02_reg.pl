#======================
# ��������Ͽ
#======================
$in{'pk'} ||= time;

# ���顼�����å�
my ( @error );
push( @error, '���ƥ���̾�����Ϥ��Ƥ�������') if( $in{'NAME'} eq '' );

error_back( join( "\\n", @error ) ) if( @error ) ;


# ��¸
my %category;
hash_IO( \%category, "$dir{'db'}/category/$in{'pk'}.dat", 'e' );
%category = ( %category, %in );
hash_IO( \%category, ">$dir{'db'}/category/$in{'pk'}.dat" );

#----------------------
# HTML����
#----------------------
$HTML             = './_mini.htm';
$replace{'title'} = '����';
$replace{'html'}  = <<EOF;
<SCRIPT language="JavaScript">
<!--
window.opener.location.reload(true);
window.parent.close();
// -->
</SCRIPT>
EOF
1;



