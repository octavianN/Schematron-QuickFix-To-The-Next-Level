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
                    <sqf:title ref="fix_en fix_de fix_fr fix_ja" xml:lang="en">Add a bone</sqf:title>
                    <sqf:p ref="fix_desc_en fix_desc_de fix_desc_fr fix_desc_ja">Add bone element as child</sqf:p>
                </sqf:description>
                <sqf:add node-type="element" target="bone"/>
            </sqf:fix>
        </sch:rule>
    </sch:pattern>
    
    <sch:diagnostics xml:lang="en">
        <sch:diagnostic id="d_en"> A dog should have a bone. </sch:diagnostic>
        <sch:diagnostic id="fix_en"> Add a bone </sch:diagnostic>
        <sch:diagnostic id="fix_desc_en">Add a bone element as child</sch:diagnostic>
    </sch:diagnostics>
    <sch:diagnostics xml:lang="de">
        <sch:diagnostic id="d_de"> Ein Hund sollte ein Bein haben. </sch:diagnostic>
        <sch:diagnostic id="fix_de"> Fügen Sie einen Knochen hinzu </sch:diagnostic>
        <sch:diagnostic id="fix_desc_de"> Fügen Sie ein Knochenelement als untergeordnetes Element hinzu </sch:diagnostic>
    </sch:diagnostics>
    <sch:diagnostics xml:lang="fr">
        <sch:diagnostic id="d_fr"> Un chien doit avoir un os. </sch:diagnostic>
        <sch:diagnostic id="fix_fr"> Ajouter un os </sch:diagnostic>
        <sch:diagnostic id="fix_desc_fr"> Ajouter un élément osseux en tant qu'enfant </sch:diagnostic>
    </sch:diagnostics>
    <sch:diagnostics xml:lang="ja">
        <sch:diagnostic id="d_ja"> 犬は骨を持っている必要があります。 </sch:diagnostic>
        <sch:diagnostic id="fix_ja"> 骨を追加する </sch:diagnostic>
        <sch:diagnostic id="fix_desc_ja"> 子要素としてボーン要素を追加する </sch:diagnostic>
    </sch:diagnostics>
</sch:schema>
