<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs xd" xmlns:fcs="java:ro.sync.ui.FileChooserSingleton"
    xmlns:fc="java:ro.sync.ui.FileChooser" version="3.0">

    <xsl:template name="browse">
        <xsl:variable name="chooser" select="fcs:getFileChooserInstance()"/>
        <xsl:variable name="result" select="fc:showOpenDialog($chooser)"/>
        <xsl:if test="$result = 0">
            <xsl:value-of select="fc:getSelectedFile($chooser)"/>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
