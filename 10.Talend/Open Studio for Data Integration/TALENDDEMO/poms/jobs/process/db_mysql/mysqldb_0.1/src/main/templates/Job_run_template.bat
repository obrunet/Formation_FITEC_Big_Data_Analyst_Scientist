%~d0
cd %~dp0
java -Dtalend.component.manager.m2.repository="%cd%/../lib" -Xms256M -Xmx1024M -Dfile.encoding=UTF-8 -cp .;../lib/routines.jar;../lib/crypto-utils.jar;../lib/dom4j-1.6.1.jar;../lib/jxl.jar;../lib/log4j-1.2.17.jar;../lib/mysql-connector-java-8.0.12.jar;mysqldb_0_1.jar; talenddemo.mysqldb_0_1.mysqlDb  %*