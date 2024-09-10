using CapaDatos;
using CapaNegocio;
using System;
using System.Linq;
using System.Web.UI;

namespace Ecu911Pasantes.views.admin
{
    public partial class proyecto : System.Web.UI.Page
    {
        private Tbl_Proyecto proinfo = new Tbl_Proyecto();
        private DataClasses1DataContext dc = new DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["cod"] != null)
                {
                    int codigo = Convert.ToInt32(Request["cod"]);
                    proinfo = cnProyectos.obtenerProyectosxId(codigo);
                    

                    if (proinfo != null)
                    {
                        txtConcepto.Text = proinfo.Nombre.ToString();
                        txtDescripcion.Text = proinfo.Descripcion.ToString();
                        ddlResponsables.SelectedValue = proinfo.Resp_id.ToString();
                    }
                }
                cargarResponsables();
                Timer1.Enabled = false;
            }
        }

        private void cargarResponsables()
        {
            var listaresp = dc.Responsables();
            ddlResponsables.DataSource = listaresp.ToList();
            ddlResponsables.DataTextField = "Responsables";
            ddlResponsables.DataValueField = "Resp_id";
            ddlResponsables.DataBind();
        }
        private void guardar_modificar_datos(int id)
        {
            if (id == 0)
            {
                Guardar();
            }
            else
            {
                proinfo = cnProyectos.obtenerProyectosxId(id);
                if (proinfo != null)
                {
                    modifcar(proinfo);
                }
            }
        }
        private void modifcar(Tbl_Proyecto proinfo)
        {
            try
            {
                proinfo.Nombre = txtConcepto.Text;
                proinfo.Descripcion = txtDescripcion.Text;
                proinfo.Resp_id = Convert.ToInt32(ddlResponsables.SelectedValue);

                cnProyectos.modify(proinfo);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Éxito!', 'Datos modificados con éxito.', 'success')", true);
                Timer1.Enabled = true;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'No se puedo modificar los datos." + ex.Message + " intentelo de nuevo.', 'error')", true);
            }
        }
        private void Guardar()
        {
            try
            {
                proinfo = new Tbl_Proyecto();
                proinfo.Nombre = txtConcepto.Text;
                proinfo.Descripcion = txtDescripcion.Text;
                proinfo.Resp_id = Convert.ToInt32(ddlResponsables.SelectedValue);

                cnProyectos.save(proinfo);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Éxito!', 'Datos guardados con éxito.', 'success')", true);
                Timer1.Enabled = true;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'No se pudo guardar los datos" + ex.Message + " intentelo de nuevo.', 'error')", true);
            }
        }
        protected void lnbGuardar_Click(object sender, EventArgs e)
        {
            guardar_modificar_datos(Convert.ToInt32(Request["cod"]));
        }

        protected void lnbCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/views/admin/proyectos.aspx");
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Response.Redirect("~/views/admin/proyectos.aspx");
        }
    }
}