#===================
# ログイン認証
#===================
my %config;
hash_IO ( \%config ,"$dir{'db'}/config.ini", 'e' );

if( $in{'ID'} eq $config{'ID'} && $in{'PASS'} eq $config{'PASS'}  ) {
	%login=(
		'sid'=> 1,
		);
	Write_Cookies(-name => 'lo',
	              -value => \%login,
	              );
	print "Location: ./index.cgi\n\n";
	exit;

}

	exe('login_3');

1;
