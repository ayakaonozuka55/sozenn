#======================
#  �������
#======================

my %config;
hash_IO ( \%config ,"$dir{'db'}/config.ini", 'e' );
%config=(%config,%in);

hash_IO ( \%config ,">$dir{'db'}/config.ini" );


#----------------------
# HTML����
#----------------------
$replace{'title'} ='�������';
$replace{'html'}=<<EOF;
@{[pwd('��������:c=','�������')]}
<DIV id="edit">
<TABLE cellspacing="1" width="600">
  <TR>
    <TD valign="top" width="150">@{[exe('menu_left')]}</TD>
    <TD height="150" valign="top">
    <DIV class="title">�������</DIV>
    <BR /><BR />
    <div align="center">��Ͽ���ޤ�����</div>
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
