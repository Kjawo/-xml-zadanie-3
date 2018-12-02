<?xml version="1.0" encoding="UTF-8"?>
<!-- /////////////////////////////////////////////////////////////////////////////////////////// -->
<!-- File: xml-zadanie-3-raport.xslt -->
<!-- Authors: Konrad Jaworski, Tomasz Witczak -->
<!-- /////////////////////////////////////////////////////////////////////////////////////////// -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  Output -->
    <xsl:output method="xml" version="1.0" encoding="UTF-8" standalone="yes" />

    <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - Templates -->
    <xsl:template name="BookStore" match="/bookStore">
        <xsl:element name="clientReport">
            <xsl:apply-templates select="child::books" />
        </xsl:element>
    </xsl:template>
        <xsl:template name="Books" match="books">
            <xsl:apply-templates select="child::book" />
        </xsl:template>
            <xsl:template name="Book" match="book">
                <xsl:element name="book">
                    <xsl:apply-templates select="child::title" />
                    <xsl:apply-templates select="attribute::authorID" />
                    <xsl:apply-templates select="attribute::genreID" />
                    <xsl:apply-templates select="child::pages" />
                    <xsl:apply-templates select="attribute::publisherID" />
                    <xsl:apply-templates select="child::publishYear" />
                    <xsl:apply-templates select="child::price" />
                    <xsl:apply-templates select="attribute::coverTypeID" />
                    <xsl:apply-templates select="child::isbn" />
                </xsl:element>
            </xsl:template>
                <xsl:template name="Author" match="@authorID">
                    <xsl:element name="author">
                        <xsl:variable name="authorID" select="/bookStore/books/book/@authorID" />
                        <xsl:value-of select="concat(
                            /bookStore/authors/author[@authorID = $authorID]/firstName, ' ',
                            /bookStore/authors/author[@authorID = $authorID]/lastName)" />
                    </xsl:element>
                </xsl:template>
                <xsl:template name="Genre" match="@genreID">
                    <xsl:element name="genre">
                        <xsl:variable name="genreID" select="/bookStore/books/book/@genreID" />
                        <xsl:value-of select="/bookStore/genres/genre[@genreID = $genreID]" />
                    </xsl:element>
                </xsl:template>
                <xsl:template name="Publisher" match="@publisherID">
                    <xsl:element name="publisher">
                        <xsl:variable name="publisherID" select="/bookStore/books/book/@publisherID" />
                        <xsl:value-of select="/bookStore/publishers/publisher[@publisherID = $publisherID]" />
                    </xsl:element>
                </xsl:template>
                <xsl:template name="CoverType" match="@coverTypeID">
                    <xsl:element name="coverType">
                        <xsl:variable name="coverTypeID" select="/bookStore/books/book/@coverTypeID" />
                        <xsl:value-of select="/bookStore/coverTypes/coverType[@coverTypeID = $coverTypeID]" />
                    </xsl:element>
                </xsl:template>
                <xsl:template name="Title" match="title">
                    <xsl:element name="title">
                        <xsl:value-of select="." />
                    </xsl:element>
                </xsl:template>
                <xsl:template name="Pages" match="pages">
                    <xsl:element name="pages">
                        <xsl:value-of select="." />
                    </xsl:element>
                </xsl:template>
                <xsl:template name="PublishYear" match="publishYear">
                    <xsl:element name="publishYear">
                        <xsl:value-of select="." />
                    </xsl:element>
                </xsl:template>
                <xsl:template name="Price" match="price">
                    <xsl:element name="price">
                        <xsl:value-of select="." />
                    </xsl:element>
                </xsl:template>
                <xsl:template name="ISBN" match="isbn">
                    <xsl:element name="isbn">
                        <xsl:value-of select="." />
                    </xsl:element>
                </xsl:template>
</xsl:stylesheet>
<!-- /////////////////////////////////////////////////////////////////////////////////////////// -->