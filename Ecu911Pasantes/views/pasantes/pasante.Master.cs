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
    public partial class pasante : System.Web.UI.MasterPage
    {
        private Tbl_Pasantes pasantes = new Tbl_Pasantes();
        private Tbl_Labores labores = new Tbl_Labores();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Pasante"] != null)
                {
                    string usulogeado = Session["Pasante"].ToString();
                    string pasNom = Session["nombre"].ToString();
                    string pasApe = Session["apellido"].ToString();
                    lblNombre.Text = pasNom + " " + pasApe;

                    int codigo = Convert.ToInt32(usulogeado);
                    pasantes = cnPasantes.obtenerPasantesxSession(codigo);
                    int idPasante = Convert.ToInt32(pasantes.Pasantes_id);
                    int idUsuario = Convert.ToInt32(pasantes.Usu_id);

                    bool haAceptadoAcuerdo = VerificarAcuerdoPasante(idPasante);

                    if (!haAceptadoAcuerdo)
                    {
                        menuHoras.Visible = false;
                        menuCurriculum.Visible = false;
                        menuCertificado.Visible = false;
                    }
                    else
                    {
                        menuHoras.Visible = true;
                        menuCurriculum.Visible = true;
                        menuCertificado.Visible = false;

                        // Verificar si ha cumplido el número de horas necesarias
                        bool haCumplidoHoras = VerificarHorasCumplidas(idPasante);
                        if (haCumplidoHoras)
                        {
                            menuCertificado.Visible = true;
                            lnbAutorizar.Visible = true;
                            System.Diagnostics.Debug.WriteLine("lnbAutorizar se hizo visible");
                        }
                        else
                        {
                            System.Diagnostics.Debug.WriteLine("lnbAutorizar sigue oculto");
                        }

                    }
                }
                else
                {
                    Response.Redirect("../../autentificación/index.aspx");
                }
            }
        }

        private bool VerificarHorasCumplidas(int idPasante)
        {
            var horas = cnPasantes.ObtenerHorasPasante(idPasante);
            System.Diagnostics.Debug.WriteLine($"Horas Necesarias: {horas.HorasNecesarias}, Horas Cumplidas: {horas.HorasCumplidas}");

            if (horas.HorasCumplidas >= horas.HorasNecesarias)
            {
                return true;
            }
            else if (horas.HorasCumplidas == 0 && horas.HorasNecesarias == 0) {
                return false;
            }
            else
            {
                return false;
            }
        }



        private bool VerificarAcuerdoPasante(int idPasante)
        {
            var pasante = cnPasantes.ObtenerAcuerdoPasante(idPasante);
            return pasante.Acuerdo == "Aceptado";
        }

        protected void lnbLogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("../../autentificación/index.aspx");
        }
    }
}