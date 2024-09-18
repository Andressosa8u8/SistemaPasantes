using CapaDatos;
using CapaNegocio;
using Org.BouncyCastle.Asn1.Tsp;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using static iTextSharp.text.pdf.PdfDocument;

namespace Ecu911Pasantes.views.admin
{
    public partial class universidad : System.Web.UI.Page
    {

        private Tbl_Universidad uninfo = new Tbl_Universidad();
        private DataClasses1DataContext dc = new DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["cod"] != null)
                {
                    int codigo = Convert.ToInt32(Request["cod"]);
                    uninfo = cnUniversidad.obtenerUniversidadxId(codigo);

                    if (uninfo != null)
                    {
                        txtNombre.Text = uninfo.Uni_nombre.ToString();
                        ddlEstado.SelectedValue = uninfo.Uni_estado.ToString();
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
                uninfo= new Tbl_Universidad();
                uninfo.Uni_nombre = txtNombre.Text;
                uninfo.Uni_estado = Convert.ToChar(ddlEstado.SelectedValue);

                cnUniversidad.save(uninfo);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Éxito!', 'Datos guardados con éxito.', 'success')", true);
                Timer1.Enabled = true;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'No se pudo guardar los datos" + ex.Message + " intentelo de nuevo.', 'error')", true);
            }
        }

        private void Modificar(Tbl_Universidad uninfo)
        {
            try {
                uninfo.Uni_nombre = txtNombre.Text;
                uninfo.Uni_estado = Convert.ToChar(ddlEstado.SelectedValue);

                cnUniversidad.modify(uninfo);
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
                uninfo = cnUniversidad.obtenerUniversidadxId(id);
                if (uninfo != null)
                {
                    Modificar(uninfo);
                }
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Response.Redirect("~/views/admin/universidades.aspx");
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/views/admin/universidades.aspx");
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            guardar_modificar_datos(Convert.ToInt32(Request["cod"]));

        }

        protected void txtNombre_TextChanged(object sender, EventArgs e)
        {
            if (txtNombre.Text != "")
            {
                bool existe = cnUniversidad.autentificarxNomUniversidad(txtNombre.Text);
                if (existe)
                {
                    _ = new cnUniversidad();
                    Tbl_Universidad resp = cnUniversidad.obtenerUniversidadxNomUniversidad(txtNombre.Text);
                    if (resp != null)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'Ese nombre de usuario ya se encuentra registrado', 'error')", true);
                    }
                }
            }
        }
    }
}