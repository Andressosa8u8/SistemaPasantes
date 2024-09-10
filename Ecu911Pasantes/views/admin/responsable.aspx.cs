using CapaDatos;
using CapaNegocio;
using System;
using System.Web.UI;

namespace Ecu911Pasantes.views.admin
{
    public partial class responsable : System.Web.UI.Page
    {
        private Tbl_Responsable respinfo = new Tbl_Responsable();
        private Tbl_Usuarios usuinfo = new Tbl_Usuarios();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["cod"] != null)
                {
                    int codigo = Convert.ToInt32(Request["cod"]);
                    usuinfo = cnUsuarios.obtenerUsuariosxId(codigo);
                    int usu = Convert.ToInt32(usuinfo.Usu_id.ToString());
                    respinfo = cnResponsables.obtenerResponsablesxUsuario(usu);
                    actualizar();
                    if (usuinfo != null)
                    {
                        txtUser.Text = usuinfo.Usuario.ToString();
                        txtPrimerNombre.Text = usuinfo.PrimerNombre.ToString();
                        txtSegundoNombre.Text = usuinfo.SegundoNombre.ToString();
                        txtPrimerApellido.Text = usuinfo.PrimerApellido.ToString();
                        txtSegundoApellido.Text = usuinfo.SegundoApellido.ToString();
                        txtCedula.Text = usuinfo.Cedula.ToString();
                        txtArea.Text = usuinfo.Area.ToString();
                        txtEmail.Text = usuinfo.Correo.ToString();
                        txtCelular.Text = usuinfo.Celular.ToString();
                        txtDireccion.Text = usuinfo.Direccion.ToString();
                        txtPass.Text = usuinfo.Password.ToString();
                        txtConfirmar.Text = usuinfo.Password.ToString();
                        ddlEstado.SelectedValue = usuinfo.Estado.ToString();
                        if (respinfo != null)
                        {
                            txtCargo.Text = respinfo.Cargo.ToString();
                        }
                    }
                }
                Timer1.Enabled = false;
            }
        }

        protected void lnbCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/views/admin/responsables.aspx");
        }

        protected void lnbGuardar_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                guardar_modificar_datos(Convert.ToInt32(Request["cod"]), Convert.ToInt32(usuinfo.Usu_id.ToString()));
            }
        }
        private void Guardar()
        {
            try
            {
                usuinfo = new Tbl_Usuarios
                {
                    Usuario = txtUser.Text.Trim(),
                    Password = encriptar(txtPass.Text).Trim(),
                    PrimerNombre = txtPrimerNombre.Text.ToUpper().Trim(),
                    SegundoNombre = txtSegundoNombre.Text.ToUpper().Trim(),
                    PrimerApellido = txtPrimerApellido.Text.ToUpper().Trim(),
                    SegundoApellido = txtSegundoApellido.Text.ToUpper().Trim(),
                    Cedula = txtCedula.Text.Trim(),
                    Area = txtArea.Text.ToUpper().Trim(),
                    Celular = txtCelular.Text.Trim(),
                    Correo = txtEmail.Text.ToUpper().Trim(),
                    Direccion = txtDireccion.Text.ToUpper().Trim(),
                    Tusu_id = 1
                };
                cnUsuarios.save(usuinfo);

                respinfo = new Tbl_Responsable
                {
                    Cargo = txtCargo.Text.ToUpper().Trim(),
                    Usu_id = usuinfo.Usu_id
                };

                cnResponsables.save(respinfo);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Éxito!', 'Datos guardados con éxito.', 'success')", true);
                Timer1.Enabled = true;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'No se pudo guardar los datos" + ex.Message + " intentelo de nuevo.', 'error')", true);
            }
        }
        private void modificar(Tbl_Responsable respmd, Tbl_Usuarios usu)
        {
            try
            {
                usu.Usuario = txtUser.Text.Trim();
                usu.PrimerNombre = txtPrimerNombre.Text.ToUpper().Trim();
                usu.SegundoNombre = txtSegundoNombre.Text.ToUpper().Trim();
                usu.PrimerApellido = txtPrimerApellido.Text.ToUpper().Trim();
                usu.SegundoApellido = txtSegundoApellido.Text.ToUpper().Trim();
                usu.Cedula = txtCedula.Text.Trim();
                usu.Area = txtArea.Text.ToUpper().Trim();
                usu.Celular = txtCelular.Text.Trim();
                usu.Correo = txtEmail.Text.ToUpper().Trim();
                usu.Direccion = txtDireccion.Text.ToUpper().Trim();
                usu.Estado = ddlEstado.SelectedValue;
                cnUsuarios.modify(usu);

                respmd.Cargo = txtCargo.Text.ToUpper().Trim();
                respmd.Estado = ddlEstado.SelectedValue;
                cnResponsables.Modify(respmd);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Éxito!', 'Datos modificados con éxito.', 'success')", true);
                Timer1.Enabled = true;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'No se puedo modificar los datos." + ex.Message + " intentelo de nuevo.', 'error')", true);
            }
        }
        private void guardar_modificar_datos(int id,int usu)
        {
            if (id == 0 && usu == 0)
            {
                Guardar();
            }
            else
            {
                usuinfo = cnUsuarios.obtenerUsuariosxId(id);
                usu = Convert.ToInt32(usuinfo.Usu_id.ToString());
                respinfo = cnResponsables.obtenerResponsablesxUsuario(usu);
                if (usuinfo != null)
                {
                    if (respinfo != null)
                    {
                        modificar(respinfo, usuinfo);
                    }
                }
            }
        }
        private void actualizar()
        {
            txtPass.Enabled = false;
            txtConfirmar.Enabled = false;
            btnGuardar.Text = "Actualizar";
            ddlEstado.Enabled = true;
        }
        string encriptar(string cadena)
        {
            byte[] encriptar = System.Text.Encoding.Unicode.GetBytes(cadena);
            string resultado = Convert.ToBase64String(encriptar);
            return resultado;
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/admin/responsables.aspx");
        }
        protected void TxtCedula_TextChanged(object sender, EventArgs e)
        {
            if (txtCedula.Text != "") 
            {
                bool existe = cnUsuarios.autentificarxCedula(txtCedula.Text);
                if (existe)
                {
                    _ = new Tbl_Usuarios();
                    Tbl_Usuarios resp = cnUsuarios.obtenerUsuariosxCedula(txtCedula.Text);
                    if (resp != null)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'Ya existe una persona registrado con ese numero de cedula', 'error')", true);
                        txtCedula.Text = "";
                    }
                }
            }
        }

        protected void txtUser_TextChanged(object sender, EventArgs e)
        {
            if (txtUser.Text != "")
            {
                bool existe = cnUsuarios.autentificarxNomUsuario(txtUser.Text);
                if (existe)
                {
                    _ = new Tbl_Usuarios();
                    Tbl_Usuarios resp = cnUsuarios.obtenerUsuariosxNomUsuario(txtUser.Text);
                    if (resp != null)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'Ese nombre de usuario ya se encuentra registrado', 'error')", true);
                    }
                }
            }
        }
    }
}