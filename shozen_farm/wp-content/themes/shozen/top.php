<?php
/*
Template Name: TOP用
*/
?>
<?php get_header(); ?>

<div class="wrapper_wideall">
	<section class="top-section">
		<div class="spmv_area">
			<p class="pic">
				<img src="<?php echo get_site_url(); ?>/img/sp/top/topmv.png">
			</p>
			<p class="mon">
				ショーゼンファームでは<br>
				細やかなオーダーメイド加工により、<br>
				お客様の様々なニーズにお応えいたします。
			</p>
		</div>
		<a href="<?php echo get_site_url(); ?>/"><div class="toppic01"><img src="<?php echo get_site_url(); ?>/img/pc/top/topmain01.png"><p>生産 ＞</p></div></a>
		<a href="<?php echo get_site_url(); ?>/kakou/"><div class="toppic02"><img src="<?php echo get_site_url(); ?>/img/pc/top/topmain02.png"><p>カット加工 ＞</p></div></a>
		<a href="<?php echo get_site_url(); ?>/reason/#p01"><div class="toppic03"><img src="<?php echo get_site_url(); ?>/img/pc/top/topmain03.png"><p>冷凍貯蔵 ＞</p></div></a>
		<a href="<?php echo get_site_url(); ?>/reason/#p01"><div class="toppic04"><img src="<?php echo get_site_url(); ?>/img/pc/top/topmain04.png"><p>流通販売 ＞</p></div></a>
		<br clear="all">
	</section>
	<!-- /.top-section -->
</div>
<!-- /.wrapper_wideall -->

<div class="wrapper">
	<section class="l-section">
		<div class="newsttl">新着情報</div>
<?php $posts = get_posts('numberposts=3'); global $post;?>
<?php foreach($posts as $post): ?>
		<div class="newsarea">
			<div class="day"><?php the_time('Y/m/d'); ?></div><div class="cate"><span><?php $cat = get_the_category(); $cat = $cat[0]; echo $cat->cat_name;?></span></div>
			<div class="ttl"><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></div>
			<br clear="all">
		</div>
<?php endforeach; ?>
		<a href="<?php echo get_site_url(); ?>/newslist/"><div class="alllink floatright">すべて見る ＞</div></a>
	</section>
	<!-- /.l-section -->

</div>
<!-- /.wrapper -->

<?php get_footer(); ?>
