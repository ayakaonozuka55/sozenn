#=====================
# 資料請求フォーム
#=====================
exe('') if ( $in{'pk'}  eq '' );
#------------------
# 入力内容の正規化
#------------------
$in{'pk'} =~ tr/0-9//cd;
$in{'sid'}=~ tr/0-9a-zA-Z//cd;

# 古いリストの削除
cleanDir( "$dir{'db'}/tmp/yoyaku", 60 * 60 * 24 );

my %sid;
hash_IO( \%sid ,"$dir{'db'}/tmp/yoyaku/$in{'sid'}/form.dat", 'e' );

if( $sid{'sid'} eq '' ) {
	$sid{'sid'} ||= time . rand_str(5);
	mkdirs "$dir{'db'}/tmp/yoyaku/$sid{'sid'}";
}


$sid{'yoyaku_pk'} ||= $in{'pk'};
# 一時ファイルの作成
hash_IO( \%sid, ">$dir{'db'}/tmp/yoyaku/$sid{'sid'}/form.dat" ) if ( !-e "$dir{'db'}/tmp/yoyaku/$sid{'sid'}/form.dat" );

%replace = %sid;
# プラン情報の取得
my %yoyaku;
hash_IO( \%yoyaku ,"$dir{'db'}/yoyaku/$sid{'yoyaku_pk'}.dat", 'e' );

$replace{'YOYAKU_NAME'} = $yoyaku{'NAME'};
$replace{'YOYAKU_NO'} = $yoyaku{'NO'};

#----------------------
# HTML出力
#----------------------
$HTML                    = '_form.htm';
