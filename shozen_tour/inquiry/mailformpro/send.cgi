#!/usr/bin/perl

use CGI::Carp qw(fatalsToBrowser);
use Jcode;
require 'functions.cgi';
require 'config.cgi';

#POSTされたデータを取得
&getpost();

#Cookieの取得
*getCookieData = GetCookie();

if($form{'mode'} ne $null){
	if($form{'mode'} eq 'download' && $config{"password"} ne $form{'password'}){
		&downloadScreen();
	}
	elsif($form{'mode'} eq 'download' && $config{"password"} eq $form{'password'} && $config{"password"} ne $null && (-f $config{"log_file"})){
		&fileDownload();
	}
	elsif($form{'mode'} eq 'delete' && $config{"password"} ne $form{'password'}){
		&deleteScreen();
	}
	elsif($form{'mode'} eq 'delete' && $config{"password"} eq $form{'password'} && $config{"password"} ne $null && (-f $config{"log_file"})){
		&deleteComplate();
	}
	else {
		print "Content-type: text/html;charset=utf-8\n\n";
		print "ERROR CODE" . $error{"code"} . "<br>\n";
	}
}
else{
	#送信元ドメインのチェック
	&domaincheck();
	&confcheck();
	&spamcheck();
	&javascript_check();
	#mailform 用環境変数の定義
	if($error{"code"} == 0){
		&serials();
		&expires_check;
		if($error_redirect){
			&refresh($config{"error_url"});
		}
		else {
			&envMailform();
			&logfileCreate();
			if($config{"posted_body"} ne $null){
				$config{"body"} = $config{"posted_body"};
			}
			$config{"body"} .= $envs;
			$config{"body"} =~ s/<resbody>/$resbody/g;
			$config{"body"} =~ s/<date>/$form{'date'}/g;
			$config{"body"} =~ s/<serial>/$form{'serial'}/g;
			if($config{'SQLserver'}){
				use DBI;
				$SQLexport =~ s/<date>/$form{'date'}/g;
				$SQLexport =~ s/<serial>/$form{'serial'}/g;
				$SQLexport =~ s/<.*?>//ig;
				&_SQLexport;
			}
			
			if($config{"vCard"}){
				if($config{"vCard_sjis"}){
					$vCard = &encodeSJIS($vCard);
				}
				push @attached,$vCard;
				push @attached_name,"vCard.vcf";
			}
			
			if($form{'email'} =~ /[^a-zA-Z0-9\.\@\-\_\+]/ || split(/\@/,$form{'email'}) != 2){
				$form{'email'} = $mailto[0];
			}
			
			for($cnt=0;$cnt<@mailto;$cnt++){
				&sendmail($mailto[$cnt],$form{'email'},$form{'email'},$config{"subject"},$config{"body"},@attached);
			}
			if($config{"return_subject"} ne $null && $config{"return_body"} ne $null && $form{'email'} ne $mailto[0]){
				@attached = ();
				$config{"return_body"} =~ s/<resbody>/$resbody/g;
				$config{"return_body"} =~ s/<date>/$form{'date'}/g;
				$config{"return_body"} =~ s/<serial>/$form{'serial'}/g;
				&sendmail($form{'email'},$config{"mailfrom"},$config{"fromname"},$config{"return_subject"},$config{"return_body"},@null);
			}
			&refresh($config{"thanks_url"});
		}
	}
	else{
		print "Content-type: text/html;charset=utf-8\n\n";
		print "ERROR CODE" . $error{"code"} . "<br>\n";
		print $error{"info"};
	}
}
exit;