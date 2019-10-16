<?php
 
if (isset($_GET['viewmode'])) {
    $viewmode = $_GET['viewmode'];
    setcookie("viewmode", $viewmode, null, "/shozen_tour/");
} else {
    $viewmode = $_COOKIE['viewmode'];
}
 
if ($viewmode = "pc") {
    $regex_ua_spn = "(iPhone|iPod|Android.*Mobile|BlackBerry)";
    if (preg_match($regex_ua_spn, $_SERVER['HTTP_USER_AGENT']) == 0) {
        setcookie("viewmode", "sp", null, "/shozen_tour/");
        header("Location: /shozen_tour/");
    }
}
?><!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="株式会社ショーゼンは安全、正確な輸送に徹しお客様に信頼される輸送サービスを提供します" />
<meta name="keywords" content="ショーゼン,貸切バス,団体ツアー,貨物輸送,観光バス,物流倉庫,ツアー,引越し,淡路,花バス" />
<title>ショーゼン観光バス：貸切バス・団体ツアー</title>
<link rel="stylesheet" media="all" type="text/css" href="/shozen_tour/sp/css/import.css" />
<script type="text/javascript" src="/shozen_tour/sp/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/shozen_tour/sp/js/jquery.slidebars.js"></script>
<script type="text/javascript" src="/shozen_tour/sp/js/jquery.hoverIntent.minified.js"></script>
<script type="text/javascript" src="/shozen_tour/sp/js/common.js"></script>
<!--[if lt IE 9]>
<script src="/shozen_tour/sp/js/html5shiv.js"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
<![endif]-->
</head>

<body>

<div id="header">
<div class="hLogo">
<a href="/shozen_tour/sp/">
<div><img src="/shozen_tour/sp/images/common/logo.png" alt="ショーゼン観光バス"/></div>
</a>
</div>
<div class="hTrigger sb-toggle-right"><span class="menu-trigger"><span></span><span></span><span></span></span></div>
<ul class="gNav sb-slidebar sb-right sb-style-overlay fw">
<li><a href="/shozen_tour/sp/">トップページ</a></li>
<li><a href="/shozen_tour/sp/introductionbus/">バス紹介</a></li>
<li><a href="/shozen_tour/reason/">ショーゼン観光バスの特徴</a></li>
<li><a href="/shozen_tour/bustour/">バス旅行・団体旅行</a></li>
<li><a href="/shozen_tour/courtesybus/">送迎バス</a></li>
<li><a href="/shozen_tour/pilgrimage/">巡礼・巡拝ツアー</a></li>
<li><a href="/shozen_tour/voice/">お客様の声</a></li>
<li><a href="/shozen_tour/faq/">よくある質問</a></li>
<li><a href="http://www.shozen.com/#main03" target="_blank">会社概要</a></li>
<li><a href="/shozen_tour/inquiry/">お申込み・お問い合わせ</a></li>
<li class="close sb-toggle-right"><span>閉じる</span></li>
</ul>
<div class="hInq">
<p class="tel"><span class="ye">本社</span> <span class="tel-link">0799-62-6826</span> / <span class="ye">神戸営業所</span> <span class="tel-link">078-995-2176</span></p>
</div>

</div>
<!-- /header -->



<div id="sb-site">

<div class="topMv">
<a href="/shozen_tour/reason/"><img src="images/top/mv.jpg" alt="こんな楽しい旅行はじめて！お決まりになりがちなバス旅行に驚きと感動を！"/></a>
</div>
<!-- /topMv -->

<div class="container">

<h2 class="title">ショーゼンの<span>観光バス</span>が選ばれる理由</h2>
<div class="top01">
<div><img src="images/top/01_01.png" alt="幹事さん！こんなご希望にお応えします！"/></div>
<div><img src="images/top/01_02.png" alt="こんな旅行いままでしたことない！参加者を喜ばせたい！"/></div>
<div><img src="images/top/01_03.png" alt="人数に合わせてバスを選びたい！車内ではみんなで盛り上がりたい！"/></div>
<div><img src="images/top/01_04.png" alt="施設での面倒な支払いや、予約は任せたい！ "/></div>
<div><img src="images/top/01_05.png" alt="会費の範囲内など限られた予算内で旅行したい！ "/></div>
</div>
<div class="mb20"><a href="/shozen_tour/reason/"><img src="images/top/01_btn.png" alt="ショーゼン観光バスの特徴はこちら！"/></a></div>

<h2 class="title">ショーゼンの<span>送迎バス</span>なら安心・安全</h2>
<div class="top02">

<div class="item">
<h3>ご要望に幅広く答える<br>バスラインナップ</h3>
<ul>
<li><img src="images/top/02_01.png" alt=""/><span>大人数様も<br>お任せください</span></li>
<li><img src="images/top/02_02.png" alt=""/><span>通勤・通学まで<br>幅広くカバー</span></li>
</ul>
<p>
イベント・冠婚葬祭・通学・通勤の送迎はおまかせ下さい！
これだけの車種構成は、淡路島ではショーゼン観光バスだけ!!
</p>
</div>

<div class="item">
<h3>お客様を無事目的地まで<br>お届けしたい</h3>
<ul>
<li><img src="images/top/02_03.png" alt=""/><span>アルコールチェックを<br>安全のため徹底</span></li>
<li><img src="images/top/02_04.png" alt=""/><span>整備もバッチリ<br>欠かせません</span></li>
</ul>
<p>
お客様を安全・快適に目的地にお届けすることが『ショーゼンの使命』です。
</p>
</div>

<div class="item">
<h3>お客様に気持ちイイを<br>体験していただきたい</h3>
<ul>
<li><img src="images/top/02_05.png" alt=""/><span>毎日洗車で<br>清潔に</span></li>
<li><img src="images/top/02_06.png" alt=""/><span>きっちりとした服装で<br>お客様をお迎え</span></li>
</ul>
<p>
①清潔な車両<br>
②身だしなみの整った乗務員<br>
ショーゼン最低限のルールです。
</p>
</div>

</div>
<div class="mb20"><a href="/shozen_tour/courtesybus/"><img src="images/top/02_btn.png" alt="送迎バスの詳細はこちら！"/></a></div>

<h2 class="title">ショーゼンの<span>お遍路</span>はここが違う！</h2>
<p class="lead">
四国八十八ヵ所・四国別格二十ヵ所・西国三十三ヵ所etc...巡りは
ショーゼンにお任せください！
</p>
<div class="top03">

<div class="item">
<div class="txt">
<h3>
お参りだけじゃない！<br>
様々な感動！ 
</h3>
<p>
お参り以外にも、旅行の醍醐味とも言えるお食事やお宿でもお客様に喜んでいただけるものを提供します。
</p>
</div>
<div class="pic"><img src="images/top/03_01.png" alt=""/></div>
</div>

<div class="item">
<div class="txt">
<h3>
ゆったり広々キレイな<br>
バスで快適な旅を！ 
</h3>
<p>
ゆったりとした快適なバスで乗務員も安全運転を徹底。乗り物酔いが心配な方も安心してお乗りいただけます。
</p>
</div>
<div class="pic"><img src="images/top/03_02.png" alt=""/></div>
</div>

<div class="item">
<div class="txt">
<h3>
お参りツアーを通して<br>
新たな絆を発見 
</h3>
<p>
初めは見ず知らずの人だったのが様々な体験を通して笑い合いかけがえのない親友に！
</p>
</div>
<div class="pic"><img src="images/top/03_03.png" alt=""/></div>
</div>

</div>
<div class="mb20"><a href="/shozen_tour/pilgrimage/"><img src="images/top/03_btn.png" alt="巡礼・巡拝ツアーの詳細はこちら！"/></a></div>

<h2 class="title">ショーゼンの豊富な<span>バスラインナップ</span></h2>
<div class="top04">

<a href="/shozen_tour/introductionbus/selega27_premium.php">
<div class="item">
<div class="pic"><img src="images/top/04_01.png" alt=""/></div>
<div class="txt">
<h3>
セレガ27 プレミアム（正シート27席） 
</h3>
<p>
まさにプレミアム！淡路島で唯一！
</p>
</div>
</div>
</a>

<a href="/shozen_tour/introductionbus/roza23.php">
<div class="item">
<div class="pic"><img src="images/top/04_02.png" alt=""/></div>
<div class="txt">
<h3>
小型23（23人乗り）
</h3>
</div>
</div>
</a>

<a href="/shozen_tour/introductionbus/selega53.php">
<div class="item">
<div class="pic"><img src="images/top/04_03.png" alt=""/></div>
<div class="txt">
<h3>
セレガ53（53人乗り） 
</h3>
</div>
</div>
</a>

<a href="/shozen_tour/introductionbus/kogata27.php">
<div class="item">
<div class="pic"><img src="images/top/04_04.png" alt=""/></div>
<div class="txt">
<h3>
小型27S（27人乗り） 
</h3>
</div>
</div>
</a>

<a href="/shozen_tour/introductionbus/selega59.php">
<div class="item">
<div class="pic"><img src="images/top/04_05.png" alt=""/></div>
<div class="txt">
<h3>
セレガ59（59人乗り）
</h3>
</div>
</div>
</a>

</div>
<div><a href="/shozen_tour/introductionbus/"><img src="images/top/04_btn.png" alt="バスラインナップの詳細はこちら！"/></a></div>

</div>
<!-- /container -->

<div class="btmNav">
<h4><img src="images/common/btm_title.png" alt="貸切バスのお申込み、お問い合わせ"/></h4>
<div class="inner">
<p>ショーゼンのスタッフがどんなに些細なことでも親切、丁寧に、誠意を持って対応させていただきます。</p>
<ul>
<li><span class="tel-img"><img src="images/common/btm_tel_01.png" alt="0799-62-6826"/></span></li>
<li><span class="tel-img"><img src="images/common/btm_tel_02.png" alt="078-995-2176"/></span></li>
</ul>
<div><a href="/shozen_tour/inquiry/"><img src="images/common/btm_inq.png" alt="WEBからのお申込み・お問い合わせ"/></a></div>
</div>
</div>
<!-- /btmNav -->

</div>
<!-- /sb-site -->


<div id="footer">
<div id="footerInner">

<div class="fNav">
<ul>
<li><a href="/shozen_tour/sp/">トップページ</a></li>
<li><a href="/shozen_tour/sp/introductionbus/">バス紹介</a></li>
<li><a href="/shozen_tour/reason/">ショーゼン観光バスの特徴</a></li>
<li><a href="/shozen_tour/bustour/">バス旅行・団体旅行</a></li>
<li><a href="/shozen_tour/courtesybus/">送迎バス</a></li>
<li><a href="/shozen_tour/pilgrimage/">巡礼・巡拝ツアー</a></li>
<li><a href="/shozen_tour/voice/">お客様の声</a></li>
<li><a href="/shozen_tour/faq/">よくある質問</a></li>
<li><a href="http://www.shozen.com/#main03" target="_blank">会社概要</a></li>
<li><a href="/shozen_tour/inquiry/">お申込み・お問い合わせ</a></li>
</ul>
</div>
<!-- /fNav -->

<div class="fadd">
<h5>株式会社 ショーゼン</h5>
<p>
■本社<br>
〒656-2154 兵庫県淡路市木曽下162番地の3<br>
TEL：<span class="tel-link">0799-62-6826</span><br>
FAX：0799-62-6827
</p>
<p>
■神戸営業所<br>
〒651-2228 兵庫県神戸市西区見津が丘3丁目11-7<br>
TEL：<span class="tel-link">078-995-2176</span><br>
FAX：078-995-2178
</p>
<address>Copyright (C) 2014 shozen Co,. Ltd. All Rights Reserved.</address>
</div>

</div>
<!-- /footerInner -->

</div>
<!-- /footer -->

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