#------------------
# �������Ƥ�������
#------------------
$in{'sid'} =~ tr/0-9a-zA-Z//cd;

# ���å�����ڤ�ΤȤ�
if ( !-e "$dir{'db'}/tmp/mitsumori/$in{'sid'}.dat" ) {
    exe('');
    return 1;
}
if( $in{'.back'} ) {
    exe('');
	return 1;
}

my %sid;
hash_IO( \%sid, "$dir{'db'}/tmp/mitsumori/$in{'sid'}.dat" );

my $type;
$type = qq|�緿58�;衡����������49�ʡ����9�ʢ�$sid{'type1'}��\n| if( $sid{'type1'} );
$type .= qq|�緿53�;衡����������45�ʡ����8�ʢ� $sid{'type2'}��\n| if( $sid{'type2'} );
$type .= qq|�緿28�;衡����������28�ʡ�����ʥ��� $sid{'type3'}��\n| if( $sid{'type3'} );
$type .= qq|�淿40�;衡����������33�ʡ����7�ʢ� $sid{'type4'}��\n| if( $sid{'type4'} );
$type .= qq|����25�;衡����������25�ʡ�����ʥ���$sid{'type5'}��\n| if( $sid{'type5'} );
$type .= qq|����23�;衡����������18�ʡ����5�ʢ� $sid{'type6'}��\n| if( $sid{'type6'} );

# ����
$sid{'SHITUMON'}    ||='----';
$sid{'MAN'}         ||='--';
$sid{'WOMAN'}       ||='--';
$sid{'CHILD'}       ||='--';
$sid{'JITAKU_JUSYO'}||='----';
$sid{'KAISYA_JUSYO'}||='----';
$sid{'JITAKU_TEL'}  ||='----';
$sid{'KEITAI_TEL'}  ||='----';
$sid{'KAISYA_TEL'}  ||='----';

# ����
$sid{'LUNCH_YOSAN_START'}||='----';
$sid{'LUNCH_YOSAN_END'}  ||='----';
$sid{'STAY_YOSAN_START'} ||='----';
$sid{'STAY_YOSAN_END'}   ||='----';
$sid{'STAY_TYPE'}        ||='----';
$sid{'OPTION'}           ||='----';
$sid{'CHUUI'}            ||='----';



# ---------------
# �����ԤؤΎҎ���1 
# ---------------
$mail{'to'}      = 'kobayashi.iz@wintec.ne.jp';
$mail{'from'}    = $sid{'MAIL'};
$mail{'subject'} = '[������ҥ��硼����]�����Ѥ���մ�λ��';
$mail{'body'}    = <<EOF ;                    # >
�ף�⥵���Ȥ���θ��Ѥ����Ǥ���
��������������������������������������������
�������Ѵ�˾��
ʿ��$sid{'YY'}ǯ$sid{'START_MM'}��$sid{'START_DD'}����$sid{'END_MM'}��$sid{'END_DD'}��

�����Ѥ����
$sid{'SYURUI'}

������
$sid{'NITTEI'}

������̾
$sid{'DANTAI_NAME'}$sid{'DANTAI_NULL'}

����ɽ�Ԥ�̾��
$sid{'DAIHYOU_NAME'}����

������
�ʼ����$sid{'JITAKU_JUSYO'}
�ʲ�ҡ�$sid{'KAISYA_JUSYO'}

�������ֹ�
�ʼ����$sid{'JITAKU_TEL'}
�ʷ��ӡ�$sid{'KEITAI_TEL'}
�ʲ�ҡ�$sid{'KAISYA_TEL'}

��FAX�ֹ�
$sid{'FAX'}

��e-mail���ɥ쥹
$sid{'MAIL'}

���Х�������
$type

����ȯ���
��ꡡ$sid{'BASYO'}
��ȯ���$sid{'START_TIME'}��������������$sid{'END_TIME'}����

����Ū��
$sid{'MOKUTEKICHI'}

���Х�������
$sid{'GUIDE'}

��ι����Ū
$sid{'MOKUTEKI'}��$sid{'MOKUTEKI_SONOTA'}

�������ѿͰ�
�����$sid{'TOTAL'}��
��������$sid{'MAN'}��
��������$sid{'WOMAN'}��
���͡���$sid{'CHILD'}��

��Ϣ��������Ϥ�����ʤ�
$sid{'SHITUMON'}
��������������������������������������������
�����Ҥˤ��뿩��������μ��ۤ򤴴�˾������
�����뿩�������������Τ�ͽ��
$sid{'LUNCH_YOSAN_START'}�ߡ�$sid{'LUNCH_YOSAN_END'}�ߤ��餤�ޤ�

����������������Τ�ͽ��
$sid{'STAY_YOSAN_START'}�ߡ�$sid{'STAY_YOSAN_END'}�ߤ��餤�ޤ�

���ɥ�����
$sid{'STAY_TYPE'}��$sid{'STAY_SONOTA'}

�����ץ����
$sid{'OPTION'}��$sid{'OPTION_SONOTA'}

������¾���ۻ�����ջ�����
$sid{'CHUUI'}
��������������������������������������������
EOF

require "$dir{'script'}/Send_Mail.pl";
Send_Mail();

# ---------------
# �����ԤؤΎҎ���2 
# ---------------
#$mail{'to'}      = 'kobayashi.iz@wintec.ne.jp';
#$mail{'from'}    = $sid{'MAIL'};
#$mail{'subject'} = '[������ҥ��硼����]�����Ѥ���մ�λ��';
#$mail{'body'}    = <<EOF ;                    # >
#�ף�⥵���Ȥ���θ��Ѥ����Ǥ���
#��������������������������������������������
#�������Ѵ�˾��
#ʿ��$sid{'YY'}ǯ$sid{'START_MM'}��$sid{'START_DD'}����$sid{'END_MM'}��$sid{'END_DD'}��
#
#�����Ѥ����
#$sid{'SYURUI'}
#
#������
#$sid{'NITTEI'}
#
#������̾
#$sid{'DANTAI_NAME'}$sid{'DANTAI_NULL'}
#
#����ɽ�Ԥ�̾��
#$sid{'DAIHYOU_NAME'}����
#
#������
#�ʼ����$sid{'JITAKU_JUSYO'}
#�ʲ�ҡ�$sid{'KAISYA_JUSYO'}
#
#�������ֹ�
#�ʼ����$sid{'JITAKU_TEL'}
#�ʷ��ӡ�$sid{'KEITAI_TEL'}
#�ʲ�ҡ�$sid{'KAISYA_TEL'}
#
#��FAX�ֹ�
#$sid{'FAX'}
#
#��e-mail���ɥ쥹
#$sid{'MAIL'}
#
#���Х�������
#$type
#
#����ȯ���
#��ꡡ$sid{'BASYO'}
#��ȯ���$sid{'START_TIME'}��������������$sid{'END_TIME'}����
#
#����Ū��
#$sid{'MOKUTEKICHI'}
#
#���Х�������
#$sid{'GUIDE'}
#
#��ι����Ū
#$sid{'MOKUTEKI'}��$sid{'MOKUTEKI_SONOTA'}
#
#�������ѿͰ�
#�����$sid{'TOTAL'}��
#��������$sid{'MAN'}��
#��������$sid{'WOMAN'}��
#���͡���$sid{'CHILD'}��
#
#��Ϣ��������Ϥ�����ʤ�
#$sid{'SHITUMON'}
#��������������������������������������������
#�����Ҥˤ��뿩��������μ��ۤ򤴴�˾������
#�����뿩�������������Τ�ͽ��
#$sid{'LUNCH_YOSAN_START'}�ߡ�$sid{'LUNCH_YOSAN_END'}�ߤ��餤�ޤ�
#
#����������������Τ�ͽ��
#$sid{'STAY_YOSAN_START'}�ߡ�$sid{'STAY_YOSAN_END'}�ߤ��餤�ޤ�
#
#���ɥ�����
#$sid{'STAY_TYPE'}��$sid{'STAY_SONOTA'}
#
#�����ץ����
#$sid{'OPTION'}��$sid{'OPTION_SONOTA'}
#
#������¾���ۻ�����ջ�����
#$sid{'CHUUI'}
#��������������������������������������������
#EOF
 #
#Send_Mail();

# ----------------
# �����ͤؤΎҎ���
# ----------------
$mail{'to'}      = $sid{'MAIL'};
$mail{'from'}    = 'kobayashi.iz@wintec.ne.jp'; # 
$mail{'subject'} = '[������ҥ��硼����]�����Ѥꤴ���ꤢ�꤬�Ȥ��������ޤ�';

$mail{'body'} = <<EOF ;    # >

�����٤Ϥ����Ѥ����򤤤����������ˤ��꤬�Ȥ��������ޤ���������ˤ�Ϣ�������ޤ��ΤǤ��Ԥ����������ޤ���
��������������������������������������������
�������Ѵ�˾��
ʿ��$sid{'YY'}ǯ$sid{'START_MM'}��$sid{'START_DD'}����$sid{'END_MM'}��$sid{'END_DD'}��

�����Ѥ����
$sid{'SYURUI'}

������
$sid{'NITTEI'}

������̾
$sid{'DANTAI_NAME'}$sid{'DANTAI_NULL'}

����ɽ�Ԥ�̾��
$sid{'DAIHYOU_NAME'}����

������
�ʼ����$sid{'JITAKU_JUSYO'}
�ʲ�ҡ�$sid{'KAISYA_JUSYO'}

�������ֹ�
�ʼ����$sid{'JITAKU_TEL'}
�ʷ��ӡ�$sid{'KEITAI_TEL'}
�ʲ�ҡ�$sid{'KAISYA_TEL'}

��FAX�ֹ�
$sid{'FAX'}

��e-mail���ɥ쥹
$sid{'MAIL'}

���Х�������
$type

����ȯ���
��ꡡ$sid{'BASYO'}
��ȯ���$sid{'START_TIME'}��������������$sid{'END_TIME'}����

����Ū��
$sid{'MOKUTEKICHI'}

���Х�������
$sid{'GUIDE'}

��ι����Ū
$sid{'MOKUTEKI'}��$sid{'MOKUTEKI_SONOTA'}

�������ѿͰ�
�����$sid{'TOTAL'}��
��������$sid{'MAN'}��
��������$sid{'WOMAN'}��
���͡���$sid{'CHILD'}��

��Ϣ��������Ϥ�����ʤ�
$sid{'SHITUMON'}
��������������������������������������������
�����Ҥˤ��뿩��������μ��ۤ򤴴�˾������
�����뿩�������������Τ�ͽ��
$sid{'LUNCH_YOSAN_START'}�ߡ�$sid{'LUNCH_YOSAN_END'}�ߤ��餤�ޤ�

����������������Τ�ͽ��
$sid{'STAY_YOSAN_START'}�ߡ�$sid{'STAY_YOSAN_END'}�ߤ��餤�ޤ�

���ɥ�����
$sid{'STAY_TYPE'}��$sid{'STAY_SONOTA'}

�����ץ����
$sid{'OPTION'}��$sid{'OPTION_SONOTA'}

������¾���ۻ�����ջ�����
$sid{'CHUUI'}
��������������������������������������������

==================================
������ҥ��硼����
==================================

EOF

Send_Mail();

# ------------------------------------------------------- #

# ����ե�����κ��
unlink "$dir{'db'}/tmp/mitsumori/$in{'sid'}.dat";

print "Content-Type: text/html\n\n";
print &template('./_thanks.htm');
exit;

1;
