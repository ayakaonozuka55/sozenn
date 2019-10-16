<?php global $blog_id; ?><!DOCTYPE html>
<html lang="ja">
<head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/website#">
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>株式会社ショーゼンファーム</title>
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="noindex">
<meta name="robots" content="nofollow">
<meta name="robots" content="noarchive">
  <!--OGP-->
  <meta property="og:locale" content="ja_JP"/>
  <meta property="og:type" content="website"/>
  <meta property="og:description" content=""/>
  <meta property="og:image" content="http://www.shozen.com/shozen_farm/img/ogpic.jpg"/>
  <meta property="og:url" content="http://www.shozen.com/shozen_farm/"/>
  <meta property="og:site_name" content="株式会社ショーゼンファーム"/>
  <meta property="og:title" content="株式会社ショーゼンファーム"/>
  <!--/OGP-->

  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <link rel="stylesheet" href="<?php echo home_url(); ?>/css/common.css">
  <link rel="stylesheet" href="<?php echo home_url(); ?>/css/sub.css">
  <link rel="stylesheet" href="<?php echo home_url(); ?>/css/utility.css">
  <script type="text/javascript" src="<?php echo home_url(); ?>/js/libs.js"></script>
  <script type="text/javascript" src="<?php echo home_url(); ?>/js/common.js"></script>

<!-- jQuery.jsの読み込み -->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>

<!-- スムーズスクロール部分の記述 -->
<script>
$(function(){
   // #で始まるアンカーをクリックした場合に処理
   $('a[href^=#]').click(function() {
      // スクロールの速度
      var speed = 1200; // ミリ秒
      // アンカーの値取得
      var href= $(this).attr("href");
      // 移動先を取得
      var target = $(href == "#" || href == "" ? 'html' : href);
      // 移動先を数値で取得
      var position = target.offset().top;
      // スムーススクロール
      $('body,html').animate({scrollTop:position}, speed, 'swing');
      return false;
   });
});
</script>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-75283835-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-75283835-1');
</script>

</head>
<body>

<div class="head-area">
	<div class="header font-noto cf">
		<header>
		<h1>
			<div class="headsponly">
				<a href="<?php echo home_url(); ?>/"><img src="<?php echo home_url(); ?>/img/pc/top/toplogo.png"></a>
				<p>
				<span class="copttl">お客様のニーズに応じた農産品を創造します。</span><br>
				<span class="cop">株式会社ショーゼンファーム</span>
				</p>
			</div>
			<div class="headpconly">
				<a href="<?php echo home_url(); ?>/"><img src="<?php echo home_url(); ?>/img/pc/top/headlogo.png"></a>
			</div>
			<a href="<?php echo home_url(); ?>/contact/"><div id="navMailPc">
				<i class="fa fa-envelope"></i> お問い合わせ
			</div></a>
			<div id="navTelPc">
				<a href="tel:0799649222"><i class="fa fa-phone"></i> 0799-64-9222</a><br><span>(平日10：00～18：00)</span>
			</div>
		</h1>
		<div id="navTelSp">
			<a href="tel:0799649222"><img src="<?php echo home_url(); ?>/img/sp/top/toptel.png"></a>
		</div>
		<div id="navToggle">
		  <div>
		   <span></span> <span></span> <span></span>
		  </div>
		</div><!--#navToggle END-->
		<nav>
		  <ul>
		   <a href="<?php echo home_url(); ?>/" class="headlink01"><li><i class="fa fa-home"></i><br>ホーム</li></a>
		   <a href="<?php echo home_url(); ?>/reason/" class="headlink01"><li><span class="navsmall">ショーゼンファームが</span><br>選ばれる理由</li></a>
		   <a href="<?php echo home_url(); ?>/kakou/" class="headlink01"><li>加工場紹介</li></a>
		   <a href="<?php echo home_url(); ?>/product/" class="headlink01"><li>製品紹介</li></a>
		   <a href="<?php echo home_url(); ?>/company/" class="headlink01"><li>会社概要</li></a>
		   <a href="<?php echo home_url(); ?>/contact/" class="headlink01"><li class="inc sponly">お問い合わせ</li></a>
		  </ul>
		</nav>
		</header>
	</div>
	<!-- /.header font-noto cf -->
</div>
<!-- /.head-area -->
