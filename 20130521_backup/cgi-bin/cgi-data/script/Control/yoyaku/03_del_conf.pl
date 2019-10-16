#======================
# 記事の削除確認
#======================

my %yoyaku;
hash_IO ( \%yoyaku ,"$dir{'db'}/yoyaku/$in{'pk'}.dat", 'e' );
%yoyaku=HTML_escape(\%yoyaku);
&Get_Category_Name($yoyaku{'CATEGORY_pk'});

#----------------------
# HTML出力
#----------------------
$HTML='./_mini.htm';
$replace{'title'} ="ツアー情報管理";
$replace{'html'} =<<EOF; # >
<DIV class="title">ツアー情報　削除確認</DIV>
  <DIV align="center">
  <TABLE cellspacing="1" cellpadding="3" bgcolor="#999999">
    <COL style="background-color:#eee; width:80.0px; text-align:center;">
    <COL style="background-color:#fff; width:270.0px;">
  <TR>
    <TD bgcolor="#C7DCF2" width="80">ツアー名</TD>
	<TD bgcolor="#ffffff">$yoyaku{'NAME'}</TD>
  </TR>
  <TR>
    <TD bgcolor="#C7DCF2" width="80">ツアー番号</TD>
	<TD bgcolor="#ffffff">$yoyaku{'NO'}</TD>
  </TR>
  <TR>
    <TD bgcolor="#C7DCF2" width="80">カテゴリ</TD>
	<TD bgcolor="#ffffff">$get_category_name</TD>
  </TR>
  <TR>
    <TD bgcolor="#C7DCF2" width="80">実施期間</TD>
	<TD bgcolor="#ffffff">$yoyaku{'START_YY'}年$yoyaku{'START_MM'}月$yoyaku{'START_DD'}日 〜 $yoyaku{'END_YY'}年$yoyaku{'END_MM'}月$yoyaku{'END_DD'}日</TD>
  </TR>
  <TR>
    <TD bgcolor="#C7DCF2" width="80">申込締切日</TD>
	<TD bgcolor="#ffffff">$yoyaku{'SHIMEKIRI_YY'}年$yoyaku{'SHIMEKIRI_MM'}月$yoyaku{'SHIMEKIRI_DD'}日</TD>
  </TR>
</TABLE>
  <BR>
  <TABLE cellspacing="1" cellpadding="3">
    <TR>
      <TD align="center"><B>このデータを本当に削除してよろしいですか？</B></TD>
    </TR>
  </TABLE>
  <BR>
<FORM action="$ENV{'SCRIPT_NAME'}" method="POST">
<INPUT type="hidden" name="c" value="yoyaku-4">
<INPUT type="hidden" name="pk" value="$yoyaku{'pk'}">
<INPUT type="submit" value="　今すぐ削除　"><BR>
</FORM>
</DIV>
EOF

1;
