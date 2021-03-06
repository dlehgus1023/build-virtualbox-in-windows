@echo off

call base_config.bat

echo [+] Certification
cd %VBOX_DIR%
set PATH=%PATH%;%WINDDK_DIR%;

echo [*] Create a certification file
makecert.exe -r -pe -ss my -eku 1.3.6.1.5.5.7.3.3 -n "CN=MyTestCertificate" mytestcert.cer

echo [*] Apply certmgr to root and trustedpublisher
certmgr.exe -add mytestcert.cer -s -r localMachine root
certmgr.exe -add mytestcert.cer -s -r localMachine trustedpublisher

echo [*] Note that if this procedure is called more than once, it could cause some conflictions during compilation