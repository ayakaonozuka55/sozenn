#======================
# 記事の削除確認
#======================

my %topics;
hash_IO ( \%topics ,"$dir{'db'}/topics/$in{'pk'}.dat", 'e' );
%topics=HTML_escape(\%topics);

#----------------------
# HTML出力
#----------------------
$HTML='./_mini.htm';
$replace{'title'} ="News&Topics";
$replace{'html'} =<<EOF; # >
<DIV class="title">News&Topics　削除確認</DIV>
  <DIV align="center">
  <TABLE cellspacing="1" cellpadding="3" bgcolor="#999999">
    <COL style="background-color:#eee; width:80.0px; text-align:center;">
    <COL style="background-color:#fff; width:270.0px;">
  <TR>
    <TD bgcolor="#C7DCF2" width="80">日付</TD>
	<TD bgcolor="#ffffff">$topics{'YY'}年$topics{'MM'}月$topics{'DD'}日</TD>
  </TR>
  <TR>
    <TD bgcolor="#C7DCF2" width="80">タイトル</TD>
	<TD bgcolor="#ffffff">$topics{'TITLE'}</TD>
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
<INPUT type="hidden" name="c" value="topics-4">
<INPUT type="hidden" name="pk" value="$topics{'pk'}">
<INPUT type="submit" value="　今すぐ削除　"><BR>
</FORM>
</DIV>
EOF
1;









# $replace{'html'}=<<EOF;
# <DIV id="edit">
# <FORM action="$ENV{'SCRIPT_NAME'}" method="POST">
# <INPUT type="hidden" name="c" value="topics-4">
# <INPUT type="hidden" name="pk" value="$topics{'pk'}">
# <TABLE cellspacing="1" cellpadding="3" width="300">
#   <TR>
#     <TD>
# 	<DIV class="title2">日付</DIV>
# 	$topics{'YY'}年$topics{'MM'}月$topics{'DD'}日
# 	<DIV class="title2">タイトル</DIV>
# 	$topics{'TITLE'}
# 	<BR>
# 	<BR>
# 	</TD>
#   </TR>
# </TABLE>
# </DIV>
# 　　<INPUT type="submit" value="削除する">
# </FORM>
# EOF
