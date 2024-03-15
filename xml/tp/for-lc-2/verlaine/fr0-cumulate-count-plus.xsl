<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" id="fr0-cumulate-count-plus"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="xsd">

  <xsl:output method="text"/>
  <xsl:strip-space elements="*"/>
  <xsl:variable name="eol" select="'&#10;'" as="xsd:string"/>

  <xsl:template match="poemefr0" as="xsd:string">
    <xsl:variable name="poem-processed" as="xsd:string+">
      <xsl:apply-templates select="corps"/>
    </xsl:variable>
    <xsl:value-of select="$poem-processed" separator=""/>
  </xsl:template>

  <xsl:template match="corps" as="xsd:string+">
    <xsl:sequence select="'Les nombres de lignes cumulées sont :',$eol"/>
    <xsl:apply-templates select="strophe[1]"/>
  </xsl:template>

  <xsl:template match="strophe" as="xsd:string+">
    <xsl:param name="already-counted" select="0" as="xsd:integer"/>
    <xsl:variable name="newly-counted" select="$already-counted + count(ligne)"
                  as="xsd:integer"/>
    <xsl:sequence select="xsd:string($newly-counted),$eol"/>
    <xsl:apply-templates select="following-sibling::strophe[1]">
      <xsl:with-param name="already-counted" select="$newly-counted"
                      as="xsd:integer"/>
    </xsl:apply-templates>
  </xsl:template>

</xsl:stylesheet>
