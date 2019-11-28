$fileDir = Split-Path -Parent $MyInvocation.MyCommand.Path
cd $fileDir
java '-Dtalend.component.manager.m2.repository=%cd%/../lib' '-Xms256M' '-Xmx1024M' '-Dfile.encoding=UTF-8' -cp '.;../lib/routines.jar;../lib/ant-1.10.1.jar;../lib/checkArchive-1.1-20190917.jar;../lib/commons-compress-1.19.jar;../lib/crypto-utils.jar;../lib/dom4j-1.6.1.jar;../lib/log4j-1.2.17.jar;../lib/talendzip.jar;../lib/zip4j-1.3.3.jar;testfileunarchie_0_1.jar;' talenddemo.testfileunarchie_0_1.testFileUnarchie  $args