using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecu911Pasantes.views.admin
{
    public partial class participantes : System.Web.UI.Page
    {
        private DataClasses1DataContext dc = new DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarParticipantes();
            }
        }
        private void cargarParticipantes()
        {
            var query = from p in dc.Tbl_Pasantes
                        join l in dc.Tbl_Labores on p.Pasantes_id equals l.Pasantes_id
                        join pr in dc.Tbl_Proyecto on l.Proyecto_id equals pr.Proyecto_id
                        join u in dc.Tbl_Usuarios on p.Usu_id equals u.Usu_id
                        orderby p.Universidad
                        select new
                        {
                            u.PrimerApellido,
                            u.PrimerNombre,
                            p.Universidad,
                            pr.Nombre,
                            pr.Descripcion
                        };
            grvParticipantes.DataSource = query.ToList();
            grvParticipantes.DataBind();
        }
    }
}