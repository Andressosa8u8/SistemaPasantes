using CapaDatos;
using CapaNegocio;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecu911Pasantes.views.admin
{
    public partial class pasantes : System.Web.UI.Page
    {
        private readonly DataClasses1DataContext dc = new DataClasses1DataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //if (Session["Mensaje"] != null && Session["Estado"] != null && Session["Icono"] != null)
                //{
                //    var Mensaje = Session["Mensaje"];
                //    var Estado = Session["Estado"];
                //    var Icono = Session["Icono"];

                //    ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('"+Estado+"', '"+Mensaje+"', '"+Icono+"')", true);
                //}
                cargarPasantes();
            }
        }
        private void cargarPasantes()
        {
            var listaPas = dc.UsuariosyPasantes();
            if (listaPas != null)
            {
                grvPasantes.DataSource = listaPas;
                grvPasantes.DataBind();
            }
        }

        protected void lnbAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/views/admin/pasante.aspx");
        }

        protected void grvPasantes_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            int codigo = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "Editar")
            {
                Response.Redirect("~/views/admin/pasante.aspx?cod=" + codigo, true);
            }
            else if (e.CommandName == "Detalles")
            {
                Response.Redirect("~/views/admin/detallePasante.aspx?cod=" + codigo, true);
            }
            else if (e.CommandName == "Eliminar")
            {
                Tbl_Pasantes pasape = new Tbl_Pasantes();
                Tbl_Usuarios usupe = new Tbl_Usuarios();
                usupe = cnUsuarios.obtenerUsuariosxId(codigo);
                int usu = Convert.ToInt32(usupe.Usu_id.ToString());
                pasape = cnPasantes.obtenerPasantesxUsuario(usu);
                if (usupe != null)
                {
                    cnUsuarios.delete(usupe);
                    if (pasape != null)
                    {
                        cnPasantes.delete(pasape);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Éxito!', 'Datos eliminados con éxito.', 'success')", true);
                        cargarPasantes();
                    }
                }
            }
        }

        protected void grvPasantes_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string estado = DataBinder.Eval(e.Row.DataItem, "Estado").ToString();


                if (estado == "A")
                {
                    e.Row.Cells[4].CssClass = "badge bg-success text-white";
                    e.Row.Cells[4].Text = "Activo";
                }
                else if (estado == "P")
                {
                    e.Row.Cells[4].CssClass = "badge bg-warning text-white";
                    e.Row.Cells[4].Text = "Pendiente";
                }
                else
                {
                    e.Row.Cells[4].CssClass = "badge bg-danger text-white";
                    e.Row.Cells[4].Text = "Inactivo";
                }
            }
        }
    }
}