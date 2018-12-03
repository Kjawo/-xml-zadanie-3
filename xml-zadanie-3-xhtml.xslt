<?xml version="1.0" encoding="UTF-8"?>
<!-- /////////////////////////////////////////////////////////////////////////////////////////// -->
<!-- File: xml-zadanie-3-xhtml.xslt -->
<!-- Authors: Konrad Jaworski, Tomasz Witczak -->
<!-- /////////////////////////////////////////////////////////////////////////////////////////// -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
    <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  Output -->
    <xsl:output method="xhtml" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
                doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" version="1.0"
                encoding="UTF-8"/>

    <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - Templates -->
    <xsl:template name="ClientReport" match="/clientReport">
        <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pl" lang="pl">

            <head>
                <title>Raport inwentarza książek</title>
            </head>

            <body>
                <div>
                    <h3>Raport inwentarza książek</h3>
                    <p>Czas utworzenia raportu: <xsl:value-of select="/clientReport/reportInformation/reportGenerationTime"/></p>
                </div>
                <div>
                    <table>
                        <tr>
                            <th>Tytuł</th>
                            <th>Autor</th>
                            <th>Gatunek</th>
                            <th>Liczba stron</th>
                            <th>Wydawca</th>
                            <th>Rok wydania</th>
                            <th>Cena</th>
                            <th>Rodzaj okładki</th>
                            <th>ISBN</th>
                        </tr>
                        <xsl:for-each select="/clientReport/book">
                            <tr>
                                <xsl:for-each select="*">
                                    <td>
                                        <xsl:value-of select="." />
                                    </td>
                                </xsl:for-each>
                            </tr>
                        </xsl:for-each>
                    </table>
                </div>
                <div>
                    <h3>Statystyki:</h3>
                    <table>
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <th>Autor</th>
                                        <th>Ilość książek</th>
                                    </tr>
                                    <xsl:for-each select="/clientReport/statistics/bookCountsPerAuthor/authorsBookCount">
                                        <tr>
                                            <xsl:for-each select="*">
                                                <td>
                                                    <xsl:value-of select="." />
                                                </td>
                                            </xsl:for-each>
                                        </tr>
                                    </xsl:for-each>
                                    <tr>
                                        <td><b>Łącznie</b></td>
                                        <td><b><xsl:value-of select="/clientReport/statistics/overallBookCount"/></b></td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            Średnia liczba stron:
                                        </td>
                                        <td>
                                            <xsl:value-of select="/clientReport/statistics/averagePageCount" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Średnia cena:
                                        </td>
                                        <td>
                                            <xsl:value-of select="/clientReport/statistics/averagePrice" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Najczęstszy gatunek:
                                        </td>
                                        <td>
                                            <xsl:value-of select="/clientReport/statistics/mostCommonGenre" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Najczęstszy rodzaj okładki:
                                        </td>
                                        <td>
                                            <xsl:value-of select="/clientReport/statistics/mostCommonCoverType" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </body>

        </html>
    </xsl:template>

</xsl:stylesheet>
        <!-- /////////////////////////////////////////////////////////////////////////////////////////// -->