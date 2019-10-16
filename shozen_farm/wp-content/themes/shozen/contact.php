<?php
/*
Template Name: お問い合わせ用
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

				<!--メールフォームプロ-->
				<form id="mailformpro" action="<?php echo home_url(); ?>/mail/mailformpro/mailformpro.cgi" method="POST">
					<div class="mfp_phase" summary="">
						<dl class="mailform">

							<dt class="mfp">会社名</dt>
							<dd class="mfp"><input type="text" name="会社名" size="80"  style="width:100%;" /></dd>

							<dt class="mfp">部署名</dt>
							<dd class="mfp"><input type="text" name="部署名" size="80"  style="width:100%;" /></dd>

							<dt class="mfp">担当者名 <span class="req">必須</span></dt>
							<dd class="mfp">
								<input type="text" name="担当者名" size="80" style="width:100%;" required />
							</dd>

							<dt class="mfp">郵便番号</dt>
							<dd class="mfp">
								<input type="hidden" name="住所" data-unjoin="〒+郵便番号+\n+都道府県+市区町村+丁目番地" value="" />
								<input type="text" name="郵便番号" size="30"  data-address="都道府県,市区町村,市区町村" autocomplete="off" />
							</dd>
							<dt class="mfp">住所</dt>
							<dd class="mfp">
								<ol>
									<li>
										<span>都道府県</span>
										<select name="都道府県" >
											<option value="" selected="selected">【選択して下さい】</option>
											<optgroup label="北海道・東北地方">
												<option value="北海道">北海道</option>
												<option value="青森県">青森県</option>
												<option value="岩手県">岩手県</option>
												<option value="秋田県">秋田県</option>
												<option value="宮城県">宮城県</option>
												<option value="山形県">山形県</option>
												<option value="福島県">福島県</option>
											</optgroup>
											<optgroup label="関東地方">
												<option value="栃木県">栃木県</option>
												<option value="群馬県">群馬県</option>
												<option value="茨城県">茨城県</option>
												<option value="埼玉県">埼玉県</option>
												<option value="東京都">東京都</option>
												<option value="千葉県">千葉県</option>
												<option value="神奈川県">神奈川県</option>
											</optgroup>
											<optgroup label="中部地方">
												<option value="山梨県">山梨県</option>
												<option value="長野県">長野県</option>
												<option value="新潟県">新潟県</option>
												<option value="富山県">富山県</option>
												<option value="石川県">石川県</option>
												<option value="福井県">福井県</option>
												<option value="静岡県">静岡県</option>
												<option value="岐阜県">岐阜県</option>
												<option value="愛知県">愛知県</option>
											</optgroup>
											<optgroup label="近畿地方">
												<option value="三重県">三重県</option>
												<option value="滋賀県">滋賀県</option>
												<option value="京都府">京都府</option>
												<option value="大阪府">大阪府</option>
												<option value="兵庫県">兵庫県</option>
												<option value="奈良県">奈良県</option>
												<option value="和歌山県">和歌山県</option>
											</optgroup>
											<optgroup label="四国地方">
												<option value="徳島県">徳島県</option>
												<option value="香川県">香川県</option>
												<option value="愛媛県">愛媛県</option>
												<option value="高知県">高知県</option>
											</optgroup>
											<optgroup label="中国地方">
												<option value="鳥取県">鳥取県</option>
												<option value="島根県">島根県</option>
												<option value="岡山県">岡山県</option>
												<option value="広島県">広島県</option>
												<option value="山口県">山口県</option>
											</optgroup>
											<optgroup label="九州・沖縄地方">
												<option value="福岡県">福岡県</option>
												<option value="佐賀県">佐賀県</option>
												<option value="長崎県">長崎県</option>
												<option value="大分県">大分県</option>
												<option value="熊本県">熊本県</option>
												<option value="宮崎県">宮崎県</option>
												<option value="鹿児島県">鹿児島県</option>
												<option value="沖縄県">沖縄県</option>
											</optgroup>
										</select>
									</li>
									<li><span>市区町村</span> <input type="text" name="市区町村" required size="50" /></li>
									<li><span>丁目番地</span> <input type="text" name="丁目番地" required size="50" /></li>
								</ol>
							</dd>

						    <dt class="mfp">電話番号</dt>
						    <dd class="mfp"><input type="tel" data-type="tel" name="電話番号" size="30" data-min="9" data-max="13" /></dd>


							<dt class="mfp">メールアドレス <span class="req">必須</span></dt>
							<dd class="mfp"><input type="email" data-type="email" name="email" size="80" required style="width:100%;" /></dd>

							<dt class="mfp">確認のためもう一度 <span class="req">必須</span></dt>
							<dd class="mfp"><input type="email" data-type="email" name="confirm_email" data-post-disable="1" size="80" required /></dd>

							<dt class="mfp">お問い合わせ内容</dt>
							<dd class="mfp"><textarea name="お問い合わせ内容" rows="20" cols="100" style="width:100%;" ></textarea></dd>

						</dl>
					</div>
						<div class="mailbtntxt01">
							以上でよろしければ確認画面ボタンを押してください。<br>
							ご送信いただきましたのち、担当者よりお電話又はEmailにてご連絡いたします。
						</div>
						<div class="mfp_buttons">
							<button type="reset">リセット</button>&nbsp;&nbsp;<button type="submit">確認画面へ</button>
						</div>
						<div class="mailbtntxt02">
							ご記入された内容は、他に公開することは絶対にございません。<br>
							注：お急ぎの方はお電話にてお問い合わせください。
						</div>
				</form>
				<div class="mailafter_area">
					<div class="after01">お電話でのお問い合わせは</div>
					<div class="after02">
						<a href="tel:0799649222">0799-64-9222</a><br>
						<span>受付時間：月曜日～土曜日　9：00～17：00</span>
					</div>
					<br clear="all">
				</div>

				<script type="text/javascript" id="mfpjs" src="<?php echo home_url(); ?>/mail/mailformpro/mailformpro.cgi" charset="UTF-8"></script>
				<!--/メールフォームプロ-->




		</div>
	</section>
	<!-- /.l-section -->

</div>
<!-- /.wrapper -->




<!-- sub-container end -->
<?php get_footer(); ?>
