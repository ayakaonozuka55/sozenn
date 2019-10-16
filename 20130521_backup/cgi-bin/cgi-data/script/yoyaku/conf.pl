#------------------
# 入力内容の正規化
#------------------
$in{'sid'} =~ tr/0-9a-zA-Z//cd;

# セッション切れのとき
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

# エラーチェック
push( @Errors, '[お名前]を入力してください。' )                            if ( $sid{'NAME'} eq '' );
push( @Errors, '[ふりがな]を入力してください。' )                          if ( $sid{'FURI'} eq '' );
push( @Errors, '[団体名]を入力してください。' )                            if ( $sid{'DANTAI_NAME'} eq '' );
push( @Errors, '[電話番号]を入力してください。' )                          if ( $sid{'TEL'} eq '' );
push( @Errors, '[電話番号]は、「数字」「-」「(　)」以外は使用できません' ) if ( $sid{'TEL'}  && !tel_check($sid{'TEL'}) );
push( @Errors, '[メールアドレス]を入力してください。' )                    if ( $sid{'MAIL'} eq '' );
push( @Errors, 'メールアドレスの書式ではありません。' )                    if ( $sid{'MAIL'} ne '' && !mail_check( $sid{'MAIL'} ) );
push( @Errors, '[ご住所]を入力してください。' )                            if ( $sid{'ADDRESS'} eq '' );
push( @Errors, '[人数]を入力してください。' )                              if ( $sid{'NINZUU'} eq '' );
push( @Errors, '[ご希望乗車場所]を入力してください。' )                    if ( $sid{'KIBOU_BASYO'} eq '' );
push( @Errors, '[ご希望日]を入力してください。' )                          if ( $sid{'KIBOU_DATE'} eq '' );


if (@Errors) {
    $replace{'error'} = join( "<BR>", @Errors );
    $replace{'sid'}   = $sid{'sid'};
    $HTML             = '_error.htm';
    return 1;
}
%replace = HTML_escape( \%sid );
$replace{'TOIAWASE'} = norm_br( $replace{'TOIAWASE'} );

# プラン情報の取得
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
