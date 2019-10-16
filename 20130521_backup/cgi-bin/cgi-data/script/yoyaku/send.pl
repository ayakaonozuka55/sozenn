#------------------
# 入力内容の正規化
#------------------
$in{'sid'} =~ tr/0-9a-zA-Z//cd;

exe( '' ) if( $in{'sid'} eq '' );
# セッション切れのとき
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
# リクエストNOの処理
#---------------------
my $NO;
{
	# 総合カウント
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
# プラン情報の取得
my %yoyaku;
hash_IO( \%yoyaku ,"$dir{'db'}/yoyaku/$sid{'yoyaku_pk'}.dat", 'e' );
my $yoyaku_name = $yoyaku{'NAME'};
my $yoyaku_no   = $yoyaku{'NO'};

# --------------
# 管理者へのﾒｰﾙ
# --------------
$mail{'to'}      = 'webmaster@shozen.com';
$mail{'from'}    = $sid{'MAIL'};
$mail{'subject'} = '団体貸切バス旅行プラン予約リクエスト';
$mail{'body'}    = <<EOF ;                       # >
ホームページから団体貸切バス旅行プランの予約リクエストがありました。
──────────────────────────────
【内容】
プラン名：$yoyaku_name
プランNO：$yoyaku_no

■お名前　：$sid{'NAME'}
■ふりがな：$sid{'FURI'}
■団体名　：$sid{'DANTAI_NAME'}
■TEL　　 ：$sid{'TEL'}
■Email　 ：$sid{'MAIL'}
■ご住所　：$sid{'ADDRESS'}
■人数　　：$sid{'NINZUU'}
■ご希望乗車場所
　$sid{'KIBOU_BASYO'}
■ご希望日：$sid{'KIBOU_DATE'}
■お問い合わせ事項
　$sid{'TOIAWASE'}
──────────────────────────────
EOF

require "$dir{'script'}/Send_Mail.pl";
Send_Mail();

#--------------
#お客様へのﾒｰﾙ
#--------------
$mail{'to'}      = $sid{'MAIL'};
$mail{'from'}    = 'webmaster@shozen.com';
$mail{'subject'} = '団体貸切バス旅行プラン予約リクエストありがとうございました';
$mail{'body'}    = <<EOF ;                # >
$sid{'NAME'}　様
この度は、団体貸切バス旅行プランのご予約リクエストをいただき、誠にありがとうございます。
この返信メールが届いた時点ではご予約の確定ではございません。
こちらからの予約の結果をもちまして確定とさせていただきますことを予めご了承下さい。


予約の結果が届きお申込いただく際は
「ご旅行条件書」を必ずご覧下さい。http://www.shozen.com/agreement.pdf


下記内容がお申込内容となります。ご確認下さい。
──────────────────────────────
【内容
プラン名：$yoyaku_name
プランNO：$yoyaku_no

■お名前　：$sid{'NAME'}
■ふりがな：$sid{'FURI'}
■団体名　：$sid{'DANTAI_NAME'}
■TEL　　 ：$sid{'TEL'}
■Email　 ：$sid{'MAIL'}
■ご住所　：$sid{'ADDRESS'}
■人数　　：$sid{'NINZUU'}
■ご希望乗車場所
　$sid{'KIBOU_BASYO'}
■ご希望日：$sid{'KIBOU_DATE'}
■お問い合わせ事項
　$sid{'TOIAWASE'}

上記内容はご予約時に必要となりますので大切に保管してください。

──────────────────────────────
予約の結果を担当者よりメールにてご連絡差し上げますので、お待ちくださいませ。【基本、平日２．３日程度(※土日祝祭日を挟む場合は通常よりご連絡が遅くなる場合がございます。)】

何らかの障害で連絡がなかった場合は、誠にお手数ですが、
再度下記までご連絡くださいますようお願いいたします。

株式会社　ショーゼン　〒656-2154 兵庫県淡路市木曽下162番地の3
TEL：0799-62-6826　FAX：0799-62-6827 Email：kanko-bus\@shozen.com
EOF

require "$dir{'script'}/Send_Mail.pl";
Send_Mail();

# # 一時ファイルの削除
rmtree "$dir{'db'}/tmp/yoyaku/$in{'sid'}";

$replace{'yoyaku_no'} = $NO;
$HTML = './_thanks.htm';
1;










# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# 新規ID発行用ｶｳﾝﾀ
# new_ID( ｶｳﾝﾀｱﾄﾞﾚｽ ,ｶｳﾝﾀ名 , ﾓｰﾄﾞ );
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

