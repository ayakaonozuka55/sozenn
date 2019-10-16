#=========================
# イベント情報の登録
#=========================
my %local;
my %category;
hash_IO( \%category, "$dir{'db'}/category/$in{'pk'}.dat", 'e' );
%category = HTML_escape( \%category );

#----------------------
# HTML出力
#----------------------
$HTML             = './_mini.htm';
$replace{'title'} = 'カテゴリ管理';
$replace{'html'}  = <<EOF;
<DIV id="edit" align="center">
<DIV class="title">カテゴリ管理</DIV>
<FORM action="$ENV{'SCRIPT_NAME'}" method="POST" name="form" enctype="multipart/form-data">
<INPUT type="hidden" name="c" value="category-2">
<INPUT type="hidden" name="pk" value="$category{'pk'}">
<TABLE cellspacing="1" cellpadding="3" bgcolor="#999999" width="400">
  <TR>
    <TD bgcolor="#C7DCF2">カテゴリ名</TD>
	<TD bgcolor="#ffffff"><INPUT size="60" type="text" name="NAME" value="$category{'NAME'}"></TD>
  </TR>
</TABLE>
<BR>
<INPUT type="submit" value="登録">
</FORM>
</DIV>
EOF
1;
