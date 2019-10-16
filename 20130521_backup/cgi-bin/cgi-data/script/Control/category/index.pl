#===================
# category����
#===================

my $list;
my @tr_color = ( '#eeeeee', '#ffffff' );
my $tr_color;

$in{'sk'} ||= 0;
my $turn = 20;

my (@category);

for my $category ( reverse sort glob("$dir{'db'}/category/*.dat") ) {
    my %category;
    hash_IO( \%category, $category, 'e' );
    push( @category, \%category );
}

@category = sort { $b->{'pk'} <=> $a->{'pk'} } @category;
my $total = scalar @category;

for my $category ( @category[ $in{'sk'} .. $in{'sk'} + $turn - 1 ] ) {
    last if ( !$category );
    my %category = HTML_escape($category);
    $tr_color = ( $tr_color == 0 );
    
    $list .= qq|  <TR bgcolor="$tr_color[$tr_color]">\n|;
    $list .= qq|    <TD>$category{'NAME'}</TD>\n|;
    $list .= qq|    <TD align="center"><A href="?c=category-1&pk=$category{'pk'}" onClick="ow(this.href,550,200);return false;">�Խ�</A></TD>|;
    $list .= qq|    <TD align="center"><A href="?c=category-3&pk=$category{'pk'}" onClick="ow(this.href,450,200);return false;">���</A></TD>\n|;
    $list .= qq|  </TR>\n|;

}

$list ||= qq|<TR bgcolor="#cccccc"><TD colspan="3" align="center"><FONT color="#999999">�����ǡ����ʤ�</FONT></TD></TR>\n|;

$seek = '';
$seek .= qq|<TABLE cellspacing="1" cellpadding="3" width="330">\n|;
$seek .= qq| <TR>\n|;
$seek .= qq|   <TD align="left">\n|;
$seek .= qq|     <A href="?c=category&sk=@{[$in{'sk'}-$turn]}">����$turn��</A>��| if ( $in{'sk'} );
$seek .= qq|   </TD>\n|;
$seek .= qq|   <TD align="right">\n|;
$seek .= qq|     <A href="?c=category&sk=@{[$in{'sk'}+$turn]}">����$turn��</A><BR>| if ( ( $in{'sk'} + $turn ) <= $total );    # >
$seek .= qq|   </TD>\n|;
$seek .= qq| </TR>\n|;
$seek .= qq|</TABLE>\n|;

#----------------------
# HTML����
#----------------------
$replace{'title'} = '���ƥ������';
$replace{'html'}  = <<EOF;
@{[pwd('��������:c=','���ƥ������')]}
<DIV id="edit">
<TABLE cellspacing="1" width="950">
  <TR>
	<TD valign="top" width="150">@{[exe('menu_left')]}</TD>
	<TD valign="top">
	<DIV class="title">���ƥ������</DIV>
	<A href="?c=category-1" onClick="ow(this.href,550,200);return false;">+�������ƥ������Ͽ</A>
	$seek
	<TABLE bgcolor="#999999" cellspacing="1" cellpadding="3">
	  <TR class="list_head">
	    <TD align="center" width="250" align="center">���ƥ���̾</TD>
	    <TD align="center" colspan="2">���</TD>
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
