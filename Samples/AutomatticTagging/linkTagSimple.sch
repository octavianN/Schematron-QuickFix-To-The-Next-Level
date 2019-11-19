<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- Automatic tagging -->
    <sch:pattern>
        <sch:rule context="text()[matches(., '(http|www)\S+')][local-name(parent::node()) != 'xref']">
            <sch:report test="true()" role="warn" sqf:fix="convertToLink">
                Link detected in '<sch:value-of select="local-name(parent::node())"/>' element</sch:report>
            
            <sqf:fix id="convertToLink">
                <sqf:description>
                    <sqf:title>Convert text link to xref</sqf:title>
                </sqf:description>
                <sqf:stringReplace regex="(http|www)\S+">
                    <xref href="{regex-group(0)}" format="html" scope="external"/>
                </sqf:stringReplace>
            </sqf:fix>
        </sch:rule>
    </sch:pattern>
</sch:schema>