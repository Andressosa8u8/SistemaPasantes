using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class cnLabores
    {
        //Instanciamos el dbml
        private static DataClasses1DataContext dc = new DataClasses1DataContext();

        //metodo para retornar todos los usuarios
        public static List<Tbl_Labores> obtenerLabor()
        {
            var lista = dc.Tbl_Labores.Where(lab => lab.Estado == "A");
            return lista.ToList();
        }
        public static Tbl_Labores obtenerLaboresxId(int id)
        {
            var labid = dc.Tbl_Labores.FirstOrDefault(lab => lab.Labor_id.Equals(id) && lab.Estado == "A");
            return labid;
        }
        public static Tbl_Labores obtenerLaboresxNombre(string nombre)
        {
            var labnom = dc.Tbl_Labores.FirstOrDefault(lab => lab.ConceptoL.Equals(nombre) && lab.Estado == "A");
            return labnom;
        }
        //Metodo para obtener pasantes por usuario
        public static Tbl_Labores obtenerLaboresxPasante(int id)
        {
            var laborid = dc.Tbl_Labores.FirstOrDefault(labor => labor.Pasantes_id.Equals(id) && labor.Estado == "A");
            return laborid;
        }
        //metodo para verificar si existe el nombre
        public static bool autentificarxNom(string nombre)
        {
            var auto = dc.Tbl_Labores.Any(lab => lab.Estado == "A" && lab.ConceptoL == (nombre));
            return auto;
        }

        public static bool autentificarxPasante(int id)
        {
            var auto = dc.Tbl_Labores.Any(lab => lab.Estado == "A" && lab.Certificado == "A" && lab.Pasantes_id.Equals(id));
            return auto;
        }
        public static void save(Tbl_Labores lab)
        {
            try
            {
                lab.Estado = "A";
                lab.Certificado = "P";
                dc.Tbl_Labores.InsertOnSubmit(lab);
                dc.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw new ArgumentException("Los datos no han sido guardados <br/>" + ex.Message);
            }
        }

        public static void modify(Tbl_Labores lab)
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
        public static void delete(Tbl_Labores lab)
        {
            try
            {
                lab.Estado = "I";
                dc.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw new ArgumentException("Los datos no han sido eliminados <br/>" + ex.Message);
            }
        }
        public static void authorize(Tbl_Labores lab)
        {
            try
            {
                lab.Certificado = "A";
                dc.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw new ArgumentException("El certificado no ha sido autorizado <br/>" + ex.Message);
            }
        }
    }
}
