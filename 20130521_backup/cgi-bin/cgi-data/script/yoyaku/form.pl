#=====================
# ��������ե�����
#=====================
exe('') if ( $in{'pk'}  eq '' );
#------------------
# �������Ƥ�������
#------------------
$in{'pk'} =~ tr/0-9//cd;
$in{'sid'}=~ tr/0-9a-zA-Z//cd;

# �Ť��ꥹ�Ȥκ��
cleanDir( "$dir{'db'}/tmp/yoyaku", 60 * 60 * 24 );

my %sid;
hash_IO( \%sid ,"$dir{'db'}/tmp/yoyaku/$in{'sid'}/form.dat", 'e' );

if( $sid{'sid'} eq '' ) {
	$sid{'sid'} ||= time . rand_str(5);
	mkdirs "$dir{'db'}/tmp/yoyaku/$sid{'sid'}";
}


$sid{'yoyaku_pk'} ||= $in{'pk'};
# ����ե�����κ���
hash_IO( \%sid, ">$dir{'db'}/tmp/yoyaku/$sid{'sid'}/form.dat" ) if ( !-e "$dir{'db'}/tmp/yoyaku/$sid{'sid'}/form.dat" );

%replace = %sid;
# �ץ�����μ���
my %yoyaku;
hash_IO( \%yoyaku ,"$dir{'db'}/yoyaku/$sid{'yoyaku_pk'}.dat", 'e' );

$replace{'YOYAKU_NAME'} = $yoyaku{'NAME'};
$replace{'YOYAKU_NO'} = $yoyaku{'NO'};

#----------------------
# HTML����
#----------------------
$HTML                    = '_form.htm';
