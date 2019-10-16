#=========================
# 新着情報の登録
#=========================
my %local;
my %topics;
hash_IO( \%topics, "$dir{'db'}/topics/$in{'pk'}.dat", 'e' );
%topics = HTML_escape( \%topics );

$topics{'MODE'} ||= '非公開';
$local{'MODE'} .= radio_box( 'MODE', $topics{'MODE'}, '非公開' ) . qq|<LABEL for="STATUS-0">非公開</LABEL>&nbsp;&nbsp;&nbsp;&nbsp;|;
$local{'MODE'} .= radio_box( 'MODE', $topics{'MODE'}, '公開' ) . qq|<LABEL for="STATUS-1"><FONT color="blue">公開</FONT></LABEL>|;

$topics{'YY'} ||= &YY;
$topics{'MM'} ||= &MM;
$topics{'DD'} ||= &DD;

$local{'YY'} = '<SELECT name="YY">' . form_option( $topics{'YY'}, [ &YY .. &YY + 1 ] );
$local{'MM'} = '<SELECT name="MM">' . form_option( $topics{'MM'}, [ '01' .. '12' ] );
$local{'DD'} = '<SELECT name="DD">' . form_option( $topics{'DD'}, [ '01' .. '31' ] );

#---------------
# 画像
#---------------

for my $i (1) {
    $local{'img'} .= qq|<TR>\n|;
    $local{'img'} .= qq|  <TD bgcolor="#C7DCF2">画像(横幅160px)</TD>\n|;
    $local{'img'} .= qq|  <TD bgcolor="#ffffff" valign="bottom">\n|;
    my @cgi_image = glob("$dir{'topics-image'}/$topics{'pk'}/img$i.*");
    if ( $cgi_image[0] ) {
        my $ext = ( split( /\./, $cgi_image[0] ) )[-1];
        $local{'img'} .= qq|<IMG src="$dir{'topics-image'}/$topics{'pk'}/img$i.$ext" id="preview$i" width='100'><BR>|;
        $local{'img'} .= qq|<INPUT TYPE="checkbox" name="img$i-DELETE" value="1">削除<BR>|;
    }
    else {
        my $ext = ( split( /\./, $cgi_image[0] ) )[-1];
        $local{'img'} .= qq|<IMG src="$dir{'topics-image'}/$topics{'pk'}/img$i.$ext" border="0" id="preview$i" style="display:none;" width='100'>|;
    }
    $local{'img'} .= qq|  <INPUT type="file" size="50" name="img$i" onChange="preview$i.src=this.value;preview$i.style.display='block';"><BR>\n|;
    $local{'img'} .= qq| </TD>\n|;
    $local{'img'} .= qq|</TR>\n|;
}

#----------------------
# HTML出力
#----------------------
$HTML             = './_mini.htm';
$replace{'title'} = 'News&Topics';
$replace{'html'}  = <<EOF;
<DIV id="edit" align="center">
<DIV class="title">News&Topics登録・編集</DIV>
<FORM action="$ENV{'SCRIPT_NAME'}" method="POST" name="form" enctype="multipart/form-data">
<INPUT type="hidden" name="c" value="topics-2">
<INPUT type="hidden" name="pk" value="$topics{'pk'}">
<TABLE cellspacing="1" cellpadding="3" bgcolor="#999999" width="550">
  <TR>
    <TD bgcolor="#C7DCF2">公開状況</TD>
	<TD bgcolor="#ffffff">$local{'MODE'}</TD>
  </TR>
  <TR>
    <TD bgcolor="#C7DCF2">日付</TD>
	<TD bgcolor="#ffffff">$local{'YY'}年 $local{'MM'}月 $local{'DD'}</TD>
  </TR>
  <TR>
    <TD bgcolor="#C7DCF2">タイトル</TD>
	<TD bgcolor="#ffffff"><INPUT size="84" type="text" name="TITLE" value="$topics{'TITLE'}"></TD>
  </TR>
  <TR>
    <TD bgcolor="#C7DCF2">URL</TD>
	<TD bgcolor="#ffffff">
	  <INPUT size="84" type="text" name="URL" value="$topics{'URL'}" style="IME-MODE: disabled"><BR>
	  (例) http://www.shozen.com/
	</TD>
  </TR>
  <TR>
    <TD bgcolor="#C7DCF2">コメント</TD>
	<TD bgcolor="#ffffff"><TEXTAREA rows="8" cols="60" name="COMMENT">$topics{'COMMENT'}</TEXTAREA></TD>
  </TR>
  $local{'img'}
</TABLE>
<BR>
<INPUT type="submit" value="登録">
</FORM>
</DIV>
EOF
1;
