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
    public partial class hora : System.Web.UI.Page
    {
        private Tbl_Horas horinfo = new Tbl_Horas();
        private DataClasses1DataContext dc = new DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string usulogeado = Session["Pasante"].ToString();
                bool activo = cnPasantes.autentificarxEstado(Convert.ToInt32(usulogeado));
                if (activo)
                {
                    cargarLabores();
                    btnEnviar.Visible = true;
                }
                else
                {
                    Validar();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'Usted aun no se encuentra habilitado para poder registar sus horas.', 'error')", true);
                }
                Timer1.Enabled = false;
                HorasxMes();
            }
        }
        private void cargarLabores()
        {
            string usulogeado = Session["Pasante"].ToString();
            var listaLab = dc.LaboresPorPasante(Convert.ToInt32(usulogeado));
            ddlLabor.DataSource = listaLab.ToList();
            ddlLabor.DataTextField = "ConceptoL";
            ddlLabor.DataValueField = "Labor_id";
            ddlLabor.DataBind();
        }

        private void Guardar()
        {
            try
            {
                horinfo = new Tbl_Horas();
                horinfo.Cantidad = Convert.ToInt32(txtCantidad.Text);
                horinfo.ConceptoH = txtConcepto.Text;
                horinfo.Labor_id = Convert.ToInt32(ddlLabor.SelectedValue);

                cnHoras.save(horinfo);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Éxito!', 'Datos Guardados Con Exito.', 'success')", true);
                Timer1.Enabled = true;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'No se puedo guardar los datos." + ex.Message + " intentelo de nuevo.', 'error')", true);
            }
        }

        protected void lnbCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/views/pasantes/horas.aspx");
        }

        protected void lnbGuardar_Click(object sender, EventArgs e)
        {
            Guardar();
        }
        private void Validar()
        {
            txtCantidad.Enabled = false;
            txtConcepto.Enabled = false;
            ddlLabor.Enabled = false;
            btnEnviar.Visible = false;
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Response.Redirect("~/views/pasantes/horas.aspx");
        }
        
        private void HorasxMes()
        {
            string usulogeado = Session["Pasante"].ToString();
            var hormes = dc.HorasxMes(Convert.ToInt32(usulogeado));
            if (hormes != null)
            {
                foreach (var item in hormes)
                {
                    txtCantidad.Text += item.HorasA;
                };
            }
        }
    }
}