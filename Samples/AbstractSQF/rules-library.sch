<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:include href="quickFix-library.xml"/>
    
    <sch:pattern id="unwrapCheckPattern" abstract="true">
        <sch:rule context="$childElement">
            <sch:report test="parent::$parentElement" sqf:fix="unwrapElement"> 
                The '$childElement' should not be in a '$parentElement' element. 
            </sch:report>
        </sch:rule>
    </sch:pattern>

    <sch:pattern id="wrapCheckPattern" abstract="true">
        <sch:rule context="$childElement">
            <sch:assert test="parent::$parentElement" sqf:fix="wrapWithElement"> 
                The '$childElement' should not be wrapped in a '$parentElement' element. 
            </sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:pattern id="mergePattern" abstract="true">
        <sch:rule context="$element">
            <sch:let name="currentName" value="local-name()"/>
            <sch:report test="following-sibling::element()[1][local-name() = $currentName]" sqf:fix="mergeSiblings"> 
                Two consecutive '$element' elements are not allowed.
            </sch:report>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="renamePattern" abstract="true">
        <sch:rule context="$element">
            <sch:assert test="false()" sqf:fix="renameElement"> 
                Element '$element' not allowed, use '$newName' instead.
            </sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>
