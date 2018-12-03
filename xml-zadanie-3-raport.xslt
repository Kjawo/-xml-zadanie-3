<?xml version="1.0" encoding="UTF-8"?>
<!-- /////////////////////////////////////////////////////////////////////////////////////////// -->
<!-- File: xml-zadanie-3-raport.xslt -->
<!-- Authors: Konrad Jaworski, Tomasz Witczak -->
<!-- /////////////////////////////////////////////////////////////////////////////////////////// -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
    <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  Output -->
    <xsl:output method="xml" version="1.0" encoding="UTF-8" standalone="yes" />

    <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - Templates -->
    <xsl:template name="BookStore" match="/bookStore">
        <xsl:element name="clientReport">
            <xsl:call-template name="ReportInformation" />
            <xsl:apply-templates select="child::books" />
            <xsl:call-template name="Statistics" />
        </xsl:element>
    </xsl:template>
    <xsl:template name="ReportInformation">
        <xsl:element name="reportInformation">
            <!-- TODO: Ewentualnie coś się doda -->
            <xsl:call-template name="ReportGenerationTime" />
        </xsl:element>
    </xsl:template>
    <xsl:template name="ReportGenerationTime">
        <xsl:element name="reportGenerationTime">
            <xsl:value-of select="format-dateTime(current-dateTime(), '[H01]:[m01] [D01]-[M01]-[Y0001]')" />
        </xsl:element>
    </xsl:template>
    <xsl:template name="Books" match="books">
        <xsl:apply-templates select="child::book">
            <xsl:sort select="title" />
        </xsl:apply-templates>
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
            <xsl:variable name="authorID" select="." />
            <xsl:value-of select="concat(
                            /bookStore/authors/author[@authorID = $authorID]/firstName, ' ',
                            /bookStore/authors/author[@authorID = $authorID]/lastName)" />
        </xsl:element>
    </xsl:template>
    <xsl:template name="Genre" match="@genreID">
        <xsl:element name="genre">
            <xsl:variable name="genreID" select="." />
            <xsl:value-of select="/bookStore/genres/genre[@genreID = $genreID]" />
        </xsl:element>
    </xsl:template>
    <xsl:template name="Publisher" match="@publisherID">
        <xsl:element name="publisher">
            <xsl:variable name="publisherID" select="." />
            <xsl:value-of select="/bookStore/publishers/publisher[@publisherID = $publisherID]" />
        </xsl:element>
    </xsl:template>
    <xsl:template name="CoverType" match="@coverTypeID">
        <xsl:element name="coverType">
            <xsl:variable name="coverTypeID" select="." />
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
    <xsl:template name="Statistics">
        <xsl:element name="statistics">
            <xsl:call-template name="OverallBookCount" />
            <xsl:call-template name="AveragePageCount" />
            <xsl:call-template name="AveragePrice" />
            <xsl:call-template name="MostCommonGenre" />
            <xsl:call-template name="MostCommonCoverType" />
            <xsl:call-template name="BookCountsPerAuthor" />
        </xsl:element>
    </xsl:template>
    <xsl:template name="OverallBookCount">
        <xsl:element name="overallBookCount">
            <xsl:value-of select="count(/bookStore/books/book)"/>
        </xsl:element>
    </xsl:template>
    <xsl:template name="AveragePageCount">
        <xsl:element name="averagePageCount">
            <xsl:value-of select="round(avg(/bookStore/books/book/pages))"/>
        </xsl:element>
    </xsl:template>
    <xsl:template name="AveragePrice">
        <xsl:element name="averagePrice">
            <xsl:value-of select="format-number(avg(/bookStore/books/book/price), '#.##')"/>
        </xsl:element>
    </xsl:template>
    <xsl:template name="MostCommonGenre">
        <xsl:element name="mostCommonGenre">
            <!-- TODO: TODO -->
        </xsl:element>
    </xsl:template>
    <xsl:template name="MostCommonCoverType">
        <xsl:element name="mostCommonCoverType">
            <xsl:choose>
                <xsl:when test="count(/bookStore/books/book[@coverTypeID='paperback']) > round(count(/bookStore/books/book) div 2)">miękka</xsl:when>
                <xsl:otherwise>twarda</xsl:otherwise>
            </xsl:choose>
        </xsl:element>
    </xsl:template>
    <xsl:template name="BookCountsPerAuthor">
        <xsl:element name="bookCountsPerAuthor">
            <xsl:for-each select="/bookStore/authors/author">
                <xsl:sort select="lastName" />

                <xsl:variable name="authorID" select="@authorID" />
                <xsl:variable name="bookCount" select="count(/bookStore/books/book[@authorID = $authorID])" />
                <xsl:element name="authorsBookCount">

                    <xsl:element name="author">
                        <xsl:value-of select="concat(
                              /bookStore/authors/author[@authorID = $authorID]/firstName, ' ',
                              /bookStore/authors/author[@authorID = $authorID]/lastName)" />
                    </xsl:element>
                    <xsl:element name="bookCount">
                        <xsl:value-of select="$bookCount"/>
                    </xsl:element>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
        <!-- /////////////////////////////////////////////////////////////////////////////////////////// -->