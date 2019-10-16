#===================
# News&Topics ����
#===================

my $list;
my @tr_color = ( '#eeeeee', '#ffffff' );
my $tr_color;

$in{'sk'} ||= 0;
my $turn = 20;

my (@topics);

for my $topics ( reverse sort glob("$dir{'db'}/topics/*.dat") ) {
    my %topics;
    hash_IO( \%topics, $topics, 'e' );
    push( @topics, \%topics );
}
@topics = sort { $b->{'DATE'} <=> $a->{'DATE'} or $b->{'pk'} <=> $a->{'pk'} } @topics;
my $total = scalar @topics;

for my $topics ( @topics[ $in{'sk'} .. $in{'sk'} + $turn - 1 ] ) {
    last if ( !$topics );
    my %topics = HTML_escape($topics);
    $tr_color = ( $tr_color == 0 );
    if ( $topics{'MODE'} eq '����' ) {
        $list .= qq|  <TR bgcolor="$tr_color[$tr_color]">\n|;
        $list .= qq|    <TD width="60" align="center"><FONT color="blue"><B>������</B></FONT></TD>|;
        $list .= qq|    <TD align="center" width="75">$topics{'YY'}-$topics{'MM'}-$topics{'DD'}</TD>\n|;
        $list .= qq|    <TD width="300">@{[String_cut($topics{'TITLE'},50)]}</TD>\n|;
        $list .= qq|    <TD align="center"><A href="?c=topics-7&pk=$topics{'pk'}&sk=$in{'sk'}">�������</A></TD>|;
        $list .= qq|    <TD align="center"><A href="?c=topics-1&pk=$topics{'pk'}" onClick="ow(this.href,600,500);return false;">�Խ�</A></TD>|;
        $list .= qq|    <TD align="center"><A href="?c=topics-3&pk=$topics{'pk'}" onClick="ow(this.href,350,250);return false;">���</A></TD>\n|;
        $list .= qq|  </TR>\n|;
    }
    elsif ( $topics{'MODE'} eq '�����' ) {
        $list .= qq|  <TR bgcolor="$tr_color[$tr_color]">\n|;
        $list .= qq|    <TD width="60" align="center"><FONT color="red">�����</FONT></TD>|;
        $list .= qq|    <TD align="center" width="75">$topics{'YY'}-$topics{'MM'}-$topics{'DD'}</TD>\n|;
        $list .= qq|    <TD width="300">@{[String_cut($topics{'TITLE'},50)]}</TD>\n|;
        $list .= qq|    <TD align="center"><A href="?c=topics-7&pk=$topics{'pk'}&sk=$in{'sk'}"><B><FONT color="#0000ff">��������</FONT></B></A></TD>|;
        $list .= qq|    <TD align="center"><A href="?c=topics-1&pk=$topics{'pk'}" onClick="ow(this.href,600,500);return false;">�Խ�</A></TD>|;
        $list .= qq|    <TD align="center"><A href="?c=topics-3&pk=$topics{'pk'}" onClick="ow(this.href,350,250);return false;">���</A></TD>\n|;
        $list .= qq|  </TR>\n|;
    }

}

$list ||= qq|<TR bgcolor="#cccccc"><TD colspan="8" align="center"><FONT color="#999999">�����ǡ����ʤ�</FONT></TD></TR>\n|;

$seek = '';
$seek .= qq|<TABLE cellspacing="1" cellpadding="3" width="750">\n|;
$seek .= qq| <TR>\n|;
$seek .= qq|   <TD align="left">\n|;
$seek .= qq|     <A href="?c=topics&sk=@{[$in{'sk'}-$turn]}">����$turn��</A>��| if ( $in{'sk'} );
$seek .= qq|   </TD>\n|;
$seek .= qq|   <TD align="right">\n|;
$seek .= qq|     <A href="?c=topics&sk=@{[$in{'sk'}+$turn]}">����$turn��</A><BR>| if ( ( $in{'sk'} + $turn ) <= $total );    # >
$seek .= qq|   </TD>\n|;
$seek .= qq| </TR>\n|;
$seek .= qq|</TABLE>\n|;

#----------------------
# HTML����
#----------------------
$replace{'title'} = 'News&Topics';
$replace{'html'}  = <<EOF;
@{[pwd('��������:c=','News&Topics')]}
<DIV id="edit">
<TABLE cellspacing="1" width="950">
  <TR>
	<TD valign="top" width="150">@{[exe('menu_left')]}</TD>
	<TD valign="top">
	<DIV class="title">News&Topics</DIV>
	<A href="?c=topics-1" onClick="ow(this.href,600,500);return false;">+������������Ͽ</A>
	$seek
	<TABLE bgcolor="#999999" cellspacing="1" cellpadding="3">
	  <TR class="list_head">
	    <TD align="center" width="60">��������</TD>
	    <TD align="center" width="75">����</TD>
	    <TD align="center" width="300">�����ȥ�</TD>
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
