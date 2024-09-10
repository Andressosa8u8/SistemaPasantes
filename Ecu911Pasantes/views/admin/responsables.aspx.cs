using CapaDatos;
using System;
using System.Web.UI.WebControls;
using CapaNegocio;
using System.Web.UI;

namespace Ecu911Pasantes.views.admin
{
    public partial class responsables : System.Web.UI.Page
    {
        private readonly DataClasses1DataContext dc = new DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarResponsables();
            }
        }

        private void cargarResponsables()
        {
            var listaRes = dc.UsuariosyResponsables();
            if (listaRes != null)
            {
                grvResponsables.DataSource = listaRes;
                grvResponsables.DataBind();
            }
        }

        protected void grvResponsables_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int codigo = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "Editar")
            {
                Response.Redirect("~/views/admin/responsable.aspx?cod=" + codigo, true);
            }
            else if (e.CommandName == "Detalles")
            {
                Response.Redirect("~/views/admin/detalleResponsable.aspx?cod=" + codigo, true);
            }
            else if (e.CommandName == "Eliminar")
            {
                Tbl_Responsable respe = new Tbl_Responsable();
                Tbl_Usuarios usupe = new Tbl_Usuarios();
                usupe = cnUsuarios.obtenerUsuariosxId(codigo);
                int usu = Convert.ToInt32(usupe.Usu_id.ToString());
                respe = cnResponsables.obtenerResponsablesxUsuario(usu);
                if (usupe != null)
                {
                    cnUsuarios.delete(usupe);
                    if (respe != null)
                    {
                        cnResponsables.delete(respe);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Éxito!', 'Datos eliminados con éxito.', 'success')", true);
                        cargarResponsables();
                    }
                }
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/views/admin/responsable.aspx");
        }

        protected void grvResponsables_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string estado = DataBinder.Eval(e.Row.DataItem, "Estado").ToString();

                if (estado == "A")
                {
                    e.Row.Cells[5].CssClass = "badge bg-success text-white";
                    e.Row.Cells[5].Text = "Activo";
                }
                else
                {
                    e.Row.Cells[5].CssClass = "badge bg-danger text-white";
                    e.Row.Cells[5].Text = "Inactivo";
                    e.Row.Cells[7].Enabled = false;
                }
            }
        }
    }
}