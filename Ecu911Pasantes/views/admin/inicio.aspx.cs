using CapaDatos;
using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace Ecu911Pasantes.views.admin
{
    public partial class inicio : System.Web.UI.Page
    {
        private DataClasses1DataContext dc = new DataClasses1DataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }

    }
}