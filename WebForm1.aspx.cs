using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Net;
using System.Xml.Xsl;
using System.Text;
using System.IO;
using System.Configuration;

namespace proyectoExamen
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public string templateHome = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Id"] == null)
            {
                templateHome = "0";
            }
            else
            {
                templateHome = Request.QueryString["Id"];
            }

            TransformarXML();
        }

        private void TransformarXML()
        {
            //recuperamos las rutas de nuestros XML y XSLT
            string xmlPath = ConfigurationManager.AppSettings["FileServer"].ToString() + "xml/datos.xml";
            string xsltPath = ConfigurationManager.AppSettings["FileServer"].ToString() + "xslt/template.xslt";

            //leer el archivo XML (importamos "using System.xlm")
            XmlTextReader xmlTextReader = new XmlTextReader(xmlPath);

            //configuramos las credenciales para resolver recursos externos como el XSLT
            XmlUrlResolver xmlUrlResolver = new XmlUrlResolver();
            xmlUrlResolver.Credentials = CredentialCache.DefaultCredentials;

            //crear las configuraciones para poder acceder al XSLT
            //los parametros "true" sirven para
            //1.  Tratar el XSLT como documento que puede ser transformado
            //2. Permitir la ejecucion de bloques de codigo JS como resultado de la transformacion

            XsltSettings settings = new XsltSettings(true, true);
            XslCompiledTransform xslt = new XslCompiledTransform();
            xslt.Load(xsltPath, settings, xmlUrlResolver);

            //creamos un StringBuilder para almacenar el resultado de la transformacion
            StringBuilder stringBuilder = new StringBuilder();
            TextWriter textWriter = new StringWriter(stringBuilder);

            //configuramos los argumentos par la transformacion
            XsltArgumentList xsltArgumentList = new XsltArgumentList();
            xsltArgumentList.AddParam("templateHome", "", templateHome);

            //transformamos el XML => HTML usando XSLT
            xslt.Transform(xmlTextReader, xsltArgumentList, textWriter);

            //obtenemos el resultado de la transformacion como 1 sola cadena
            string resultado = stringBuilder.ToString();

            //escribimos el resultado como una respuesta HTTP
            Response.Write(resultado);
        }
    }
}