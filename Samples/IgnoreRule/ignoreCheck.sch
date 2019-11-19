<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron"
  xmlns:sqf="http://www.schematron-quickfix.com/validator/process" queryBinding="xslt2"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <sch:ns uri="http://www.schematron-quickfix.com/functions" prefix="func"/>

  <sch:let name="globalIgnoredRules"
    value="/processing-instruction()[name() = 'SuppressRule']/tokenize(., ' ')"/>

  <sch:pattern>
    <!-- Title - styling elements are not allowed in title. -->
    <sch:rule context="title/b">
      <sch:let name="ruleCheckId" value="'boldCheck'"/>
      <sch:report test="not(func:isRuleIgnored(., $ruleCheckId)) and true()"
        sqf:fix="resolveBold ignoreRule ignoreRuleGlobal" role="warn"> Bold element is
        not allowed in title. </sch:report>

      <!-- Quick fix that converts a bold element into text -->
      <sqf:fix id="resolveBold">
        <sqf:description>
          <sqf:title>Change the bold element into text</sqf:title>
          <sqf:p>Removes the bold (b) markup and keeps the text content.</sqf:p>
        </sqf:description>
        <sqf:replace select="node()"/>
      </sqf:fix>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:rule context="p">
      <sch:let name="ruleCheckId" value="'fullStopCheck'"/>
      <!-- The p must end with full stop -->
      <sch:assert test="func:isRuleIgnored(., $ruleCheckId) or ends-with(text()[last()], '.')"
        sqf:fix="addFullStop ignoreRule ignoreRuleGlobal" role="warn"> Paragraph must
        end with full stop.</sch:assert>

      <!-- Quick fix that adds full stop (.). -->
      <sqf:fix id="addFullStop">
        <sqf:description>
          <sqf:title>Add full stop</sqf:title>
        </sqf:description>
        <sqf:stringReplace match="text()[last()]" regex="$" select="'.'"/>
      </sqf:fix>
    </sch:rule>
  </sch:pattern>

  <!-- Rule that checks if all specified elements have IDs -->
  <sch:let name="ELEM_NAME_WITH_ID_LIST" value="('li', 'section')"/>
  <sch:pattern>
    <sch:rule context="*[name() = $ELEM_NAME_WITH_ID_LIST]">
      <sch:let name="ruleCheckId" value="'idCheck'"/>
      <sch:report test="not(func:isRuleIgnored(., $ruleCheckId)) and string(@id) = ''" role="info"
        sqf:fix="addIdElement addIdFile ignoreRule ignoreRuleGlobal"> The
          <sch:value-of select="name()"/> element should have an id attribute. </sch:report>

      <sqf:fix id="addIdElement">
        <sqf:description>
          <sqf:title>Add id attribute to the current element.</sqf:title>
        </sqf:description>
        <sqf:add match="." node-type="attribute" target="id" select="func:createId(.)"/>
      </sqf:fix>

      <sqf:fix id="addIdFile">
        <sqf:description>
          <sqf:title>Add all missing id attributes</sqf:title>
        </sqf:description>
        <sqf:add match="//*[name() = $ELEM_NAME_WITH_ID_LIST][string(@id) = '']"
          node-type="attribute" target="id" select="func:createId(.)"/>
      </sqf:fix>
    </sch:rule>
  </sch:pattern>

  <!-- Function that generated an ID -->
  <xsl:function name="func:createId">
    <xsl:param name="element" as="element()"/>
    <xsl:value-of select="concat(name($element), '_', generate-id($element))"/>
  </xsl:function>

  <!-- Function that checks if a rule is ignored -->
  <xsl:function name="func:isRuleIgnored" as="xs:boolean">
    <xsl:param name="node"/>
    <xsl:param name="ruleId"/>
    <xsl:value-of
      select="
        boolean($ruleId) and
        ($ruleId = $node/preceding-sibling::processing-instruction()[name() = 'SuppressRule']/tokenize(., ' ')
        or $ruleId = $globalIgnoredRules)"
    />
  </xsl:function>

  <!-- Quick fixes that add a rule to the ignore list -->
  <sqf:fixes>
    <sqf:fix id="ignoreRule" role="delete">
      <sqf:description>
        <sqf:title>Ignore current rule</sqf:title>
      </sqf:description>
      <sch:let name="ignoredRulePI"
        value="preceding-sibling::processing-instruction()[name() = 'SuppressRule']"/>
      <sqf:delete match="$ignoredRulePI" use-when="$ignoredRulePI"/>
      <sqf:add position="before">
        <xsl:processing-instruction name="SuppressRule" select="concat($ignoredRulePI, ' ', $ruleCheckId)"/>
      </sqf:add>
    </sqf:fix>

    <sqf:fix id="ignoreRuleGlobal" role="delete">
      <sqf:description>
        <sqf:title>Ignore current rule in the entire document</sqf:title>
      </sqf:description>
      <sch:let name="ignoredRulePI" value="/processing-instruction()[name() = 'SuppressRule']"/>
      <sqf:delete match="$ignoredRulePI" use-when="$ignoredRulePI"/>
      <sqf:add match="/element()" position="after">
        <xsl:processing-instruction name="SuppressRule" select="concat($ignoredRulePI, ' ', $ruleCheckId)"/>
      </sqf:add>
    </sqf:fix>
    
    <sqf:fix id="ignoreRuleExternal" role="delete">
      <sqf:description>
        <sqf:title>Ignore current rule in the entire document</sqf:title>
      </sqf:description>
      <sch:let name="ignoredRulePI" value="/processing-instruction()[name() = 'SuppressRule']"/>
      <sqf:delete match="$ignoredRulePI" use-when="$ignoredRulePI"/>
      <sqf:add match="/element()" position="after">
        <xsl:processing-instruction name="SuppressRule" select="concat($ignoredRulePI, ' ', $ruleCheckId)"/>
      </sqf:add>
    </sqf:fix>
  </sqf:fixes>
</sch:schema>
