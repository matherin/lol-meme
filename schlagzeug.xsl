<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
<html>
<body>
<h1><xsl:value-of select="document/title"/></h1>
<h2><xsl:value-of select="document/textel/subheading"/></h2>
<img src="C:\xampp\htdocs\praktikum\eDrums.jpg"/>
<p><xsl:value-of select="document/textel/paragraph[2]"/></p>
<p><xsl:value-of select="document/textel/paragraph[3]"/></p>
<h2><xsl:value-of select="document/textel/subheading[2]"/></h2>
<p><xsl:value-of select="document/textel/paragraph[4]"/></p>
<table border="1">
<tr bgcolor="#80ced6">
	<th><xsl:value-of select="document/textel/table/body/row/headcell[1]"/></th>
	<th><xsl:value-of select="document/textel/table/body/row/headcell[2]"/></th>
</tr>
<xsl:for-each select="document/textel/table/body/row">
<tr>
<td><xsl:value-of select="cell[1]"/></td>
<td><xsl:value-of select="cell[2]"/></td>
</tr>
</xsl:for-each>
</table>	
</body>
</html>
</xsl:template>
</xsl:stylesheet>