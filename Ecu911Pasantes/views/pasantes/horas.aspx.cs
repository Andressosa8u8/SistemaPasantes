using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecu911Pasantes.views.pasantes
{
    public partial class horas : System.Web.UI.Page
    {
        private DataClasses1DataContext dc = new DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarNumeroHoras();
            }
        }
        private void cargarNumeroHoras()
        {
            string usulogeado = Session["Pasante"].ToString();
            var query = dc.NumeroDeHorasPasantes(Convert.ToInt32(usulogeado));
            grvNumHoras.DataSource = query.ToList();
            grvNumHoras.DataBind();
        }

        protected void lnbAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/views/pasantes/hora.aspx");
        }
    }
}