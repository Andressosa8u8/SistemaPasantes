using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class cnResponsables
    {
        //Instanciamos el dbml
        private static DataClasses1DataContext dc = new DataClasses1DataContext();
        
        //Metodo para obtener responsables por usuario
        public static Tbl_Responsable obtenerResponsablesxUsuario(int id)
        {
            var respid = dc.Tbl_Responsable.FirstOrDefault(resp => resp.Usu_id.Equals(id) && resp.Estado == "A" || resp.Estado == "I");
            return respid;
        }
        public static void save(Tbl_Responsable resp)
        {
            try
            {
                resp.Estado = "A";
                resp.Fecha = DateTime.Now;
                dc.Tbl_Responsable.InsertOnSubmit(resp);
                dc.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw new ArgumentException("Los datos no han sido guardados <br/>" + ex.Message);
            }
        }
        public static void Modify(Tbl_Responsable resp)
        {
            try
            {
                dc.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw new ArgumentException("Los datos no han sido modificados <br/>" + ex.Message);
            }
        }
        public static void delete(Tbl_Responsable resp)
        {
            try
            {
                resp.Estado = "I";
                dc.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw new ArgumentException("Los datos no han sido eliminados <br/>" + ex.Message);
            }
        }
    }
}
