using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaNegocio;

namespace Ecu911Pasantes.views.pasantes
{
    public partial class asistencia : System.Web.UI.Page
    {
        private Tbl_Asistencia asisinfo = new Tbl_Asistencia();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                string usulogeado = Session["Pasante"].ToString();
                bool existe = cnAsistencias.autentificarxCodigo(Convert.ToInt32(usulogeado));
                bool dia = cnAsistencias.autentificarDiaxCodigo(Convert.ToInt32(usulogeado));
                if (dia)
                {
                    txtAsistencia.Enabled = false;
                    txtActividades.Enabled = false;
                }
                else if (existe)
                {
                    txtActividades.Visible = true;
                }
            }
        }
        private void Guardar()
        {
            try
            {
                string usulogeado = Session["Pasante"].ToString();
                bool validar = cnUsuarios.autentificarxCodigo(Convert.ToInt32(usulogeado), Convert.ToInt32(txtAsistencia.Text));
                bool activo = cnPasantes.autentificarxEstado(Convert.ToInt32(usulogeado));
                if (validar)
                {
                    if (activo)
                    {
                        asisinfo = new Tbl_Asistencia();
                        asisinfo.Usu_id = Convert.ToInt32(usulogeado);
                        cnAsistencias.save(asisinfo);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Éxito!', 'Ingreso registrado con existo.', 'success')", true);
                        txtAsistencia.Text = "";
                        txtActividades.Visible = true;
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'Usted aun no se encuentra habilitado para poder registar su asistencia.', 'error')", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'El codigo ingresado es incorrecto.', 'error')", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'Ingreso no registrado.." + ex.Message + ".', 'error')", true);
                txtAsistencia.Text = "";
            }
        }
        private void Modificar(Tbl_Asistencia asismd)
        {
            try
            {
                string usulogeado = Session["Pasante"].ToString();
                bool validar = cnUsuarios.autentificarxCodigo(Convert.ToInt32(usulogeado), Convert.ToInt32(txtAsistencia.Text));
                Tbl_Asistencia asi = cnAsistencias.obtenerAsistenciaxCodigo(Convert.ToInt32(usulogeado));
                DateTime entrada = Convert.ToDateTime(asi.HoraEntrada);
                DateTime salida = DateTime.Now;
                TimeSpan minutos = salida - entrada;
                double diferencia = minutos.TotalMinutes;
                decimal total = Convert.ToDecimal( diferencia / 60);
                total = decimal.Round(total, 2, MidpointRounding.AwayFromZero);

                if (validar)
                {
                    asismd.Actividades = txtActividades.Text;
                    asismd.TotalHoras = total;
                    cnAsistencias.modify(asismd);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Éxito!', 'Salida registrada con existo.', 'success')", true);
                    txtAsistencia.Text = "";
                    txtActividades.Text = "";
                    txtActividades.Visible = false;
                    txtAsistencia.Enabled = false;
                    txtActividades.Enabled = false;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'El codigo ingresado es incorrecto.', 'error')", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'Salida no registrada.." + ex.Message + ".', 'error')", true);
                txtAsistencia.Text = "";
            }
        }
        protected void btnAsistencia_Click(object sender, EventArgs e)
        {
            _ = new Tbl_Asistencia();
            string usulogeado = Session["Pasante"].ToString();
            Tbl_Asistencia asi = cnAsistencias.obtenerAsistenciaxCodigo(Convert.ToInt32(usulogeado));
            bool dia = cnAsistencias.autentificarDiaxCodigo(Convert.ToInt32(usulogeado));
            if (dia)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'Ya has registrado tu asistencia del dia de hoy', 'error')", true);
            }
            else
            {
                if (asi != null)
                {
                    Modificar(asi);
                }
                else
                {
                    Guardar();
                }
            }
        }
    }
}