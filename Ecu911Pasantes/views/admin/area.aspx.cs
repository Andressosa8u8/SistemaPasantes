using CapaDatos;
using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecu911Pasantes.views.admin
{
    public partial class area : System.Web.UI.Page
    {
        private DataClasses1DataContext dc = new DataClasses1DataContext();
        private Tbl_Area areainfo = new Tbl_Area();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["cod"] != null)
                {
                    int codigo = Convert.ToInt32(Request["cod"]);
                    Tbl_Area areainfo = cnArea.obtenerAreasxId(codigo);

                    if (areainfo != null)
                    {
                        txtNombre.Text = areainfo.Area_nombre.ToString();
                        ddlEstado.SelectedValue = areainfo.Area_estado.ToString();
                    }
                }

            }
            Timer1.Enabled = false;
        }

        private void Guardar()
        {
            try
            {
                Tbl_Area areainfo = new Tbl_Area();
                areainfo.Area_nombre = txtNombre.Text;
                areainfo.Area_estado = Convert.ToChar(ddlEstado.SelectedValue);

                cnArea.save(areainfo);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Éxito!', 'Datos guardados con éxito.', 'success')", true);
                Timer1.Enabled = true;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'No se pudo guardar los datos" + ex.Message + " intentelo de nuevo.', 'error')", true);
            }
        }

        private void Modificar(Tbl_Area areainfo)
        {
            try
            {
                areainfo.Area_nombre = txtNombre.Text;
                areainfo.Area_estado = Convert.ToChar(ddlEstado.SelectedValue);

                cnArea.modify(areainfo);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Éxito!', 'Datos modificados con éxito.', 'success')", true);
                Timer1.Enabled = true;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error', '" + ex.Message + "', 'error')", true);
            }
        }

        private void guardar_modificar_datos(int id)
        {
            if (id == 0)
            {
                Guardar();
            }
            else
            {
                areainfo = cnArea.obtenerAreasxId(id);
                Modificar(areainfo);
            }
        }

        protected void txtNombre_TextChanged(object sender, EventArgs e)
        {
            if (txtNombre.Text != "")
            {
                bool existe = cnArea.autentificarxNomArea(txtNombre.Text);
                if (existe)
                {
                    _ = new cnArea();
                    Tbl_Area resp = cnArea.obtenerAreaxNomArea(txtNombre.Text);
                    if (resp != null)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'Ese nombre de usuario ya se encuentra registrado', 'error')", true);
                    }
                }
            }
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/views/admin/areas.aspx");
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            guardar_modificar_datos(Convert.ToInt32(Request["cod"]));
        }
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Response.Redirect("~/views/admin/areas.aspx");
        }
    }
}