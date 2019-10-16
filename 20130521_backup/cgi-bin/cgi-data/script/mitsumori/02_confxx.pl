#------------------
# 入力内容の正規化
#------------------
$in{'sid'} =~ tr/0-9a-zA-Z//cd;
$in{'OPTION'} = join( ",", param('OPTION') );


# セッション切れのとき
if ( !-e "$dir{'db'}/tmp/mitsumori/$in{'sid'}.dat" ) {
    exe('form-1');
    return 1;
}

my %sid;
hash_IO( \%sid, "$dir{'db'}/tmp/mitsumori/$in{'sid'}.dat" );

%sid = ( %sid, %in );
hash_IO( \%sid, ">$dir{'db'}/tmp/mitsumori/$in{'sid'}.dat" );

# エラーチェック
push( @Errors, '[ご利用希望日]をご記入ください。' )                    if ( !$sid{'YY'} || !$sid{'START_MM'} || !$sid{'START_DD'} || !$sid{'END_MM'} || !$sid{'END_DD'});
push( @Errors, '[お見積もり種類]をご選択ください。' )                  if ( !$sid{'SYURUI'} );
push( @Errors, '[日程]をご選択ください。')                             if ( !$sid{'NITTEI'} );
push( @Errors, '[団体名]をご記入ください。')                           if ( !$sid{'DAIHYOU_NAME'} && !$sid{'DANTAI_NULL'} );
push( @Errors, '[代表者お名前]をご記入ください。')                     if ( !$sid{'DAIHYOU_NAME'} );
push( @Errors, '[自宅住所]・[会社住所]いずれかをご記入ください。')     if ( !$sid{'JITAKU_JUSYO'} && !$sid{'KAISYA_JUSYO'});
push( @Errors, '[自宅電話番号]・[携帯番号]・[会社電話番号]いずれかをご記入ください。')     if ( !$sid{'JITAKU_TEL'} && !$sid{'KEITAI_TEL'} && !$sid{'KAISYA_TEL'});
# push( @Errors, '[FAX番号]をご記入ください。')                          if ( !$sid{'FAX'} );
push( @Errors, '[e-mailアドレス]をご記入下さい。' )                    if ( !$sid{'MAIL'} );
push( @Errors, '[e-mailアドレス]を正しく入力してください。' )          if ( $sid{'MAIL'} && !mail_check( $sid{'MAIL'} ) );
for my $i (1..6){
	if( !$sid{"type$i"} ) {
		$type_error++;
	}
}
push( @Errors, '[バスタイプ]をご記入ください。' )                     if ( $type_error == 6 );
push( @Errors, '[出発場所]をご記入ください。' )                       if ( !$sid{'BASYO'} );
push( @Errors, '[出発時刻]をご記入ください。' )                       if ( !$sid{'START_TIME'} );
push( @Errors, '[到着時刻]をご記入ください。' )                       if ( !$sid{'END_TIME'} );
push( @Errors, '[目的地]をご記入ください。' )                         if ( !$sid{'MOKUTEKICHI'} );
push( @Errors, '[バスガイド]をご選択ください。' )                     if ( !$sid{'GUIDE'} );
push( @Errors, '[旅行目的]をご選択ください。' )                       if ( !$sid{'MOKUTEKI'} );
push( @Errors, '[旅行目的：その他の内容]をご記入ください。' )         if ( $sid{'MOKUTEKI'} eq 'その他' && !$sid{'MOKUTEKI_SONOTA'} );
push( @Errors, '[ご利用人数合計]をご記入ください。' )                 if ( !$sid{'TOTAL'} );

if( $sid{'SYURUI'} eq '貸切バス・旅行手配見積り' ) {
	push( @Errors, '[ご利用人数（男性・女性・小人）]をご記入ください。' )if ( !$sid{'MAN'} && !$sid{'WOMAN'} && !$sid{'CHILD'} );
	push( @Errors, '[ご昼食:一日一人当たりのご予算]をご記入ください。' ) if ( !$sid{'LUNCH_YOSAN_START'} || !$sid{'LUNCH_YOSAN_END'});
	push( @Errors, '[ご宿泊:一日一人当たりのご予算]をご記入ください。' ) if ( !$sid{'STAY_YOSAN_START'}  || !$sid{'STAY_YOSAN_END'});
	push( @Errors, '[宿タイプ]をご選択ください。' )                      if ( !$sid{'STAY_TYPE'} );
}
push( @Errors, '[宿タイプ：その他の内容]をご記入ください。' )        if ( $sid{'STAY_TYPE'} eq 'その他' && !$sid{'STAY_SONOTA'});
push( @Errors, '[オプション：その他の内容]をご記入ください。' )      if ($sid{'OPTION'}=~/その他/ && !$sid{'OPTION_SONOTA'});



if (@Errors) {
    $replace{'error'} = join( "<BR>", @Errors );
    $replace{'sid'}   = $sid{'sid'};
    $HTML             = '_error.htm';
    return 1;
}

# 上部
$sid{'FAX'}      ||='----';
$sid{'MAN'}      ||='-　';
$sid{'WOMAN'}    ||='-　';
$sid{'CHILD'}    ||='-　';
$sid{'SHITUMON'} ||='----';


# 下部
$sid{'LUNCH_YOSAN_START'}||='----';
$sid{'LUNCH_YOSAN_END'}  ||='----';
$sid{'STAY_YOSAN_START'} ||='----';
$sid{'STAY_YOSAN_END'}   ||='----';
$sid{'STAY_TYPE'}        ||='----';
$sid{'OPTION'}           ||='----';
$sid{'CHUUI'}            ||='----';


%replace = HTML_escape( \%sid );


$replace{'bus_type'} = qq|<tr><td width="240">大型58人乗　≪正シート49席・補助9席≫</td><td>$sid{'type1'}台</td><tr>\n| if( $sid{'type1'} );
$replace{'bus_type'} .= qq|<tr><td width="240">大型53人乗　≪正シート45席・補助8席≫ </td><td>$sid{'type2'}台</td><tr>\n| if( $sid{'type2'} );
$replace{'bus_type'} .= qq|<tr><td width="240">大型28人乗　≪正シート28席・補助ナシ≫ </td><td>$sid{'type3'}台</td><tr>\n| if( $sid{'type3'} );
$replace{'bus_type'} .= qq|<tr><td width="240">中型40人乗　≪正シート33席・補助7席≫ </td><td>$sid{'type4'}台</td><tr>\n| if( $sid{'type4'} );
$replace{'bus_type'} .= qq|<tr><td width="240">小型25人乗　≪正シート25席・補助ナシ≫</td><td>$sid{'type5'}台</td><tr>\n| if( $sid{'type5'} );
$replace{'bus_type'} .= qq|<tr><td width="240">小型23人乗　≪正シート18席・補助5席≫ </td><td>$sid{'type6'}台</td><tr>\n| if( $sid{'type6'} );




$replace{'MOKUTEKICHI'} = norm_br( $replace{'MOKUTEKICHI'} );
$replace{'SHITUMON'}    = norm_br( $replace{'SHITUMON'} );
$replace{'CHUUI'}       = norm_br( $replace{'CHUUI'} );

$HTML = './_conf.htm';
1;

sub mail_check {
    ( $_[0] =~ /^[a-zA-Z0-9_\/\-.\+\?\[\]]+\@[a-zA-Z0-9_\.\-]+\.\w+$/ );
}
