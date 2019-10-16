#=========================
# イベント情報の登録
#=========================

my %local;
my %yoyaku;
hash_IO( \%yoyaku, "$dir{'db'}/yoyaku/$in{'pk'}.dat", 'e' );
%yoyaku = HTML_escape( \%yoyaku );

$local{'START_YY'} = '<SELECT name="START_YY">' . form_option( $yoyaku{'START_YY'}, [ '', &YY .. &YY + 1 ], [ '----', &YY .. &YY + 1 ] );
$local{'START_MM'} = '<SELECT name="START_MM">' . form_option( $yoyaku{'START_MM'}, [ '', '01' .. '12' ],   [ '--',   '01' .. '12' ] );
$local{'START_DD'} = '<SELECT name="START_DD">' . form_option( $yoyaku{'START_DD'}, [ '', '01' .. '31' ],   [ '--',   '01' .. '31' ] );

$local{'END_YY'} = '<SELECT name="END_YY">' . form_option( $yoyaku{'END_YY'}, [ '', &YY .. &YY + 1 ], [ '----', &YY .. &YY + 1 ] );
$local{'END_MM'} = '<SELECT name="END_MM">' . form_option( $yoyaku{'END_MM'}, [ '', '01' .. '12' ],   [ '--',   '01' .. '12' ] );
$local{'END_DD'} = '<SELECT name="END_DD">' . form_option( $yoyaku{'END_DD'}, [ '', '01' .. '31' ],   [ '--',   '01' .. '31' ] );

$local{'SHIMEKIRI_YY'} = '<SELECT name="SHIMEKIRI_YY">' . form_option( $yoyaku{'SHIMEKIRI_YY'}, [ '', &YY .. &YY + 1 ], [ '----', &YY .. &YY + 1 ] );
$local{'SHIMEKIRI_MM'} = '<SELECT name="SHIMEKIRI_MM">' . form_option( $yoyaku{'SHIMEKIRI_MM'}, [ '', '01' .. '12' ],   [ '--',   '01' .. '12' ] );
$local{'SHIMEKIRI_DD'} = '<SELECT name="SHIMEKIRI_DD">' . form_option( $yoyaku{'SHIMEKIRI_DD'}, [ '', '01' .. '31' ],   [ '--',   '01' .. '31' ] );

#---------------------
# カテゴリ
#---------------------

my @category_data;

# カテゴリデータの取得
for my $data ( glob("$dir{'db'}/category/*.dat") ) {
    my %cat_data;
    hash_IO( \%cat_data, "$data", 'e' );
    push( @category_data, \%cat_data );
}
@category_data = sort { $b->{'pk'} <=> $a->{'pk'} } @category_data;

my ( @category_pk, @category_name );
for my $data (@category_data) {
    next if ( $data eq '' );
    my %data = HTML_escape($data);
    push( @category_pk,   $data{'pk'} );
    push( @category_name, $data{'NAME'} );
}

$local{'category-select'} = '<SELECT name="CATEGORY_pk" size="1">' . form_option( $yoyaku{'CATEGORY_pk'}, [ '', @category_pk ], [ '▼お選び下さい', @category_name ] );

#---------------
# 画像
#---------------

for my $i (1,2,3) {
    my $comment;
    if ( $i == 1 ) {
    	$comment = qq|(一覧・詳細)|;
    }else {
    	$comment = qq|(詳細)|;
    }
    
    
    $local{'img'} .= qq|<TR>\n|;
    $local{'img'} .= qq|  <TD bgcolor="#C7DCF2">写真$i$comment</TD>\n|;
    $local{'img'} .= qq|  <TD bgcolor="#ffffff" valign="bottom">\n|;
    my @cgi_image = glob("$dir{'yoyaku-image'}/$yoyaku{'pk'}/img$i.*");
    if ( $cgi_image[0] ) {
        my $ext = ( split( /\./, $cgi_image[0] ) )[-1];
        $local{'img'} .= qq|<IMG src="$dir{'yoyaku-image'}/$yoyaku{'pk'}/img$i.$ext" id="preview$i" width='100'><BR>|;
        $local{'img'} .= qq|<INPUT TYPE="checkbox" name="img$i-DELETE" value="1">削除<BR>|;
    }
    else {
        my $ext = ( split( /\./, $cgi_image[0] ) )[-1];
        $local{'img'} .= qq|<IMG src="$dir{'yoyaku-image'}/$yoyaku{'pk'}/img$i.$ext" border="0" id="preview$i" style="display:none;" width='100'>|;
    }
    $local{'img'} .= qq|  <INPUT type="file" size="50" name="img$i" onChange="preview$i.src=this.value;preview$i.style.display='block';"><BR>\n|;
    $local{'img'} .= qq| </TD>\n|;
    $local{'img'} .= qq|</TR>\n|;
}

#-----------
# 行程表
#-----------

my $KOUTEI_list;
for my $i ( 1 .. 10 ) {

    # 食事チェックボックスの準備
    for my $val ( split( /, /, $yoyaku{"SYOKUJI$i"} ) ) {
        $yoyaku{ "SYOKUJI$i-" . $val } = $val;
    }
    my @SYOKUJI = ( '朝', '昼', '夕', );
    my $check_box;
    for my $y ( 0 .. $#SYOKUJI ) {
        my $val = $SYOKUJI[$y];
        $check_box .= check_box( "SYOKUJI$i", $yoyaku{"SYOKUJI$i-$val"}, "$val" ) . qq|<LABEL for="SYOKUJI$i-$val">$val</LABEL>&nbsp;|;
    }
	
	my $koutei_size =qq|KOUTEI$i| . '_size';
    $KOUTEI_list .= qq|<TR>\n|;
    $KOUTEI_list .= qq|  <TD colspan="2" bgcolor=#D4D4D4>$i日目</TD>\n|;
    $KOUTEI_list .= qq|</TR>\n|;
    $KOUTEI_list .= qq|<TR>\n|;
    $KOUTEI_list .= qq|  <TD>\n|;
    $KOUTEI_list .= qq|<TABLE border="0" cellspacing="1" bgcolor="#999999">\n|;
    $KOUTEI_list .= qq|  <TR>\n|;
    $KOUTEI_list .= qq|    <TD bgcolor="#efefef" valign="middle">\n|;
    $KOUTEI_list .= qq|      文字サイズ：<select name="$koutei_size">\n|;
    $KOUTEI_list .= qq|      <option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option>\n|;
    $KOUTEI_list .= qq|      <option value="5">5</option><option value="6">6</option><option value="7">7</option>\n|;
    $KOUTEI_list .= qq|      </select>\n|;
    $KOUTEI_list
        .= qq|      <A href="javaScript:void(0)" onClick="tag_size(document.form.$koutei_size.options[document.form.$koutei_size.selectedIndex].value);return false"><IMG src="./textarea_image/S.gif" border="0" title="フォントサイズを変更"></A>\n|;
    $KOUTEI_list .= qq|      <A href="javaScript:void(0)" onClick="linkPrompt(document.form.KOUTEI$i); return false"><IMG src="./textarea_image/URL.gif" border="0" title="リンクを貼る"></A>\n|;
    $KOUTEI_list .= qq|      <A href="javaScript:void(0)" onClick="tag('B');return false"><IMG src="./textarea_image/B.gif" border="0" title="太くする"></A>\n|;
    $KOUTEI_list .= qq|      <A href="javaScript:void(0)" onClick="tag('I');return false"><IMG src="./textarea_image/I.gif" border="0" title="斜体にする"></A>\n|;
    $KOUTEI_list .= qq|      <A href="javaScript:void(0)" onClick="tag('U');return false"><IMG src="./textarea_image/U.gif" border="0" title="下線を引く"></A>\n|;
    $KOUTEI_list .= qq|      <A href="javaScript:void(0)" onClick="insertStr(el,'&lt;BR&gt;');return false"><IMG src="./textarea_image/BR.gif" border="0" title="改行する"></A>\n|;
    $KOUTEI_list .= qq|      <A href="javaScript:void(0)" onClick="tag('F');return false"><IMG src="./textarea_image/F.gif" border="0" title="色をつける"></A>\n|;
    $KOUTEI_list .= qq|      <A href="./textarea_image/color/cc.html" target=_"blank"><IMG src="./textarea_image/COLOR.gif" border="0" title="色見本"></A>\n|;
    $KOUTEI_list .= qq|    </TD>\n|;
    $KOUTEI_list .= qq|  </TR>\n|;
    $KOUTEI_list .= qq|  <TR>\n|;
    $KOUTEI_list
        .= qq|    <TD><TEXTAREA rows="8" cols="42" name="KOUTEI$i" id="KOUTEI$i" onfocus="get_pos(KOUTEI$i);" onkeypress="insertbr(KOUTEI$i);" onmouseup="get_pos(KOUTEI$i);" onkeyup="get_pos(KOUTEI$i);">$yoyaku{"KOUTEI$i"}</TEXTAREA></TD>\n|;
    $KOUTEI_list .= qq|  </TR>\n|;
    $KOUTEI_list .= qq|</TABLE>\n|;
    $KOUTEI_list .= qq|    宿泊施設<BR><TEXTAREA rows="3" cols="42" name="YADO$i">$yoyaku{"YADO$i"}</TEXTAREA></TD>\n|;
    $KOUTEI_list .= qq|  </TD>\n|;
    $KOUTEI_list .= qq|  <TD valign="top">食事<BR>$check_box<hr></TD>\n|;
    $KOUTEI_list .= qq|</TR>\n|;
    $KOUTEI_list .= qq|\n|;
}

#----------------------
# HTML出力
#----------------------
$HTML             = './_mini.htm';
$replace{'title'} = 'ツアー情報管理';
$replace{'html'}  = <<EOF;
<DIV id="edit" align="center">
<DIV class="title">ツアー情報登録・編集</DIV>
<FORM action="$ENV{'SCRIPT_NAME'}" method="POST" name="form" enctype="multipart/form-data">
<INPUT type="hidden" name="c" value="yoyaku-2">
<INPUT type="hidden" name="pk" value="$yoyaku{'pk'}">
<TABLE cellspacing="1" cellpadding="3" bgcolor="#999999">
  <TR>
    <TD bgcolor="#C7DCF2">ツアー名</TD>
	<TD bgcolor="#ffffff"><INPUT size="60" type="text" name="NAME" value="$yoyaku{'NAME'}"></TD>
  </TR>
  <TR>
    <TD bgcolor="#C7DCF2">ツアー番号</TD>
	<TD bgcolor="#ffffff"><INPUT size="20" type="text" name="NO" value="$yoyaku{'NO'}" style="IME-MODE: disabled"></TD>
  </TR>
  <TR>
    <TD bgcolor="#C7DCF2">実施期間</TD>
	<TD bgcolor="#ffffff">$local{'START_YY'}年 $local{'START_MM'}月 $local{'START_DD'}日  〜  $local{'END_YY'}年 $local{'END_MM'}月 $local{'END_DD'}日</TD>
  </TR>
  <TR>
    <TD bgcolor="#C7DCF2">申込締切日</TD>
	<TD bgcolor="#ffffff">$local{'SHIMEKIRI_YY'}年 $local{'SHIMEKIRI_MM'}月 $local{'SHIMEKIRI_DD'}日</TD>
  </TR>
  <TR>
    <TD bgcolor="#C7DCF2">カテゴリ</TD>
	<TD bgcolor="#ffffff">$local{'category-select'}</TD>
  </TR>

  <TR>
    <TD bgcolor="#C7DCF2">本文</TD>
	<TD bgcolor="#ffffff">
    <TABLE border="0" cellspacing="1" bgcolor="#999999">
      <TR>
        <TD bgcolor="#efefef" valign="middle">
	      文字サイズ：<select name="HONBUN_size">
	      <option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option>
	      <option value="5">5</option><option value="6">6</option><option value="7">7</option>
	      </select>
	      <A href="javaScript:void(0)" onClick="tag_size(document.form.HONBUN_size.options[document.form.HONBUN_size.selectedIndex].value);return false"><IMG src="./textarea_image/S.gif" border="0" title="フォントサイズを変更"></A>
	      <A href="javaScript:void(0)" onClick="linkPrompt(document.form.HONBUN); return false"><IMG src="./textarea_image/URL.gif" border="0" title="リンクを貼る"></A>
	      <A href="javaScript:void(0)" onClick="tag('B');return false"><IMG src="./textarea_image/B.gif" border="0" title="太くする"></A>
	      <A href="javaScript:void(0)" onClick="tag('I');return false"><IMG src="./textarea_image/I.gif" border="0" title="斜体にする"></A>
	      <A href="javaScript:void(0)" onClick="tag('U');return false"><IMG src="./textarea_image/U.gif" border="0" title="下線を引く"></A>
	      <A href="javaScript:void(0)" onClick="insertStr(el,'&lt;BR&gt;');return false"><IMG src="./textarea_image/BR.gif" border="0" title="改行する"></A>
	      <A href="javaScript:void(0)" onClick="tag('F');return false"><IMG src="./textarea_image/F.gif" border="0" title="色をつける"></A>
          <A href="./textarea_image/color/cc.html" target=_"blank"><IMG src="./textarea_image/COLOR.gif" border="0" title="色見本"></A>
        </TD>
      </TR>
      <TR>
        <TD>
        <TEXTAREA rows="8" cols="58" name="HONBUN" id="HONBUN" onfocus="get_pos(HONBUN);" onkeypress="insertbr(HONBUN);" onmouseup="get_pos(HONBUN);" onkeyup="get_pos(HONBUN);">$yoyaku{'HONBUN'}</TEXTAREA>
        </TD>
      </TR>
    </TABLE>
	</TD>
  </TR>
  <TR>
    <TD bgcolor="#C7DCF2">出発地・宿泊日数など</TD>
	<TD bgcolor="#ffffff">
    <TABLE border="0" cellspacing="1" bgcolor="#999999">
      <TR>
        <TD bgcolor="#efefef" valign="middle">
	      文字サイズ：<select name="SYUPATU_SYUKUHAKU_size">
	      <option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option>
	      <option value="5">5</option><option value="6">6</option><option value="7">7</option>
	      </select>
	      <A href="javaScript:void(0)" onClick="tag_size(document.form.SYUPATU_SYUKUHAKU_size.options[document.form.SYUPATU_SYUKUHAKU_size.selectedIndex].value);return false"><IMG src="./textarea_image/S.gif" border="0" title="フォントサイズを変更"></A>
	      <A href="javaScript:void(0)" onClick="linkPrompt(document.form.SYUPATU_SYUKUHAKU); return false"><IMG src="./textarea_image/URL.gif" border="0" title="リンクを貼る"></A>
	      <A href="javaScript:void(0)" onClick="tag('B');return false"><IMG src="./textarea_image/B.gif" border="0" title="太くする"></A>
	      <A href="javaScript:void(0)" onClick="tag('I');return false"><IMG src="./textarea_image/I.gif" border="0" title="斜体にする"></A>
	      <A href="javaScript:void(0)" onClick="tag('U');return false"><IMG src="./textarea_image/U.gif" border="0" title="下線を引く"></A>
	      <A href="javaScript:void(0)" onClick="insertStr(el,'&lt;BR&gt;');return false"><IMG src="./textarea_image/BR.gif" border="0" title="改行する"></A>
	      <A href="javaScript:void(0)" onClick="tag('F');return false"><IMG src="./textarea_image/F.gif" border="0" title="色をつける"></A>
          <A href="./textarea_image/color/cc.html" target=_"blank"><IMG src="./textarea_image/COLOR.gif" border="0" title="色見本"></A>
        </TD>
      </TR>
      <TR>
        <TD><TEXTAREA rows="8" cols="58" name="SYUPATU_SYUKUHAKU" id="SYUPATU_SYUKUHAKU" onfocus="get_pos(SYUPATU_SYUKUHAKU);" onkeypress="insertbr(SYUPATU_SYUKUHAKU);" onmouseup="get_pos(SYUPATU_SYUKUHAKU);" onkeyup="get_pos(SYUPATU_SYUKUHAKU);">$yoyaku{'SYUPATU_SYUKUHAKU'}</TEXTAREA></TD>
      </TR>
    </TABLE>
	</TD>
  </TR>
  <TR>
    <TD bgcolor="#C7DCF2">料金</TD>
	<TD bgcolor="#ffffff">
    <TABLE border="0" cellspacing="1" bgcolor="#999999">
      <TR>
        <TD bgcolor="#efefef" valign="middle">
	      文字サイズ：<select name="RYOUKIN_size">
	      <option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option>
	      <option value="5">5</option><option value="6">6</option><option value="7">7</option>
	      </select>
	      <A href="javaScript:void(0)" onClick="tag_size(document.form.RYOUKIN_size.options[document.form.RYOUKIN_size.selectedIndex].value);return false"><IMG src="./textarea_image/S.gif" border="0" title="フォントサイズを変更"></A>
	      <A href="javaScript:void(0)" onClick="linkPrompt(document.form.RYOUKIN); return false"><IMG src="./textarea_image/URL.gif" border="0" title="リンクを貼る"></A>
	      <A href="javaScript:void(0)" onClick="tag('B');return false"><IMG src="./textarea_image/B.gif" border="0" title="太くする"></A>
	      <A href="javaScript:void(0)" onClick="tag('I');return false"><IMG src="./textarea_image/I.gif" border="0" title="斜体にする"></A>
	      <A href="javaScript:void(0)" onClick="tag('U');return false"><IMG src="./textarea_image/U.gif" border="0" title="下線を引く"></A>
	      <A href="javaScript:void(0)" onClick="insertStr(el,'&lt;BR&gt;');return false"><IMG src="./textarea_image/BR.gif" border="0" title="改行する"></A>
	      <A href="javaScript:void(0)" onClick="tag('F');return false"><IMG src="./textarea_image/F.gif" border="0" title="色をつける"></A>
          <A href="./textarea_image/color/cc.html" target=_"blank"><IMG src="./textarea_image/COLOR.gif" border="0" title="色見本"></A>
        </TD>
      </TR>
      <TR>
        <TD><TEXTAREA rows="8" cols="58" name="RYOUKIN" id="RYOUKIN" onfocus="get_pos(RYOUKIN);" onkeypress="insertbr(RYOUKIN);" onmouseup="get_pos(RYOUKIN);" onkeyup="get_pos(RYOUKIN);">$yoyaku{'RYOUKIN'}</TEXTAREA></TD>
      </TR>
    </TABLE>
	</TD>
  </TR>
  <TR>
    <TD bgcolor="#C7DCF2">注意書き</TD>
	<TD bgcolor="#ffffff">
    <TABLE border="0" cellspacing="1" bgcolor="#999999">
      <TR>
        <TD bgcolor="#efefef" valign="middle">
	      文字サイズ：<select name="CYUI_size">
	      <option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option>
	      <option value="5">5</option><option value="6">6</option><option value="7">7</option>
	      </select>
	      <A href="javaScript:void(0)" onClick="tag_size(document.form.CYUI_size.options[document.form.CYUI_size.selectedIndex].value);return false"><IMG src="./textarea_image/S.gif" border="0" title="フォントサイズを変更"></A>
	      <A href="javaScript:void(0)" onClick="linkPrompt(document.form.CYUI); return false"><IMG src="./textarea_image/URL.gif" border="0" title="リンクを貼る"></A>
	      <A href="javaScript:void(0)" onClick="tag('B');return false"><IMG src="./textarea_image/B.gif" border="0" title="太くする"></A>
	      <A href="javaScript:void(0)" onClick="tag('I');return false"><IMG src="./textarea_image/I.gif" border="0" title="斜体にする"></A>
	      <A href="javaScript:void(0)" onClick="tag('U');return false"><IMG src="./textarea_image/U.gif" border="0" title="下線を引く"></A>
	      <A href="javaScript:void(0)" onClick="insertStr(el,'&lt;BR&gt;');return false"><IMG src="./textarea_image/BR.gif" border="0" title="改行する"></A>
	      <A href="javaScript:void(0)" onClick="tag('F');return false"><IMG src="./textarea_image/F.gif" border="0" title="色をつける"></A>
          <A href="./textarea_image/color/cc.html" target=_"blank"><IMG src="./textarea_image/COLOR.gif" border="0" title="色見本"></A>
        </TD>
      </TR>
      <TR>
        <TD><TEXTAREA rows="8" cols="58" name="CYUI" id="CYUI" onfocus="get_pos(CYUI);" onkeypress="insertbr(CYUI);" onmouseup="get_pos(CYUI);" onkeyup="get_pos(CYUI);">$yoyaku{'CYUI'}</TEXTAREA></TD>
      </TR>
    </TABLE>
	</TD>
  </TR>
$local{'img'}
  <TR>
    <TD bgcolor="#C7DCF2">締切人数</TD>
	<TD bgcolor="#ffffff"><INPUT size="10" type="text" name="NINZUU" value="$yoyaku{'NINZUU'}"> 人</TD>
  </TR>
  <TR>
    <TD bgcolor="#C7DCF2">行程表</TD>
	<TD bgcolor="#ffffff">
	  <TABLE cellspacing="1" cellpadding="3" width="100%">
	  $KOUTEI_list
	  </TABLE>
	</TD>
  </TR>
</TABLE>
<BR>
<INPUT type="submit" value="登録">
</FORM>
</DIV>
EOF
1;
