<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron"
    queryBinding="xslt2" xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    
    <sch:pattern>
        <sch:rule context="text()">
            <sch:report test="matches(., 'dialog(?!\s+box)', 'i;j')" sqf:fix="addBox" role="warn">
                Dialog should be followed by 'box'.</sch:report>
            <sqf:fix id="addBox">
                <sqf:description>
                    <sqf:title>Add 'Box' after dialog</sqf:title>
                </sqf:description>
                <sqf:stringReplace regex="(?i)dialog(?!\s+box)" select="'dialog box'"/>
            </sqf:fix>
        </sch:rule>
    </sch:pattern>
</sch:schema>