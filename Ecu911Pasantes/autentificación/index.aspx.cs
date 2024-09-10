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
    public partial class index : System.Web.UI.Page
    {
        private static int con = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Timer1.Enabled = false;
            }
            Session["con"] = Session["Conantiguo"];
        }
        private void Ingresar()
        {
            bool existenom = cnUsuarios.autentificarxNom(txtUser.Text);
            bool existe = cnUsuarios.autentificar(txtUser.Text, encriptar(txtPass.Text));
            {
                if (existenom)
                {
                    if (existe)
                    {
                        Tbl_Usuarios usuario = new Tbl_Usuarios();
                        Tbl_TipoUsuario tusu = new Tbl_TipoUsuario();
                        usuario = cnUsuarios.autentificarxLogin(txtUser.Text, encriptar(txtPass.Text));
                        int rol = Convert.ToInt32(usuario.Tusu_id.ToString());
                        tusu = cnTipoUsuario.obtenerTusuarioxUsuario(Convert.ToInt32(rol));
                        int tusuario = Convert.ToInt32(usuario.Tusu_id);
                        if (tusuario == 1)
                        {
                            Session["Admin"] = usuario.Usu_id.ToString();
                            Session["nombre"] = usuario.PrimerNombre.ToString();
                            Session["apellido"] = usuario.PrimerApellido.ToString();
                            Session["rol"] = tusu.Nombre.ToString();
                            Response.Redirect("~/views/admin/inicio.aspx");
                            Limpiar();
                        }
                        else
                        {
                            Session["Pasante"] = usuario.Usu_id.ToString();
                            Session["nombre"] = usuario.PrimerNombre.ToString();
                            Session["apellido"] = usuario.PrimerApellido.ToString();
                            Session["rol"] = tusu.Nombre.ToString();
                            Response.Redirect("~/views/pasantes/asistencia.aspx");
                            Limpiar();
                        }
                    }
                    else
                    {
                        string intentos = (con + (Convert.ToInt32(Session["con"]))).ToString();
                        Session["Conantiguo"] = intentos.ToString();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'Credenciales Incorrectas! Intento #" + intentos + "', 'error')",true);
                        txtPass.Text = "";
                        if (Convert.ToInt32(intentos) == 2)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'A superado el limite de intentos.', 'error')", true);
                            btnIngresar.Visible = false;
                            Session.RemoveAll();
                            Timer1.Enabled = true;
                        }
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'El usuario no existe.', 'error')", true);
                    Limpiar();
                }
            }
        }
        private void Limpiar()
        {
            txtPass.Text = "";
            txtUser.Text = "";
        }
        string encriptar(string cadena)
        {
            string resultado = string.Empty;
            byte[] encriptar = System.Text.Encoding.Unicode.GetBytes(cadena);
            resultado = Convert.ToBase64String(encriptar);
            return resultado;
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Ingresar();
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Response.Redirect("~/autentificación/recuperar.aspx");
        }
    }
}