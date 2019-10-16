#===================
# News&Topics 一覧
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
    if ( $topics{'MODE'} eq '公開' ) {
        $list .= qq|  <TR bgcolor="$tr_color[$tr_color]">\n|;
        $list .= qq|    <TD width="60" align="center"><FONT color="blue"><B>公開中</B></FONT></TD>|;
        $list .= qq|    <TD align="center" width="75">$topics{'YY'}-$topics{'MM'}-$topics{'DD'}</TD>\n|;
        $list .= qq|    <TD width="300">@{[String_cut($topics{'TITLE'},50)]}</TD>\n|;
        $list .= qq|    <TD align="center"><A href="?c=topics-7&pk=$topics{'pk'}&sk=$in{'sk'}">非公開へ</A></TD>|;
        $list .= qq|    <TD align="center"><A href="?c=topics-1&pk=$topics{'pk'}" onClick="ow(this.href,600,500);return false;">編集</A></TD>|;
        $list .= qq|    <TD align="center"><A href="?c=topics-3&pk=$topics{'pk'}" onClick="ow(this.href,350,250);return false;">削除</A></TD>\n|;
        $list .= qq|  </TR>\n|;
    }
    elsif ( $topics{'MODE'} eq '非公開' ) {
        $list .= qq|  <TR bgcolor="$tr_color[$tr_color]">\n|;
        $list .= qq|    <TD width="60" align="center"><FONT color="red">非公開</FONT></TD>|;
        $list .= qq|    <TD align="center" width="75">$topics{'YY'}-$topics{'MM'}-$topics{'DD'}</TD>\n|;
        $list .= qq|    <TD width="300">@{[String_cut($topics{'TITLE'},50)]}</TD>\n|;
        $list .= qq|    <TD align="center"><A href="?c=topics-7&pk=$topics{'pk'}&sk=$in{'sk'}"><B><FONT color="#0000ff">公開する</FONT></B></A></TD>|;
        $list .= qq|    <TD align="center"><A href="?c=topics-1&pk=$topics{'pk'}" onClick="ow(this.href,600,500);return false;">編集</A></TD>|;
        $list .= qq|    <TD align="center"><A href="?c=topics-3&pk=$topics{'pk'}" onClick="ow(this.href,350,250);return false;">削除</A></TD>\n|;
        $list .= qq|  </TR>\n|;
    }

}

$list ||= qq|<TR bgcolor="#cccccc"><TD colspan="8" align="center"><FONT color="#999999">記事データなし</FONT></TD></TR>\n|;

$seek = '';
$seek .= qq|<TABLE cellspacing="1" cellpadding="3" width="750">\n|;
$seek .= qq| <TR>\n|;
$seek .= qq|   <TD align="left">\n|;
$seek .= qq|     <A href="?c=topics&sk=@{[$in{'sk'}-$turn]}">前の$turn件</A>　| if ( $in{'sk'} );
$seek .= qq|   </TD>\n|;
$seek .= qq|   <TD align="right">\n|;
$seek .= qq|     <A href="?c=topics&sk=@{[$in{'sk'}+$turn]}">次の$turn件</A><BR>| if ( ( $in{'sk'} + $turn ) <= $total );    # >
$seek .= qq|   </TD>\n|;
$seek .= qq| </TR>\n|;
$seek .= qq|</TABLE>\n|;

#----------------------
# HTML出力
#----------------------
$replace{'title'} = 'News&Topics';
$replace{'html'}  = <<EOF;
@{[pwd('管理画面:c=','News&Topics')]}
<DIV id="edit">
<TABLE cellspacing="1" width="950">
  <TR>
	<TD valign="top" width="150">@{[exe('menu_left')]}</TD>
	<TD valign="top">
	<DIV class="title">News&Topics</DIV>
	<A href="?c=topics-1" onClick="ow(this.href,600,500);return false;">+新規記事の登録</A>
	$seek
	<TABLE bgcolor="#999999" cellspacing="1" cellpadding="3">
	  <TR class="list_head">
	    <TD align="center" width="60">公開状況</TD>
	    <TD align="center" width="75">日付</TD>
	    <TD align="center" width="300">タイトル</TD>
	    <TD align="center" colspan="3">操作</TD>
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
