#======================
# 管理画面
#======================

#----------------------
# HTML出力
#----------------------
$replace{'title'} ='管理画面';
$replace{'html'}=<<EOF;
@{[pwd('管理画面')]}

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

