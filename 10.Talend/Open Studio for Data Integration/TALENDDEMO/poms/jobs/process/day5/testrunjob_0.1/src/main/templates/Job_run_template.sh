#!/bin/sh
cd `dirname $0`
ROOT_PATH=`pwd`
java -Dtalend.component.manager.m2.repository=$ROOT_PATH/../lib -Xms256M -Xmx1024M -Dfile.encoding=UTF-8 -cp .:$ROOT_PATH:$ROOT_PATH/../lib/routines.jar:$ROOT_PATH/../lib/crypto-utils.jar:$ROOT_PATH/../lib/dom4j-1.6.1.jar:$ROOT_PATH/../lib/jxl.jar:$ROOT_PATH/../lib/log4j-1.2.17.jar:$ROOT_PATH/testrunjob_0_1.jar:$ROOT_PATH/testroutine_bis_0_1.jar: talenddemo.testrunjob_0_1.testRunJob  "$@"