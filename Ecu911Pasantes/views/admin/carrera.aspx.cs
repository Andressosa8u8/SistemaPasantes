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
    public partial class carrera : System.Web.UI.Page
    {
        private Tbl_Carrera carreinfo = new Tbl_Carrera();
        private DataClasses1DataContext dc = new DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["cod"] != null)
                {
                    int codigo = Convert.ToInt32(Request["cod"]);
                    carreinfo = cnCarrera.obtenerCarrerasxId(codigo);

                    if (carreinfo != null)
                    {
                        txtNombre.Text = carreinfo.Carre_nombre.ToString();
                        ddlEstado.SelectedValue = carreinfo.Carre_estado.ToString();
                    }
                }

            }
            Timer1.Enabled = false;

        }

        private void Guardar()
        {
            try
            {
                carreinfo = new Tbl_Carrera();
                carreinfo.Carre_nombre = txtNombre.Text;
                carreinfo.Carre_estado = Convert.ToChar(ddlEstado.SelectedValue);

                cnCarrera.save(carreinfo);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Éxito!', 'Datos guardados con éxito.', 'success')", true);
                Timer1.Enabled = true;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'No se pudo guardar los datos" + ex.Message + " intentelo de nuevo.', 'error')", true);
            }
        }

        private void Modificar(Tbl_Carrera carreinfo)
        {
            try
            {
                carreinfo.Carre_nombre = txtNombre.Text;
                carreinfo.Carre_estado = Convert.ToChar(ddlEstado.SelectedValue);

                cnCarrera.modify(carreinfo);
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
                carreinfo = cnCarrera.obtenerCarrerasxId(id);
                Modificar(carreinfo);
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Response.Redirect("~/views/admin/carreras.aspx");
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/views/admin/carreras.aspx");

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            guardar_modificar_datos(Convert.ToInt32(Request["cod"]));
        }

        protected void txtNombre_TextChanged(object sender, EventArgs e)
        {
            if (txtNombre.Text != "")
            {
                bool existe = cnCarrera.autentificarxNomCarrera(txtNombre.Text);
                if (existe)
                {
                    _ = new cnCarrera();
                    Tbl_Carrera resp = cnCarrera.obtenerCarreraxNomCarrera(txtNombre.Text);
                    if (resp != null)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'Ese nombre de usuario ya se encuentra registrado', 'error')", true);
                    }
                }
            }
        }
    }
}