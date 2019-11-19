<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process" xml:lang="en">
    <sch:title>Example of Multi-Lingual Schema</sch:title>
    <sch:pattern>
        <sch:rule context="dog">
            <sch:assert test="bone" diagnostics="d_en d_de d_fr d_ja" sqf:fix="addBone">
                A dog should have a bone.</sch:assert>
            
            <sqf:fix id="addBone">
                <sqf:description>
                    <sqf:title ref="fix_en fix_de fix_fr fix_ja">Add a bone</sqf:title>
                    <sqf:p ref="fix_desc_en fix_desc_de fix_desc_fr fix_desc_ja">Add a bone element as child</sqf:p>
                </sqf:description>
                <sqf:add node-type="element" target="bone"/>
            </sqf:fix>
        </sch:rule>
    </sch:pattern>
    <sch:include href="msg_en.sch"/>
    <sch:include href="msg_fr.sch"/>
    <sch:include href="msg_de.sch"/>
    <sch:include href="msg_ja.sch"/>
</sch:schema>
