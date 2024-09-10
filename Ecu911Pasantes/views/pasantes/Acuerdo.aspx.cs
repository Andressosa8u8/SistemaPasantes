using CapaNegocio;
using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecu911Pasantes.views.pasantes
{
    public partial class Acuerdo : System.Web.UI.Page
    {
        private Tbl_Pasantes pasinfo = new Tbl_Pasantes();
        private Tbl_Usuarios usuinfo = new Tbl_Usuarios();
        protected void Page_Load(object sender, EventArgs e)
        {
            string usulogeado = Session["Pasante"].ToString();
            int codigo = Convert.ToInt32(usulogeado);
            usuinfo = cnUsuarios.obtenerUsuariosxId(codigo);
            int usu = Convert.ToInt32(usuinfo.Usu_id.ToString());
            pasinfo = cnPasantes.obtenerPasantesxUsuario(usu);
            if (usuinfo != null)
            {
                lblNombres.Text = usuinfo.PrimerApellido.ToString() + " " + usuinfo.SegundoApellido.ToString() + " " + usuinfo.PrimerNombre.ToString() + " " + usuinfo.SegundoNombre.ToString() + " ";
                lblEstudiante.Text = usuinfo.PrimerNombre.ToString() + " " + usuinfo.PrimerApellido.ToString();
                lblCedula.Text = usuinfo.Cedula.ToString() + " ";
                lblCedulaF.Text = usuinfo.Cedula.ToString();
                lbldireccion.Text = usuinfo.Direccion.ToString();
                lblArea.Text = usuinfo.Area.ToString() + " ";
                if (pasinfo != null)
                {
                    lblFecha.Text = " " + DateTime.Now.ToString("'a los' <b>d</b> 'días del mes de' <b>MMMM</b> 'del' <b>yyyy</b>");
                    lblCarrera.Text = pasinfo.Carrera.ToString() + " ";
                    lblUniversidad.Text = pasinfo.Universidad.ToString();
                    lblActividad.Text = pasinfo.Actividad.ToString() + " ";
                }
            }
            bool existe = cnPasantes.autentificarAcuerdoxUsuario(Convert.ToInt32(usulogeado));
            if (existe)
            {
                ckbAcuerdo.Checked = true;
                btnGuardar.Enabled = false;
                ckbAcuerdo.Enabled = false;
            }
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string usulogeado = Session["Pasante"].ToString();
            if (ckbAcuerdo.Checked == true)
            {
                Tbl_Pasantes acuerdo = new Tbl_Pasantes();
                acuerdo = cnPasantes.obtenerPasantesxUsuario(Convert.ToInt32(usulogeado));
                if (acuerdo != null)
                {
                    cnPasantes.acuerdo(acuerdo);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Éxito!', 'Acuerdo aceptado con exito.', 'success')", true);
                    btnGuardar.Enabled = false;
                    ckbAcuerdo.Enabled = false;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'No se pudo aceptar el acuerdo.', 'error')", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'No aceptado el acuerdo.', 'error')", true);
            }
        }
    }
}