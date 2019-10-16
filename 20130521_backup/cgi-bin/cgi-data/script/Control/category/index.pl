#===================
# category一覧
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
    $list .= qq|    <TD align="center"><A href="?c=category-1&pk=$category{'pk'}" onClick="ow(this.href,550,200);return false;">編集</A></TD>|;
    $list .= qq|    <TD align="center"><A href="?c=category-3&pk=$category{'pk'}" onClick="ow(this.href,450,200);return false;">削除</A></TD>\n|;
    $list .= qq|  </TR>\n|;

}

$list ||= qq|<TR bgcolor="#cccccc"><TD colspan="3" align="center"><FONT color="#999999">記事データなし</FONT></TD></TR>\n|;

$seek = '';
$seek .= qq|<TABLE cellspacing="1" cellpadding="3" width="330">\n|;
$seek .= qq| <TR>\n|;
$seek .= qq|   <TD align="left">\n|;
$seek .= qq|     <A href="?c=category&sk=@{[$in{'sk'}-$turn]}">前の$turn件</A>　| if ( $in{'sk'} );
$seek .= qq|   </TD>\n|;
$seek .= qq|   <TD align="right">\n|;
$seek .= qq|     <A href="?c=category&sk=@{[$in{'sk'}+$turn]}">次の$turn件</A><BR>| if ( ( $in{'sk'} + $turn ) <= $total );    # >
$seek .= qq|   </TD>\n|;
$seek .= qq| </TR>\n|;
$seek .= qq|</TABLE>\n|;

#----------------------
# HTML出力
#----------------------
$replace{'title'} = 'カテゴリ管理';
$replace{'html'}  = <<EOF;
@{[pwd('管理画面:c=','カテゴリ管理')]}
<DIV id="edit">
<TABLE cellspacing="1" width="950">
  <TR>
	<TD valign="top" width="150">@{[exe('menu_left')]}</TD>
	<TD valign="top">
	<DIV class="title">カテゴリ管理</DIV>
	<A href="?c=category-1" onClick="ow(this.href,550,200);return false;">+新規カテゴリの登録</A>
	$seek
	<TABLE bgcolor="#999999" cellspacing="1" cellpadding="3">
	  <TR class="list_head">
	    <TD align="center" width="250" align="center">カテゴリ名</TD>
	    <TD align="center" colspan="2">操作</TD>
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
