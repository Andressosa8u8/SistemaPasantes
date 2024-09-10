using CapaDatos;
using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecu911Pasantes.views.pasantes
{
    public partial class contraseña : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string resNom = Session["nombre"].ToString();
                string resApe = Session["apellido"].ToString();
            }
        }

        protected void lnbGuardar_Click(object sender, EventArgs e)
        {
            Tbl_Usuarios usu = new Tbl_Usuarios();
            int usulogeado = Convert.ToInt32(Session["Pasante"].ToString());
            usu = cnUsuarios.obtenerUsuariosxId(usulogeado);
            if (usu != null)
            {
                cambiarClave(usu);
            }
        }
        private void cambiarClave(Tbl_Usuarios usu)
        {
            try
            {
                int usulogueado = Convert.ToInt32(Session["Pasante"].ToString());
                bool existe = cnUsuarios.autentificarxUsuario(usulogueado, encriptar(txtActual.Text));
                if (existe)
                {
                    Tbl_Usuarios usuc = new Tbl_Usuarios();
                    usuc = cnUsuarios.obtenerUsuariosxId(usulogueado);
                    string anterior = usuc.Password.ToString();
                    if (anterior == encriptar(txtPass.Text))
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'Su nueva clave no puede ser igual a la anterior.', 'error')", true);
                        Limpiar();
                    }
                    else
                    {
                        usu.Password = encriptar(txtPass.Text);
                        cnUsuarios.change(usu);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Éxito!', 'Su clave a sido modificada con exito.', 'success')", true);
                        Limpiar();
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'La contraseña anterior ingresada es incorrecta.', 'error')", true);
                    Limpiar();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'No se a podido realizar el cambio de su clave" + ex.Message + ".', 'error')", true);
                Limpiar();
            }
        }
        private void Limpiar()
        {
            txtActual.Text = "";
            txtPass.Text = "";
            txtConfirmar.Text = "";
        }
        string encriptar(string cadena)
        {
            string resultado = string.Empty;
            byte[] encriptar = System.Text.Encoding.Unicode.GetBytes(cadena);
            resultado = Convert.ToBase64String(encriptar);
            return resultado;
        }
    }
}