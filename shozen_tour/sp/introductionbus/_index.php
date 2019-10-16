<?php
 
if (isset($_GET['viewmode'])) {
    $viewmode = $_GET['viewmode'];
    setcookie("viewmode", $viewmode, null, "/shozen_tour/introductionbus/");
} else {
    $viewmode = $_COOKIE['viewmode'];
}
 
if ($viewmode = "pc") {
    $regex_ua_spn = "(iPhone|iPod|Android.*Mobile|BlackBerry)";
    if (preg_match($regex_ua_spn, $_SERVER['HTTP_USER_AGENT']) == 0) {
        setcookie("viewmode", "sp", null, "/shozen_tour/introductionbus/");
        header("Location: /shozen_tour/introductionbus/");
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

<div class="pageMv">
<img src="../images/introductionbus/mv.png" alt="バス紹介 観光貸切バスや送迎バスをご紹介"/>
</div>
<!-- /pageMv -->

<div class="container">

<ul class="busNav">
<li><a href="#chu"><img src="../images/introductionbus/nav_chu.png" alt="中型バス"/></a></li>
<li><a href="#dai"><img src="../images/introductionbus/nav_dai.png" alt="大型バス"/></a></li>
<li><a href="#sho"><img src="../images/introductionbus/nav_sho.png" alt="小型バス"/></a></li>
</ul>

<h2 class="title" id="chu">中型バス</h2>
<div class="lineup">

<a href="/shozen_tour/introductionbus/selega27_premium.php">
<div class="item">
<h3>セレガ27 プレミアム<span>所有台数 <b>1台</b></span></h3>
<div class="pic">
<ul>
<li><img src="../images/introductionbus/icon_ryoko.png" alt="バス旅行"/></li>
<li><img src="../images/introductionbus/icon_jyunrei.png" alt="巡礼"/></li>
</ul>
<div><img src="../images/introductionbus/selega27_premium.png" alt=""/></div>
</div>
<div class="txt">
<p>
「プレミアム」の上をいく「Premium」!!極上の旅行をお約束する新型車両。
車内装備にもこだわっています。ぜひ1度ご利用ください。
</p>
</div>
<div class="btn"><img src="../images/introductionbus/btn_detail.png" alt="詳しくはこちら"/></div>
</div>
</a>

<a href="/shozen_tour/introductionbus/selega27_k_p.php">
<div class="item">
<h3>セレガ27カジュアルプレミアム<span>所有台数 <b>1台</b></span></h3>
<div class="pic">
<ul>
<li><img src="../images/introductionbus/icon_ryoko.png" alt="バス旅行"/></li>
<li><img src="../images/introductionbus/icon_jyunrei.png" alt="巡礼"/></li>
</ul>
<div><img src="../images/introductionbus/selega27_k_p.png" alt=""/></div>
</div>
<div class="txt">
<p>
「カジュアル」と「プレミアム」
相反するものが同居する魅力！！
車内のカラーリングにはこだわりを持っています。 当社一押しの１台です。
</p>
</div>
<div class="btn"><img src="../images/introductionbus/btn_detail.png" alt="詳しくはこちら"/></div>
</div>
</a>

</div>
<!-- /lineup -->

<h2 class="title" id="dai">大型バス</h2>
<div class="lineup">

<a href="/shozen_tour/introductionbus/selega53.php">
<div class="item">
<h3>セレガ53<span>所有台数 <b>2台</b></span></h3>
<div class="pic">
<ul>
<li><img src="../images/introductionbus/icon_ryoko.png" alt="バス旅行"/></li>
<li><img src="../images/introductionbus/icon_sogei.png" alt="送迎"/></li>
<li><img src="../images/introductionbus/icon_jyunrei.png" alt="巡礼"/></li>
</ul>
<div><img src="../images/introductionbus/selega53.png" alt=""/></div>
</div>
<div class="txt">
<p>
旅行される方々に、少しでもゆったりと旅行していただきたいという思いで、導入いたしました。 利用されたお客さまからの、リピート率はNo.1!!ショーゼンおすすめのバスで、楽しい旅行に行きませんか？
</p>
</div>
<div class="btn"><img src="../images/introductionbus/btn_detail.png" alt="詳しくはこちら"/></div>
</div>
</a>

<a href="/shozen_tour/introductionbus/selega59.php">
<div class="item">
<h3>セレガ59<span>所有台数 <b>7台</b></span></h3>
<div class="pic">
<ul>
<li><img src="../images/introductionbus/icon_ryoko.png" alt="バス旅行"/></li>
<li><img src="../images/introductionbus/icon_sogei.png" alt="送迎"/></li>
</ul>
<div><img src="../images/introductionbus/selega59.png" alt=""/></div>
</div>
<div class="txt">
<p>
旅行から送迎と、様々なシーンで大活躍！
座席数が多いので、大人数も乗車可能。
比較的、車両が新しいのも魅力のひとつです。
</p>
</div>
<div class="btn"><img src="../images/introductionbus/btn_detail.png" alt="詳しくはこちら"/></div>
</div>
</a>

</div>
<!-- /lineup -->

<h2 class="title" id="sho">小型バス</h2>
<div class="lineup">

<a href="/shozen_tour/introductionbus/roza23.php">
<div class="item">
<h3>小型23<span>所有台数 <b>4台</b></span></h3>
<div class="pic">
<ul>
<li><img src="../images/introductionbus/icon_ryoko.png" alt="バス旅行"/></li>
<li><img src="../images/introductionbus/icon_sogei.png" alt="送迎"/></li>
</ul>
<div><img src="../images/introductionbus/roza23.png" alt=""/></div>
</div>
<div class="txt">
<p>
小回りが利くので、ご自宅付近での乗降が可能！
冠婚葬祭には、特におススメです。
また、「小さいから乗り心地が悪いのでは・・・！？」
そんな心配は必要ありません。 ぜひ一度ご利用ください。
</p>
</div>
<div class="btn"><img src="../images/introductionbus/btn_detail.png" alt="詳しくはこちら"/></div>
</div>
</a>

<a href="/shozen_tour/introductionbus/kogata27.php">
<div class="item">
<h3>小型27S<span>所有台数 <b>2台</b></span></h3>
<div class="pic">
<ul>
<li><img src="../images/introductionbus/icon_ryoko.png" alt="バス旅行"/></li>
<li><img src="../images/introductionbus/icon_sogei.png" alt="送迎"/></li>
</ul>
<div><img src="../images/introductionbus/kogata27.png" alt=""/></div>
</div>
<div class="txt">
<p>
『小型バスには、荷物置き場がなく困っている』
そんな不満を解消するバスが登場です。
クラブや冠婚葬祭の送迎はもちろん、観光にも適した1台です。
</p>
</div>
<div class="btn"><img src="../images/introductionbus/btn_detail.png" alt="詳しくはこちら"/></div>
</div>
</a>

<a href="/shozen_tour/introductionbus/roza27.php">
<div class="item">
<h3>小型27<span>所有台数 <b>2台</b></span></h3>
<div class="pic">
<ul>
<li><img src="../images/introductionbus/icon_sogei.png" alt="送迎"/></li>
</ul>
<div><img src="../images/introductionbus/roza27.png" alt=""/></div>
</div>
<div class="txt">
<p>
小型23では、人数が乗り切らないというお客様には、
こちらのバスがおススメです。
</p>
</div>
<div class="btn"><img src="../images/introductionbus/btn_detail.png" alt="詳しくはこちら"/></div>
</div>
</a>

</div>
<!-- /lineup -->

<div><a href="/shozen_tour/images/introductionbus/bus_panf_2015.pdf"><img src="../images/introductionbus/btn_panf.png" alt="ショーゼンバスのパンフレットはこちら"/></a></div>

</div>
<!-- /container -->

<div class="btmNav">
<h4><img src="../images/common/btm_title.png" alt="貸切バスのお申込み、お問い合わせ"/></h4>
<div class="inner">
<p>ショーゼンのスタッフがどんなに些細なことでも親切、丁寧に、誠意を持って対応させていただきます。</p>
<ul>
<li><span class="tel-img"><img src="../images/common/btm_tel_01.png" alt="0799-62-6826"/></span></li>
<li><span class="tel-img"><img src="../images/common/btm_tel_02.png" alt="078-995-2176"/></span></li>
</ul>
<div><a href="/shozen_tour/inquiry/"><img src="../images/common/btm_inq.png" alt="WEBからのお申込み・お問い合わせ"/></a></div>
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