<?php
 
if (isset($_GET['viewmode'])) {
    $viewmode = $_GET['viewmode'];
    setcookie("viewmode", $viewmode, null, "/shozen_tour/introductionbus/");
} else {
    $viewmode = $_COOKIE['viewmode'];
}
 
if ($viewmode != "pc") {
    $regex_ua_spn = "(iPhone|iPod|Android.*Mobile|BlackBerry)";
    if (preg_match($regex_ua_spn, $_SERVER['HTTP_USER_AGENT']) != 0) {
        setcookie("viewmode", "sp", null, "/shozen_tour/introductionbus/");
        header("Location: /shozen_tour/sp/introductionbus/");
    }
}
?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja" lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="content-style-type" content="text/css" />
<meta http-equiv="content-script-type" content="text/javascript" />
<meta name="description" content="株式会社ショーゼンは安全、正確な輸送に徹しお客様に信頼される輸送サービスを提供します" />
<meta name="keywords" content="ショーゼン,貸切バス,団体ツアー,貨物輸送,観光バス,物流倉庫,ツアー,引越し,淡路,花バス" />
<title>ショーゼンの保有バス紹介 | ショーゼン観光バス</title>
<link rel="canonical" href="http://www.shozen.com/" />
<link rel="stylesheet" href="../css/import.css" type="text/css" />
<script type="text/javascript" src="../js/jquery.tools.min.js"></script>
<script type="text/javascript" src="../js/jquery.lightbox-0.5.min.js"></script>
<script type="text/javascript" src="../js/scrollsmoothly.js"></script>
<script type="text/javascript" src="../js/lib/common.js"></script>
<!--[if IE 6]>  
<script type="text/javascript" src="../js/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript" src="../js/lib/ie6.js"></script>
<![endif]-->



</head>

<body>

<div id="wrap">

<div id="header">
<?php include "../inc/header.inc";?>
</div><!-- /header -->

<?php include "../inc/gnav.inc";?>

<div id="mainVisual">
<img src="../images/introductionbus/main_visual.png" alt="ひろ～いバス紹介" width="980" height="135" />
</div><!-- /mainVisual -->

<div id="container">

<div id="main">

<ul id="pankuzu">
<li id="home"><a href="/shozen_tour/">トップページ</a></li>
<li>バス紹介</li>
</ul>



<h2>大型バス</h2>

<div class="introTop">
<div class="pic"><a href="big_luxury.php"><img src="../images/introductionbus/big_luxury.png" width="280" height="210" alt="大型ラグジュアリー" /></a></div>
<div class="col">
<h3>大型ラグジュアリー<img src="../images/introductionbus/Luxury_03.jpg" width="110" height="26" alt="大型ラグジュアリー" /><span>所有台数 1台</span></h3>
<p>化粧室（トイレ）を備えたラグジュアリーバス。<br />ショーゼン観光バスに初登場！</p>
<ul>

<!--
<li><img src="../images/introductionbus/icon_travel.gif" width="79" height="30" alt="バス旅行" /></li>
<li><img src="../images/introductionbus/icon_courtesy.gif" width="79" height="30" alt="送迎" /></li>
<li><img src="../images/introductionbus/icon_pilgrimage.gif" width="79" height="30" alt="巡礼" /></li>
-->

<li class="btn"><a href="big_luxury.php"><img src="../images/introductionbus/top_btn_off.gif" width="160" height="40" alt="詳しくはこちら" /></a></li>
</ul>
</div>
</div>



<div class="introTop">
<div class="pic"><a href="selega53.php"><img src="../images/introductionbus/ogata_53.png" width="280" height="210" alt="大型52" /></a></div>
<div class="col">
<h3>大型52<span>所有台数 2台</span></h3>
<p>楽しい旅行にはやっぱりサロンテーブル付きバス。<br />リピート率No1！</p>
<ul>

<!--
<li><img src="../images/introductionbus/icon_travel.gif" width="79" height="30" alt="バス旅行" /></li>
<li><img src="../images/introductionbus/icon_courtesy.gif" width="79" height="30" alt="送迎" /></li>
<li><img src="../images/introductionbus/icon_pilgrimage.gif" width="79" height="30" alt="巡礼" /></li>
-->


<li class="btn"><a href="selega53.php"><img src="../images/introductionbus/top_btn_off.gif" width="160" height="40" alt="詳しくはこちら" /></a></li>
</ul>
</div>
</div>




<div class="introTop">
<div class="pic"><a href="big57.php"><img src="../images/introductionbus/ogata_57.png" width="280" height="210" alt="大型59" /></a></div>
<div class="col">
<h3>大型57<span>所有台数 2台</span></h3>
<p>
様々シーンに大活躍！<br />大人数の乗車におすすめ！
</p>
<ul>

<!--
<li><img src="../images/introductionbus/icon_travel.gif" width="79" height="30" alt="バス旅行" /></li>
<li><img src="../images/introductionbus/icon_courtesy.gif" width="79" height="30" alt="送迎" /></li>
-->

<li class="btn"><a href="big57.php"><img src="../images/introductionbus/top_btn_off.gif" width="160" height="40" alt="詳しくはこちら" /></a></li>
</ul>
</div>
</div>



<div class="introTop">
<div class="pic"><a href="selega59.php"><img src="../images/introductionbus/ogata_59.png" width="280" height="210" alt="大型57" /></a></div>
<div class="col">
<h3>大型59<span>所有台数 3台</span></h3>
<p>
様々シーンに大活躍！<br />大人数の乗車におすすめ！
</p>
<ul>

<!--
<li><img src="../images/introductionbus/icon_travel.gif" width="79" height="30" alt="バス旅行" /></li>
<li><img src="../images/introductionbus/icon_courtesy.gif" width="79" height="30" alt="送迎" /></li>
-->

<li class="btn"><a href="selega59.php"><img src="../images/introductionbus/top_btn_off.gif" width="160" height="40" alt="詳しくはこちら" /></a></li>
</ul>
</div>
</div>


<div class="introTop">
<div class="pic"><a href="big60.php"><img src="../images/introductionbus/ogata_60.png" width="280" height="210" alt="大型57" /></a></div>
<div class="col">
<h3>大型60<span>所有台数 2台</span></h3>
<p>
様々シーンに大活躍！<br />大人数の乗車におすすめ！
</p>
<ul>

<!--
<li><img src="../images/introductionbus/icon_travel.gif" width="79" height="30" alt="バス旅行" /></li>
<li><img src="../images/introductionbus/icon_courtesy.gif" width="79" height="30" alt="送迎" /></li>
-->

<li class="btn"><a href="big60.php"><img src="../images/introductionbus/top_btn_off.gif" width="160" height="40" alt="詳しくはこちら" /></a></li>
</ul>
</div>
</div>




<h2>中型バス</h2>


<div class="introTop">
<div class="pic"><a href="selega27_premium.php"><img src="../images/introductionbus/chugata_premium.png" width="280" height="210" alt="中型プレミアム" /></a></div>
<div class="col">
<h3>中型　プレミアム<span>所有台数 3台</span></h3>
<p>
極上の旅行をお約束するプレミアムバス。<br />社内装備にこだわっています。
</p>
<ul>

<!--
<li><img src="../images/introductionbus/icon_travel.gif" width="79" height="30" alt="バス旅行" /></li>

<li><img src="../images/introductionbus/icon_pilgrimage.gif" width="79" height="30" alt="巡礼" /></li>
-->

<li class="btn"><a href="selega27_premium.php"><img src="../images/introductionbus/top_btn_off.gif" width="160" height="40" alt="詳しくはこちら" /></a></li>
</ul>
</div>
</div>


<h2>小型バス</h2>


<div class="introTop">
<div class="pic"><a href="roza23.php"><img src="../images/introductionbus/koagata_23.png" width="280" height="210" alt="小型23" /></a></div>
<div class="col">
<h3>小型23<span>所有台数 3台</span></h3>
<p>
観光に送迎に大活躍！<br />小回りが利くのでご自宅付近までお伺いします。
</p>
<ul>

<!--
<li><img src="../images/introductionbus/icon_travel.gif" width="79" height="30" alt="バス旅行" /></li>
<li><img src="../images/introductionbus/icon_courtesy.gif" width="79" height="30" alt="送迎" /></li>
-->

<li class="btn"><a href="roza23.php"><img src="../images/introductionbus/top_btn_off.gif" width="160" height="40" alt="詳しくはこちら" /></a></li>
</ul>
</div>
</div>



<div class="introTop">
<div class="pic"><a href="kogata24.php"><img src="../images/introductionbus/koagata_24.png" width="280" height="210" alt="小型24" /></a></div>
<div class="col">
<h3>小型24<span>所有台数 1台</span></h3>
<p>
送迎専門バス<br />2016年3月導入。
</p>
<ul>

<!--
<li><img src="../images/introductionbus/icon_travel.gif" width="79" height="30" alt="バス旅行" /></li>
<li><img src="../images/introductionbus/icon_courtesy.gif" width="79" height="30" alt="送迎" /></li>
-->


<li class="btn"><a href="kogata24.php"><img src="../images/introductionbus/top_btn_off.gif" width="160" height="40" alt="詳しくはこちら" /></a></li>
</ul>
</div>
</div>




<div class="introTop">
<div class="pic"><a href="kogata27.php"><img src="../images/introductionbus/kogata27-2.png" width="280" height="210" alt="小型27" /></a></div>
<div class="col">
<h3>小型27<span>所有台数 1台</span></h3>
<p>
観光に送迎に大活躍！<br />小回りが利くのでご自宅付近までお伺いします。
</p>
<ul>

<!--
<li><img src="../images/introductionbus/icon_courtesy.gif" width="79" height="30" alt="送迎" /></li>
-->

<li class="btn"><a href="kogata27.php"><img src="../images/introductionbus/top_btn_off.gif" width="160" height="40" alt="詳しくはこちら" /></a></li>
</ul>
</div>
</div>





<div class="introTop">
<div class="pic"><a href="roza27.php"><img src="../images/introductionbus/kogata_27.png" width="280" height="210" alt="小型28" /></a></div>
<div class="col">
<h3>小型27 DELUXE<span>所有台数 1台</span></h3>
<p>
マイクロバスの最高峰！<br />新型車両堂々のデビュー
</p>
<ul>

<!--
<li><img src="../images/introductionbus/icon_courtesy.gif" width="79" height="30" alt="送迎" /></li>
-->

<li class="btn"><a href="roza27.php"><img src="../images/introductionbus/top_btn_off.gif" width="160" height="40" alt="詳しくはこちら" /></a></li>
</ul>
</div>
</div>



<div class="introTop">
<div class="pic"><a href="kogata27s.php"><img src="../images/introductionbus/kogata_27s.png" width="280" height="210" alt="小型27s" /></a></div>
<div class="col">
<h3>小型27S<span>所有台数 2台</span></h3>
<p>
荷物スペース確保しました。<br />クラブ送迎におすすめ。
</p>
<ul>

<!--
<li><img src="../images/introductionbus/icon_travel.gif" width="79" height="30" alt="バス旅行" /></li>
<li><img src="../images/introductionbus/icon_courtesy.gif" width="79" height="30" alt="送迎" /></li>
-->

<li class="btn"><a href="kogata27s.php"><img src="../images/introductionbus/top_btn_off.gif" width="160" height="40" alt="詳しくはこちら" /></a></li>
</ul>
</div>
</div>






<div> <a href="../images/introductionbus/bus_panf_2018.pdf" target="_blank"><img src="../images/introductionbus/bus_panf_off.gif"></a>
</div>
<br />



<!--
<div class="introTop">
<div class="pic"><a href="hiace.php"><img src="../images/introductionbus/hiace.png" width="280" height="210" alt="エクシード25" /></a></div>
<div class="col">
<h3>ハイエース<span>所有台数 1台</span></h3>
<p>
自家用車では無理、小型バスでは少人数、でも運転したくない。<br />
そんな時に、旅行や送迎に適したサイズです。
</p>
<ul>
<li><img src="../images/introductionbus/icon_travel.gif" width="79" height="30" alt="バス旅行" /></li>
<li><img src="../images/introductionbus/icon_courtesy.gif" width="79" height="30" alt="送迎" /></li>
<li class="btn"><a href="hiace.php"><img src="../images/introductionbus/top_btn_off.gif" width="160" height="40" alt="詳しくはこちら" /></a></li>
</ul>
</div>
</div>

-->


<?php include "../inc/btminq.inc";?>
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