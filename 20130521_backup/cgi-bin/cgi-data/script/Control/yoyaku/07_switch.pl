#======================
# µ­»ö¤Î¸ø³«ÀÚÂØ½èÍı
#======================
my %yoyaku;
hash_IO( \%yoyaku, "$dir{'db'}/yoyaku/$in{'pk'}.dat", 'e' );

my %koukai;
hash_IO( \%koukai, "$dir{'db'}/yoyaku/koukai.ini", 'e' );

if ( $yoyaku{'MODE'} eq 'Èó¸ø³«' ) {
    $yoyaku{'MODE'} = '¸ø³«';
    $koukai{ $in{'pk'} } = $yoyaku{'CATEGORY_pk'};
}
elsif ( $yoyaku{'MODE'} eq '¸ø³«' ) {
    $yoyaku{'MODE'} = 'Èó¸ø³«';
    delete $koukai{ $in{'pk'} };
}
hash_IO( \%koukai, ">$dir{'db'}/yoyaku/koukai.ini" );

hash_IO( \%yoyaku, ">$dir{'db'}/yoyaku/$in{'pk'}.dat" );

my $rand_str = rand_str(20);
print_refresh(qq|./index.cgi?c=yoyaku&sk=$in{'sk'}&$rand_str|);

1;
