<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet >
    <xsl:template match="water-bottles">
        <xsl:apply-template select="water-bottle" />
    </xsl:template>
    <xsl:template match="water-bottle">
        <xsl:apply-templates select="name, comes-from" />
    </xsl:template>
    <xsl:template math="name">
        <xsl:apply-templates />
    </xsl:template>
</xsl:stylesheet>