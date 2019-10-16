#===================
# yoyaku����
#===================

my $list;
my @tr_color = ( '#eeeeee', '#ffffff' );
my $tr_color;

$in{'sk'} ||= 0;
my $turn = 20;

my (@yoyaku);

for my $yoyaku ( reverse sort glob("$dir{'db'}/yoyaku/*.dat") ) {
    my %yoyaku;
    hash_IO( \%yoyaku, $yoyaku, 'e' );
    push( @yoyaku, \%yoyaku );
}

@yoyaku = sort { $b->{'DATE'} <=> $a->{'DATE'} or $b->{'pk'} <=> $a->{'pk'} } @yoyaku;
my $total = scalar @yoyaku;

for my $yoyaku ( @yoyaku[ $in{'sk'} .. $in{'sk'} + $turn - 1 ] ) {
    last if ( !$yoyaku );
    my %yoyaku = HTML_escape($yoyaku);
    $tr_color = ( $tr_color == 0 );
    
    # ���ƥ���̾�μ���
    &Get_Category_Name ($yoyaku{'CATEGORY_pk'});
    
    
    if ( $yoyaku{'MODE'} eq '����' ) {
        $list .= qq|  <TR bgcolor="$tr_color[$tr_color]">\n|;
        $list .= qq|    <TD align="center"><FONT color="blue"><B>������</B></FONT></TD>|;
        $list .= qq|    <TD width="200">@{[String_cut( $yoyaku{'NAME'},30 )]}</TD>\n|;
        $list .= qq|    <TD width="70">$yoyaku{'NO'}</TD>\n|;
        $list .= qq|    <TD width="140">@{[String_cut($get_category_name,24)]}</TD>\n|;
        $list .= qq|    <TD>$yoyaku{'START_YY'}ǯ$yoyaku{'START_MM'}��$yoyaku{'START_DD'}�� �� $yoyaku{'END_YY'}ǯ$yoyaku{'END_MM'}��$yoyaku{'END_DD'}��</TD>\n|;
        $list .= qq|    <TD>$yoyaku{'SHIMEKIRI_YY'}ǯ$yoyaku{'SHIMEKIRI_MM'}��$yoyaku{'SHIMEKIRI_DD'}��</TD>\n|;
        $list .= qq|    <TD align="center"><A href="?c=yoyaku-7&pk=$yoyaku{'pk'}&sk=$in{'sk'}">�������</A></TD>|;
        $list .= qq|    <TD align="center"><A href="?c=yoyaku-1&pk=$yoyaku{'pk'}" onClick="ow(this.href,650,700);return false;">�Խ�</A></TD>|;
        $list .= qq|    <TD align="center"><A href="?c=yoyaku-3&pk=$yoyaku{'pk'}" onClick="ow(this.href,400,300);return false;">���</A></TD>\n|;
        $list .= qq|  </TR>\n|;
    }
    elsif ( $yoyaku{'MODE'} eq '�����' ) {
        $list .= qq|  <TR bgcolor="$tr_color[$tr_color]">\n|;
        $list .= qq|    <TD align="center"><FONT color="red">�����</FONT></TD>|;
        $list .= qq|    <TD width="200">@{[String_cut( $yoyaku{'NAME'},32 )]}</TD>\n|;
        $list .= qq|    <TD width="70">$yoyaku{'NO'}</TD>\n|;
        $list .= qq|    <TD width="140">@{[String_cut($get_category_name,24)]}</TD>\n|;
        $list .= qq|    <TD>$yoyaku{'START_YY'}ǯ$yoyaku{'START_MM'}��$yoyaku{'START_DD'}�� �� $yoyaku{'END_YY'}ǯ$yoyaku{'END_MM'}��$yoyaku{'END_DD'}��</TD>\n|;
        $list .= qq|    <TD>$yoyaku{'SHIMEKIRI_YY'}ǯ$yoyaku{'SHIMEKIRI_MM'}��$yoyaku{'SHIMEKIRI_DD'}��</TD>\n|;
        $list .= qq|    <TD align="center"><A href="?c=yoyaku-7&pk=$yoyaku{'pk'}&sk=$in{'sk'}"><B><FONT color="#0000ff">��������</FONT></B></A></TD>|;
        $list .= qq|    <TD align="center"><A href="?c=yoyaku-1&pk=$yoyaku{'pk'}" onClick="ow(this.href,650,700);return false;">�Խ�</A></TD>|;
        $list .= qq|    <TD align="center"><A href="?c=yoyaku-3&pk=$yoyaku{'pk'}" onClick="ow(this.href,400,300);return false;">���</A></TD>\n|;
        $list .= qq|  </TR>\n|;
    }

}

$list ||= qq|<TR bgcolor="#cccccc"><TD colspan="9" align="center"><FONT color="#999999">�����ǡ����ʤ�</FONT></TD></TR>\n|;

$seek = '';
$seek .= qq|<TABLE cellspacing="1" cellpadding="3" width="800">\n|;
$seek .= qq| <TR>\n|;
$seek .= qq|   <TD align="left">\n|;
$seek .= qq|     <A href="?c=yoyaku&sk=@{[$in{'sk'}-$turn]}">����$turn��</A>��| if ( $in{'sk'} );
$seek .= qq|   </TD>\n|;
$seek .= qq|   <TD align="right">\n|;
$seek .= qq|     <A href="?c=yoyaku&sk=@{[$in{'sk'}+$turn]}">����$turn��</A><BR>| if ( ( $in{'sk'} + $turn ) <= $total );    # >
$seek .= qq|   </TD>\n|;
$seek .= qq| </TR>\n|;
$seek .= qq|</TABLE>\n|;

#----------------------
# HTML����
#----------------------
$replace{'title'} = '�ĥ����������';
$replace{'html'}  = <<EOF;
@{[pwd('��������:c=','�ĥ����������')]}
<DIV id="edit">
<TABLE cellspacing="1" width="1200">
  <TR>
	<TD valign="top" width="150">@{[exe('menu_left')]}</TD>
	<TD valign="top">
	<DIV class="title">�ĥ����������</DIV>
	<A href="?c=yoyaku-1" onClick="ow(this.href,650,700);return false;">+������������Ͽ</A>
	$seek
	<TABLE bgcolor="#999999" cellspacing="1" cellpadding="3">
	  <TR class="list_head">
	    <TD align="center" width="60">��������</TD>
	    <TD align="center" width="200">�ĥ���̾</TD>
	    <TD align="center" width="70">�ĥ����ֹ�</TD>
	    <TD align="center" width="140">���ƥ���</TD>
	    <TD align="center" width="200">�»ܴ���</TD>
	    <TD align="center" width="90">����������</TD>
	    <TD align="center" colspan="3">���</TD>
	  </TR>
	$list
	</TABLE>
	$seek
	<BR>
	</TD>
  </TR>
</TABLE>
</DIV>
EOF
1;
