%~d0
cd %~dp0
java -Dtalend.component.manager.m2.repository="%cd%/../lib" -Xms256M -Xmx1024M -cp .;../lib/routines.jar;../lib/commons-collections4-4.1.jar;../lib/commons-compress-1.19.jar;../lib/commons-math3-3.6.1.jar;../lib/crypto-utils.jar;../lib/dom4j-1.6.1.jar;../lib/external_sort.jar;../lib/geronimo-stax-api_1.0_spec-1.0.1.jar;../lib/log4j-1.2.17.jar;../lib/poi-4.1.0-20190523141255_modified_talend.jar;../lib/poi-ooxml-4.1.0-20190523141255_modified_talend.jar;../lib/poi-ooxml-schemas-4.1.0-20190523141255_modified_talend.jar;../lib/poi-scratchpad-4.1.0-20190523141255_modified_talend.jar;../lib/xmlbeans-3.1.0.jar;sort_0_1.jar; talenddemo.sort_0_1.sort  --context=Default %*