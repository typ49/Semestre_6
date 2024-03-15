<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" id="fr0-cumulate-count"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="text"/>
  <xsl:strip-space elements="*"/>
  <xsl:variable name="eol" select="'&#10;'"/>

  <xsl:template match="poemefr0">
    <xsl:apply-templates select="corps"/>
  </xsl:template>

  <xsl:template match="corps">
    <xsl:value-of select="'Les nombres de lignes cumulées sont :',$eol"/>
    <xsl:apply-templates select="strophe[1]"/>
  </xsl:template>

  <xsl:template match="strophe">
    <xsl:param name="already-counted" select="0"/>
    <xsl:variable name="newly-counted"
                  select="$already-counted + count(ligne)"/>
    <xsl:value-of select="$newly-counted,$eol" separator=""/>
    <xsl:apply-templates select="following-sibling::strophe[1]">
      <xsl:with-param name="already-counted" select="$newly-counted"/>
    </xsl:apply-templates>
  </xsl:template>

</xsl:stylesheet>
