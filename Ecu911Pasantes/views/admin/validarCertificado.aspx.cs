using CapaDatos;
using CapaNegocio;
using HtmlAgilityPack;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecu911Pasantes.views.admin
{
    public partial class validarCertificado : System.Web.UI.Page
    {
        private readonly DataClasses1DataContext dc = new DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarHorasCulminadas();
            }
        }

        private void CargarHorasCulminadas()
        {
            var lista = dc.HorasCulminadas();
            grvCertificados.DataSource = lista;
            grvCertificados.DataBind();
        }

        protected void grvCertificados_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int codigo = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "Autorizar")
            {
                Tbl_Labores labores = new Tbl_Labores();
                labores = cnLabores.obtenerLaboresxId(codigo);
                if (labores != null)
                {
                    cnLabores.authorize(labores);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Éxito!', 'Certificado autorizado con existo.', 'success')", true);
                    CargarHorasCulminadas();
                }
            }
            else if (e.CommandName == "Descargar")
            {
                var certificado = dc.Certificado(codigo);
                foreach (var item in certificado)
                {
                    string nombres = item.Nombres;
                    string cedula = item.Cedula;
                    string carrera = item.Carrera;
                    string proyecto = item.Nombre;
                    string universidad = item.Universidad;
                    int horas = Convert.ToInt32(item.Nhoras);
                    string codigoecu = item.CodigoEcu;

                    HtmlNode.ElementsFlags["img"] = HtmlElementFlag.Closed;
                    HtmlNode.ElementsFlags["br"] = HtmlElementFlag.Closed;
                    Document pdfDoc = new Document(PageSize.A4, 41f, 41f, 41f, 41f);
                    PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                    BaseFont fuente = BaseFont.CreateFont(BaseFont.TIMES_ROMAN, BaseFont.CP1252, true);
                    Font titulo = new Font(fuente, 14f, Font.BOLD, new BaseColor(0, 0, 0));
                    BaseFont fuente2 = BaseFont.CreateFont(BaseFont.TIMES_ROMAN, BaseFont.CP1252, true);
                    Font parrafo = new Font(fuente2, 12f, Font.NORMAL, new BaseColor(0, 0, 0));
                    BaseFont fuente3 = BaseFont.CreateFont(BaseFont.TIMES_ROMAN, BaseFont.CP1252, true);
                    Font cuadro = new Font(fuente3, 10f, Font.NORMAL, new BaseColor(0, 0, 0));

                    pdfDoc.Open();
                    string imageURL = Server.MapPath("../../resources/vendors/images") + "/Bandera.PNG";
                    iTextSharp.text.Image bandera = iTextSharp.text.Image.GetInstance(imageURL);
                    bandera.ScaleAbsolute(510, 50);
                    pdfDoc.Add(bandera);
                    pdfDoc.Add(new Chunk(Chunk.NEWLINE));
                    pdfDoc.Add(new Paragraph("Quito, " + DateTime.Now.ToString("dd 'de' MMMM 'del' yyyy "), parrafo) { Alignment = Element.ALIGN_RIGHT });
                    pdfDoc.Add(new Chunk(Chunk.NEWLINE));
                    pdfDoc.Add(new Chunk(Chunk.NEWLINE));
                    pdfDoc.Add(new Paragraph("CERTIFICADO", titulo) { Alignment = Element.ALIGN_CENTER });
                    pdfDoc.Add(new Chunk(Chunk.NEWLINE));
                    pdfDoc.Add(new Paragraph("El Servicio Integrado de Seguridad ECU 911 entrega el presente Certificado a "
                        + nombres + "con cédula de identidad " + cedula + "estudiante de " + carrera + "de el/la "
                        + universidad + ", por haber formado parte del Proyecto Académico " + proyecto + " con una duración de "
                        + horas + "horas, a partir del False al " + DateTime.Now.ToString("dd 'de' MMMM 'del' yyyy "), parrafo)
                    { Alignment = Element.ALIGN_JUSTIFIED });
                    pdfDoc.Add(new Chunk(Chunk.NEWLINE));
                    pdfDoc.Add(new Paragraph("Durante este periodo demostró su colaboración y responsabilidad en lo encomendado.", parrafo) { Alignment = Element.ALIGN_JUSTIFIED });
                    pdfDoc.Add(new Chunk(Chunk.NEWLINE));
                    pdfDoc.Add(new Paragraph("Es todo cuanto se puede declarar en honor a la verdad. El interesado puede hacer uso del presente certificado para los fines pertinentes.", parrafo) { Alignment = Element.ALIGN_JUSTIFIED });
                    pdfDoc.Add(new Chunk(Chunk.NEWLINE));
                    pdfDoc.Add(new Paragraph("Se expide el presente certificado para los fines pertinentes.", parrafo) { Alignment = Element.ALIGN_JUSTIFIED });
                    pdfDoc.Add(new Chunk(Chunk.NEWLINE));
                    pdfDoc.Add(new Paragraph("Atentamente,", parrafo) { Alignment = Element.ALIGN_JUSTIFIED });
                    string imageURL1 = Server.MapPath("../../resources/vendors/images") + "/firmas.png";
                    iTextSharp.text.Image firmas = iTextSharp.text.Image.GetInstance(imageURL1);
                    firmas.ScaleAbsolute(520, 150);
                    pdfDoc.Add(firmas);
                    pdfDoc.Add(new Chunk(Chunk.NEWLINE));
                    var tbl = new PdfPTable(new float[] { 50f }) { WidthPercentage = 40, HorizontalAlignment = Element.ALIGN_RIGHT };
                    tbl.AddCell(new PdfPCell(new Paragraph("Dirección Nacional Académico para Emergencias Subdirección Técnica de Doctrina", cuadro)) { BorderColor = new BaseColor(0, 0, 0), BorderWidthBottom = 0, HorizontalAlignment = Element.ALIGN_CENTER });
                    tbl.AddCell(new PdfPCell(new Paragraph("Fecha: " + DateTime.Now.ToShortDateString(), cuadro)) { BorderWidthBottom = 0, BorderWidthTop = 0, HorizontalAlignment = Element.ALIGN_CENTER });
                    tbl.AddCell(new PdfPCell(new Paragraph(codigoecu, cuadro)) { BorderColor = new BaseColor(0, 0, 0), BorderWidthTop = 0, HorizontalAlignment = Element.ALIGN_CENTER });
                    pdfDoc.Add(tbl);
                    pdfDoc.Add(new Chunk(Chunk.NEWLINE));
                    string imageURL2 = Server.MapPath("../../resources/vendors/images") + "/footer.png";
                    iTextSharp.text.Image footer = iTextSharp.text.Image.GetInstance(imageURL2);
                    footer.ScaleAbsolute(520, 50);
                    footer.SetAbsolutePosition(41f, 41f);
                    pdfDoc.Add(footer);
                    pdfDoc.Close();
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "attachment;filename=Certificado_Finalizacion.pdf");
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.Write(pdfDoc);
                    Response.End();
                }
            }
        }
    }
}