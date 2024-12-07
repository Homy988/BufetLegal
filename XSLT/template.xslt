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
		<!--INicio de la plantilla-->
		<html lang="zxx" class="no-js">
			<head>
				<!-- Mobile Specific Meta -->
				<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"></meta>
				<!-- Favicon-->
				<link rel="shortcut icon" href="img/fav.png"></link>
				<!-- Author Meta -->
				<meta name="author" content="codepixer"></meta>
				<!-- Meta Description -->
				<meta name="description" content=""></meta>
				<!-- Meta Keyword -->
				<meta name="keywords" content=""></meta>
				<!-- meta character set -->
				<meta charset="UTF-8"></meta>
				<!-- Site Title -->
				<title>Watch</title>

				<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"></link>
				<!--
			CSS
			============================================= -->
				<link rel="stylesheet" href="css/linearicons.css"></link>
				<link rel="stylesheet" href="css/font-awesome.min.css"></link>
				<link rel="stylesheet" href="css/bootstrap.css"></link>
				<link rel="stylesheet" href="css/magnific-popup.css"></link>
				<link rel="stylesheet" href="css/nice-select.css"></link>
				<link rel="stylesheet" href="css/animate.min.css"></link>
				<link rel="stylesheet" href="css/owl.carousel.css"></link>
				<link rel="stylesheet" href="css/main.css"></link>
			</head>
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

				<script src="js/vendor/jquery-2.2.4.min.js"></script>
				<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
				<script src="js/vendor/bootstrap.min.js"></script>
				<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
				<script src="js/easing.min.js"></script>
				<script src="js/hoverIntent.js"></script>
				<script src="js/superfish.min.js"></script>
				<script src="js/jquery.ajaxchimp.min.js"></script>
				<script src="js/jquery.magnific-popup.min.js"></script>
				<script src="js/owl.carousel.min.js"></script>
				<script src="js/jquery.sticky.js"></script>
				<script src="js/jquery.nice-select.min.js"></script>
				<script src="js/parallax.min.js"></script>
				<script src="js/mail-script.js"></script>
				<script src="js/main.js"></script>
			</body>
		</html>
		<!--Fin de la plantilla-->
	</xsl:template>

	<!--Templeate adicionales-->
	<!--Son "microtempleates que contienen estructura y contenido en funcion de la pagina/segmento que se desea mostrar-->
	<xsl:template name="Home">
		<h1>Hola desde xslt home</h1>
	</xsl:template>
	<xsl:template name="Carta">
		<h1>Hola desde xslt carta</h1>
	</xsl:template>
	<xsl:template name="Contacto">
		<h1>Hola desde xslt Contacto</h1>
	</xsl:template>
	<xsl:template name="PlayRomm">
		<h1>Hola desde xslt PlayRomm</h1>
	</xsl:template>
</xsl:stylesheet>
