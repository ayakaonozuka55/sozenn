<?php get_header(''); ?>

<div class="wrapper_widesub">
	<div class="pankuzu"><a href="<?php echo home_url(); ?>/"><i class="fa fa-home"> ホーム</i></a>　｜　製品情報</div>
	<div class="subttl_area">
		<div class="subttl">
			<div class="subttl_txt ttl_oneline">製品情報</div>
		</div>
	</div>
</div>
<!-- /.wrapper_wideall -->


<div class="wrapper">
	<section class="l-section">

		<div class="newsttl">ショーゼンファームの製品情報</div>

		<div class="seihin01">
			<div class="pageinlink">
				<ul>
					<a href="<?php echo home_url(); ?>/category/seihin/" class="link01"><li class="li02">製品情報</li></a>
					<a href="<?php echo home_url(); ?>/category/kakou/" class="link02"><li class="li02">加工場</li></a>
					<a href="<?php echo home_url(); ?>/category/farm/" class="link02"><li class="li01">農場情報</li></a>
					<a href="<?php echo home_url(); ?>/category/news/" class="link02"><li class="li02">新着情報</li></a>
				</ul>
			</div>
		</div>

<?php
query_posts($query_string);
query_posts('posts_per_page=10&cat=2&paged='.$paged);
?>
<?php if ( have_posts() ) : ?>
<?php while (have_posts()) : the_post(); ?>

		<div class="newsarea">
			<div class="day"><?php the_time('Y/m/d'); ?></div><div class="cate"><span><?php $cat = get_the_category(); $cat = $cat[0]; echo $cat->cat_name;?></span></div>
			<div class="ttl"><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></div>
			<br clear="all">
		</div>

<?php endwhile; ?>

            <div class="pager_top">
				<?php wp_pagination(); ?>
            </div>
<?php wp_reset_query();endif; ?>

	</section>
	<!-- /.l-section -->

</div>
<!-- /.wrapper -->




<!-- sub-container end -->
<?php get_footer(); ?>