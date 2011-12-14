<?xml  version="1.0"  encoding="UTF-8"?>
<xsl:stylesheet  version="1.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html" indent="yes" encoding="UTF-8" doctype-system="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-public="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" />
	
  <xsl:template match="/document">
  	<xsl:variable name="author" select="information/author" />
  	<xsl:variable name="created" select="Information/created" />
  	<xsl:variable name="language" select="Information/language" />
		<html>
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
				<meta http-equiv="Content-Language" content="{$language}"/>
				<meta name="Keywords" content=""/>
				<meta name="Description" content=""/>
				<meta name="Author" content="{$author}"/>
				<meta name="Generator" content="DiX - Document in XML"/>
				<link rel="stylesheet" type="text/css" href="style/screen.css" media="screen"/>
				<link rel="stylesheet" type="text/css" href="style/print.css" media="print"/>
				<title>
					<xsl:value-of select="information/title"/>
				</title>
			</head>
			<body>
				<div id="page">
					<h1><xsl:value-of select="information/title"/></h1>
					<xsl:if test="content/section">
						<ul id="navi">
							<xsl:for-each select="content/section">
								<xsl:call-template name="navi_section"/> 
							</xsl:for-each>
						</ul>
					</xsl:if>
					<div id="content">
						<xsl:apply-templates select="content"/> 
					</div>
					<ul id="footer">
						<xsl:if test="information/author">
							<li id="author">
								<xsl:value-of select="information/author"/>
							</li>
						</xsl:if>
						<xsl:if test="information/created">
							<li id="created">
								<xsl:value-of select="information/created"/>
							</li>
						</xsl:if>
						<li class="clear"></li>
					</ul>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template name="navi_section">
		<xsl:variable name="name" select="@name" />
		<li>
			<a href="#{$name}"><xsl:value-of select="@name"/></a>
			<xsl:if test="section">
				<ul>
					<xsl:for-each select="section">
						<xsl:call-template name="navi_section"/> 
					</xsl:for-each>
				</ul>
			</xsl:if>
		</li>
	</xsl:template>

	<xsl:template match="section">
		<xsl:variable name="name" select="@name" />
		<div class="section">
			<a name="{$name}"></a><h2><xsl:value-of select="@name"/></h2>
			<xsl:apply-templates/> 
		</div>
	</xsl:template>

	<xsl:template match="paragraph">
		<p><xsl:value-of select="."/></p>
	</xsl:template>

	<xsl:template match="image">
		<xsl:variable name="file" select="file" />
		<div class="image">
			<img src="{$file}" />
			<p><xsl:value-of select="description"/></p>
		</div>
	</xsl:template>

	<xsl:template match="code">
		<code>
			<xsl:value-of select="."/>
		</code>
	</xsl:template>
</xsl:stylesheet>
