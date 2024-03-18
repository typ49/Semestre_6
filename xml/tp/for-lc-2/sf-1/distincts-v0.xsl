<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" id="distincts-v0"
    xmlns:L3-players="http://www.univ-fcomte.fr/L3info"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="L3-players xsd">

    <xsl:output method="text" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>
    <xsl:include href="common.xsl"/>

    <xsl:template match="book | inproceedings" as="xsd:string+">
        <xsl:variable name="the-normalised-title" as="xsd:string">
            <xsl:apply-templates select="title"/>
        </xsl:variable>
        <xsl:sequence
            select=
                "$the-normalised-title,
                L3-players:report-on-title
                    (count(preceding-sibling::*/title
                        [L3-players:normalise-title(.) eq $the-normalised-title]) +
                    count(following-sibling::*/title
                        [L3-players:normalise-title(.) eq $the-normalised-title]))"/>
    </xsl:template>

</xsl:stylesheet>