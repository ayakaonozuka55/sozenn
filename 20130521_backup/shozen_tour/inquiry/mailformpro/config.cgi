## 2011-01-19 mailform pro Ver.2.x.x config file

##UTF-8モード (0:通常 / 1:日本語以外対応)
$config{'utf8'} = 0;

##vCardを有効にする(0:無効 / 1:有効)
$config{"vCard"} = 0;

##vCardをSJISにする(0:無効 / 1:有効)
$config{"vCard_sjis"} = 0;

##スクリプトのURL / ※基本的にここは変更しなくてOKです
$config{"url"} = 'http://' . $ENV{'SERVER_NAME'} . $ENV{'SCRIPT_NAME'};

##リファラードメインチェック / ドメインチェックをしない場合は行頭に半角＃を入れてください
$config{"domain"} = $ENV{'HTTP_HOST'};

##全文英語のスパム候補を除外(1:除外 / 0:除外しない)
$config{"english_spam"} = 0;

##リンク系スパム候補を除外(0:除外 / 1:除外しない)
$config{"link_spam"} = 0;

##sendmailのパス
$config{"sendmail"} = '/usr/lib/sendmail';
#$config{"sendmail"} = 'C:\sendmail\sendmail.exe';

##フォームからの送信先 設定したほうの先頭の#を削除してください
# ひとつの場合 
#@mailto = ('xxxxx@example.jp');
# 複数の場合 (シングルクォートでくくったメールアドレスをカンマで区切って指定)
@mailto = ('webmaster@shozen.com','sekiguchi@butlers.jp');

##フォームからの差出人
$config{"mailfrom"} = $mailto[0];

##フォームの差出人名
$config{"fromname"} = 'ショーゼン観光バス';

##サンクスページのURL(URLかsend.cgiから見た相対パス)
$config{"thanks_url"} = '../thanks.php';

##サンクスページに通し番号を渡す(1:ON / 0:OFF)
$config{"thanks_serial"} = 1;

##入力時間の平均時間をHTMLに表示する場合の書式
$config{"input_time_format"} = '<p>このフォームの入力にはおおよそ <strong><avg></strong> 程度掛かります。</p>';

##自動返信メールに通し番号を付けるかどうか(1:つける / 0:つけない)
$config{"return_subject_serial"} = 1;

##通し番号に日付を付けるかどうか(1:つける / 0:つけない)
$config{"return_subject_serial_date"} = 1;

##ログファイル(CSV)のパス
#$config{"log_file"} = 'postlog.csv.cgi';

##ログファイル(CSV)のダウンロードパスワード
#$config{"password"} = 'password';

##ログファイル(CSV)の自由整形
#$config{'CSVexport'} = 'export.csv.cgi';


##送信有効期限 ※有効期限を設定する場合はエラーページを用意して下さい。
##期限の書式は YYYY-MM-DD HH:MM:SS です。
##受付開始日時
#$config{"expires_break"} = '2009-01-22 06:21:00';
##受付終了日時
#$config{"expires"} = '2009-03-22 06:30:00';

##送信有効期限をHTMLに表示する場合の書式
$config{"expires_time_format"} = '<p class="expires">このフォームは <strong><expires></strong> で締め切りとさせて頂きます。</p>';
$config{"expires_time_timeout"} = '<p class="expires">このフォームの送信は <expires> で既に締め切りました。</p>';
$config{"expires_time_break"} = '<p class="expires">このフォームからのご応募は <expires> から開始いたします。</p>';

##送信数制限 ※送信数制限を設定する場合はエラーページを用意して下さい。
#$config{"limit"} = 100;

##送信数制限をHTMLに表示する場合の書式
$config{"limit_format"} = '<p class="limit">残り応募数はあと <strong><limit></strong> 枠です。</p>';
$config{"limit_over"} = '<p class="limit"><strong>このフォームの応募数を超えました。</strong></p>';

##エラーページURL
#$config{"error_url"} = 'http://cgi.synck.com/mailform/pro2.0.0/error.html';

##設置者に届くメールの件名
$config{"subject"} = 'ショーゼン観光バスからのお問い合わせ';

##設置者に届くメールの本文整形 / 自動生成の場合 NULL / 特殊整形文字 <resbody>:送信内容一式 / <date>:日付 / <serial>:通し番号 / <input_time>:入力秒
$config{"posted_body"} = <<'__posted_body__';
<date>
お問い合せフォームより以下のメールを受付ました。
──────────────────────────
受付番号：<serial>
入力時間：<input_time>
確認時間：<confirm_time>
　送信元：<http_referer>
<resbody>
──────────────────────────

─IP Traking data ─────────────────
<iplogs>
──────────────────────────

━━━━━━━━━━━━━━━━━━━━━━━━━━
株式会社ショーゼン

〒656-2154
兵庫県淡路市木曽下162-3
TEL：0799-62-6888
FAX：0799-62-6827
http://www.shozen.com/
━━━━━━━━━━━━━━━━━━━━━━━━━━
__posted_body__

##送信者に届く自動返信メールの件名
$config{"return_subject"} = 'お問い合せありがとうございました';

##送信者に届く自動返信メールの本文 / 特殊整形文字 <resbody>:送信内容一式 / <date>:日付 / <serial>:通し番号 / <input_time>:入力秒
$config{"return_body"} = <<'__return_body__';
<姓> 様
──────────────────────────

この度はお問い合せ頂き誠にありがとうございました。
改めて担当者よりご連絡をさせていただきます。

─ご送信内容の確認─────────────────
受付番号：<serial>
<resbody>
──────────────────────────

このメールに心当たりの無い場合は、お手数ですが
下記連絡先までお問い合わせください。

この度はお問い合わせ重ねてお礼申し上げます。

━━━━━━━━━━━━━━━━━━━━━━━━━━
株式会社ショーゼン

〒656-2154
兵庫県淡路市木曽下162-3
TEL：0799-62-6888
FAX：0799-62-6827
http://www.shozen.com/
━━━━━━━━━━━━━━━━━━━━━━━━━━
__return_body__

##件名につける通し番号用ファイル
$config{"serial_file"} = 'serial.dat';

##入力時間の合計を記憶するファイル
$config{"input_time_file"} = 'time.dat';

##コンバージョンレート算出用ログファイル
$config{"conversion_file"} = 'unique.dat';

## SQL Export
#$config{'SQLserver'} = 'DBI:mysql:mfp2:localhost';
#$config{'SQLuser'} = 'mfp';
#$config{'SQLpasswd'} = 'mfppassword';

## IP Tracking File
#$config{'iplogs'} = '../iplogs/iplogs.dat.cgi';

## SMTP Sending
#$config{'SMTPserver'} = 'smtp.example.com';

## POP before SMTP
#$config{'POPserver'} = 'pop.example.com';
#$config{'POPuser'} = 'username';
#$config{'POPpasswd'} = 'password';

if($config{'utf8'}){
	use MIME::Base64;
	$config{'charset'} = 'UTF-8';
}
else {
	$config{'charset'} = 'ISO-2022-JP';
}
