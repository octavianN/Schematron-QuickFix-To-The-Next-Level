<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process" queryBinding="xslt2"
    xmlns="http://www.w3.org/1999/xhtml">
    <sch:ns uri="http://www.w3.org/1999/xhtml" prefix="xht"/>
    <sch:pattern>
        <sch:rule context="xht:img">
            <sch:assert test="parent::node()[local-name() = 'a']" sqf:fix="addAnchorAndTitle"> Link is
                required for images</sch:assert>
        
             <sqf:fix id="addAnchorAndTitle">
                <sqf:description>
                    <sqf:title>Surround image with a hypertext link</sqf:title>
                    <sqf:p>The image will be surrounded with a hypertext link. The value of the link
                        will be inserted by the user.</sqf:p>
                </sqf:description>

                <!-- Href value -->
                <sqf:user-entry name="href">
                    <sqf:description>
                        <sqf:title>Enter anchor href value:</sqf:title>
                    </sqf:description>
                </sqf:user-entry>
                
                <!-- Link title -->
                <sqf:user-entry name="linkTitle">
                    <sqf:description>
                        <sqf:title>Enter link title:</sqf:title>
                    </sqf:description>
                </sqf:user-entry>
                 
                 <!-- Surround current image element with an anchor -->
                <sqf:replace>
                    <a href="{$href}" title="{$linkTitle}">
                        <sqf:copy-of select="."/>
                    </a>
                </sqf:replace>
            </sqf:fix>
            
        </sch:rule>
    </sch:pattern>
</sch:schema>
