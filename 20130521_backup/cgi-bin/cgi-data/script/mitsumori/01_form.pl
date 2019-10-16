#=========================
# お問い合わせフォーム
#=========================
#------------------
# 入力内容の正規化
#------------------
$in{'sid'} =~ tr/0-9a-zA-Z//cd;

# 古いリストの削除
cleanFile( "$dir{'db'}/tmp/mitsumori", 60 * 60 * 24 );

my %sid;
hash_IO( \%sid, "$dir{'db'}/tmp/mitsumori/$in{'sid'}.dat", 'e' );
$sid{'sid'} ||= time . rand_str(3);

#------------------
# 一時ファイル作成
#------------------
hash_IO( \%sid, ">$dir{'db'}/tmp/mitsumori/$sid{'sid'}.dat" ) if ( !-e "$dir{'db'}/tmp/mitsumori/$sid{'sid'}.dat" );

%replace = HTML_escape( \%sid );

# 見積種類
$replace{'syurui-radio'}=radio_box('SYURUI',$sid{'SYURUI'},'貸切バスのみの見積り','貸切バスのみの見積り').qq|<BR>|;
$replace{'syurui-radio'}.=radio_box('SYURUI',$sid{'SYURUI'},'貸切バス・旅行手配見積り','貸切バス・旅行手配見積り(当社にて旅行手配希望される方)');
# 日程
$replace{'nittei-radio'}=radio_box('NITTEI',$sid{'NITTEI'},'日帰り','日帰り').qq|　|;
$replace{'nittei-radio'}.=radio_box('NITTEI',$sid{'NITTEI'},'1泊2日','1泊2日').qq|　|;
$replace{'nittei-radio'}.=radio_box('NITTEI',$sid{'NITTEI'},'2泊3日','2泊3日').qq|　|;
$replace{'nittei-radio'}.=radio_box('NITTEI',$sid{'NITTEI'},'3泊〜','3泊〜');
# 団体名 
$replace{'dantai_null-radio'}=radio_box('DANTAI_NULL',$sid{'DANTAI_NULL'},'特に必要は無い','特に必要は無い');
# バスガイド
$replace{'guide-radio'}=radio_box('GUIDE',$sid{'GUIDE'},'つける','つける').qq|　|;
$replace{'guide-radio'}.=radio_box('GUIDE',$sid{'GUIDE'},'つけない','つけない');
# 旅行目的
$replace{'mokuteki-radio'}=radio_box('MOKUTEKI',$sid{'MOKUTEKI'},'観光','観光').qq|　|;
$replace{'mokuteki-radio'}.=radio_box('MOKUTEKI',$sid{'MOKUTEKI'},'送迎','送迎').qq|　|;
$replace{'mokuteki-radio'}.=radio_box('MOKUTEKI',$sid{'MOKUTEKI'},'視察','視察').qq|　|;
$replace{'mokuteki-radio'}.=radio_box('MOKUTEKI',$sid{'MOKUTEKI'},'その他','その他').qq|　|;
# 宿泊タイプ
$replace{'stay_type-radio'}=radio_box('STAY_TYPE',$sid{'STAY_TYPE'},'旅館','旅館').qq|　|;
$replace{'stay_type-radio'}.=radio_box('STAY_TYPE',$sid{'STAY_TYPE'},'ホテル','ホテル').qq|　|;
$replace{'stay_type-radio'}.=radio_box('STAY_TYPE',$sid{'STAY_TYPE'},'その他','その他').qq|　|;

# ボタン
{
    for my $val ( split( /,/, $sid{'OPTION'} ) ) {
        $sid{ 'OPTION-' . $val } = $val;
    }
    my @OPTION = ( 'コンパニオン', 'カラオケ', '宴会場', 'その他', );
    my @rep_OPTION;
    for $i ( 0 .. $#OPTION ) {
        my $val = $OPTION[$i];
        my $tmp;
        $replace{'OPTION-select'} .= check_box( 'OPTION', $sid{"OPTION-$val"}, "$val" ) . qq|<LABEL for="OPTION-$val">$val</LABEL>&nbsp;|;
        $replace{'OPTION-select'} .= qq|<BR>| if( $val eq '宴会場' );
    }
}


$HTML = './_form.htm';

1;
