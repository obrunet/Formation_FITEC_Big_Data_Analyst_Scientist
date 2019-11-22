#!/bin/sh
cd `dirname $0`
ROOT_PATH=`pwd`
java -Dtalend.component.manager.m2.repository=$ROOT_PATH/../lib -Xms256M -Xmx1024M -Dfile.encoding=UTF-8 -cp .:$ROOT_PATH:$ROOT_PATH/../lib/routines.jar:$ROOT_PATH/../lib/commons-collections4-4.1.jar:$ROOT_PATH/../lib/commons-compress-1.19.jar:$ROOT_PATH/../lib/commons-math3-3.6.1.jar:$ROOT_PATH/../lib/crypto-utils.jar:$ROOT_PATH/../lib/dom4j-1.6.1.jar:$ROOT_PATH/../lib/geronimo-stax-api_1.0_spec-1.0.1.jar:$ROOT_PATH/../lib/log4j-1.2.17.jar:$ROOT_PATH/../lib/poi-4.1.0-20190523141255_modified_talend.jar:$ROOT_PATH/../lib/poi-ooxml-4.1.0-20190523141255_modified_talend.jar:$ROOT_PATH/../lib/poi-ooxml-schemas-4.1.0-20190523141255_modified_talend.jar:$ROOT_PATH/../lib/poi-scratchpad-4.1.0-20190523141255_modified_talend.jar:$ROOT_PATH/../lib/xmlbeans-3.1.0.jar:$ROOT_PATH/testexcel_0_1.jar: talenddemo.testexcel_0_1.testExcel  "$@"