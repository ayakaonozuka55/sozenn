#======================
# 記事の削除確認
#======================

my %category;
hash_IO ( \%category ,"$dir{'db'}/category/$in{'pk'}.dat", 'e' );
%category=HTML_escape(\%category);

#----------------------
# HTML出力
#----------------------
$HTML='./_mini.htm';
$replace{'title'} ="カテゴリ管理";
$replace{'html'} =<<EOF; # >
<DIV class="title">カテゴリ情報　削除確認</DIV>
  <DIV align="center">
  <TABLE cellspacing="1" cellpadding="3" bgcolor="#999999">
    <COL style="background-color:#eee; width:80.0px; text-align:center;">
    <COL style="background-color:#fff; width:270.0px;">
  <TR>
    <TD><B>カテゴリ名</B></TD>
    <TD>$category{'NAME'}</TD>
  </TR>
</TABLE>
  <BR>
  <TABLE cellspacing="1" cellpadding="3">
    <TR>
      <TD align="center"><B><FONT color="red">※このカテゴリに関連する団体ツアー情報はすべて削除されます。</FONT></B></TD>
    </TR>
    <TR>
      <TD align="center"><B>このデータを本当に削除してよろしいですか？</B></TD>
    </TR>
  </TABLE>
  <BR>
  <FORM action="$ENV{'SCRIPT_NAME'}" method="POST">
  <INPUT type="hidden" name="c" value="category-4">
  <INPUT type="hidden" name="pk" value="$category{'pk'}">
  <INPUT type="submit" value="　今すぐ削除　"><BR>
  </FORM>
</DIV>
EOF
1;
