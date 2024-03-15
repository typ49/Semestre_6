<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" id="fr0-2-latex"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="xsd">

  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:variable name="eol" select="'&#10;'"/>
  <xsl:strip-space elements="*"/>

  <xsl:template match="poemefr0" as="xsd:string">
    <xsl:variable name="poemefr0-processed" as="xsd:string+">
      <xsl:sequence select="'\documentclass{article}',$eol,
                            '\usepackage[T1]{fontenc}',$eol,
                            '\usepackage[utf8]{inputenc}',$eol,$eol"/>
      <xsl:apply-templates select="preambule"/>
      <xsl:sequence
        select="'\begin{document}',$eol,$eol,'\maketitle',$eol,$eol"/>
      <xsl:apply-templates select="corps"/>
      <xsl:sequence select="'\end{document}',$eol"/>
    </xsl:variable>
    <xsl:value-of select="$poemefr0-processed" separator=""/>
  </xsl:template>

  <xsl:template match="preambule" as="xsd:string+">
    <xsl:sequence select="'\title{',data(titre)"/>
    <xsl:apply-templates select="recueil"/>
    <xsl:sequence select="$eol,'\author{'"/>
    <xsl:apply-templates select="auteur"/>
    <xsl:sequence select="'}',$eol,'\date{',data(date),'}',$eol,$eol"/>
  </xsl:template>

  <xsl:template match="recueil" as="xsd:string+">
    <xsl:sequence select="' \\ (\emph{in} ',.,')}'"/>
  </xsl:template>

  <xsl:template match="auteur" as="xsd:string+">
    <xsl:apply-templates select="prenom"/>
    <xsl:value-of select="nom"/>
    <xsl:if test="naissance and deces">
      <xsl:sequence select="' (',naissance,'--',deces,')'"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="prenom" as="xsd:string+">
    <xsl:sequence select="data(.),' '"/>
  </xsl:template>

  <xsl:template match="corps" as="xsd:string+">
    <xsl:sequence select="'\begin{verse}',$eol"/>
    <xsl:apply-templates/>
    <xsl:sequence select="'\end{verse}',$eol,$eol"/>
  </xsl:template>

  <xsl:template match="strophe" as="xsd:string+">
    <xsl:apply-templates/>
    <xsl:value-of select="$eol"/>
  </xsl:template>

  <xsl:template match="ligne" as="xsd:string+">
    <xsl:apply-templates/>
    <xsl:sequence select="if (position() lt last()) then ' \\' else (),$eol"/>
  </xsl:template>

  <xsl:template match="r" as="xsd:string">
    <xsl:text>\qquad </xsl:text>
  </xsl:template>

</xsl:stylesheet>
