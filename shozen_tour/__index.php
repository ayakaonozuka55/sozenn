<?php
 
if (isset($_GET['viewmode'])) {
    $viewmode = $_GET['viewmode'];
    setcookie("viewmode", $viewmode, null, "/shozen_tour/");
} else {
    $viewmode = $_COOKIE['viewmode'];
}
 
if ($viewmode != "pc") {
    $regex_ua_spn = "(iPhone|iPod|Android.*Mobile|BlackBerry)";
    if (preg_match($regex_ua_spn, $_SERVER['HTTP_USER_AGENT']) != 0) {
        setcookie("viewmode", "sp", null, "/shozen_tour/");
        header("Location: /shozen_tour/sp/");
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
<title>ショーゼン観光バス：貸切バス・団体ツアー</title>
<link rel="canonical" href="http://www.shozen.com/" />
<link rel="stylesheet" href="css/import.css" type="text/css" />
<script type="text/javascript" src="js/jquery.tools.min.js"></script>
<script type="text/javascript" src="js/jquery.lightbox-0.5.min.js"></script>
<script type="text/javascript" src="js/scrollsmoothly.js"></script>
<script type="text/javascript" src="js/lib/top.js"></script>
<!--[if IE 6]>  
<script type="text/javascript" src="js/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript" src="js/lib/ie6.js"></script>
<![endif]-->
</head>

<body id="top">

<div id="wrap">

<div id="header">
<?php include "inc/header.inc";?>
</div><!-- /header -->

<?php include "inc/gnav.inc";?>

<div id="branding">
<a href="#" onclick="location.href='reason/';"><img src="images/top/image_01.jpg" alt="こんな楽しい旅行はじめて！お決まりになりがちなバス旅行に驚きと感動を！" width="980" height="270" /></a>
</div><!-- /branding -->

<div id="container">

<div id="main">

<h2>ショーゼンの<span class="red">観光バス</span>が選ばれる理由</h2>
<div id="top01">
<h3><img src="images/top/cont_01_title.jpg" width="710" height="35" alt="幹事さん！こんなご希望にお応えします！" /></h3>
<div class="comment co01 fl">
<h4><img src="images/top/cont_01_01_title.gif" width="256" height="37" alt="こんな旅行いままでしたことない！参加者を喜ばせたい！" /></h4>
<p>ありきたりなコースや土産物屋ばかりの旅行ではなく、オリジナルで自由なコースを提案します</p>
</div>
<div class="comment co02 fr">
<h4><img src="images/top/cont_01_02_title.gif" width="256" height="37" alt="人数に合わせてバスを選びたい！車内ではみんなで盛り上がりたい！" /></h4>
<p>ビールサーバーやカラオケ、DVDなどの豪華な設備。 淡路島内トップクラスの車種構成でお待ちしています！</p>
</div>
<div class="comment co03 fl">
<h4><img src="images/top/cont_01_03_title.gif" width="256" height="37" alt="会費の範囲内など限られた予算内で旅行したい！ " /></h4>
<p>
親切・丁寧・正確がモットーです。<br />
施設の手配はもちろん、<br />
面倒な支払いも代行。
</p>
</div>
<div class="comment co04 fr">
<h4><img src="images/top/cont_01_04_title.gif" width="256" height="37" alt="こんな旅行いままでしたことない！" /></h4>
<p>
お客様の予算に合わせて、お食事や宿泊など淡路島No.1と言って頂ける様々なプランをご提案。</p>
</div>
</div>
<p class="top01Link"><a href="reason/">ショーゼン観光バスの特徴はこちら！</a></p>

<h2>ショーゼンの<span class="red">送迎バス</span>なら安心・安全</h2>
<div id="top02">
<div class="col">
<h4>ご要望に幅広く答える<br />バスラインナップ</h4>
<div class="pic"><img src="images/top/cont_02_01_pic.png" alt="大人数様もお任せください 通勤・通学まで幅広くカバー" width="220" height="108" /></div>
<p>イベント・冠婚葬祭・通学・通勤の送迎はおまかせ下さい！これだけの車種構成は、淡路島ではショーゼン観光バスだけ!!</p>
</div>
<div class="col">
<h4>お客様を無事目的地まで<br />お届けしたい</h4>
<div class="pic"><img src="images/top/cont_02_02_pic.png" alt="目的地までの確認をキッチリ 整備もバッチリ欠かせません" width="220" height="108" /></div>
<p>お客様を安全・快適に目的地にお届けすることが『ショーゼンの使命』です。</p>
</div>
<div class="col m0">
<h4>お客様に気持ちイイを<br />体験していただきたい</h4>
<div class="pic"><img src="images/top/cont_02_03_pic.png" alt="毎日洗車で清潔に ビシッと決めたおもてなし" width="220" height="108" /></div>
<p>①清潔な車両<br />②身だしなみの整った乗務員<br />ショーゼン最低限のルールです。</p>
</div>
</div>
<p class="top02Link"><a href="courtesybus/">送迎バスの詳細はこちら！</a></p>

<h2>ショーゼンの<span class="red">お遍路</span>はここが違う！</h2>
<p class="lead">四国八十八ヵ所・四国別格二十ヵ所・西国三十三ヵ所etc...巡りはショーゼンにお任せください！</p>
<div id="top03">
<div class="col">
<h4>お参りだけじゃない！<br />様々な感動！</h4>
<div class="pic"><img src="images/top/cont_03_01_pic.png" alt="お参りだけじゃない！" width="150" height="110" /></div>
<p>お参り以外にも、旅行の醍醐味とも言えるお食事やお宿でもお客様に喜んでいただけるものを提供します。</p>
</div>
<div class="col">
<h4>ゆったり広々キレイなバスで<br />快適な旅を！</h4>
<div class="pic"><img src="images/top/cont_03_02_pic.png" alt="ゆったり広々キレイなバス" width="150" height="110" /></div>
<p>ゆったりとした快適なバスで乗務員も安全運転を徹底。乗り物酔いが心配な方も安心してお乗りいただけます。</p>
</div>
<div class="col m0">
<h4>お参りツアーを通して<br />新たな絆を発見</h4>
<div class="pic"><img src="images/top/cont_03_03_pic.png" alt="お参りツアー" width="150" height="110" /></div>
<p>初めは見ず知らずの人だったのが様々な体験を通して笑い合いかけがえのない親友に！</p>
</div>
</div>
<p class="top01Link"><a href="pilgrimage/">巡礼・巡拝ツアーの詳細はこちら！</a></p>

<h2>ショーゼンの豊富な<span class="red">バスラインナップ</span></h2>
<div id="top04">
<div class="col">
<h4>セレガ27　プレミアム<br /><span>（正シート27席）</span></h4>
<div class="pic"><a href="introductionbus/selega27_premium.php"><img src="images/top/cont_top_serega27_premium.jpg" alt="セレガ27プレミアム" width="380" height="140" /></a></div>
<p>まさにプレミアム！<br />淡路島で唯一！ </p>
</div>


<div class="col02">
<div class="item"><a href="introductionbus/roza23.php"><img src="images/top/cont_23_pic.png" alt="" width="155" height="100" /><br />小型23（23人乗り）</a></div>
<div class="item"><a href="introductionbus/selega53.php"><img src="images/top/cont_04_04_pic.png" alt="" width="155" height="100" /><br />
セレガ53（53人乗り）</a></div>
<div class="item"><a href="introductionbus/kogata27.php"><img src="images/top/cont_04_05_pic.png" alt="" width="155" height="100" /><br />小型27S（27人乗り）</a></div>
<div class="item"><a href="introductionbus/selega59.php"><img src="images/top/cont_04_03_pic.png" alt="" width="155" height="100" /><br />セレガ59（59人乗り）</a></div>
</div>
</div>
<p class="top02Link"><a href="introductionbus/">バスラインナップの詳細はこちら！</a></p>

<?php include "inc/btminq.inc";?>
<div class="pagetop"><a href="#wrap"><img src="images/common/pagetop_off.gif" alt="このページの上に戻る" width="150" height="34" /></a></div>

</div><!-- /main -->

<div id="side">
<?php include "inc/side.inc";?>
</div><!-- /side -->

</div><!-- /container -->

</div><!-- /wrap -->

<div id="footer">
<?php include "inc/footer.inc";?>
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