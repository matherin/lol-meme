<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:variable name="counter" select="1"/>
<xsl:template match="/">
<html>
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<style>
body {
  font-family: "Lato", sans-serif;
}

.sidenav {
  height: 100%;
  width: 250px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  padding-top: 20px;
}

.sidenav a {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.main {
  margin-left: 250px; /* Same as the width of the sidenav */
  font-size: 18px; /* Increased text to enable scrolling */
  padding: 0px 10px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>
</head>
<body>

	<!-- Sidebar -->
	<div class="sidenav">
			<a href="#"><h3><xsl:value-of select="document/title"/></h3></a>
			<xsl:for-each select="document/textel/subheading">
				<xsl:variable name="position" select="."/>				
				<a href="#{$position}"><h5><xsl:value-of select="."/></h5></a>
			</xsl:for-each>
	</div>

	<div class="main">
		<h1 class="display-3"><xsl:value-of select="document/title"/></h1>
		<xsl:for-each select="document">
			<xsl:apply-templates select="textel" />
		</xsl:for-each>
	</div>

<!--
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
</table>	-->

</body>
</html>
</xsl:template>

<!-- Textel -->
<xsl:template match="textel">
<div class="row">
	<div class="col-8">
	<xsl:for-each select="*">
		<xsl:apply-templates select="." /> <!-- weist ein template zu (s.u.) das den namen des elemntes hat (paragraph, table, etc.)-->
  	</xsl:for-each>  
	</div>
</div>
</xsl:template>

<!-- Subheading -->
<xsl:template match="subheading">
<xsl:variable name="position" select="."/>
<h2 id="{$position}"><xsl:value-of select="."/></h2> 
</xsl:template>

<!-- Absatz -->
<xsl:template match="paragraph">
	<!--<xsl:apply-template select="*" />-->
	<xsl:choose>
		<xsl:when test="image">
			<xsl:apply-templates select="image"/>
		</xsl:when>
		<xsl:otherwise>
			<p>
				<xsl:value-of select="."/>
			</p>
		</xsl:otherwise>
	</xsl:choose>
	<!--<xsl:if test="image">
		<xsl:apply-templates select="image"/>
	</xsl:if>
	<p>
		<xsl:value-of select="."/>
	</p>-->
</xsl:template>

<!-- Bild -->
<xsl:template match="image">
	<xsl:variable name="title" select="./@subtitle"/>
	<img src="C:\xampp\htdocs\praktikum\{$title}.jpg"/>
</xsl:template>

<!-- Tabelle -->
<xsl:template match="table">
<table  class="table" border="1">
	<xsl:for-each select="*">
	<!-- Dummy Ausgabe: body -->
		<xsl:apply-templates select="." />
  	</xsl:for-each>  
</table>
</xsl:template>

<!-- Container ohne inhalt, geben alles ans subtemplate weiter -->
<xsl:template match="body">
	<xsl:for-each select="*">
		<!-- Dummy Ausgabe: row -->
		<xsl:apply-templates select="." />

  	</xsl:for-each>  

</xsl:template>

<!-- table row -->
<xsl:template match="row">
	<xsl:if test="headcell">
		<thead class="thead-dark">
			<xsl:for-each select="./headcell">
			<th><xsl:value-of select="."/></th>
			</xsl:for-each>
		</thead>
	</xsl:if>
	<tbody>
		<tr>
			<xsl:for-each select="./cell">		
				<td><xsl:value-of select="."/></td>
			</xsl:for-each>  
		</tr>
	</tbody>
</xsl:template>

<!-- Liste -->
<xsl:template match="list">
	<xsl:for-each select="*">
	<!-- Dummy Ausgabe: Welche Elemente erhalte ich in diesem Element -->
		<br/><b><xsl:value-of select="name(.)"/></b><br/>
		<xsl:apply-templates select="." />
  	</xsl:for-each>  
</xsl:template>

</xsl:stylesheet>