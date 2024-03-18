<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <!-- Output format -->
  <xsl:output method="text" encoding="UTF-8"/>

  <!-- Template for the root element -->
  <xsl:template match="/film-series">
    <!-- Apply templates for films sorted by year -->
    <xsl:apply-templates select="film-list/film">
      <xsl:sort select="@year" data-type="number" order="ascending"/>
    </xsl:apply-templates>
  </xsl:template>

  <!-- Template for each film -->
  <xsl:template match="film">
    <!-- Print the title -->
    <xsl:value-of select="title"/>
    <xsl:text> --- </xsl:text>
    <!-- Find the actor's details based on the starring attribute -->
    <xsl:apply-templates select="../people/personname[@key=current()/@starring]"/>
    <!-- Add a newline for the next film -->
    <xsl:text>&#10;</xsl:text>
  </xsl:template>

  <!-- Template for each actor -->
  <xsl:template match="personname">
    <!-- Print the actor's first and last name -->
    <xsl:value-of select="@firstname"/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="@lastname"/>
    <!-- Print the actor's birth and death year -->
    <xsl:text> (</xsl:text>
    <xsl:value-of select="@born"/>
    <xsl:choose>
      <!-- Check if the death attribute exists -->
      <xsl:when test="@dead">
        <xsl:text> - </xsl:text>
        <xsl:value-of select="@dead"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text> -</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>) [</xsl:text>
    <!-- Print the ISO code of the actor's country of birth -->
    <xsl:value-of select="@born-as"/>
    <xsl:text>]</xsl:text>
  </xsl:template>

</xsl:stylesheet>
