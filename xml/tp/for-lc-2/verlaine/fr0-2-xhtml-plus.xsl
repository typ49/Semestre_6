<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" id="fr0-2-xhtml-plus"
                xmlns="http://www.w3.org/1999/xhtml"                
                xmlns:xhtml="http://www.w3.org/1999/xhtml"  
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                exclude-result-prefixes="xsd xhtml">

  <xsl:output
    method="xhtml" encoding="UTF-8"
    doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
    indent="yes"/>

  <xsl:strip-space elements="*"/>
  <xsl:variable name="emdash" select="'&#8212;'" as="xsd:string"/>
  <xsl:variable name="nbsp" select="'&#160;'" as="xsd:string"/>

  <xsl:template match="poemefr0" as="element(xhtml:html)">
    <html>
      <head><title><xsl:value-of select="preambule/titre"/></title></head>
      <body><xsl:apply-templates/></body>
    </html>
  </xsl:template>

  <xsl:template match="preambule" as="element()+">
    <h1 align="center"><xsl:apply-templates select="titre"/></h1>
    <xsl:apply-templates select="recueil"/>
    <p align="center"><xsl:apply-templates select="auteur"/></p>
    <p align="center"><xsl:apply-templates select="date"/></p>
  </xsl:template>

  <xsl:template match="recueil" as="element(xhtml:p)">
    <p align="center"><em>in </em><xsl:value-of select="."/></p>
  </xsl:template>

  <xsl:template match="titre | date | naissance | deces" as="xsd:string">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="auteur" as="xsd:string">
    <xsl:variable name="author-processed" as="xsd:string+">
      <xsl:apply-templates select="prenom,nom"/>
      <xsl:if test="naissance and deces">
        <xsl:text> (</xsl:text>
        <xsl:apply-templates select="naissance"/>
        <xsl:value-of select="$emdash"/>
        <xsl:apply-templates select="deces"/>
        <xsl:text>)</xsl:text>
      </xsl:if>
    </xsl:variable>
    <xsl:value-of select="$author-processed" separator=""/>
  </xsl:template>

  <xsl:template match="prenom" as="xsd:string+">
    <xsl:apply-templates/><xsl:value-of select="$nbsp"/>
  </xsl:template>

  <xsl:template match="corps" as="element(xhtml:div)">
    <div><xsl:apply-templates/></div>
  </xsl:template>

  <xsl:template match="strophe" as="element()+">
    <div><xsl:apply-templates/></div><br/>
  </xsl:template>

  <xsl:template match="ligne"><xsl:apply-templates/><br/></xsl:template>

  <xsl:template match="r" as="xsd:string">
    <xsl:value-of select="for $i in 1 to 5 return $nbsp" separator=""/>
  </xsl:template>

</xsl:stylesheet>
