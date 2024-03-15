<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" id="fr1-2-fr0"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="xsd">

  <xsl:output method="xml" encoding="UTF-8" doctype-system="poemefr0.dtd"
              indent="yes"/>

  <xsl:strip-space elements="*"/>

  <xsl:template match="poemefr1" as="element(poemefr0)">
    <poemefr0><xsl:apply-templates/></poemefr0>
  </xsl:template>

  <xsl:template match="preambule" as="element(preambule)">
    <preambule>
      <xsl:apply-templates select="@titre,@recueil,@date"/>
      <auteur>
        <xsl:apply-templates select="@prenom,@nom,@naissance,@deces"/>
      </auteur>
    </preambule>
  </xsl:template>

  <xsl:template
    match="@titre | @recueil | @date | @nom | @prenom | @naissance | @deces"
    as="element()">
    <xsl:element name="{name()}"><xsl:value-of select="."/></xsl:element>
  </xsl:template>

  <xsl:template match="corps" as="element(corps)">
    <corps><xsl:apply-templates select="ligne[@strophe='oui']"/></corps>
  </xsl:template>

  <xsl:template match="ligne" as="element(strophe)">
    <strophe><xsl:apply-templates select="." mode="lignesseules"/></strophe>
  </xsl:template>

  <xsl:template match="ligne" mode="lignesseules" as="element(ligne)+">
    <ligne>
      <xsl:call-template name="renfoncement"/>
      <xsl:apply-templates/>
    </ligne>
    <xsl:apply-templates 
      select="following-sibling::ligne[1][@strophe != 'oui']"
      mode="lignesseules"/>
  </xsl:template>

  <xsl:template name="renfoncement" as="element(r)?">
    <xsl:if test="@r != '0em'"><r/></xsl:if>
  </xsl:template>

</xsl:stylesheet>
