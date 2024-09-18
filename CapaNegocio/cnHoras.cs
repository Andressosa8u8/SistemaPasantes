using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class cnHoras
    {
        //Instanciamos el dbml
        private static DataClasses1DataContext dc = new DataClasses1DataContext();

        //metodo para retornar todos los usuarios
        public static List<Tbl_Horas> obtenerHoras()
        {
            var lista = dc.Tbl_Horas.Where(hor => hor.Estado == "A" || hor.Estado == "P");
            return lista.ToList();
        }
        public static Tbl_Horas obtenerHorasxId(int id)
        {
            var Horid = dc.Tbl_Horas.FirstOrDefault(Hor => Hor.Horas_id.Equals(id) && Hor.Estado == "A" || Hor.Estado == "P");
            return Horid;
        }

        public static void save(Tbl_Horas Hor)
        {
            try
            {
                Hor.Estado = "P";
                Hor.Fecha = DateTime.Now;
                dc.Tbl_Horas.InsertOnSubmit(Hor);
                dc.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw new ArgumentException("Los datos no han sido guardados <br/>" + ex.Message);
            }
        }

        public static void modify(Tbl_Horas Hor)
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
        public static void delete(Tbl_Horas Hor)
        {
            try
            {
                Hor.Estado = "I";
                dc.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw new ArgumentException("Los datos no han sido eliminados <br/>" + ex.Message);
            }
        }
        public static void status(Tbl_Horas Hor)
        {
            try
            {
                Hor.Estado = "A";
                dc.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw new ArgumentException("El estado no ha sido actualizado <br/>" + ex.Message);
            }
        }
    }
}
