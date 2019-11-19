<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:pattern>
        <sch:rule context="ul">
            <sch:report test="count(li) mod 2 != 0" sqf:fix="removeAnyItem">
                The list must contain an even number of entries.
            </sch:report>
            <sqf:fix id="removeAnyItem" use-for-each="1 to count(li)">
                <sqf:description>
                    <sqf:title>Remove item #<sch:value-of select="$sqf:current"/>: "<sch:value-of select="li[$sqf:current]"/>"</sqf:title>
                </sqf:description>
                <sqf:delete match="li[$sqf:current]"/>
            </sqf:fix>
        </sch:rule>
    </sch:pattern> 
</sch:schema>