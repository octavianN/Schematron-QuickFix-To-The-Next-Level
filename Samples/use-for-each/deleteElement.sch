<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
 <sch:pattern>
     <sch:rule context="root">
         <sch:report test="//*[@id]" sqf:fix="generic-fix">
            Elements with ids not allowed.
         </sch:report>
         
         <sqf:fix id="generic-fix" use-for-each="//*[@id]">
             <sqf:description>
                 <sqf:title>Delete id attribute from element <sch:value-of select="$sqf:current/@id"/></sqf:title>
             </sqf:description>
             <sqf:delete match="$sqf:current/@id"/>
         </sqf:fix>
     </sch:rule>
 </sch:pattern>   
</sch:schema>