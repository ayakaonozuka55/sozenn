#======================
# ��������
#======================

#----------------------
# HTML����
#----------------------
$replace{'title'} ='��������';
$replace{'html'}=<<EOF;
@{[pwd('��������')]}

<DIV id="edit">
<TABLE cellspacing="1" width="850">
  <TR>
    <TD valign="top" width="150">@{[exe('menu_left')]}</TD>
    <TD valign="top">
    </TD>
  </TR>
</TABLE>
</DIV>
EOF

1;

