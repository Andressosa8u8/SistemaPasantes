using CapaDatos;
using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecu911Pasantes.autentificación
{
    public partial class recuperar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Timer1.Enabled = false;
            }
        }
        private void Recuperar()
        {
            Tbl_Usuarios usu = new Tbl_Usuarios();
            bool existe = cnUsuarios.autentificarxCorreo(txtEmail.Text);
            {
                if (existe)
                {
                    usu = cnUsuarios.obtenerCorreo(txtEmail.Text);

                    string from = "sistema.pasantes.ecu911@gmail.com";
                    string pass = "SistemaPasantes911";
                    string to = usu.Correo;
                    string mensaje = "La contraseña que el olvido es: <strong>" + 
                        desencriptar(usu.Password) + "</strong>";

                    if (new cnEmail().EnviarEmail(from, pass, to, mensaje))
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Éxito!', 'Correo enviado con éxito.', 'success')", true);
                        txtEmail.Text = "";
                        Timer1.Enabled = true;
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'Correo no enviado intentelo de nuevo.', 'error')", true);
                        txtEmail.Text = "";
                        return;
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'El correo no existe.', 'error')", true);
                    txtEmail.Text = "";
                }
            }
        }
        string desencriptar(string cadena)
        {
            string resultado = string.Empty;
            byte[] desencriptar = Convert.FromBase64String(cadena);
            resultado = System.Text.Encoding.Unicode.GetString(desencriptar);
            return resultado;
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Response.Redirect("~/autentificación/index.aspx");
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            Recuperar();
        }
    }
}