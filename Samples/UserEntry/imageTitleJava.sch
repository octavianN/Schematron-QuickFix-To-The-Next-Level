<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" queryBinding="xslt2">
    <sch:ns uri="http://www.w3.org/1999/xhtml" prefix="xht"/>
    <xsl:include href="browse.xsl"/>
    <sch:pattern>
        <sch:rule context="xht:img">
            <sch:assert test="@src" sqf:fix="addSrc"> Image requies @src attribute</sch:assert>

            <sqf:fix id="addSrc">
                <sqf:description>
                    <sqf:title>Browse and add @src attribute</sqf:title>
                </sqf:description>
                <sqf:add node-type="attribute" target="src">
                    <xsl:call-template name="browse"/>
                </sqf:add>
            </sqf:fix>
        </sch:rule>
    </sch:pattern>
</sch:schema>
