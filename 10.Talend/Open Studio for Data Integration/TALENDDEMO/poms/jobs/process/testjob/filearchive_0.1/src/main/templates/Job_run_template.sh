#!/bin/sh
cd `dirname $0`
ROOT_PATH=`pwd`
java -Dtalend.component.manager.m2.repository=$ROOT_PATH/../lib -Xms256M -Xmx1024M -Dfile.encoding=UTF-8 -cp .:$ROOT_PATH:$ROOT_PATH/../lib/routines.jar:$ROOT_PATH/../lib/checkArchive-1.1-20190917.jar:$ROOT_PATH/../lib/commons-compress-1.19.jar:$ROOT_PATH/../lib/crypto-utils.jar:$ROOT_PATH/../lib/dom4j-1.6.1.jar:$ROOT_PATH/../lib/log4j-1.2.17.jar:$ROOT_PATH/../lib/talendzip.jar:$ROOT_PATH/../lib/zip4j-1.3.3.jar:$ROOT_PATH/filearchive_0_1.jar: talenddemo.filearchive_0_1.fileArchive  "$@"