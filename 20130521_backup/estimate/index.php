<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ja" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html;charset=Shift_JIS">
<meta http-equiv="Content-Language" content="ja" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta name ="description" content="株式会社ショーゼンは安全、正確な輸送に徹しお客様に信頼される輸送サービスを提供します" />
<meta name ="keywords"  content="ショーゼン,貸切バス,団体ツアー,貨物輸送,観光バス,物流倉庫,ツアー,引越し,淡路,花バス" />
<meta name ="copyright" content="Copyright copy; Shozen Co,. Ltd. All Rights Reserved." />
<title>株式会社 ショーゼン：引越見積り依頼フォーム</title>
<link href="../_common/style.css" rel="stylesheet" type="text/css" media="all" />
<link rev="made" href="mailto:webmaster@shozen.com" />
<link rel="start" href="index.html" />
<link rel="next" href="company/" />
</head>
<a name="top"></a>
<body class="other">
<!-- ■■空の背景ここから■■ -->
<div id="wrapper_other">
	<!-- ■■ヘッダー部分ここから■■ -->
	<div id="header">
 	<h1><img src="../_common/img/logo_01.gif" alt="SHOZEN" width="86" height="73"></h1>
		<div class="right">
 			<div class="description">
 			株式会社 ショーゼン：貨物輸送・物流倉庫・観光貸切バス・国内旅行業・引越し 
 		</div>
 	<!-- ■■トップのメニュー部分ここから■■ -->
 		<div id="menu_s">
		<?php
require("../_common/menu_s.txt");
?>
	</div>
	<!-- /■■トップのメニュー部分ここまで■■ --><br />
	<h2><img src="../_common/img/logo_02.gif" alt="株式会社ショーゼン" width="203" height="23"></h2>
	</div>
	<div class="down">
	<img src="../_common/img/titleimg_02.jpg" alt="" width="308" height="52"><img src="../_common/img/titleimg_03.jpg" alt="" width="442" height="52">
	</div>
	</div>
	<!-- /■■ヘッダー部分ここまで■■ -->
	<!-- ■■コンテンツ部分の影ここから■■-->
	<div id="contents">
	<!-- ■■コンテンツ部分ここから■■-->
	<div id="contents_01">
	<!-- ■■左のメニュー部分ここから■■-->
	<div class="left">
	<div id="menu">
		<div class="h">
		<?php
		require("../_common/menu.txt");
		?><br />
<p class="l5 normal">
引越しに関するお問合せ<br />
TEL：0799-62-6828<br />
FAX：0799-62-6827<br /></p>
<p class="l5 small">Email：<a href="mailto:buturyu@shozen.com">buturyu@shozen.com</a></p></div>
	</div>
	</div>
	<!-- /■■左のメニュー部分ここまで■■-->
	<!-- ■■ページ右部分ここから■■-->
	<div class="right">
	<div class="block">
	<!-- ■■カテゴリ名ここから■■-->
	<h3><img src="img/title.gif" alt="引越し見積り依頼　estimate request form" width="528" height="30"></h3>
	<!-- /■■カテゴリ名ここまで■■-->
	<!-- ■■ショーゼン・ツアーここから■■-->
<p>トラックの稼働状況、お荷物の種類によってはご希望に添えない場合もございます。</p><br />
<form action="postmail.cgi" method="POST">
<input type=hidden name="need" value="お引越ご依頼希望日 現在のご住所 お名前 現在のお電話番号 Emailアドレス 確認Emailアドレス 家族構成 現在の住宅区分 現住所のエレベーター 現在の道路状況 玄関以外から搬入したお荷物 移転先のご住所 移転先のお電話番号 移転先の住宅区分 移転先のエレベータ 移転先の道路状況 お荷物情報">
<input type=hidden name="match" value="Emailアドレス 確認Emailアドレス">
		<table class="form" width="550" border="0" cellspacing="2" cellpadding="0">
			<tr>
				<td class="l" width="150">お引越ご依頼希望日　<span class="must">*</span></td>
				<td class="r"><input class="textarea" type="text" name="お引越ご依頼希望日" value="年" size="4" border="0">年　<input class="textarea" type="text" name="お引越ご依頼希望日" value="月" size="4" border="0">月　<input class="textarea" type="text" name="お引越ご依頼希望日" value="日" size="4" border="0">日</td>
			</tr>
		</table>
		<br>
		<table class="form" width="550" border="0" cellspacing="2" cellpadding="0">
			<tr height="20">
				<td class="title" colspan="2" height="20"><b>現住所情報</b></td>
			</tr>
			<tr>
				<td class="l" width="130">ご住所　<span class="must">*</span></td>
				<td class="r"><textarea class="textarea" name="現在のご住所" rows="3" cols="53"></textarea></td>
			</tr>
			<tr>
				<td class="l" width="130">お名前　<span class="must">*</span></td>
				<td class="r"><input class="textarea" type="text" name="お名前" size="50" border="0"></td>
			</tr>
			<tr>
				<td class="l" width="130">電話番号　<span class="must">*</span></td>
				<td class="r"><input class="textarea" type="text" name="現在のお電話番号" size="30" border="0"><br>
				</td>
			</tr>
			<tr>
				<td class="l" width="130">携帯など</td>
				<td class="r"><input class="textarea" type="text" name="現在の携帯番号等" size="30" border="0"></td>
			</tr>
			<tr>
				<td class="l" width="130">Emailアドレス　<span class="must">*</span></td>
				<td class="r"><input class="textarea" type="text" name="Emailアドレス" size="30" border="0"></td>
			</tr>
				<tr>
					<td class="l" width="130">Email再入力　<span class="must">*</span></td>
					<td class="r"><input class="textarea" type="text" name="確認Emailアドレス" size="30" border="0"></td>
				</tr>
				<tr>
				<td class="l" width="130">家族構成　<span class="must">*</span></td>
				<td class="r"><input type="radio" name="家族構成" value="単身" border="0">単身　<input type="radio" name="家族構成" value="家族" border="0">家族　（大人　<input class="textarea" type="text" name="大人" size="3" border="0">人　小人　<input class="textarea" type="text" name="小人" size="3" border="0">人）<br>
				</td>
			</tr>
			<tr>
				<td class="l" width="130">住宅区分　<span class="must">*</span></td>
				<td class="r"><input type="radio" name="現在の住宅区分" value="一戸建て" border="0">一戸建て　<input type="radio" name="現在の住宅区分" value="マンション" border="0">マンション　<input type="radio" name="現在の住宅区分" value="アパート" border="0">アパート　<input class="textarea" type="text" name="フロア" size="3" border="0">階　<input class="textarea" type="text" name="LDK" size="3" border="0">LDK</td>
			</tr>
				<tr>
					<td class="l" width="130">エレベーター　<span class="must">*</span></td>
					<td class="r"><input type="radio" name="現住所のエレベーター" value="有り" border="0">有り　<input type="radio" name="現住所のエレベーター" value="無し" border="0">無し<br>
					</td>
				</tr>
				<tr>
					<td class="l" width="130">道路状況　<span class="must">*</span></td>
					<td class="r"><input type="radio" name="現在の道路状況" value="玄関先まで2ｔトラックまでは入ると思う" border="0">玄関先まで2ｔトラックまでは入ると思う<br>
						<input type="radio" name="現在の道路状況" value="玄関先まで4ｔトラックまでは入ると思う" border="0">玄関先まで4ｔトラックまでは入ると思う<br>
						<input type="radio" name="現在の道路状況" value="玄関から約10ｍ以上の手運搬が必要と思う" border="0">玄関から約10ｍ以上の手運搬が必要と思う<br>
						<input type="radio" name="現在の道路状況" value="玄関から約50ｍ以上の手運搬が必要と思う" border="0">玄関から約50ｍ以上の手運搬が必要と思う<br>
						<input type="radio" name="現在の道路状況" value="良くわからない" border="0">良くわからない </td>
				</tr>
				<tr>
				<td class="l" width="130">建物状況詳細</td>
				<td class="r"><input class="textarea" type="text" name="現在の建物状況詳細" size="40" border="0"></td>
			</tr>
			<tr>
				<td class="l" width="130">玄関以外から搬入したお荷物　<span class="must">*<br>
						</span><span class="small">
					(例：○○を窓から搬入、○○をクレーンにて搬入など)</span></td>
				<td class="r"><input type="radio" name="玄関以外から搬入したお荷物" value="ある" border="0">ある　<input type="radio" name="玄関以外から搬入したお荷物" value="ない" border="0">ない<br>
						詳細　<textarea class="textarea" name="玄関以外から搬入したお荷物の詳細" rows="4" cols="42"></textarea><br>
						<span class="small">					※あるとチェックを付けられた方は必ずご記入ください。<br>
												分からない場合でも、玄関からは無理だと思われる荷物などご記入ください。</span></td>
			</tr>
		</table>
			<br>
			<table class="form" width="550" border="0" cellspacing="2" cellpadding="0">
				<tr height="20">
					<td class="title" colspan="2" height="20"><b>転移先情報</b></td>
				</tr>
				<tr>
					<td class="l" width="121">ご住所　<span class="must">*</span></td>
					<td class="r"><textarea class="textarea" name="移転先のご住所" rows="3" cols="54"></textarea></td>
				</tr>
				<tr>
					<td class="l" width="121">電話番号　<span class="must">*</span></td>
					<td class="r"><input class="textarea" type="text" name="移転先のお電話番号" size="30" border="0"><br>
					</td>
				</tr>
				<tr>
					<td class="l" width="121">住宅区分　<span class="must">*</span></td>
					<td class="r"><input type="radio" name="移転先の住宅区分" value="一戸建て" border="0">一戸建て　<input type="radio" name="移転先の住宅区分" value="マンション" border="0">マンション　<input type="radio" name="移転先の住宅区分" value="アパート" border="0">アパート　<input class="textarea" type="text" name="フロア" size="3" border="0">階　<input class="textarea" type="text" name="LDK" size="3" border="0">LDK</td>
				</tr>
				<tr>
					<td class="l" width="121">エレベーター　<span class="must">*</span></td>
					<td class="r"><input type="radio" name="移転先のエレベータ" value="有り" border="0">有り　<input type="radio" name="移転先のエレベータ" value="無し" border="0">無し<br>
					</td>
				</tr>
				<tr>
					<td class="l" width="121">道路状況　<span class="must">*</span></td>
					<td class="r"><input type="radio" name="移転先の道路状況" value="玄関先まで2ｔトラックまでは入ると思う" border="0">玄関先まで2ｔトラックまでは入ると思う<br>
						<input type="radio" name="移転先の道路状況" value="玄関先まで4ｔトラックまでは入ると思う" border="0">玄関先まで4ｔトラックまでは入ると思う<br>
						<input type="radio" name="移転先の道路状況" value="玄関から約10ｍ以上の手運搬が必要と思う" border="0">玄関から約10ｍ以上の手運搬が必要と思う<br>
						<input type="radio" name="移転先の道路状況" value="玄関から約50ｍ以上の手運搬が必要と思う" border="0">玄関から約50ｍ以上の手運搬が必要と思う<br>
						<input type="radio" name="移転先の道路状況" value="良くわからない" border="0">良くわからない </td>
				</tr>
				<tr>
					<td class="l" width="121">建物状況詳細</td>
					<td class="r"><input class="textarea" type="text" name="移転先の建物状況詳細" size="40" border="0"></td>
				</tr>
			</table>
			<br>
			<table class="form" width="550" border="0" cellspacing="2" cellpadding="0">
				<tr height="20">
					<td class="title" height="20"><b>お荷物情報<span class="small">　（タンス２個　ベッド２個　など、出来るだけ詳しくご記入ください。）</span></b>　<span class="must">*</span></td>
				</tr>
				<tr>
					<td class="r"><textarea class="textarea" name="お荷物情報" rows="4" cols="72"></textarea></td>
				</tr>
			</table>
			<br>
			<table class="form" width="550" border="0" cellspacing="2" cellpadding="0">
				<tr height="20">
					<td class="title" height="20"><b>その他ご連絡事項、引越時の注意点など</b></td>
				</tr>
				<tr>
					<td class="r"><textarea class="textarea" name="その他ご連絡事項、引越時の注意点など" rows="4" cols="72"></textarea></td>
				</tr>
			</table>
			<table width="546" border="0" cellspacing="6" cellpadding="0">
			<tr>
				<td class="center" align="center">以上でよろしければ、送信ボタンを押してください。<br>
						ご送信いただきましたのち、担当者よりお電話にてご連絡いたします。</td>
			</tr>
			<tr>
				<td class="center" align="center"><input type=submit value="送信する">　<input type=reset value="リセット"></td>
			</tr>
			<tr>
				<td class="center" align="center">ご記入された内容は、他に公開することは絶対にございません。<br>
					注：お急ぎの方はお電話にてお問い合わせください。</td>
			</tr>
		</table>
		</form>
<!--■■ショーゼン・ツアーここまで■■-->
	<div class="gototop"><a href="#top">▲ページTOPへ</a></div>
	</div>
	</div>
<!-- ■■ページ右部分ここまで■■-->
<div id="footer">
株式会社　ショーゼン　〒656-2154　兵庫県淡路市木曽下162番地の3　TEL：0799-62-6888　FAX：0799-62-6827　Email：webmaster@shozen.com
</div>
<!-- ■■フッターここまで■■-->
</div>
<!-- ■■コンテンツ部分ここまで■■ -->
</div>
<!-- ■■コンテンツ部分の影ここまで■■ -->
</div>
<div id="copy">
Copyright (C) 2007shozen Co,. Ltd. All Rights Reserved.
</div>
</div>
<!-- /■■空の背景ここまで■■ -->
</body>
</html>