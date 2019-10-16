#------------------
# 入力内容の正規化
#------------------
$in{'sid'} =~ tr/0-9a-zA-Z//cd;

# セッション切れのとき
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
$type = qq|大型58人乗　≪正シート49席・補助9席≫$sid{'type1'}台\n| if( $sid{'type1'} );
$type .= qq|大型53人乗　≪正シート45席・補助8席≫ $sid{'type2'}台\n| if( $sid{'type2'} );
$type .= qq|大型28人乗　≪正シート28席・補助ナシ≫ $sid{'type3'}台\n| if( $sid{'type3'} );
$type .= qq|中型40人乗　≪正シート33席・補助7席≫ $sid{'type4'}台\n| if( $sid{'type4'} );
$type .= qq|小型25人乗　≪正シート25席・補助ナシ≫$sid{'type5'}台\n| if( $sid{'type5'} );
$type .= qq|小型23人乗　≪正シート18席・補助5席≫ $sid{'type6'}台\n| if( $sid{'type6'} );

# 上部
$sid{'SHITUMON'}    ||='----';
$sid{'MAN'}         ||='--';
$sid{'WOMAN'}       ||='--';
$sid{'CHILD'}       ||='--';
$sid{'JITAKU_JUSYO'}||='----';
$sid{'KAISYA_JUSYO'}||='----';
$sid{'JITAKU_TEL'}  ||='----';
$sid{'KEITAI_TEL'}  ||='----';
$sid{'KAISYA_TEL'}  ||='----';

# 下部
$sid{'LUNCH_YOSAN_START'}||='----';
$sid{'LUNCH_YOSAN_END'}  ||='----';
$sid{'STAY_YOSAN_START'} ||='----';
$sid{'STAY_YOSAN_END'}   ||='----';
$sid{'STAY_TYPE'}        ||='----';
$sid{'OPTION'}           ||='----';
$sid{'CHUUI'}            ||='----';



# ---------------
# 管理者へのﾒｰﾙ1 
# ---------------
$mail{'to'}      = 'kobayashi.iz@wintec.ne.jp';
$mail{'from'}    = $sid{'MAIL'};
$mail{'subject'} = '[株式会社ショーゼン]お見積り受付完了。';
$mail{'body'}    = <<EOF ;                    # >
Ｗｅｂサイトからの見積り依頼です。
──────────────────────
■ご利用希望日
平成$sid{'YY'}年$sid{'START_MM'}月$sid{'START_DD'}日〜$sid{'END_MM'}月$sid{'END_DD'}日

■見積り種類
$sid{'SYURUI'}

■日程
$sid{'NITTEI'}

■団体名
$sid{'DANTAI_NAME'}$sid{'DANTAI_NULL'}

■代表者お名前
$sid{'DAIHYOU_NAME'}　様

■住所
（自宅）$sid{'JITAKU_JUSYO'}
（会社）$sid{'KAISYA_JUSYO'}

■電話番号
（自宅）$sid{'JITAKU_TEL'}
（携帯）$sid{'KEITAI_TEL'}
（会社）$sid{'KAISYA_TEL'}

■FAX番号
$sid{'FAX'}

■e-mailアドレス
$sid{'MAIL'}

■バスタイプ
$type

■出発場所
場所　$sid{'BASYO'}
出発時刻　$sid{'START_TIME'}時頃　　到着時刻　$sid{'END_TIME'}時頃

■目的地
$sid{'MOKUTEKICHI'}

■バスガイド
$sid{'GUIDE'}

■旅行目的
$sid{'MOKUTEKI'}　$sid{'MOKUTEKI_SONOTA'}

■御利用人員
合計約　$sid{'TOTAL'}人
男性　　$sid{'MAN'}人
女性　　$sid{'WOMAN'}人
小人　　$sid{'CHILD'}人

■連絡事項又はご質問など
$sid{'SHITUMON'}
──────────────────────
＜当社にて昼食、宿泊場所の手配をご希望の方＞
■ご昼食一日一人当たりのご予算
$sid{'LUNCH_YOSAN_START'}円〜$sid{'LUNCH_YOSAN_END'}円くらいまで

■ご宿泊一人当たりのご予算
$sid{'STAY_YOSAN_START'}円〜$sid{'STAY_YOSAN_END'}円くらいまで

■宿タイプ
$sid{'STAY_TYPE'}　$sid{'STAY_SONOTA'}

■オプション
$sid{'OPTION'}　$sid{'OPTION_SONOTA'}

■その他手配時の注意事項等
$sid{'CHUUI'}
──────────────────────
EOF

require "$dir{'script'}/Send_Mail.pl";
Send_Mail();

# ---------------
# 管理者へのﾒｰﾙ2 
# ---------------
#$mail{'to'}      = 'kobayashi.iz@wintec.ne.jp';
#$mail{'from'}    = $sid{'MAIL'};
#$mail{'subject'} = '[株式会社ショーゼン]お見積り受付完了。';
#$mail{'body'}    = <<EOF ;                    # >
#Ｗｅｂサイトからの見積り依頼です。
#──────────────────────
#■ご利用希望日
#平成$sid{'YY'}年$sid{'START_MM'}月$sid{'START_DD'}日〜$sid{'END_MM'}月$sid{'END_DD'}日
#
#■見積り種類
#$sid{'SYURUI'}
#
#■日程
#$sid{'NITTEI'}
#
#■団体名
#$sid{'DANTAI_NAME'}$sid{'DANTAI_NULL'}
#
#■代表者お名前
#$sid{'DAIHYOU_NAME'}　様
#
#■住所
#（自宅）$sid{'JITAKU_JUSYO'}
#（会社）$sid{'KAISYA_JUSYO'}
#
#■電話番号
#（自宅）$sid{'JITAKU_TEL'}
#（携帯）$sid{'KEITAI_TEL'}
#（会社）$sid{'KAISYA_TEL'}
#
#■FAX番号
#$sid{'FAX'}
#
#■e-mailアドレス
#$sid{'MAIL'}
#
#■バスタイプ
#$type
#
#■出発場所
#場所　$sid{'BASYO'}
#出発時刻　$sid{'START_TIME'}時頃　　到着時刻　$sid{'END_TIME'}時頃
#
#■目的地
#$sid{'MOKUTEKICHI'}
#
#■バスガイド
#$sid{'GUIDE'}
#
#■旅行目的
#$sid{'MOKUTEKI'}　$sid{'MOKUTEKI_SONOTA'}
#
#■御利用人員
#合計約　$sid{'TOTAL'}人
#男性　　$sid{'MAN'}人
#女性　　$sid{'WOMAN'}人
#小人　　$sid{'CHILD'}人
#
#■連絡事項又はご質問など
#$sid{'SHITUMON'}
#──────────────────────
#＜当社にて昼食、宿泊場所の手配をご希望の方＞
#■ご昼食一日一人当たりのご予算
#$sid{'LUNCH_YOSAN_START'}円〜$sid{'LUNCH_YOSAN_END'}円くらいまで
#
#■ご宿泊一人当たりのご予算
#$sid{'STAY_YOSAN_START'}円〜$sid{'STAY_YOSAN_END'}円くらいまで
#
#■宿タイプ
#$sid{'STAY_TYPE'}　$sid{'STAY_SONOTA'}
#
#■オプション
#$sid{'OPTION'}　$sid{'OPTION_SONOTA'}
#
#■その他手配時の注意事項等
#$sid{'CHUUI'}
#──────────────────────
#EOF
 #
#Send_Mail();

# ----------------
# お客様へのﾒｰﾙ
# ----------------
$mail{'to'}      = $sid{'MAIL'};
$mail{'from'}    = 'kobayashi.iz@wintec.ne.jp'; # 
$mail{'subject'} = '[株式会社ショーゼン]お見積りご依頼ありがとうございます';

$mail{'body'} = <<EOF ;    # >

この度はお見積り依頼をいただき、誠にありがとうございます。近日中にご連絡いたしますのでお待ちくださいませ。
──────────────────────
■ご利用希望日
平成$sid{'YY'}年$sid{'START_MM'}月$sid{'START_DD'}日〜$sid{'END_MM'}月$sid{'END_DD'}日

■見積り種類
$sid{'SYURUI'}

■日程
$sid{'NITTEI'}

■団体名
$sid{'DANTAI_NAME'}$sid{'DANTAI_NULL'}

■代表者お名前
$sid{'DAIHYOU_NAME'}　様

■住所
（自宅）$sid{'JITAKU_JUSYO'}
（会社）$sid{'KAISYA_JUSYO'}

■電話番号
（自宅）$sid{'JITAKU_TEL'}
（携帯）$sid{'KEITAI_TEL'}
（会社）$sid{'KAISYA_TEL'}

■FAX番号
$sid{'FAX'}

■e-mailアドレス
$sid{'MAIL'}

■バスタイプ
$type

■出発場所
場所　$sid{'BASYO'}
出発時刻　$sid{'START_TIME'}時頃　　到着時刻　$sid{'END_TIME'}時頃

■目的地
$sid{'MOKUTEKICHI'}

■バスガイド
$sid{'GUIDE'}

■旅行目的
$sid{'MOKUTEKI'}　$sid{'MOKUTEKI_SONOTA'}

■御利用人員
合計約　$sid{'TOTAL'}人
男性　　$sid{'MAN'}人
女性　　$sid{'WOMAN'}人
小人　　$sid{'CHILD'}人

■連絡事項又はご質問など
$sid{'SHITUMON'}
──────────────────────
＜当社にて昼食、宿泊場所の手配をご希望の方＞
■ご昼食一日一人当たりのご予算
$sid{'LUNCH_YOSAN_START'}円〜$sid{'LUNCH_YOSAN_END'}円くらいまで

■ご宿泊一人当たりのご予算
$sid{'STAY_YOSAN_START'}円〜$sid{'STAY_YOSAN_END'}円くらいまで

■宿タイプ
$sid{'STAY_TYPE'}　$sid{'STAY_SONOTA'}

■オプション
$sid{'OPTION'}　$sid{'OPTION_SONOTA'}

■その他手配時の注意事項等
$sid{'CHUUI'}
──────────────────────

==================================
株式会社ショーゼン
==================================

EOF

Send_Mail();

# ------------------------------------------------------- #

# 一時ファイルの削除
unlink "$dir{'db'}/tmp/mitsumori/$in{'sid'}.dat";

print "Content-Type: text/html\n\n";
print &template('./_thanks.htm');
exit;

1;
