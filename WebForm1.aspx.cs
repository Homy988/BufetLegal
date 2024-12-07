using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Xsl;
using System.Xml;

namespace BufetLegal
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        //declaro una variable goblal
        public string TipoMenu = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Label1.Text = "Hola desde CodeBehind";
            //recupero una variable que viene dentro de la URL, Para ello valido que exista
            //una variable llamada ID
            if (Request.QueryString["Id"] == null)
            {
                TipoMenu = "0";
            }
            else
            {
                TipoMenu = Request.QueryString["Id"];
            }
            TransformarXML();
        }
        //metodo para cargar y transformar xml usando XSLT
        private void TransformarXML()
        {
            //recupararde forma externa XML usando XSLT
            String xmpPhath = ConfigurationManager.AppSettings["FileServer"].ToString() +
                "XML/menu.xml";
            String xsltPhath = ConfigurationManager.AppSettings["FileServer"].ToString() +
                "XSLT/template.xslt";
            //Leer el XML 
            XmlTextReader xmlTextReader = new XmlTextReader(xmpPhath);

            //Configuramos las credenciales  de nuestra maquina
            XmlUrlResolver xmlUrlResolver = new XmlUrlResolver();
            xmlUrlResolver.Credentials = CredentialCache.DefaultCredentials;

            //Crear las configuraciones para poder acceder al xslt
            //los parametros true sirven para
            //1.- tratar el xslt como documento que puede ser transformado
            //2.- permitir la ejecucion de bloque de codigo Js como resultado de la transformacion
            XsltSettings settings = new XsltSettings(true, true);

            XslCompiledTransform xslt = new XslCompiledTransform();
            xslt.Load(xsltPhath, settings, xmlUrlResolver);

            //creamos un substring para almacenar el resultado de la transformacion
            StringBuilder stringBuilder = new StringBuilder();
            TextWriter textwriter = new StringWriter(stringBuilder);

            //Configuramos los argumentos para la transformacion
            XsltArgumentList xsltArgumentList = new XsltArgumentList();

            //Transformamos el xml 0> html usando xslt
            xsltArgumentList.AddParam("TipoMenu", "", TipoMenu);
            xslt.Transform(xmlTextReader, xsltArgumentList, textwriter);

            //Obtenemos el resultado de la transformacion ceomo 1 sola cadema
            string resultado = stringBuilder.ToString();

            //Escribimos el resultado como una respuesta HTTP
            Response.Write(resultado);
        }
    }
}