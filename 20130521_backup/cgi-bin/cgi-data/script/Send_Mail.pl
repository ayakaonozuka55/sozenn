# ------------------------------------------------------- #
# $mail{'to'}        = '';
# $mail{'from'}      = '';
# $mail{'to_view'}   = '';
# $mail{'from_view'} = '';
# $mail{'subject'}   = '';
# $mail{'body'}      = '';
# Send_Mail();
sub Send_Mail {

    sleep 100 if ( $mail{'to'}   =~ /\n|,| / );    # 不正対策
    sleep 100 if ( $mail{'from'} =~ /\n|,| / );    # 不正対策

    ( $mail{'to'} )   = split( /\n/, $mail{'to'} );
    ( $mail{'from'} ) = split( /\n/, $mail{'from'} );

    my $sendmail =
          ( -e '/usr/lib/sendmail' )  ? '/usr/lib/sendmail'
        : ( -e '/usr/sbin/sendmail' ) ? '/usr/sbin/sendmail'
        :                               '';

    jcode::convert( \$mail{'body'}, 'jis' ) if ( $mail{'body'} );

    my $Encode_To      = EncodeSubject( $mail{'to_view'} );
    my $Encode_From    = EncodeSubject( $mail{'from_view'} );
    my $Encode_Subject = EncodeSubject( $mail{'subject'} );

    my $to   = ($Encode_To)   ? qq|$Encode_To <$mail{'to'}>|     : $mail{'to'};
    my $from = ($Encode_From) ? qq|$Encode_From <$mail{'from'}>| : $mail{'from'};

    if ($sendmail) {
        open( MAIL, "| $sendmail -t -f$mail{'from'}" ) || die('sendmailがオープンできません');
    }
    else {
        open( MAIL, ">./$mail{'to'}.txt" );
    }

    print MAIL qq|To: $to\n|
        . qq|From: $from\n|
        . qq|Subject: $Encode_Subject\n|
        . qq|MIME-Version: 1.0\n|
        . qq|Content-Type: text/plain;\n|
        . qq|	charset="iso-2022-jp"\n|
        . qq|Content-Transfer-Encoding: 7bit\n| . qq|\n|
        . qq|$mail{'body'}\n|;

    close(MAIL);
}

# ------------------------------------------------------- #
sub EncodeSubject {
    my ($String) = @_;
    &jcode::convert( \$String, "euc" );
    my ($Base64Table) = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' . 'abcdefghijklmnopqrstuvwxyz' . '0123456789+/';
    my ( $chunk, $ByteChunk, $PackedByteChunk, $DecimalNum, $EncodedString );
    my ( $SplitedWord, @SplitedWordList, $i, $Byte, $Buff );
    my ($KI)          = 0;
    my ($KO)          = 0;
    my ($CharNum)     = 0;
    my ($CharType)    = 0;
    my ($LineLength)  = 0;
    my ($CharEndFlag) = 1;
    if ( $String =~ /[^a-zA-Z0-9\!\"\#\$\%\&\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\/\^\_\~ ]/ ) {    # '
        $i               = 0;
        @SplitedWordList = ();
        while ( $i < length($String) ) {
            $Byte = substr( $String, $i, 1 );
            if ( $Byte =~ /[\x8E\xA1-\xFE]/ ) {
                unless ( $CharType eq 'K' ) { $KI++; }
                $CharType = 'K';
                if ($CharEndFlag) {
                    $CharEndFlag = 0;
                }
                else {
                    $CharEndFlag = 1;
                }
            }
            else {
                if ( $CharType eq 'K' ) { $KO++; }
                $CharType    = 'A';
                $CharEndFlag = 1;
            }
            $Buff .= $Byte;
            $CharNum += 1;
            $LineLength = 27 + ( $CharNum * 4 / 3 ) + ( ( $KI + $KO ) * 4 ) + 2;
            if ( $CharType eq 'K' ) { $LineLength += 4; }
            if ( $CharEndFlag && $LineLength >= 70 ) {
                &jcode::convert( \$Buff, "jis" );
                push( @SplitedWordList, $Buff );
                $Buff     = '';
                $CharNum  = 0;
                $CharType = 0;
                $KI       = 0;
                $KO       = 0;
            }
            $i++;
        }
        &jcode::convert( \$Buff, "jis" );
        push( @SplitedWordList, $Buff );

        for $SplitedWord (@SplitedWordList) {
            $EncodedString .= '=?ISO-2022-JP?B?';
            $BitStream = unpack( "B*", $SplitedWord );
            $i = 0;
            while ( $chunk = substr( $BitStream, $i * 6, 6 ) ) {
                unless ( length($chunk) == 6 ) {
                    $chunk = pack( "B6", $chunk );
                    $chunk = unpack( "B6", $chunk );
                }
                $ByteChunk       = sprintf( "%08d", $chunk );
                $PackedByteChunk = pack( "B8",      $ByteChunk );
                $DecimalNum      = unpack( "C",     $PackedByteChunk );
                $EncodedString .= substr( $Base64Table, $DecimalNum, 1 );
                $i++;
            }
            if ( length($SplitedWord) % 3 == 1 ) {
                $EncodedString .= '==';
            }
            elsif ( length($SplitedWord) % 3 == 2 ) {
                $EncodedString .= '=';
            }
            $EncodedString .= '?=' . "\n ";
        }
        $EncodedString =~ s/\n $//;
    }
    else {
        $EncodedString = $String;
    }
    return $EncodedString;
}
1;
