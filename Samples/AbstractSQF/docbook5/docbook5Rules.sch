<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:include href="../quickFix-library.xml"/>
    <sch:ns uri="http://docbook.org/ns/docbook" prefix="doc"/>
    
    <sch:include href="../rules-library.sch#unwrapCheckPattern"/>
    <sch:include href="../rules-library.sch#wrapCheckPattern"/>
    <sch:include href="../rules-library.sch#mergePattern"/>
    <sch:include href="../rules-library.sch#renamePattern"/>
    
    <!-- Unordered list should not be in a paragraph -->
    <sch:pattern is-a="unwrapCheckPattern">
        <sch:param name="parentElement" value="doc:para"/>
        <sch:param name="childElement" value="doc:itemizedlist"/>
    </sch:pattern>
    
    <!-- Ordered lists should not be in a paragraph -->
    <sch:pattern is-a="unwrapCheckPattern">
        <sch:param name="parentElement" value="doc:para"/>
        <sch:param name="childElement" value="doc:orderedlist"/>
    </sch:pattern>
    
    <!-- Figure should not be in a paragraph -->
    <sch:pattern is-a="wrapCheckPattern">
        <sch:param name="parentElement" value="doc:para"/>
        <sch:param name="childElement" value="doc:figure"/>
    </sch:pattern>
    
    <!-- Adjacent ordered lists are not allowed -->
    <sch:pattern is-a="mergePattern">
        <sch:param name="element" value="doc:orderedlist"/>
    </sch:pattern>
    
    <!-- Adjacent unordered lists are not allowed -->
    <sch:pattern is-a="mergePattern">
        <sch:param name="element" value="doc:itemizedlist"/>
    </sch:pattern>
    
    <!-- Ordered lists are not allowed -->
    <sch:pattern is-a="renamePattern">
        <sch:param name="element" value="doc:orderedlist"/>
        <sch:param name="newName" value="itemizedlist"/>
    </sch:pattern>
</sch:schema>