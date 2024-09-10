using CapaDatos;
using CapaNegocio;
using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecu911Pasantes.views.admin
{
    public partial class proyectos : System.Web.UI.Page
    {
        private DataClasses1DataContext dc = new DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarProyectos();
            }
        }

        private void cargarProyectos()
        {
            var listaPro = dc.Proyectos();
            if (listaPro != null)
            {
                grvProyectos.DataSource = listaPro.ToList();
                grvProyectos.DataBind();
            }
        }

        protected void lnbAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/views/admin/proyecto.aspx");
        }

        protected void grvProyectos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int codigo = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "Editar")
            {
                Response.Redirect("~/views/admin/proyecto.aspx?cod=" + codigo, true);
            }
            else if (e.CommandName == "Eliminar")
            {
                Tbl_Proyecto prope = new Tbl_Proyecto();
                prope = cnProyectos.obtenerProyectosxId(codigo);
                if (prope != null)
                {
                    cnProyectos.delete(prope);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Éxito!', 'Datos eliminados con éxito.', 'success')", true);
                    cargarProyectos();
                }
            }
        }
    }
}