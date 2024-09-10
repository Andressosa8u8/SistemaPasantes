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
    public partial class detallePasante : System.Web.UI.Page
    {
        private Tbl_Pasantes pasinfo = new Tbl_Pasantes();
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
                    pasinfo = cnPasantes.obtenerPasantesxUsuario(usu);
                    string estado = pasinfo.Estado.ToString();
                    if (usuinfo != null || pasinfo != null)
                    {
                        lblCedula.Text = usuinfo.Cedula.ToString();
                        lblNombres.Text = usuinfo.PrimerNombre.ToString() + " " + usuinfo.SegundoNombre.ToString();
                        lblApellidos.Text = usuinfo.PrimerApellido.ToString() + " " + usuinfo.SegundoApellido.ToString();
                        lblDireccion.Text = usuinfo.Direccion.ToString();
                        lblCorreo.Text = usuinfo.Correo.ToString();
                        lblCelular.Text = usuinfo.Celular.ToString();
                        lblUser.Text = usuinfo.Usuario.ToString();
                        lblArea.Text = usuinfo.Area.ToString();
                        lblCarrera.Text = pasinfo.Carrera.ToString();
                        lblSemestre.Text = pasinfo.Nsemestre.ToString();
                        lblUniversidad.Text = pasinfo.Universidad.ToString();
                        lblCodigo.Text = pasinfo.CodigoEcu.ToString();
                        lblActividad.Text = pasinfo.Actividad.ToString();
                        if (pasinfo.Estado.ToString() == "A")
                        {
                            lblEstado.Text = "Activo";
                            lblEstado.CssClass = "badge bg-success text-white";
                        }
                        else if (pasinfo.Estado.ToString() == "P")
                        {
                            lblEstado.Text = "Pendiente";
                            lblEstado.CssClass = "badge bg-warning text-white";
                        }
                        else
                        {
                            lblEstado.Text = "Inactivo";
                            lblEstado.CssClass = "badge bg-danger text-white";
                        }
                    }
                }
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/views/admin/pasantes.aspx");
        }
    }
}