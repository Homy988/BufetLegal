<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>

	<!--Creamos una variable que reciba un parametro desde el procesador
	la propiedad "name" establece el nombre de la variable
	la propiedad select establece el origen del dato de la variable-->
	<xsl:param name="TipoMenu" select="TipoMenu"></xsl:param>
	<!--Mi template Principal
	La idea es recrear el comportamiento de una "pagina maestra" donde la pagina principal carga los elementos
	que son "constantes" en el resto del sitio-->

	<xsl:template match="Menu">
		<html>
			<body>
				<!-- ======= Choose Section ======= -->
				<xsl:choose>
					<xsl:when test="$TipoMenu = 0">
						<xsl:call-template name="Home"></xsl:call-template>
					</xsl:when>
					<xsl:when test="$TipoMenu = 1">
						<xsl:call-template name="Carta"></xsl:call-template>
					</xsl:when>
					<xsl:when test="$TipoMenu = 2">
						<xsl:call-template name="Contacto"></xsl:call-template>
					</xsl:when>
					<xsl:when test="$TipoMenu = 3">
						<xsl:call-template name="PlayRomm"></xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="Home"></xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
				<!-- End Choose -->
			</body>
		</html>
	</xsl:template>

	<!--Templeate adicionales-->
	<!--Son "microtempleates que contienen estructura y contenido en funcion de la pagina/segmento que se desea mostrar-->
	<xsl:template name="Home">
		<h1>Home</h1>
	</xsl:template>
	<xsl:template name="Carta">
		<h1>Carta</h1>
	</xsl:template>
	<xsl:template name="Contacto">
		<h1>Cintacto</h1>
	</xsl:template>
	<xsl:template name="PlayRomm">
		<h1>PlayRomm</h1>
	</xsl:template>
	
</xsl:stylesheet>
