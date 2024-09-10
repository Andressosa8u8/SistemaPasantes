using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaNegocio;

namespace Ecu911Pasantes.views.admin
{
    public partial class horas : System.Web.UI.Page
    {
        private DataClasses1DataContext dc = new DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarHoras();
            }
        }

        private void cargarHoras()
        {
            var listaHoras = dc.Horas();
            if (listaHoras != null)
            {
                grvHoras.DataSource = listaHoras.ToList();
                grvHoras.DataBind();
            }
        }

        protected void lnbAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/views/admin/hora.aspx");
        }

        protected void grvHoras_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int codigo = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "Editar")
            {
                Response.Redirect("~/views/admin/hora.aspx?cod=" + codigo, true);
            }
            else if (e.CommandName == "Eliminar")
            {
                Tbl_Horas horpe = new Tbl_Horas();
                horpe = cnHoras.obtenerHorasxId(codigo);
                if (horpe != null)
                {
                    cnHoras.delete(horpe);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Éxito!', 'Datos eliminados con éxito.', 'success')", true);
                    cargarHoras();
                }
            }
            else if (e.CommandName == "Actualizar")
            {
                Tbl_Horas hores = new Tbl_Horas();
                hores = cnHoras.obtenerHorasxId(codigo);
                if (hores != null)
                {
                    cnHoras.status(hores);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Éxito!', 'Datos Actualizados con éxito.', 'success')", true);
                    cargarHoras();
                }
            }
        }
    }
}