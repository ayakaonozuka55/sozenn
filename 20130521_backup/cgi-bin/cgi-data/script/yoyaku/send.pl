#------------------
# �������Ƥ�������
#------------------
$in{'sid'} =~ tr/0-9a-zA-Z//cd;

exe( '' ) if( $in{'sid'} eq '' );
# ���å�����ڤ�ΤȤ�
if ( !-e "$dir{'db'}/tmp/yoyaku/$in{'sid'}/form.dat" ) {
    exe('');
    return 1;
}

if( $in{'.back'} ) {
	exe( 'form-1' );
	return 1;
	
}

my %sid;
hash_IO( \%sid, "$dir{'db'}/tmp/yoyaku/$in{'sid'}/form.dat" );
%sid = ( %sid, %in );
hash_IO( \%sid, ">$dir{'db'}/tmp/yoyaku/$in{'sid'}/form.dat" );


#---------------------
# �ꥯ������NO�ν���
#---------------------
my $NO;
{
	# ��祫�����
	my %count;
	hash_IO( \%count, "$dir{'db'}/yoyaku/count.ini",'-e');

	my %yoyaku_no;
	hash_IO( \%yoyaku_no, "$dir{'db'}/tmp/yoyaku/$in{'sid'}/no.dat", 'e');

	$count{'count'} ||=0;
	if( !$yoyaku_no{'no'})  {
		$count{'count'}++;
		$yoyaku_no{'no'} = $count{'count'};
		$yoyaku_no{'sid'} = $sid{'sid'};
		hash_IO( \%yoyaku_no, ">$dir{'db'}/tmp/yoyaku/$in{'sid'}/no.dat" );
		hash_IO( \%count, ">$dir{'db'}/yoyaku/count.ini" );
	}

	my %yoyaku_no;
	hash_IO( \%yoyaku_no, "$dir{'db'}/tmp/yoyaku/$in{'sid'}/no.dat");

	$NO = sprintf("%06d", $yoyaku_no{'no'});
}
# �ץ�����μ���
my %yoyaku;
hash_IO( \%yoyaku ,"$dir{'db'}/yoyaku/$sid{'yoyaku_pk'}.dat", 'e' );
my $yoyaku_name = $yoyaku{'NAME'};
my $yoyaku_no   = $yoyaku{'NO'};

# --------------
# �����ԤؤΎҎ���
# --------------
$mail{'to'}      = 'webmaster@shozen.com';
$mail{'from'}    = $sid{'MAIL'};
$mail{'subject'} = '�������ڥХ�ι�ԥץ��ͽ��ꥯ������';
$mail{'body'}    = <<EOF ;                       # >
�ۡ���ڡ��������������ڥХ�ι�ԥץ���ͽ��ꥯ�����Ȥ�����ޤ�����
������������������������������������������������������������
�����ơ�
�ץ��̾��$yoyaku_name
�ץ��NO��$yoyaku_no

����̾������$sid{'NAME'}
���դ꤬�ʡ�$sid{'FURI'}
������̾����$sid{'DANTAI_NAME'}
��TEL���� ��$sid{'TEL'}
��Email�� ��$sid{'MAIL'}
�������ꡡ��$sid{'ADDRESS'}
���Ϳ�������$sid{'NINZUU'}
������˾��־��
��$sid{'KIBOU_BASYO'}
������˾����$sid{'KIBOU_DATE'}
�����䤤��碌����
��$sid{'TOIAWASE'}
������������������������������������������������������������
EOF

require "$dir{'script'}/Send_Mail.pl";
Send_Mail();

#--------------
#�����ͤؤΎҎ���
#--------------
$mail{'to'}      = $sid{'MAIL'};
$mail{'from'}    = 'webmaster@shozen.com';
$mail{'subject'} = '�������ڥХ�ι�ԥץ��ͽ��ꥯ�����Ȥ��꤬�Ȥ��������ޤ���';
$mail{'body'}    = <<EOF ;                # >
$sid{'NAME'}����
�����٤ϡ��������ڥХ�ι�ԥץ��Τ�ͽ��ꥯ�����Ȥ򤤤����������ˤ��꤬�Ȥ��������ޤ���
�����ֿ��᡼�뤬�Ϥ��������ǤϤ�ͽ��γ���ǤϤ������ޤ���
�����餫���ͽ��η�̤����ޤ��Ƴ���Ȥ����Ƥ��������ޤ����Ȥ�ͽ�ᤴλ����������


ͽ��η�̤��Ϥ����������������ݤ�
�֤�ι�Ծ���פ�ɬ��������������http://www.shozen.com/agreement.pdf


�������Ƥ����������ƤȤʤ�ޤ�������ǧ��������
������������������������������������������������������������
������
�ץ��̾��$yoyaku_name
�ץ��NO��$yoyaku_no

����̾������$sid{'NAME'}
���դ꤬�ʡ�$sid{'FURI'}
������̾����$sid{'DANTAI_NAME'}
��TEL���� ��$sid{'TEL'}
��Email�� ��$sid{'MAIL'}
�������ꡡ��$sid{'ADDRESS'}
���Ϳ�������$sid{'NINZUU'}
������˾��־��
��$sid{'KIBOU_BASYO'}
������˾����$sid{'KIBOU_DATE'}
�����䤤��碌����
��$sid{'TOIAWASE'}

�嵭���ƤϤ�ͽ�����ɬ�פȤʤ�ޤ��Τ����ڤ��ݴɤ��Ƥ���������

������������������������������������������������������������
ͽ��η�̤�ô���Ԥ��᡼��ˤƤ�Ϣ�����夲�ޤ��Τǡ����Ԥ����������ޤ����ڴ��ܡ�ʿ��������������(�������˺����򶴤�����̾��ꤴϢ���٤��ʤ��礬�������ޤ���)��

���餫�ξ㳲��Ϣ���ʤ��ä����ϡ����ˤ�����Ǥ�����
���ٲ����ޤǤ�Ϣ���������ޤ��褦���ꤤ�������ޤ���

������ҡ����硼���󡡢�656-2154 ʼ�˸�øϩ��������162���Ϥ�3
TEL��0799-62-6826��FAX��0799-62-6827 Email��kanko-bus\@shozen.com
EOF

require "$dir{'script'}/Send_Mail.pl";
Send_Mail();

# # ����ե�����κ��
rmtree "$dir{'db'}/tmp/yoyaku/$in{'sid'}";

$replace{'yoyaku_no'} = $NO;
$HTML = './_thanks.htm';
1;










# ��������������������������������������������������������������
# ����IDȯ���ю����ݎ�
# new_ID( �����ݎ����Ďގڎ� ,�����ݎ�̾ , �ӎ��Ď� );
# $in{'id'} = new_ID("$dir{'db'}/counter.ini",'member');
sub new_ID {
	my ($path,$name,$mode)=@_;
	my %counter;
	hash_IO ( \%counter ,$path, 'e' );
	return $counter{$name} if( $mode=~/c/ );
	$counter{$name}++;
	hash_IO ( \%counter ,">$path" );
	sprintf("%06d",$counter{$name} )
}

