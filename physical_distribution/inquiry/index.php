<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja" lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="content-style-type" content="text/css" />
<meta http-equiv="content-script-type" content="text/javascript" />
<meta name="description" content="株式会社ショーゼンは安全、正確な輸送に徹しお客様に信頼される輸送サービスを提供します" />
<meta name="keywords" content="ショーゼン,貸切バス,団体ツアー,貨物輸送,観光バス,物流倉庫,ツアー,引越し,淡路,花バス" />
<title>お問い合わせ | 株式会社ショーゼン</title>
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


<script type="text/javascript">

  

</script>

</head>

<body id="blue">

<div id="wrap">

<div id="header">
<?php include "../inc/header.inc";?>
</div><!-- /header -->

<?php include "../inc/gnav.inc";?>

<div id="mainVisual">
<img src="../images/inquiry/main_visual.png" alt="お問い合わせ" width="980" height="135" />
</div><!-- /mainVisual -->

<div id="container">





<div id="main">

<ul id="pankuzu">
<li id="home"><a href="/">トップページ</a></li>
<li>お問い合わせ</li>
</ul>

<h2 class="greener">お問い合わせ</h2>

<!--<p class="lead">
お申込み・お問い合わせいただいたお客さまの名前、住所、電話番号、お問い合わせ内容などの個人の情報は、<br />
お客さまのご同意がない限り、お申込み・お問い合わせの対応に限って 使用いたします。<br />
お客さまの個人情報のお取り扱いの詳しいご案内は、<a href="../privacy/index.php" target="_blank">個人情報の取り扱いについてをご覧ください。</a>
</p>-->

<div class="inqAd">
<h4>お電話でのお問い合わせは</h4>
<p><span>0799-62-6828</span><br />
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
<div id="mfp_buttons">
<ul>
<li><input type="button" value="" id="button_mfp_cancel" onclick="mfp_send_cancel()" onkeypress="mfp_send_cancel()" onmouseover="this.style.background='url(images/mfp_cancel_over.gif)'" onmouseout="this.style.background='url(images/mfp_cancel.gif)'" /></li>
<li><input type="button" value="" id="button_mfp_send" onclick="sending()" onkeypress="sending()" onmouseover="this.style.background='url(images/mfp_send_over.gif)'" onmouseout="this.style.background='url(images/mfp_send.gif)'" /></li>
</ul>
</div>
</div><!-- /mfp_phase_confirm -->

<div id="mfp_phase_1" class="mfp_phase_section">
<table border="0" cellspacing="0" cellpadding="0" class="mailform" summary="mailform main">

<tr>
<th>会社名</th>
<td>
<input type="text" name="会社名" size="16" class="mfp" />
</td>
</tr>

<tr>
<th>部署名</th>
<td>
<input type="text" name="部署名" size="16" class="mfp" />
</td>
</tr>

<tr>
<th><img src="images/mfp_must.gif" width="32" height="18" alt="必須" class="must" /> 担当者名</th>
<td>
<input type="text" name="担当者名(必須)" size="16" class="mfp" />
<div id="errormsg_担当者名" class="mfp_err"></div>
</td>
</tr>

<tr>
<th>郵便番号</th>
<td>
<input type="text" name="郵便番号" size="16" class="mfp" />
</td>
</tr>

<tr>
<th>住所</th>
<td>
<input type="text" name="住所" size="16" class="mfp" />
</td>
</tr>

<tr>
<th>電話番号</th>
<td>
<input type="text" name="電話番号" size="16" class="mfp" />
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
<th>お問い合せ内容</th>
<td><textarea name="お問い合せ内容" rows="10" cols="50"></textarea> </td>
</tr>
</table>

<!--<h2>当社にて昼食、宿泊場所の手配をご希望される方は以下をご記入ください。</h2>-->
<p class="lead">以上でよろしければ確認画面ボタンを押してください。<br />
ご送信いただきましたのち、担当者よりお電話又はEmailにてご連絡いたします。</p>




<div id="mfp_buttons">
<ul>
<li><input type="button" value="" id="button_mfp_reset" onclick="mfp_reset(this.form)" onkeypress="mfp_reset(this.form)" onmouseover="this.style.background='url(images/mfp_reset_over.gif)'" onmouseout="this.style.background='url(images/mfp_reset.gif)'" /></li>
<li><input type="button" value="" id="button_mfp_goconfirm" onclick="sendMail(this.form)" onkeypress="sendMail(this.form)" onmouseover="this.style.background='url(images/mfp_goconfirm_over.gif)'" onmouseout="this.style.background='url(images/mfp_goconfirm.gif)'" /></li>
</ul>
</div>

<p class="lead red">ご記入された内容は、他に公開することは絶対にございません。<br />
注：お急ぎの方はお電話にてお問い合わせください。</p>

</div><!-- /mfp_phase_1 -->

</form>

<div class="pagetop"><a href="#wrap"><img src="../images/common/pagetop_off.gif" alt="このページの上に戻る" width="150" height="33" /></a></div>

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

  ga('create', 'UA-52118525-1', 'shozen.com');
  ga('send', 'pageview');

</script>


</body>
</html>