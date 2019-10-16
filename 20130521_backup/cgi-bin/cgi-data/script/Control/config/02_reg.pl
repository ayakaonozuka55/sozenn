#======================
#  初期設定
#======================

my %config;
hash_IO ( \%config ,"$dir{'db'}/config.ini", 'e' );
%config=(%config,%in);

hash_IO ( \%config ,">$dir{'db'}/config.ini" );


#----------------------
# HTML出力
#----------------------
$replace{'title'} ='初期設定';
$replace{'html'}=<<EOF;
@{[pwd('管理画面:c=','初期設定')]}
<DIV id="edit">
<TABLE cellspacing="1" width="600">
  <TR>
    <TD valign="top" width="150">@{[exe('menu_left')]}</TD>
    <TD height="150" valign="top">
    <DIV class="title">初期設定</DIV>
    <BR /><BR />
    <div align="center">登録しました。</div>
    <BR /><BR />
    <BR /><BR />
    <BR /><BR />
    <BR /><BR />
    </TD>
  </TR>
</TABLE>
</DIV>
EOF
1;
