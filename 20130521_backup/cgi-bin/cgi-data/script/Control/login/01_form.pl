#======================
# ������˥塼
#======================

#----------------------
# HTML����
#----------------------
$replace{'title'} ='�ێ��ގ���';
$replace{'html'}=<<EOF;
<BR>
<BR>

<FORM action="$ENV{'SCRIPT_NAME'}" method="POST">
<INPUT type="hidden" name="c" value="login_2">
<TABLE cellspacing="1" cellpadding="3" width="300">
  <TR>
    <TD align="center">
    <DIV id="edit">
	<DIV class="flat">�����󤷤Ƥ���������</DIV>
	<DIV class="solid">
		<TABLE cellspacing="1" cellpadding="3">
		  <TR>
		    <TD>ID</TD>
		    <TD><INPUT size="20" type="text" name="ID" style="IME-MODE: disabled"></TD>
		  </TR>
		  <TR>
		    <TD>PASS</TD>
		    <TD><INPUT size="10" type="password" name="PASS"style="IME-MODE: disabled"></TD>
		  </TR>
		</TABLE>
		<BR>
		<INPUT type="submit" value="�����󤹤�">
	</DIV>
</DIV>
</TD>
  </TR>
</TABLE>


</FORM>
<BR>
<BR>


EOF
1;
