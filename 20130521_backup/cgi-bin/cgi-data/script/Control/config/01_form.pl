#======================
#  初期設定
#======================

my %config;
hash_IO ( \%config ,"$dir{'db'}/config.ini", 'e' );
%config=HTML_escape(\%config);

#----------------------
# HTML出力
#----------------------
$replace{'title'} ='初期設定';
$HTML='./_mini.htm';
$replace{'html'}=<<EOF;
@{[pwd('管理画面:c=','初期設定')]}
<DIV id="edit">
<TABLE cellspacing="1" width="600">
  <TR>
    <TD valign="top" width="150">@{[exe('menu_left')]}</TD>
    <TD valign="top">
    <DIV class="title">初期設定</DIV>
    <FORM action="$ENV{'SCRIPT_NAME'}" method="POST">
    <INPUT type="hidden" name="c" value="config_2">
    <DIV class="title2"><LABEL for="ID">ID/PASS</LABEL></DIV>
    ID　<INPUT size="20" type="text" name="ID" value="$config{'ID'}" id="ID" style="IME-MODE: disabled">　　
    PASS　<INPUT size="20" type="text" name="PASS" value="$config{'PASS'}" style="IME-MODE: disabled"><BR>
    <BR>
    <BR>
    <BR>
    <INPUT type="submit" value="登録する">
    <BR>
    <BR>
    <BR>
    </TD>
  </TR>
</TABLE>
</DIV>
EOF
1;
