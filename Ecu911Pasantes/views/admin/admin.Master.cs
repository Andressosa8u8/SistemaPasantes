using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecu911Pasantes.views.admin
{
    public partial class admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Admin"] != null)
                {
                    string usulogeado = Session["Admin"].ToString();
                    string resNom = Session["nombre"].ToString();
                    string resApe = Session["apellido"].ToString();
                    string resRol = Session["rol"].ToString();
                    lblNombre.Text = resNom + " " + resApe;
                    //lblRol.Text = resRol;
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