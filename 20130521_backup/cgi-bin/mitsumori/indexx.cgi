#!/usr/bin/perl
use CGI::Carp qw(fatalsToBrowser);

#---------------
# ﾃﾞｨﾚｸﾄﾘの設定
#---------------
%dir = (
    'script' => '../cgi-data/script',
    'db'     => '../cgi-data/db',
);

#------------------
# ｻﾌﾞﾙｰﾁﾝ読み込み
#------------------
require "$dir{'script'}/lib.pl";
require "$dir{'script'}/jcode.pl";

#------------------
# 動作ｺﾏﾝﾄﾞ読み込み
#------------------
hash_IO( \%cmd, "$dir{'script'}/mitsumori/cmd.ini" );

#------------------
# ﾌｫｰﾑﾃﾞｰﾀ読み込み
#------------------
Parse();

#---------------
# ｺﾏﾝﾄﾞ実行
#---------------
exe( $in{'c'} );

#------------------
# HTMLの出力
#------------------
$HTML ||= '_.htm';
print "Content-Type: text/html\n\n";
print &replace( \%replace, template($HTML) );
exit;
1;
