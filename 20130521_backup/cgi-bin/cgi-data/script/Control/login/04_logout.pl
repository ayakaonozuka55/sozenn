#===================
# ログアウト
#===================

Write_Cookies(-name => 'lo',
              -value => '',
              );
print "Location: ./index.cgi\n\n";
exit;

1;
