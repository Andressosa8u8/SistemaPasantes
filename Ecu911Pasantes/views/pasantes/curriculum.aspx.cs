using CapaDatos;
using CapaNegocio;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecu911Pasantes.views.pasantes
{
    public partial class curriculum : System.Web.UI.Page
    {
        private Tbl_Pasantes pasinfo = new Tbl_Pasantes();
        private Tbl_Usuarios usuinfo = new Tbl_Usuarios();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btnSubir_Click(object sender, EventArgs e)
        {
            string usulogeado = Session["Pasante"].ToString();
            pasinfo = cnPasantes.obtenerPasantesxUsuario(Convert.ToInt32(usulogeado));
            if (pasinfo != null)
            {
                subir(pasinfo);
            }
        }
        private void subir(Tbl_Pasantes pasmd)
        {
            string usulogeado = Session["Pasante"].ToString();
            usuinfo = cnUsuarios.obtenerUsuariosxId(Convert.ToInt32(usulogeado));
            string info = usuinfo.Cedula.ToString();
            try
            {
                bool existe = cnPasantes.autentificarxUsu(Convert.ToInt32(usulogeado));
                if (existe)
                {
                    pasmd.Curriculum = txtCurriculum.Text;
                    cnPasantes.curriculum(pasmd);
                    txtCurriculum.Text = "";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Éxito!', 'Curriculum subido con éxito.', 'success')", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'No se pudo subir el curriculum." + ex.Message + " intentelo de nuevo.', 'error')", true);
            }
        }
    }
}