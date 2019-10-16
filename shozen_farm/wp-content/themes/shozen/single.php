<?php get_header(''); ?>
<!-- sub-container -->

<div class="wrapper_widesub">
	<div class="pankuzu"><a href="<?php echo home_url(); ?>/"><i class="fa fa-home"> ホーム</i></a>　｜　ショーゼンファームの新着情報</div>
	<div class="subttl_area">
		<div class="subttl">
			<div class="subttl_txt ttl_oneline">新着情報</div>
		</div>
	</div>
</div>
<!-- /.wrapper_wideall -->

<div class="wrapper">
	<section class="l-section">

		<div class="newsttl">ショーゼンファームの新着情報</div>

		<div class="seihin01">
			<div class="pageinlink">
				<ul>
					<a href="<?php echo get_category_link('2');?>" class="link01"><li class="li02">製品情報</li></a>
					<a href="<?php echo get_category_link('3');?>" class="link02"><li class="li02">加工場</li></a>
					<a href="<?php echo get_category_link('4');?>" class="link02"><li class="li01">農場情報</li></a>
					<a href="<?php echo get_category_link('1');?>" class="link02"><li class="li02">新着情報</li></a>
				</ul>
			</div>
		</div>


<?php if(have_posts()): while(have_posts()): the_post(); ?>

<div class="inner">
    <h2><?php the_title(); ?></h2>


<div class="briefingText clearfix">
<div class="bri_box">


<h3>
	<span><?php the_date(); ?></span>
</h3>

<?php if(has_post_thumbnail()): ?>
<div class="thum">
<?php the_post_thumbnail('full'); ?>
</div>
<?php endif; ?>

<?php the_content(); ?>

</div><!-- /bri_box -->

<?php endwhile; endif; ?>

<br clear="all">

<a href="http://www.shozen.com/shozen_farm/newslist/" class="Sbtn">一覧に戻る</a>

</div><!-- /briefingText clearfix -->

</div><!-- /inner -->

	</section>
	<!-- /.l-section -->

</div>
<!-- /.wrapper -->



<!-- sub-container end -->
<?php get_footer(); ?>
