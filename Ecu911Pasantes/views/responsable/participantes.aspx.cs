using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecu911Pasantes.views.responsable
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
                        join v in dc.Tbl_Universidad on p.Uni_id equals v.Uni_id
                        select new
                        {
                            u.PrimerApellido,
                            u.PrimerNombre,
                            p.Uni_id,
                            pr.Nombre,
                            pr.Descripcion,
                            v.Uni_nombre
                        };

            var orderedQuery = query.ToList().OrderBy(x => x.Uni_nombre);

            grvParticipantes.DataSource = orderedQuery.ToList();
            grvParticipantes.DataBind();
        }
    }
}