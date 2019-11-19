<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron"
  xmlns:sqf="http://www.schematron-quickfix.com/validator/process" queryBinding="xslt2"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <sch:pattern>
    <!-- Add Ids to all sections, in this way you can easly refer the section from documentation -->
    <sch:rule context="section">
      <sch:assert test="@id" sqf:fix="addId addIds" role="warn">All sections should have an @id attribute</sch:assert>
      
      <sqf:fix id="addId">
        <sqf:description>
          <sqf:title>Add @id to the current section</sqf:title>
          <sqf:p>Add an @id attribute to the current section. The ID is generated from the section title.</sqf:p>
        </sqf:description>
        
        <!-- Generate an id based on the section title. If there is no title then generate a random id. -->
        <sqf:add target="id" node-type="attribute"
          select="if (exists(title) and string-length(title) > 0) 
          then substring(lower-case(replace(replace(normalize-space(string(title)), '\s', '_'), '[^a-zA-Z0-9_]', '')), 0, 50) 
          else generate-id()"/>
      </sqf:fix>
      
      <sqf:fix id="addIds">
        <sqf:description>
          <sqf:title>Add @id to all sections</sqf:title>
          <sqf:p>Add an @id attribute to each section from the document. The ID is generated from the section title.</sqf:p>
        </sqf:description>
        <!-- Generate an id based on the section title. If there is no title then generate a random id. -->
        <sqf:add match="//section[not(@id)]" target="id" node-type="attribute" 
          select="if (exists(title) and string-length(title) > 0) 
          then substring(lower-case(replace(replace(normalize-space(string(title)), '\s', '_'), '[^a-zA-Z0-9_]', '')), 0, 50) 
          else generate-id()"/>
      </sqf:fix>
    </sch:rule>
    
    <!-- Topic ID must be equal to name -->
    <sch:rule context="topic">
      <sch:let name="reqId" value="substring-before(tokenize(document-uri(/), '/')[last()], '.')"/>
      <sch:assert test="@id = $reqId" sqf:fix="setId">
        Topic ID must be equal to file name.
      </sch:assert>
      <sqf:fix id="setId">
        <sqf:description>
          <sqf:title>Set "<sch:value-of select="$reqId"/>" as a topic ID</sqf:title>
          <sqf:p>The topic ID must be equal to the file name.</sqf:p>
        </sqf:description>
        <sqf:add node-type="attribute" target="id" select="$reqId"/>
      </sqf:fix>
    </sch:rule>
  </sch:pattern>
</sch:schema>
