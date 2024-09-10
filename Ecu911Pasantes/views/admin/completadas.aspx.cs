using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecu911Pasantes.views.admin
{
    public partial class completadas : System.Web.UI.Page
    {
        private readonly DataClasses1DataContext dc = new DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarNumeroHoras();
            }
        }
        private void cargarNumeroHoras()
        {
            var query = dc.NumeroDeHoras();
            grvNumHoras.DataSource = query.ToList();
            grvNumHoras.DataBind();
        }
    }
}