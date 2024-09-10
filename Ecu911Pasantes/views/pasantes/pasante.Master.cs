using CapaDatos;
using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecu911Pasantes.views.pasantes
{
    public partial class pasante : System.Web.UI.MasterPage
    {
        private Tbl_Pasantes pasantes = new Tbl_Pasantes();
        private Tbl_Labores labores = new Tbl_Labores();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {               
                if (Session["Pasante"] != null)
                {
                    string usulogeado = Session["Pasante"].ToString();
                    string pasNom = Session["nombre"].ToString();
                    string pasApe = Session["apellido"].ToString();
                    string pasRol = Session["rol"].ToString();
                    lblNombre.Text = pasNom + " " + pasApe;

                    int codigo = Convert.ToInt32(usulogeado);
                    pasantes = cnPasantes.obtenerPasantesxSession(codigo);
                    int idPasante = Convert.ToInt32(pasantes.Pasantes_id);
                    bool certificado = cnLabores.autentificarxPasante(idPasante);
                    if (certificado)
                    {
                        lnbAutorizar.Visible = true;
                    }
                    //lblRol.Text = pasRol;
                }
                else
                {
                    Response.Redirect("../../autentificación/index.aspx");
                }
            }
        }

        protected void lnbLogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("../../autentificación/index.aspx");
        }
    }
}