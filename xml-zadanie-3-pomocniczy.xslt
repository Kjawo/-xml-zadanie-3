<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" standalone="yes" />

    <xsl:template match="/">
        <clientReport>
            <xsl:apply-templates/>
        </clientReport>
    </xsl:template>

    <xsl:template match="book">
        <book>
        <title><xsl:value-of select="title"/></title>
        <!-- <author></author> -->
        <!-- <genre></genre> -->
        <pages><xsl:value-of select="pages"/></pages>
        <!-- <publisher></publisher> -->
        <publishYear><xsl:value-of select="publishYear"/></publishYear>
        <price><xsl:value-of select="price"/></price>
        <!-- <frontCover/> -->
        <!-- <coverType></coverType> -->
        <isbn><xsl:value-of select="isbn"/></isbn>
        </book>
    </xsl:template>
    <xsl:template match="header"/>
    <xsl:template match="authors"/>
    <xsl:template match="genres"/>
    <xsl:template match="coverTypes"/>
    <xsl:template match="publishers"/>
</xsl:stylesheet>