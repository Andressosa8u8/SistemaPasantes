﻿using CapaDatos;
using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecu911Pasantes.views.responsable
{
    public partial class pasante : System.Web.UI.Page
    {
        private Tbl_Pasantes pasinfo = new Tbl_Pasantes();
        private Tbl_Usuarios usuinfo = new Tbl_Usuarios();
        private DataClasses1DataContext dc = new DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["cod"] != null)
                {
                    int codigo = Convert.ToInt32(Request["cod"]);
                    usuinfo = cnUsuarios.obtenerUsuariosxId(codigo);
                    int usu = Convert.ToInt32(usuinfo.Usu_id.ToString());
                    pasinfo = cnPasantes.obtenerPasantesxUsuario(usu);
                    string estado = pasinfo.Estado.ToString();
                    actualizar();
                    if (estado == "A" || estado == "I")
                    {
                        ddlEstado.Enabled = true;
                        var pendiente = ddlEstado.SelectedValue.Equals('P');
                        pendiente = false;
                    }
                    if (usuinfo != null)
                    {
                        txtUser.Text = usuinfo.Usuario.ToString();
                        txtPrimerApellido.Text = usuinfo.PrimerApellido.ToString();
                        txtSegundoApellido.Text = usuinfo.SegundoApellido.ToString();
                        txtPrimerNombre.Text = usuinfo.PrimerNombre.ToString();
                        txtSegundoNombre.Text = usuinfo.SegundoNombre.ToString();
                        txtCedula.Text = usuinfo.Cedula.ToString();
                        txtCelular.Text = usuinfo.Celular.ToString();
                        txtEmail.Text = usuinfo.Correo.ToString();
                        //txtArea.Text = usuinfo.Area.ToString();
                        ddlCentro.SelectedValue = usuinfo.Centro_id.ToString();
                        txtDireccion.Text = usuinfo.Direccion.ToString();
                        txtPass.Text = usuinfo.Password.ToString();
                        txtConfirmar.Text = usuinfo.Password.ToString();
                        ddlUniversidad.SelectedValue = pasinfo.Uni_id.ToString();
                        if (pasinfo != null)
                        {
                            //txtCarrera.Text = pasinfo.Carrera.ToString();
                            ddlCarrera.SelectedValue = pasinfo.Carre_id.ToString();
                            txtNivel.Text = pasinfo.Nsemestre.ToString();
                            //txtUniversidad.Text = pasinfo.Universidad.ToString();
                            ddlUniversidad.SelectedValue = pasinfo.Uni_id.ToString();
                            txtCodEcu.Text = pasinfo.CodigoEcu.ToString();
                            ddlActividad.SelectedValue = pasinfo.Actividad.ToString();
                            ddlEstado.SelectedValue = pasinfo.Estado.ToString();
                            txtHorasR.Text = pasinfo.HorasNecesarias.ToString();

                        }
                    }
                }
                cargarUniversidad();
                cargarCarrera();
                cargaCentro();
                Timer1.Enabled = false;
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
                    PrimerApellido = txtPrimerApellido.Text.ToUpper().Trim(),
                    SegundoApellido = txtSegundoApellido.Text.ToUpper().Trim(),
                    PrimerNombre = txtPrimerNombre.Text.ToUpper().Trim(),
                    SegundoNombre = txtSegundoNombre.Text.ToUpper().Trim(),
                    Cedula = txtCedula.Text,
                    Celular = txtCelular.Text,
                    Correo = txtEmail.Text.ToUpper().Trim(),
                    //Area = txtArea.Text.ToUpper().Trim(),
                    Centro_id = Convert.ToInt32(ddlCentro.SelectedValue),
                    Direccion = txtDireccion.Text.ToUpper().Trim(),
                    Tusu_id = 2
                };
                cnUsuarios.save(usuinfo);

                pasinfo = new Tbl_Pasantes
                {
                    //Carrera = txtCarrera.Text.ToUpper().Trim(),
                    Carre_id = Convert.ToInt32(ddlCarrera.SelectedValue),
                    Nsemestre = Convert.ToInt32(txtNivel.Text),
                    //Universidad = txtUniversidad.Text.ToUpper().Trim(),
                    Uni_id = Convert.ToInt32(ddlUniversidad.SelectedValue),
                    CodigoEcu = txtCodEcu.Text.ToUpper().Trim(),
                    Actividad = ddlActividad.SelectedValue,
                    Usu_id = usuinfo.Usu_id,
                    HorasNecesarias = Convert.ToInt32(txtHorasR.Text)
                };
                cnPasantes.save(pasinfo);
                //Session["Mensaje"] = "Datos guardados con éxito.";
                //Session["Estado"] = "Éxito!";
                //Session["Icono"] = "success";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Éxito!', 'Datos guardados con éxito.', 'success')", true);
                Timer1.Enabled = true;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'No se pudo guardar los datos" + ex.Message + " intentelo de nuevo.', 'error')", true);
            }
        }
        private void Modificar(Tbl_Pasantes pas, Tbl_Usuarios usu)
        {
            try
            {
                usu.Usuario = txtUser.Text.Trim();
                usu.PrimerApellido = txtPrimerApellido.Text.ToUpper().Trim();
                usu.SegundoApellido = txtSegundoApellido.Text.ToUpper().Trim();
                usu.PrimerNombre = txtPrimerNombre.Text.ToUpper().Trim();
                usu.SegundoNombre = txtSegundoNombre.Text.ToUpper().Trim();
                usu.Cedula = txtCedula.Text.Trim();
                usu.Celular = txtCelular.Text.Trim();
                usu.Correo = txtEmail.Text.ToUpper().Trim();
                //usu.Area = txtArea.Text.ToUpper().Trim();
                usu.Centro_id = Convert.ToInt32(ddlCentro.SelectedValue);
                usu.Direccion = txtDireccion.Text.ToUpper().Trim();
                usu.Estado = ddlEstado.SelectedValue;
                cnUsuarios.modify(usu);

                //pas.Carrera = txtCarrera.Text.ToUpper().Trim();
                pas.Carre_id = Convert.ToInt32(ddlCarrera.SelectedValue);
                pas.Nsemestre = Convert.ToInt32(txtNivel.Text);
                //pas.Universidad = txtUniversidad.Text.ToUpper().Trim();
                pas.Uni_id = Convert.ToInt32(ddlUniversidad.SelectedValue);
                pas.CodigoEcu = txtCodEcu.Text.ToUpper().Trim();
                pas.Actividad = ddlActividad.SelectedValue;
                pas.Estado = ddlEstado.SelectedValue;
                pas.HorasNecesarias = Convert.ToInt32(txtHorasR.Text);
                cnPasantes.modify(pas);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Éxito!', 'Datos modificados con éxito.', 'success')", true);
                Timer1.Enabled = true;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'No se puedo modificar los datos." + ex.Message + " intentelo de nuevo.', 'error')", true);
            }
        }
        private void guardar_modificar_datos(int id, int usu)
        {
            if (id == 0 && usu == 0)
            {
                Guardar();
            }
            else
            {
                usuinfo = cnUsuarios.obtenerUsuariosxId(id);
                usu = Convert.ToInt32(usuinfo.Usu_id.ToString());
                pasinfo = cnPasantes.obtenerPasantesxUsuario(usu);
                if (usuinfo != null)
                {
                    if (pasinfo != null)
                    {
                        Modificar(pasinfo, usuinfo);
                    }
                }
            }
        }
        protected void lnbGuardar_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                guardar_modificar_datos(Convert.ToInt32(Request["cod"]), Convert.ToInt32(usuinfo.Usu_id.ToString()));
            }
        }

        protected void lnbCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/views/responsable/pasantes.aspx");
        }
        private void actualizar()
        {
            txtPass.Enabled = false;
            txtConfirmar.Enabled = false;
            btnGuardar.Text = "Actualizar";
        }
        string encriptar(string cadena)
        {
            byte[] encriptar = System.Text.Encoding.Unicode.GetBytes(cadena);
            string resultado = Convert.ToBase64String(encriptar);
            return resultado;
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Response.Redirect("~/views/responsable/pasantes.aspx");
        }
        protected void TxtCedula_TextChanged(object sender, EventArgs e)
        {
            bool existe = cnUsuarios.autentificarxCedula(txtCedula.Text);
            if (existe)
            {
                Tbl_Usuarios resp = new Tbl_Usuarios();
                resp = cnUsuarios.obtenerUsuariosxCedula(txtCedula.Text);
                if (resp != null)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'Ya existe una persona registrado con ese numero de cedula', 'error')", true);
                }
            }
        }

        //protected void btnCodPa_Click(object sender, EventArgs e)
        //{
        //    Random r = new Random();
        //   int codigo = r.Next(100000, 1000000);
        //    txtCodPa.Text = Convert.ToString(codigo);
        //}

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



        private void cargarUniversidad()
        {
            var listauni = dc.Universidades();
            ddlUniversidad.DataSource = listauni;
            ddlUniversidad.DataTextField = "Uni_nombre";
            ddlUniversidad.DataValueField = "Uni_id";
            ddlUniversidad.DataBind();

            // Elemento predeterminado Seleccione ...
            ddlUniversidad.Items.Insert(0, new ListItem("Seleccione la universidad", "0"));

        }

        private void cargarCarrera()
        {
            var listacarreras = dc.Universidadycarreras();
            ddlCarrera.DataSource = listacarreras;
            ddlCarrera.DataTextField = "Carre_nombre";
            ddlCarrera.DataValueField = "Carre_id";
            ddlCarrera.DataBind();

            // Elemento predeterminado Seleccione ...
            ddlCarrera.Items.Insert(0, new ListItem("Seleccione la carrera", "0"));
        }

        private void cargaCentro()
        {
            var listaCentros = dc.ObtenerCentros();
            ddlCentro.DataSource = listaCentros;
            ddlCentro.DataTextField = "Centro_nombre";
            ddlCentro.DataValueField = "Centro_id";
            ddlCentro.DataBind();

            // Elemento predeterminado Seleccione ...
            ddlCentro.Items.Insert(0, new ListItem("Seleccione un centro", "0"));
        }
    }
}