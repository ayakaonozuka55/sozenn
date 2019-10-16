#!/usr/bin/perl
use CGI::Carp qw(fatalsToBrowser);

#---------------
# ﾃﾞｨﾚｸﾄﾘの設定
#---------------
%dir=(
    'db'            => '../cgi-data/db',
    'script'        => '../cgi-data/script',
    'topics-image'  => '../topics/cgi-image',
    'yoyaku-image'    => '../yoyaku/cgi-image',
    'htdocs'        => '../..',
    );

#------------------
# ｻﾌﾞﾙｰﾁﾝ読み込み
#------------------
require "$dir{'script'}/lib.pl";
require "$dir{'script'}/jcode.pl";

#------------------
# 動作ｺﾏﾝﾄﾞ読み込み
#------------------
hash_IO ( \%cmd ,"$dir{'script'}/Control/cmd.ini" );

#------------------
# ﾌｫｰﾑﾃﾞｰﾀ読み込み
#------------------
Parse();

#------------------
# ﾛｸﾞｲﾝ状態読み込み
#------------------
%login=Cookies('lo');

if( ! $login{'sid'} &&  $in{'c'} ne 'login_2') {
    $in{'c'}='login_1';
}

#---------------
# ｺﾏﾝﾄﾞ実行
#---------------
exe($in{'c'});

#------------------
# HTMLの出力
#------------------
$HTML ||='./_.htm';
$replace{'title'} ||='';

$HTML=template($HTML);
$HTML=replace(\%replace,$HTML);
print "Content-Type: text/html\n\n";
print $HTML;
exit;


1;
