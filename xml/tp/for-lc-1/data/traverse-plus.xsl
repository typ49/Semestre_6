<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" id="traverse-plus"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="xsd">

  <xsl:output method="text"/>
  <xsl:variable name="eol" select="'&#xA;'" as="xsd:string"/>
  <xsl:strip-space elements="*"/>

  <xsl:template match="* | @*" as="xsd:string">
    <xsl:variable name="messages" as="xsd:string+">
      <xsl:sequence
        select=
        '"Le nom est : ",name()," c&apos;est-à-dire : ",namespace-uri(),
         ", puis ",local-name(),".",$eol,"Les noms disponibles sont : ",$eol,
         for $namespace in namespace::*
           return (name($namespace),", qui vaut : ",$namespace,$eol),
         "**********",$eol'/>
      <xsl:apply-templates select="@*,*"/>
    </xsl:variable>
    <xsl:value-of select="$messages" separator=""/>
  </xsl:template>

</xsl:stylesheet>
