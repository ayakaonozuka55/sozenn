<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja" lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="content-style-type" content="text/css" />
<meta http-equiv="content-script-type" content="text/javascript" />
<meta name="description" content="株式会社ショーゼンは安全、正確な輸送に徹しお客様に信頼される輸送サービスを提供します" />
<meta name="keywords" content="ショーゼン,貸切バス,団体ツアー,貨物輸送,観光バス,物流倉庫,ツアー,引越し,淡路,花バス" />
<title>お申込み・お問い合わせ | ショーゼン観光バス</title>
<link rel="canonical" href="http://www.shozen.com/" />
<link rel="stylesheet" href="../css/import.css" type="text/css" />
<script type="text/javascript" src="../js/jquery.tools.min.js"></script>
<script type="text/javascript" src="../js/scrollsmoothly.js"></script>
<!--[if IE 6]>  
<script type="text/javascript" src="../js/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript" src="../js/lib/ie6.js"></script>
<![endif]-->
<link rel="stylesheet" href="commons/mailform.css" type="text/css" />
<script type="text/javascript" src="commons/jquery.js" charset="UTF-8"></script>
<script type="text/javascript" src="commons/mfp.lang.js" charset="UTF-8"></script>
<script type="text/javascript" src="commons/mfp.extensions.js" charset="UTF-8"></script>
<script type="text/javascript" src="commons/mailform.js" charset="UTF-8"></script>
<script type="text/javascript" src="postcodes/get.cgi?js" charset="UTF-8"></script>





</head>

<body>

<div id="wrap">

<div id="header">
<?php include "../inc/header.inc";?>
</div><!-- /header -->

<?php include "../inc/gnav.inc";?>

<div id="mainVisual">
<img src="../images/inquiry/main_visual.png" alt="お申込み・お問い合わせ" width="980" height="135" />
</div><!-- /mainVisual -->

<div id="container">

<div id="main">

<ul id="pankuzu">
<li id="home"><a href="/shozen_tour/">トップページ</a></li>
<li>お申込み・お問い合わせ</li>
</ul>

<h2>お申込み・お問い合わせ</h2>

<p class="lead">
お申込み・お問い合わせいただいたお客さまの名前、住所、電話番号、お問い合わせ内容などの個人の情報は、<br />
お客さまのご同意がない限り、お申込み・お問い合わせの対応に限って 使用いたします。<br />
お客さまの個人情報のお取り扱いの詳しいご案内は、<a href="../privacy/index.php" target="_blank">個人情報の取り扱いについてをご覧ください。</a>
</p>
<div class="inqAd">
<h4>お電話でのお申込み・お問い合わせは</h4>
<p><span>0799-62-6826</span><br />
受付時間：月曜日～土曜日 9:00～17:00</p>
</div>

<form id="mailform" name="mailform" method="post" action="mailformpro/send.cgi" onsubmit="return falsesubmit(this)" accept-charset="UTF-8">
<script type="text/javascript" src="mailformpro/include.cgi" charset="UTF-8"></script>
<noscript>
<p><input type="hidden" name="javascript_flag" value="0" /></p>
</noscript>
<div id="mailfrom_hidden_object">
<input type="submit" value="submit" />
<input type="hidden" name="must_id" value="(必須)" />
<input type="hidden" name="input_time" value="0" />
<input type="hidden" name="confirm_time" id="confirm_time" value="0" />
<input type="hidden" name="sitein_referrer" value="" />
<input type="hidden" name="mailform_confirm_mode" value="1" />
<input type="hidden" name="errorlog" id="mfp_errorlog" value="" />
</div>

<div id="mfp_phase_confirm">
<div id="mfp_phase_confirm_inner">
</div>


<!--
<div id="mfp_buttons">
<ul>
<li><input type="button" value="" id="button_mfp_cancel" onclick="mfp_send_cancel()" onkeypress="mfp_send_cancel()" onmouseover="this.style.background='url(images/mfp_cancel_over.gif)'" onmouseout="this.style.background='url(images/mfp_cancel.gif)'" /></li>
<li><input type="button" value="" id="button_mfp_send" onclick="sending()" onkeypress="sending()" onmouseover="this.style.background='url(images/mfp_send_over.gif)'" onmouseout="this.style.background='url(images/mfp_send.gif)'" /></li>
</ul>
</div>
-->


</div><!-- /mfp_phase_confirm -->

<div id="mfp_phase_1" class="mfp_phase_section">
<table border="0" cellspacing="0" cellpadding="0" class="mailform" summary="mailform main">
<tr>
<th><img src="images/mfp_must.gif" width="32" height="18" alt="必須" class="must" /> お問い合わせ種類</th>
<td>
<ol>
<li><label for="shurui01" id="shurui01_label" class="mfp"><input type="radio" name="お問い合わせ種類(必須)" id="shurui01" value="貸切バスのみの見積り" class="mfp" /> 貸切バスのみの見積り</label></li>
<li><label for="shurui02" id="shurui02_label" class="mfp"><input type="radio" name="お問い合わせ種類(必須)" id="shurui02" value="貸切バス・旅行手配見積り(当社にて旅行手配希望される方) " class="mfp" /> 貸切バス・旅行手配見積り(当社にて旅行手配希望される方) </label></li>
<li><label for="shurui03" id="shurui03_label" class="mfp"><input type="radio" name="お問い合わせ種類(必須)" id="shurui03" value="その他お問い合わせ" class="mfp" /> その他お問い合わせ</label></li>
</ol>
<div id="errormsg_お問い合わせ種類" class="mfp_err"></div>
<input type="hidden" name="お問い合わせ種類(必須)" />
</td>
</tr>
<tr>
<th>ご利用希望日</th>
<td>
平成 <input type="text" name="ご利用希望年" value="" size="4" border="0" maxlength="2" class="mfp"> 年 
<input type="text" name="始まり月～" value="" size="4" border="0" maxlength="2" class="mfp"> 月 
<input type="text" name="始まり日～" value="" size="4" border="0" maxlength="2" class="mfp"> 日 ～ 
<input type="text" name="終わり月～" value="" size="4" border="0" maxlength="2" class="mfp"> 月 
<input type="text" name="終わり日～" value="" size="4" border="0" maxlength="2" class="mfp"> 日
</td>
</tr>
<tr>
<th>日程</th>
<td>
<ul>
<li><label for="nittei01" id="nittei01_label" class="mfp"><input type="radio" name="日程" id="nittei01" value="日帰り" class="mfp" /> 日帰り</label></li>
<li><label for="nittei02" id="nittei02_label" class="mfp"><input type="radio" name="日程" id="nittei02" value="1泊2日" class="mfp" /> 1泊2日</label></li>
<li><label for="nittei03" id="nittei03_label" class="mfp"><input type="radio" name="日程" id="nittei03" value="2泊3日" class="mfp" /> 2泊3日</label></li>
<li><label for="nittei04" id="nittei04_label" class="mfp"><input type="radio" name="日程" id="nittei04" value="3泊～" class="mfp" /> 3泊～</label></li>
</ul>
<div id="errormsg_お問い合わせ種類" class="mfp_err"></div>
<input type="hidden" name="お問い合わせ種類(必須)" />
</td>
</tr>
<tr>
<th>団体名</th>
<td>
<input type="text" name="団体名" size="40" class="mfp" />
</td>
</tr>
<tr>
<th><img src="images/mfp_must.gif" width="32" height="18" alt="必須" class="must" /> お名前（代表者）</th>
<td>
姓 <input type="text" name="姓(必須)" size="15" class="mfp" />　
名 <input type="text" name="名(必須)" size="15" class="mfp" />
<div id="errormsg_姓" class="mfp_err"></div>
<div id="errormsg_名" class="mfp_err"></div>
</td>
</tr>
<tr>
<th><img src="images/mfp_must.gif" width="32" height="18" alt="必須" class="must" /> フリガナ</th>
<td>
セイ <input type="text" name="セイ(必須)" size="15" class="mfp" />　
メイ <input type="text" name="メイ(必須)" size="15" class="mfp" />
<div id="errormsg_セイ" class="mfp_err"></div>
<div id="errormsg_メイ" class="mfp_err"></div>
</td>
</tr>
<tr>
<th>住所</th>
<td>
自宅 <input type="text" name="自宅住所" size="40" class="mfp" /><br />
<span class="red">※お見積りの場合ご自宅は必ず入力願います。</span><br />
会社 <input type="text" name="会社住所" size="40" class="mfp" /><br />
<span class="red">※社員旅行などは会社のご住所を入力願います。</span>
</td>
</tr>
<tr>
<th>電話番号</th>
<td>
<ol>
<li>自宅 <input type="text" name="自宅電話番号" size="16" class="mfp" /></li>
<li>携帯 <input type="text" name="携帯電話番号" size="16" class="mfp" /></li>
<li>会社 <input type="text" name="会社電話番号" size="16" class="mfp" /></li>
</ol>
</td>
</tr>
<tr>
<th>ＦＡＸ番号</th>
<td>
<input type="text" name="ＦＡＸ番号" size="16" class="mfp" />
</td>
</tr>
<tr>
<th><img src="images/mfp_must.gif" width="32" height="18" alt="必須" class="must" /> メールアドレス</th>
<td><input type="text" name="email(必須)" size="40" class="mfp" /><div id="errormsg_email" class="mfp_err"></div></td>
</tr>
<tr>
<th><img src="images/mfp_must.gif" width="32" height="18" alt="必須" class="must" /> 確認のためもう一度</th>
<td><input type="text" name="confirm_email(必須)" size="40" class="mfp" /><div id="errormsg_confirm_email" class="mfp_err"></div></td>
</tr>
<tr>
<th>バスタイプ</th>
<td>
<ol>
<li><a href="/introductionbus/selega58.php" target="_blank">大型59人乗 ≪正シート49席・補助9席≫</a>　 <input type="text" name="大型59人乗台数" value="" size="4" border="0" maxlength="2" class="mfp"> 台</li>
<li><a href="/introductionbus/selega53.php" target="_blank">大型53人乗 ≪正シート45席・補助8席≫</a>　 <input type="text" name="大型53人乗台数" value="" size="4" border="0" maxlength="2" class="mfp"> 台</li>
<li><a href="/introductionbus/selega28.php" target="_blank">中型28人乗 ≪正シート28席・補助ナシ≫</a>　<input type="text" name="中型28人乗台数" value="" size="4" border="0" maxlength="2" class="mfp"> 台</li>

<li><a href="/introductionbus/exc27.php" target="_blank">セレガプレミアム27人乗 ≪正シート27席・補助ナシ≫</a>　<input type="text" name="セレガプレミアム27人乗台数" value="" size="4" border="0" maxlength="2" class="mfp"> 台</li>

<li><a href="/introductionbus/exc25.php" target="_blank">小型27人乗 ≪正シート21席・補助6≫</a>　<input type="text" name="小型27人乗台数" value="" size="4" border="0" maxlength="2" class="mfp"> 台</li>
<li><a href="/introductionbus/roza23.php" target="_blank">小型23人乗 ≪正シート18席・補助5席≫</a>　 <input type="text" name="小型23人乗台数" value="" size="4" border="0" maxlength="2" class="mfp"> 台</li>
</ol>
</td>
</tr>
<tr>
<th>出発場所</th>
<td>
<ol>
<li>場所 <input type="text" name="出発場所" size="16" class="mfp" /> 例：淡路市○○・・・等</li>
<li>出発時刻 <input type="text" name="出発時刻" value="" size="4" border="0" maxlength="2" class="mfp"> 時頃</li>
<li>到着時刻 <input type="text" name="到着時刻" value="" size="4" border="0" maxlength="2" class="mfp"> 時頃</li>
</ol>
</td>
</tr>
<tr>
<th>目的地</th>
<td>
簡単な行程をご入力ください。<br />
（各滞在時間等もお分かりでしたらお知らせください）<br />
<textarea name="目的地" rows="5" cols="50"></textarea> 
</td>
</tr>
<tr>
<th>バスガイド</th>
<td>
<ul>
<li><label for="guide01" id="guide01_label" class="mfp"><input type="radio" name="バスガイド" id="guide01" value="つける" class="mfp" /> つける</label></li>
<li><label for="guide02" id="guide02_label" class="mfp"><input type="radio" name="バスガイド" id="guide02" value="つけない" class="mfp" /> つけない</label></li>
</ul>
<div id="errormsg_お問い合わせ種類" class="mfp_err"></div>
<input type="hidden" name="お問い合わせ種類(必須)" />
</td>
</tr>
<tr>
<th>旅行目的</th>
<td>
<ul class="mb05 clearfix">
<li><label for="mokuteki01" id="mokuteki01_label" class="mfp"><input type="radio" name="旅行目的" id="mokuteki01" value="観光" class="mfp" /> 観光</label></li>
<li><label for="mokuteki02" id="mokuteki02_label" class="mfp"><input type="radio" name="旅行目的" id="mokuteki02" value="送迎" class="mfp" /> 送迎</label></li>
<li><label for="mokuteki03" id="mokuteki03_label" class="mfp"><input type="radio" name="旅行目的" id="mokuteki03" value="視察" class="mfp" /> 視察</label></li>
<li><label for="mokuteki04" id="mokuteki04_label" class="mfp"><input type="radio" name="旅行目的" id="mokuteki04" value="その他" class="mfp" /> その他</label></li>
</ul>
<input type="hidden" name="旅行目的" />
<p>その他の場合ご記入ください<br />
<input type="text" name="その他の目的" size="40" class="mfp" /></p>
</td>
</tr>
<tr>
<th>御利用人員</th>
<td>
<ul class="mb05 clearfix">
<li>合計約 <input type="text" name="御利用人員（合計）" value="" size="4" border="0" maxlength="3" class="mfp"> 人 </li>
<li>男性 <input type="text" name="御利用人員（男性）" value="" size="4" border="0" maxlength="3" class="mfp"> 人 </li>
<li>女性 <input type="text" name="御利用人員（女性）" value="" size="4" border="0" maxlength="3" class="mfp"> 人 </li>
<li>小人 <input type="text" name="御利用人員（小人）" value="" size="4" border="0" maxlength="3" class="mfp"> 人 </li>
</ul>
<span class="red">※当社にて宿泊の手配をご希望の方は、<br />
　男性、女性、小人の御人数もご入力ください。</span>
</td>
</tr>
<tr>
<th>お問い合せ内容</th>
<td><textarea name="お問い合せ内容" rows="10" cols="50"></textarea> </td>
</tr>
</table>

<h2>当社にて昼食、宿泊場所の手配をご希望される方は以下をご記入ください。</h2>
<p class="lead red">※1ご昼食・ご宿泊について、どちらか一方のみご希望のお客様は不要な方の予算部分に000と入力してください。</p>
<table border="0" cellspacing="0" cellpadding="0" class="mailform" summary="mailform main">
<tr>
<th>ご昼食 <span class="red">※1</span><br />
一日一人当たりのご予算</th>
<td>
<ul>
<li><input type="text" name="ご昼食ご予算始まり" size="16" class="mfp" /> 円～</li>
<li><input type="text" name="ご昼食ご予算終わり" size="16" class="mfp" /> 円くらいまで</li>
</ul>
</td>
</tr>
<tr>
<th>ご宿泊 <span class="red">※1</span><br />
一人当たりのご予算</th>
<td>
<ul>
<li><input type="text" name="ご宿泊ご予算始まり" size="16" class="mfp" /> 円～</li>
<li><input type="text" name="ご宿泊ご予算終わり" size="16" class="mfp" /> 円くらいまで</li>
</ul>
</td>
</tr>
<tr>
<th>宿タイプ</th>
<td>
<ul class="mb05 clearfix">
<li><label for="yado01" id="yado01_label" class="mfp"><input type="radio" name="宿タイプ" id="yado01" value="旅館" class="mfp" /> 旅館</label></li>
<li><label for="yado02" id="yado02_label" class="mfp"><input type="radio" name="宿タイプ" id="yado02" value="ホテル" class="mfp" /> ホテル</label></li>
<li><label for="yado03" id="yado03_label" class="mfp"><input type="radio" name="宿タイプ" id="yado03" value="その他" class="mfp" /> その他</label></li>
</ul>
<input type="hidden" name="宿タイプ" />
<p>その他にチェックを入れられた方は詳しくご記入ください <br />
<input type="text" name="その他の宿タイプ" size="40" class="mfp" /></p>
</td>
</tr>
<tr>
<th>オプション</th>
<td>
<ul class="mb05 clearfix">
<li><label for="op01" id="op01_label" class="mfp"><input type="checkbox" name="オプション" id="op01" value="コンパニオン" class="mfp" /> コンパニオン</label></li>
<li><label for="op02" id="op02_label" class="mfp"><input type="checkbox" name="オプション" id="op02" value="カラオケ" class="mfp" /> カラオケ</label></li>
<li><label for="op03" id="op03_label" class="mfp"><input type="checkbox" name="オプション" id="op03" value="宴会場" class="mfp" /> 宴会場</label></li>
<li><label for="op04" id="op04_label" class="mfp"><input type="checkbox" name="オプション" id="op04" value="その他" class="mfp" /> その他</label></li>
</ul>
<input type="hidden" name="オプション" />
<p>その他の場合ご記入ください<br />
<input type="text" name="その他のオプション" size="40" class="mfp" /></p>
</td>
</tr>
<tr>
<th>その他手配時の<br />注意事項等</th>
<td><textarea name="その他手配時の注意事項等" rows="10" cols="50"></textarea> </td>
</tr>
</table>

<div id="mfp_buttons">
<ul>
<li><input type="button" value="" id="button_mfp_reset" onclick="mfp_reset(this.form)" onkeypress="mfp_reset(this.form)" onmouseover="this.style.background='url(images/mfp_reset_over.gif)'" onmouseout="this.style.background='url(images/mfp_reset.gif)'" /></li>
<li><input type="button" value="" id="button_mfp_goconfirm" onclick="sendMail(this.form)" onkeypress="sendMail(this.form)" onmouseover="this.style.background='url(images/mfp_goconfirm_over.gif)'" onmouseout="this.style.background='url(images/mfp_goconfirm.gif)'" /></li>
</ul>
</div>
</div><!-- /mfp_phase_1 -->

</form>

<div class="pagetop"><a href="#wrap"><img src="../images/common/pagetop_off.gif" alt="このページの上に戻る" width="150" height="34" /></a></div>

</div><!-- /main -->

<div id="side">
<?php include "../inc/side.inc";?>
</div><!-- /side -->

</div>
<!-- /container -->

</div><!-- /wrap -->

<div id="footer">
<?php include "../inc/footer.inc";?>
</div><!-- /footer -->


<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-52118257-1', 'shozen.com');
  ga('send', 'pageview');

</script>


</body>
</html>