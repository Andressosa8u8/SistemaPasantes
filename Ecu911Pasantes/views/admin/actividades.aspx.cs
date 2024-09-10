using CapaDatos;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecu911Pasantes.views.admin
{
    public partial class actividades : System.Web.UI.Page
    {
        private DataClasses1DataContext dc = new DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }

        protected void lnbBuscar_Click(object sender, EventArgs e)
        {
            
        }
        //Metodo obtener cedula por numero de historia clinica
        [WebMethod]
        [ScriptMethod]
        public static List<string> ObtenerCedulaPasante(string prefixText)
        {
            List<string> lista = new List<string>();
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ToString());
                con.Open();
                SqlCommand cmd = new SqlCommand("select top(10) Cedula +' | '+ PrimerNombre +' '+ SegundoNombre +' '+ PrimerApellido +' '+ SegundoApellido from Tbl_Usuarios where Cedula LIKE + @Cedula + '%' and Tusu_id = 2 and Estado = 'A'", con);
                cmd.Parameters.AddWithValue("@Cedula", prefixText);
                SqlDataAdapter da = new SqlDataAdapter(cmd);

                IDataReader lector = cmd.ExecuteReader();

                while (lector.Read())
                {
                    lista.Add(lector.GetString(0));
                }

                lector.Close();
                return lista;
            }
            catch (Exception ex)
            {
                Console.Write(ex);
                return null;
            }
        }

        protected void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            var query = dc.Actividades(txtBuscar.Text);
            if (query != null)
            {
                grvActividades.DataSource = query.ToList();
                grvActividades.DataBind();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Éxito!', 'No existen datos en ese numero de cedula', 'danger')", true);
                txtBuscar.Text = "";
            }
        }
    }
}