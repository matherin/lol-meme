<?xml version="1.0"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/collection">
        <html>
            <head>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
            </head>
                <body>
                    <div class="container">
                        <div class="row">
                            <div class="col-6">
                                <h2>
                                    <xsl:value-of select="head"/>
                                </h2>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-2">
                                <h3>CDs by title</h3>
                            <xsl:for-each select="cover">
                                <a href=""><xsl:value-of select="title"/></a><br />
                            </xsl:for-each>

                            </div>
                            <div class="col-6">
                            <table>
                            <xsl:for-each select="cds/cd">
                                <tr>
                                    <td>
                                        <xsl:for-each select="cover">
                                            <img src="{@href}" width="100px" />
                                        </xsl:for-each>
                                    </td>
                                    <td>
                                        <h5><xsl:value-of select="title"/></h5>
                                        <h6><xsl:value-of select="artist"/></h6>
                                        <ul>
                                            <xsl:for-each select="songs/song">
                                                <li><xsl:value-of select="title"/></li>
                                            </xsl:for-each>
                                        </ul>
                                    </td>
                                </tr>
                            </xsl:for-each>
                            </table>
                            </div>
                        </div>
                    </div>

                </body>
            </html>
        </xsl:template>
    </xsl:stylesheet>