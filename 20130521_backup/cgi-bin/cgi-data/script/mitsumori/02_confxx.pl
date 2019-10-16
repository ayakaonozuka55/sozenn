#------------------
# �������Ƥ�������
#------------------
$in{'sid'} =~ tr/0-9a-zA-Z//cd;
$in{'OPTION'} = join( ",", param('OPTION') );


# ���å�����ڤ�ΤȤ�
if ( !-e "$dir{'db'}/tmp/mitsumori/$in{'sid'}.dat" ) {
    exe('form-1');
    return 1;
}

my %sid;
hash_IO( \%sid, "$dir{'db'}/tmp/mitsumori/$in{'sid'}.dat" );

%sid = ( %sid, %in );
hash_IO( \%sid, ">$dir{'db'}/tmp/mitsumori/$in{'sid'}.dat" );

# ���顼�����å�
push( @Errors, '[�����Ѵ�˾��]�򤴵�������������' )                    if ( !$sid{'YY'} || !$sid{'START_MM'} || !$sid{'START_DD'} || !$sid{'END_MM'} || !$sid{'END_DD'});
push( @Errors, '[�����Ѥ�����]�����򤯤�������' )                  if ( !$sid{'SYURUI'} );
push( @Errors, '[����]�����򤯤�������')                             if ( !$sid{'NITTEI'} );
push( @Errors, '[����̾]�򤴵�������������')                           if ( !$sid{'DAIHYOU_NAME'} && !$sid{'DANTAI_NULL'} );
push( @Errors, '[��ɽ�Ԥ�̾��]�򤴵�������������')                     if ( !$sid{'DAIHYOU_NAME'} );
push( @Errors, '[���𽻽�]��[��ҽ���]�����줫�򤴵�������������')     if ( !$sid{'JITAKU_JUSYO'} && !$sid{'KAISYA_JUSYO'});
push( @Errors, '[���������ֹ�]��[�����ֹ�]��[��������ֹ�]�����줫�򤴵�������������')     if ( !$sid{'JITAKU_TEL'} && !$sid{'KEITAI_TEL'} && !$sid{'KAISYA_TEL'});
# push( @Errors, '[FAX�ֹ�]�򤴵�������������')                          if ( !$sid{'FAX'} );
push( @Errors, '[e-mail���ɥ쥹]�򤴵�����������' )                    if ( !$sid{'MAIL'} );
push( @Errors, '[e-mail���ɥ쥹]�����������Ϥ��Ƥ���������' )          if ( $sid{'MAIL'} && !mail_check( $sid{'MAIL'} ) );
for my $i (1..6){
	if( !$sid{"type$i"} ) {
		$type_error++;
	}
}
push( @Errors, '[�Х�������]�򤴵�������������' )                     if ( $type_error == 6 );
push( @Errors, '[��ȯ���]�򤴵�������������' )                       if ( !$sid{'BASYO'} );
push( @Errors, '[��ȯ����]�򤴵�������������' )                       if ( !$sid{'START_TIME'} );
push( @Errors, '[�������]�򤴵�������������' )                       if ( !$sid{'END_TIME'} );
push( @Errors, '[��Ū��]�򤴵�������������' )                         if ( !$sid{'MOKUTEKICHI'} );
push( @Errors, '[�Х�������]�����򤯤�������' )                     if ( !$sid{'GUIDE'} );
push( @Errors, '[ι����Ū]�����򤯤�������' )                       if ( !$sid{'MOKUTEKI'} );
push( @Errors, '[ι����Ū������¾������]�򤴵�������������' )         if ( $sid{'MOKUTEKI'} eq '����¾' && !$sid{'MOKUTEKI_SONOTA'} );
push( @Errors, '[�����ѿͿ����]�򤴵�������������' )                 if ( !$sid{'TOTAL'} );

if( $sid{'SYURUI'} eq '���ڥХ���ι�Լ��۸��Ѥ�' ) {
	push( @Errors, '[�����ѿͿ������������������͡�]�򤴵�������������' )if ( !$sid{'MAN'} && !$sid{'WOMAN'} && !$sid{'CHILD'} );
	push( @Errors, '[���뿩:�������������Τ�ͽ��]�򤴵�������������' ) if ( !$sid{'LUNCH_YOSAN_START'} || !$sid{'LUNCH_YOSAN_END'});
	push( @Errors, '[������:�������������Τ�ͽ��]�򤴵�������������' ) if ( !$sid{'STAY_YOSAN_START'}  || !$sid{'STAY_YOSAN_END'});
	push( @Errors, '[�ɥ�����]�����򤯤�������' )                      if ( !$sid{'STAY_TYPE'} );
}
push( @Errors, '[�ɥ����ס�����¾������]�򤴵�������������' )        if ( $sid{'STAY_TYPE'} eq '����¾' && !$sid{'STAY_SONOTA'});
push( @Errors, '[���ץ���󡧤���¾������]�򤴵�������������' )      if ($sid{'OPTION'}=~/����¾/ && !$sid{'OPTION_SONOTA'});



if (@Errors) {
    $replace{'error'} = join( "<BR>", @Errors );
    $replace{'sid'}   = $sid{'sid'};
    $HTML             = '_error.htm';
    return 1;
}

# ����
$sid{'FAX'}      ||='----';
$sid{'MAN'}      ||='-��';
$sid{'WOMAN'}    ||='-��';
$sid{'CHILD'}    ||='-��';
$sid{'SHITUMON'} ||='----';


# ����
$sid{'LUNCH_YOSAN_START'}||='----';
$sid{'LUNCH_YOSAN_END'}  ||='----';
$sid{'STAY_YOSAN_START'} ||='----';
$sid{'STAY_YOSAN_END'}   ||='----';
$sid{'STAY_TYPE'}        ||='----';
$sid{'OPTION'}           ||='----';
$sid{'CHUUI'}            ||='----';


%replace = HTML_escape( \%sid );


$replace{'bus_type'} = qq|<tr><td width="240">�緿58�;衡����������49�ʡ����9�ʢ�</td><td>$sid{'type1'}��</td><tr>\n| if( $sid{'type1'} );
$replace{'bus_type'} .= qq|<tr><td width="240">�緿53�;衡����������45�ʡ����8�ʢ� </td><td>$sid{'type2'}��</td><tr>\n| if( $sid{'type2'} );
$replace{'bus_type'} .= qq|<tr><td width="240">�緿28�;衡����������28�ʡ�����ʥ��� </td><td>$sid{'type3'}��</td><tr>\n| if( $sid{'type3'} );
$replace{'bus_type'} .= qq|<tr><td width="240">�淿40�;衡����������33�ʡ����7�ʢ� </td><td>$sid{'type4'}��</td><tr>\n| if( $sid{'type4'} );
$replace{'bus_type'} .= qq|<tr><td width="240">����25�;衡����������25�ʡ�����ʥ���</td><td>$sid{'type5'}��</td><tr>\n| if( $sid{'type5'} );
$replace{'bus_type'} .= qq|<tr><td width="240">����23�;衡����������18�ʡ����5�ʢ� </td><td>$sid{'type6'}��</td><tr>\n| if( $sid{'type6'} );




$replace{'MOKUTEKICHI'} = norm_br( $replace{'MOKUTEKICHI'} );
$replace{'SHITUMON'}    = norm_br( $replace{'SHITUMON'} );
$replace{'CHUUI'}       = norm_br( $replace{'CHUUI'} );

$HTML = './_conf.htm';
1;

sub mail_check {
    ( $_[0] =~ /^[a-zA-Z0-9_\/\-.\+\?\[\]]+\@[a-zA-Z0-9_\.\-]+\.\w+$/ );
}
