#------------------
# �������Ƥ�������
#------------------
$in{'sid'} =~ tr/0-9a-zA-Z//cd;

# ���å�����ڤ�ΤȤ�
if ( $in{'sid'} eq '' ) {
    exe('');
    return 1;
}

if ( !-e "$dir{'db'}/tmp/yoyaku/$in{'sid'}/form.dat" ) {
    exe('');
    return 1;
}

my %sid;
hash_IO( \%sid, "$dir{'db'}/tmp/yoyaku/$in{'sid'}/form.dat" );
exe( '' ) if( $sid{'yoyaku_pk'} eq '' );
%sid = ( %sid, %in );
hash_IO( \%sid, ">$dir{'db'}/tmp/yoyaku/$in{'sid'}/form.dat" );

# ���顼�����å�
push( @Errors, '[��̾��]�����Ϥ��Ƥ���������' )                            if ( $sid{'NAME'} eq '' );
push( @Errors, '[�դ꤬��]�����Ϥ��Ƥ���������' )                          if ( $sid{'FURI'} eq '' );
push( @Errors, '[����̾]�����Ϥ��Ƥ���������' )                            if ( $sid{'DANTAI_NAME'} eq '' );
push( @Errors, '[�����ֹ�]�����Ϥ��Ƥ���������' )                          if ( $sid{'TEL'} eq '' );
push( @Errors, '[�����ֹ�]�ϡ��ֿ����ס�-�ס�(��)�װʳ��ϻ��ѤǤ��ޤ���' ) if ( $sid{'TEL'}  && !tel_check($sid{'TEL'}) );
push( @Errors, '[�᡼�륢�ɥ쥹]�����Ϥ��Ƥ���������' )                    if ( $sid{'MAIL'} eq '' );
push( @Errors, '�᡼�륢�ɥ쥹�ν񼰤ǤϤ���ޤ���' )                    if ( $sid{'MAIL'} ne '' && !mail_check( $sid{'MAIL'} ) );
push( @Errors, '[������]�����Ϥ��Ƥ���������' )                            if ( $sid{'ADDRESS'} eq '' );
push( @Errors, '[�Ϳ�]�����Ϥ��Ƥ���������' )                              if ( $sid{'NINZUU'} eq '' );
push( @Errors, '[����˾��־��]�����Ϥ��Ƥ���������' )                    if ( $sid{'KIBOU_BASYO'} eq '' );
push( @Errors, '[����˾��]�����Ϥ��Ƥ���������' )                          if ( $sid{'KIBOU_DATE'} eq '' );


if (@Errors) {
    $replace{'error'} = join( "<BR>", @Errors );
    $replace{'sid'}   = $sid{'sid'};
    $HTML             = '_error.htm';
    return 1;
}
%replace = HTML_escape( \%sid );
$replace{'TOIAWASE'} = norm_br( $replace{'TOIAWASE'} );

# �ץ�����μ���
my %yoyaku;
hash_IO( \%yoyaku ,"$dir{'db'}/yoyaku/$sid{'yoyaku_pk'}.dat", 'e' );
$replace{'YOYAKU_NAME'} = $yoyaku{'NAME'};
$replace{'YOYAKU_NO'} = $yoyaku{'NO'};

$HTML = './_conf.htm';
1;




sub mail_check {
    ( $_[0] =~ /^[a-zA-Z0-9_\/\-.\+\?\[\]]+\@[a-zA-Z0-9_\.\-]+\.\w+$/ );
}

sub tel_check {
	($_[0] =~ /^[0-9\(\)\-]+$/)
}
