<?php
/*
Template Name: お問い合わせ完了ページ用
*/
?>
<?php get_header('mail'); ?>



<div class="wrapper_widesub">
	<div class="pankuzu"><a href="<?php echo home_url(); ?>/"><i class="fa fa-home"> ホーム</i></a>　｜　お問い合わせ</div>
	<div class="subttl_area">
		<div class="subttl">
			<div class="subttl_txt ttl_oneline">お問い合わせ</div>
		</div>
	</div>
</div>
<!-- /.wrapper_wideall -->


<div class="wrapper">
	<section class="l-section">
		<div class="contact_area01">
				<h1 class="mailform_h1">お問い合わせありがとうございました。</h1>
                <div class="thanks_txt">
					改めて担当者よりご連絡をさせていただきます。
				</div>
                <div class="thanks_txt">
					<a href="<?php echo home_url(); ?>/">TOPへ戻る ></a>
				</div>
				<div class="mailafter_area">
					<div class="after01">お電話でのお問い合わせは</div>
					<div class="after02">
						<a href="tel:0799649222">0799-64-9222</a><br>
						<span>受付時間：月曜日～土曜日　9：00～17：00</span>
					</div>
					<br clear="all">
				</div>

		</div>
	</section>
	<!-- /.l-section -->

</div>
<!-- /.wrapper -->

<!-- sub-container end -->
<?php get_footer(); ?>
