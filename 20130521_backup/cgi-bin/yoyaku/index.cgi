#!/usr/bin/perl
use CGI::Carp qw(fatalsToBrowser);

#---------------
# �Îގ��ڎ��Ďؤ�����
#---------------
%dir = (
    'script'     => '../cgi-data/script',
    'db'         => '../cgi-data/db',
    'cgi-image'  => './cgi-image',
);

#------------------
# ���̎ގَ������ɤ߹���
#------------------
require "$dir{'script'}/lib.pl";
require "$dir{'script'}/jcode.pl";

#------------------
# ư��ώݎĎ��ɤ߹���
#------------------
hash_IO( \%cmd, "$dir{'script'}/yoyaku/cmd.ini" );

#------------------
# �̎����юÎގ����ɤ߹���
#------------------
Parse();

#---------------
# ���ώݎĎ޼¹�
#---------------
exe( $in{'c'} );

#------------------
# HTML�ν���
#------------------
$HTML ||= '_.htm';
print "Content-Type: text/html\n\n";
print &replace( \%replace, template($HTML) );
exit;
1;
