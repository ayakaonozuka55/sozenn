#======================
# �����κ����ǧ
#======================

my %category;
hash_IO ( \%category ,"$dir{'db'}/category/$in{'pk'}.dat", 'e' );
%category=HTML_escape(\%category);

#----------------------
# HTML����
#----------------------
$HTML='./_mini.htm';
$replace{'title'} ="���ƥ������";
$replace{'html'} =<<EOF; # >
<DIV class="title">���ƥ�����󡡺����ǧ</DIV>
  <DIV align="center">
  <TABLE cellspacing="1" cellpadding="3" bgcolor="#999999">
    <COL style="background-color:#eee; width:80.0px; text-align:center;">
    <COL style="background-color:#fff; width:270.0px;">
  <TR>
    <TD><B>���ƥ���̾</B></TD>
    <TD>$category{'NAME'}</TD>
  </TR>
</TABLE>
  <BR>
  <TABLE cellspacing="1" cellpadding="3">
    <TR>
      <TD align="center"><B><FONT color="red">�����Υ��ƥ���˴�Ϣ�������Υĥ�������Ϥ��٤ƺ������ޤ���</FONT></B></TD>
    </TR>
    <TR>
      <TD align="center"><B>���Υǡ����������˺�����Ƥ�����Ǥ�����</B></TD>
    </TR>
  </TABLE>
  <BR>
  <FORM action="$ENV{'SCRIPT_NAME'}" method="POST">
  <INPUT type="hidden" name="c" value="category-4">
  <INPUT type="hidden" name="pk" value="$category{'pk'}">
  <INPUT type="submit" value="�������������"><BR>
  </FORM>
</DIV>
EOF
1;
