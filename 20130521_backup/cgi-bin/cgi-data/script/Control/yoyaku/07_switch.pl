#======================
# �����θ������ؽ���
#======================
my %yoyaku;
hash_IO( \%yoyaku, "$dir{'db'}/yoyaku/$in{'pk'}.dat", 'e' );

my %koukai;
hash_IO( \%koukai, "$dir{'db'}/yoyaku/koukai.ini", 'e' );

if ( $yoyaku{'MODE'} eq '�����' ) {
    $yoyaku{'MODE'} = '����';
    $koukai{ $in{'pk'} } = $yoyaku{'CATEGORY_pk'};
}
elsif ( $yoyaku{'MODE'} eq '����' ) {
    $yoyaku{'MODE'} = '�����';
    delete $koukai{ $in{'pk'} };
}
hash_IO( \%koukai, ">$dir{'db'}/yoyaku/koukai.ini" );

hash_IO( \%yoyaku, ">$dir{'db'}/yoyaku/$in{'pk'}.dat" );

my $rand_str = rand_str(20);
print_refresh(qq|./index.cgi?c=yoyaku&sk=$in{'sk'}&$rand_str|);

1;
