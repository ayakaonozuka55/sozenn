#======================
# �����κ����ǧ
#======================

my %yoyaku;
hash_IO ( \%yoyaku ,"$dir{'db'}/yoyaku/$in{'pk'}.dat", 'e' );
%yoyaku=HTML_escape(\%yoyaku);
&Get_Category_Name($yoyaku{'CATEGORY_pk'});

#----------------------
# HTML����
#----------------------
$HTML='./_mini.htm';
$replace{'title'} ="�ĥ����������";
$replace{'html'} =<<EOF; # >
<DIV class="title">�ĥ������󡡺����ǧ</DIV>
  <DIV align="center">
  <TABLE cellspacing="1" cellpadding="3" bgcolor="#999999">
    <COL style="background-color:#eee; width:80.0px; text-align:center;">
    <COL style="background-color:#fff; width:270.0px;">
  <TR>
    <TD bgcolor="#C7DCF2" width="80">�ĥ���̾</TD>
	<TD bgcolor="#ffffff">$yoyaku{'NAME'}</TD>
  </TR>
  <TR>
    <TD bgcolor="#C7DCF2" width="80">�ĥ����ֹ�</TD>
	<TD bgcolor="#ffffff">$yoyaku{'NO'}</TD>
  </TR>
  <TR>
    <TD bgcolor="#C7DCF2" width="80">���ƥ���</TD>
	<TD bgcolor="#ffffff">$get_category_name</TD>
  </TR>
  <TR>
    <TD bgcolor="#C7DCF2" width="80">�»ܴ���</TD>
	<TD bgcolor="#ffffff">$yoyaku{'START_YY'}ǯ$yoyaku{'START_MM'}��$yoyaku{'START_DD'}�� �� $yoyaku{'END_YY'}ǯ$yoyaku{'END_MM'}��$yoyaku{'END_DD'}��</TD>
  </TR>
  <TR>
    <TD bgcolor="#C7DCF2" width="80">����������</TD>
	<TD bgcolor="#ffffff">$yoyaku{'SHIMEKIRI_YY'}ǯ$yoyaku{'SHIMEKIRI_MM'}��$yoyaku{'SHIMEKIRI_DD'}��</TD>
  </TR>
</TABLE>
  <BR>
  <TABLE cellspacing="1" cellpadding="3">
    <TR>
      <TD align="center"><B>���Υǡ����������˺�����Ƥ�����Ǥ�����</B></TD>
    </TR>
  </TABLE>
  <BR>
<FORM action="$ENV{'SCRIPT_NAME'}" method="POST">
<INPUT type="hidden" name="c" value="yoyaku-4">
<INPUT type="hidden" name="pk" value="$yoyaku{'pk'}">
<INPUT type="submit" value="�������������"><BR>
</FORM>
</DIV>
EOF

1;
