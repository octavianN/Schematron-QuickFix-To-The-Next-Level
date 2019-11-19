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
                    <sqf:title ref="dog.addBone.title" xml:lang="en">Add a bone</sqf:title>
                    <sqf:p ref="dog.addBone.p">Add bone element as child</sqf:p>
                </sqf:description>
                <sqf:add node-type="element" target="bone"/>
            </sqf:fix>
        </sch:rule>
    </sch:pattern>
    
    <sch:diagnostics xml:lang="en">
        <sch:diagnostic id="d_en"> A dog should have a bone. </sch:diagnostic>
    </sch:diagnostics>
    <sch:diagnostics xml:lang="de">
        <sch:diagnostic id="d_de"> Ein Hund sollte ein Bein haben. </sch:diagnostic>
    </sch:diagnostics>
    <sch:diagnostics xml:lang="fr">
        <sch:diagnostic id="d_fr"> Un chien doit avoir un os. </sch:diagnostic>
    </sch:diagnostics>
    <sch:diagnostics xml:lang="ja">
        <sch:diagnostic id="d_ja"> 犬は骨を持っている必要があります。 </sch:diagnostic>
    </sch:diagnostics>
</sch:schema>
