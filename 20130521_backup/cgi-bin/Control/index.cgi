#!/usr/bin/perl
use CGI::Carp qw(fatalsToBrowser);

#---------------
# �Îގ��ڎ��Ďؤ�����
#---------------
%dir=(
    'db'            => '../cgi-data/db',
    'script'        => '../cgi-data/script',
    'topics-image'  => '../topics/cgi-image',
    'yoyaku-image'    => '../yoyaku/cgi-image',
    'htdocs'        => '../..',
    );

#------------------
# ���̎ގَ������ɤ߹���
#------------------
require "$dir{'script'}/lib.pl";
require "$dir{'script'}/jcode.pl";

#------------------
# ư��ώݎĎ��ɤ߹���
#------------------
hash_IO ( \%cmd ,"$dir{'script'}/Control/cmd.ini" );

#------------------
# �̎����юÎގ����ɤ߹���
#------------------
Parse();

#------------------
# �ێ��ގ��ݾ����ɤ߹���
#------------------
%login=Cookies('lo');

if( ! $login{'sid'} &&  $in{'c'} ne 'login_2') {
    $in{'c'}='login_1';
}

#---------------
# ���ώݎĎ޼¹�
#---------------
exe($in{'c'});

#------------------
# HTML�ν���
#------------------
$HTML ||='./_.htm';
$replace{'title'} ||='';

$HTML=template($HTML);
$HTML=replace(\%replace,$HTML);
print "Content-Type: text/html\n\n";
print $HTML;
exit;


1;
