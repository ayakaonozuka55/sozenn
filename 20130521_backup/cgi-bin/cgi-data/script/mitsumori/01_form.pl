#=========================
# ���䤤��碌�ե�����
#=========================
#------------------
# �������Ƥ�������
#------------------
$in{'sid'} =~ tr/0-9a-zA-Z//cd;

# �Ť��ꥹ�Ȥκ��
cleanFile( "$dir{'db'}/tmp/mitsumori", 60 * 60 * 24 );

my %sid;
hash_IO( \%sid, "$dir{'db'}/tmp/mitsumori/$in{'sid'}.dat", 'e' );
$sid{'sid'} ||= time . rand_str(3);

#------------------
# ����ե��������
#------------------
hash_IO( \%sid, ">$dir{'db'}/tmp/mitsumori/$sid{'sid'}.dat" ) if ( !-e "$dir{'db'}/tmp/mitsumori/$sid{'sid'}.dat" );

%replace = HTML_escape( \%sid );

# ���Ѽ���
$replace{'syurui-radio'}=radio_box('SYURUI',$sid{'SYURUI'},'���ڥХ��Τߤθ��Ѥ�','���ڥХ��Τߤθ��Ѥ�').qq|<BR>|;
$replace{'syurui-radio'}.=radio_box('SYURUI',$sid{'SYURUI'},'���ڥХ���ι�Լ��۸��Ѥ�','���ڥХ���ι�Լ��۸��Ѥ�(���Ҥˤ�ι�Լ��۴�˾�������)');
# ����
$replace{'nittei-radio'}=radio_box('NITTEI',$sid{'NITTEI'},'������','������').qq|��|;
$replace{'nittei-radio'}.=radio_box('NITTEI',$sid{'NITTEI'},'1��2��','1��2��').qq|��|;
$replace{'nittei-radio'}.=radio_box('NITTEI',$sid{'NITTEI'},'2��3��','2��3��').qq|��|;
$replace{'nittei-radio'}.=radio_box('NITTEI',$sid{'NITTEI'},'3���','3���');
# ����̾ 
$replace{'dantai_null-radio'}=radio_box('DANTAI_NULL',$sid{'DANTAI_NULL'},'�ä�ɬ�פ�̵��','�ä�ɬ�פ�̵��');
# �Х�������
$replace{'guide-radio'}=radio_box('GUIDE',$sid{'GUIDE'},'�Ĥ���','�Ĥ���').qq|��|;
$replace{'guide-radio'}.=radio_box('GUIDE',$sid{'GUIDE'},'�Ĥ��ʤ�','�Ĥ��ʤ�');
# ι����Ū
$replace{'mokuteki-radio'}=radio_box('MOKUTEKI',$sid{'MOKUTEKI'},'�Ѹ�','�Ѹ�').qq|��|;
$replace{'mokuteki-radio'}.=radio_box('MOKUTEKI',$sid{'MOKUTEKI'},'����','����').qq|��|;
$replace{'mokuteki-radio'}.=radio_box('MOKUTEKI',$sid{'MOKUTEKI'},'�뻡','�뻡').qq|��|;
$replace{'mokuteki-radio'}.=radio_box('MOKUTEKI',$sid{'MOKUTEKI'},'����¾','����¾').qq|��|;
# ���񥿥���
$replace{'stay_type-radio'}=radio_box('STAY_TYPE',$sid{'STAY_TYPE'},'ι��','ι��').qq|��|;
$replace{'stay_type-radio'}.=radio_box('STAY_TYPE',$sid{'STAY_TYPE'},'�ۥƥ�','�ۥƥ�').qq|��|;
$replace{'stay_type-radio'}.=radio_box('STAY_TYPE',$sid{'STAY_TYPE'},'����¾','����¾').qq|��|;

# �ܥ���
{
    for my $val ( split( /,/, $sid{'OPTION'} ) ) {
        $sid{ 'OPTION-' . $val } = $val;
    }
    my @OPTION = ( '����ѥ˥���', '���饪��', '����', '����¾', );
    my @rep_OPTION;
    for $i ( 0 .. $#OPTION ) {
        my $val = $OPTION[$i];
        my $tmp;
        $replace{'OPTION-select'} .= check_box( 'OPTION', $sid{"OPTION-$val"}, "$val" ) . qq|<LABEL for="OPTION-$val">$val</LABEL>&nbsp;|;
        $replace{'OPTION-select'} .= qq|<BR>| if( $val eq '����' );
    }
}


$HTML = './_form.htm';

1;
