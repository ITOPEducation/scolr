<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns="http://apiscol.crdp.ac-versailles.fr/2016" xmlns:apiscol="http://apiscol.crdp.ac-versailles.fr/2016"
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:skos="http://www.w3.org/2004/02/skos/core#">
	<xsl:output method="text" omit-xml-declaration="yes" indent="no" />
	<xsl:template match="/">

		<xsl:call-template name="loop">
			<xsl:with-param name="count" select="1" />
		</xsl:call-template>

	</xsl:template>
	<xsl:template name="loop">
		<xsl:param name="count" />
		<xsl:call-template name="findvocablist">
			<xsl:with-param name="number" select="format-number($count, '000')" />
		</xsl:call-template>
		<xsl:if test="$count &lt; 100">
			<xsl:call-template name="loop">
				<xsl:with-param name="count" select="$count + 1" />
			</xsl:call-template>


		</xsl:if>
	</xsl:template>
	<xsl:template name="findvocablist">
		<xsl:param name="number"></xsl:param>
		<xsl:variable name="vocaburi"
			select="concat('http://data.education.fr/voc/scolomfr/scolomfr-voc-',$number)">
		</xsl:variable>
		<xsl:for-each
			select="//rdf:RDF/rdf:Description[@rdf:about=$vocaburi]/skos:member">
			<xsl:variable name="termuri" select="@rdf:resource">
			</xsl:variable>
			<xsl:call-template name="findterm">
				<xsl:with-param name="termuri" select="$termuri" />
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="findterm">
		<xsl:param name="termuri"></xsl:param>
		<xsl:variable name="preflabel"
			select="//rdf:RDF/rdf:Description[@rdf:about=$termuri]/skos:prefLabel" />
		<xsl:value-of select="$termuri" />
		<xsl:text disable-output-escaping="yes">=&gt;</xsl:text>
		<xsl:value-of select="$preflabel">
		</xsl:value-of>
		<xsl:for-each
			select="//rdf:RDF/rdf:Description[@rdf:about=$termuri]/skos:altLabel">
			<xsl:text>,</xsl:text>
			<xsl:value-of select=".">
			</xsl:value-of>

		</xsl:for-each>
		<xsl:text disable-output-escaping="yes">&#xA;</xsl:text>

	</xsl:template>
</xsl:stylesheet>