using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class cnCarrera
    {
        private static DataClasses1DataContext dc = new DataClasses1DataContext();

        //metodo para obtener las carreras por su id
        public static Tbl_Carrera obtenerCarrerasxId(int id)
        {
            var carreid = dc.Tbl_Carrera.FirstOrDefault(carre => carre.Carre_id.Equals(id));
            return carreid;
        }

        //metodo para verificar si existe la carrera
        public static bool autentificarxNomCarrera(string nombre)
        {
            var auto = dc.Tbl_Carrera.Any(carre => carre.Carre_nombre.Equals(nombre));
            return auto;
        }

        //metodo para verificar si existe el nombre de carrera
        public static Tbl_Carrera obtenerCarreraxNomCarrera(string nombre)
        {
            var carrenom = dc.Tbl_Carrera.FirstOrDefault(carre => carre.Carre_nombre.Equals(nombre));
            return carrenom;
        }

        public static void save(Tbl_Carrera carre)
        {
            try
            {
                carre.Carre_estado = 'A';
                dc.Tbl_Carrera.InsertOnSubmit(carre);
                dc.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw new ArgumentException("Los datos no han sido guardados <br/>" + ex.Message);
            }
        }

        public static void modify(Tbl_Carrera carre)
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

        public static void delete(Tbl_Carrera carre)
        {
            try
            {
                dc.Tbl_Carrera.DeleteOnSubmit(carre);
                dc.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw new ArgumentException("Los datos no han sido eliminados <br/>" + ex.Message);
            }
        }

    }
}
