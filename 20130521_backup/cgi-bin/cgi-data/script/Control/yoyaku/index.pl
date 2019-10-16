#===================
# yoyaku一覧
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
    
    # カテゴリ名の取得
    &Get_Category_Name ($yoyaku{'CATEGORY_pk'});
    
    
    if ( $yoyaku{'MODE'} eq '公開' ) {
        $list .= qq|  <TR bgcolor="$tr_color[$tr_color]">\n|;
        $list .= qq|    <TD align="center"><FONT color="blue"><B>公開中</B></FONT></TD>|;
        $list .= qq|    <TD width="200">@{[String_cut( $yoyaku{'NAME'},30 )]}</TD>\n|;
        $list .= qq|    <TD width="70">$yoyaku{'NO'}</TD>\n|;
        $list .= qq|    <TD width="140">@{[String_cut($get_category_name,24)]}</TD>\n|;
        $list .= qq|    <TD>$yoyaku{'START_YY'}年$yoyaku{'START_MM'}月$yoyaku{'START_DD'}日 〜 $yoyaku{'END_YY'}年$yoyaku{'END_MM'}月$yoyaku{'END_DD'}日</TD>\n|;
        $list .= qq|    <TD>$yoyaku{'SHIMEKIRI_YY'}年$yoyaku{'SHIMEKIRI_MM'}月$yoyaku{'SHIMEKIRI_DD'}日</TD>\n|;
        $list .= qq|    <TD align="center"><A href="?c=yoyaku-7&pk=$yoyaku{'pk'}&sk=$in{'sk'}">非公開へ</A></TD>|;
        $list .= qq|    <TD align="center"><A href="?c=yoyaku-1&pk=$yoyaku{'pk'}" onClick="ow(this.href,650,700);return false;">編集</A></TD>|;
        $list .= qq|    <TD align="center"><A href="?c=yoyaku-3&pk=$yoyaku{'pk'}" onClick="ow(this.href,400,300);return false;">削除</A></TD>\n|;
        $list .= qq|  </TR>\n|;
    }
    elsif ( $yoyaku{'MODE'} eq '非公開' ) {
        $list .= qq|  <TR bgcolor="$tr_color[$tr_color]">\n|;
        $list .= qq|    <TD align="center"><FONT color="red">非公開</FONT></TD>|;
        $list .= qq|    <TD width="200">@{[String_cut( $yoyaku{'NAME'},32 )]}</TD>\n|;
        $list .= qq|    <TD width="70">$yoyaku{'NO'}</TD>\n|;
        $list .= qq|    <TD width="140">@{[String_cut($get_category_name,24)]}</TD>\n|;
        $list .= qq|    <TD>$yoyaku{'START_YY'}年$yoyaku{'START_MM'}月$yoyaku{'START_DD'}日 〜 $yoyaku{'END_YY'}年$yoyaku{'END_MM'}月$yoyaku{'END_DD'}日</TD>\n|;
        $list .= qq|    <TD>$yoyaku{'SHIMEKIRI_YY'}年$yoyaku{'SHIMEKIRI_MM'}月$yoyaku{'SHIMEKIRI_DD'}日</TD>\n|;
        $list .= qq|    <TD align="center"><A href="?c=yoyaku-7&pk=$yoyaku{'pk'}&sk=$in{'sk'}"><B><FONT color="#0000ff">公開する</FONT></B></A></TD>|;
        $list .= qq|    <TD align="center"><A href="?c=yoyaku-1&pk=$yoyaku{'pk'}" onClick="ow(this.href,650,700);return false;">編集</A></TD>|;
        $list .= qq|    <TD align="center"><A href="?c=yoyaku-3&pk=$yoyaku{'pk'}" onClick="ow(this.href,400,300);return false;">削除</A></TD>\n|;
        $list .= qq|  </TR>\n|;
    }

}

$list ||= qq|<TR bgcolor="#cccccc"><TD colspan="9" align="center"><FONT color="#999999">記事データなし</FONT></TD></TR>\n|;

$seek = '';
$seek .= qq|<TABLE cellspacing="1" cellpadding="3" width="800">\n|;
$seek .= qq| <TR>\n|;
$seek .= qq|   <TD align="left">\n|;
$seek .= qq|     <A href="?c=yoyaku&sk=@{[$in{'sk'}-$turn]}">前の$turn件</A>　| if ( $in{'sk'} );
$seek .= qq|   </TD>\n|;
$seek .= qq|   <TD align="right">\n|;
$seek .= qq|     <A href="?c=yoyaku&sk=@{[$in{'sk'}+$turn]}">次の$turn件</A><BR>| if ( ( $in{'sk'} + $turn ) <= $total );    # >
$seek .= qq|   </TD>\n|;
$seek .= qq| </TR>\n|;
$seek .= qq|</TABLE>\n|;

#----------------------
# HTML出力
#----------------------
$replace{'title'} = 'ツアー情報管理';
$replace{'html'}  = <<EOF;
@{[pwd('管理画面:c=','ツアー情報管理')]}
<DIV id="edit">
<TABLE cellspacing="1" width="1200">
  <TR>
	<TD valign="top" width="150">@{[exe('menu_left')]}</TD>
	<TD valign="top">
	<DIV class="title">ツアー情報管理</DIV>
	<A href="?c=yoyaku-1" onClick="ow(this.href,650,700);return false;">+新規記事の登録</A>
	$seek
	<TABLE bgcolor="#999999" cellspacing="1" cellpadding="3">
	  <TR class="list_head">
	    <TD align="center" width="60">公開状況</TD>
	    <TD align="center" width="200">ツアー名</TD>
	    <TD align="center" width="70">ツアー番号</TD>
	    <TD align="center" width="140">カテゴリ</TD>
	    <TD align="center" width="200">実施期間</TD>
	    <TD align="center" width="90">申込締切日</TD>
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
