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
    public partial class cargo : System.Web.UI.Page
    {
        private Tbl_Cargo carinfo = new Tbl_Cargo();
        private DataClasses1DataContext dc = new DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["cod"] != null)
                {
                    int codigo = Convert.ToInt32(Request["cod"]);
                    carinfo = cnCargos.obtenerCargoxId(codigo);

                    if (carinfo != null)
                    {
                        txtNombre.Text = carinfo.Cargo_nombre.ToString();
                        ddlEstado.SelectedValue = carinfo.Cargo_estado.ToString();
                    }
                }
            }
            //cargacentro();
            Timer1.Enabled = false;

        }

        private void Guardar()
        {
            try
            {
                carinfo = new Tbl_Cargo();
                carinfo.Cargo_nombre = txtNombre.Text;
                carinfo.Cargo_estado = Convert.ToChar(ddlEstado.SelectedValue);

                cnCargos.save(carinfo);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Éxito!', 'Datos guardados con éxito.', 'success')", true);
                Timer1.Enabled = true;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'No se pudo guardar los datos" + ex.Message + " intentelo de nuevo.', 'error')", true);
            }
        }

        private void Modificar(Tbl_Cargo carinfo)
        {
            try
            {
                carinfo.Cargo_nombre = txtNombre.Text;
                carinfo.Cargo_estado = Convert.ToChar(ddlEstado.SelectedValue);

                cnCargos.modify(carinfo);
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
                carinfo = cnCargos.obtenerCargoxId(id);
                Modificar(carinfo);
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Response.Redirect("cargos.aspx");
        }

        protected void txtNombre_TextChanged(object sender, EventArgs e)
        {
            if (txtNombre.Text != "") 
            { 
                bool existe = cnCargos.autentificarxNomCargo(txtNombre.Text);
                if (existe)
                {
                    _= new cnCargos();
                    Tbl_Cargo resp = cnCargos.obtenerCargoxNomCargo(txtNombre.Text);
                    if (resp != null)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'Ese nombre de usuario ya se encuentra registrado', 'error')", true);
                    }
                }
            }        
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("cargos.aspx");
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            guardar_modificar_datos(Convert.ToInt32(Request["cod"]));
        }
    }
}