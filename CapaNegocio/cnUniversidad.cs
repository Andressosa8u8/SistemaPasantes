using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class cnUniversidad
    {
        private static DataClasses1DataContext dc = new DataClasses1DataContext();

        //metodo para obtener los universidad por su id
        public static Tbl_Universidad obtenerUniversidadxId(int id)
        {
            var uniid = dc.Tbl_Universidad.FirstOrDefault(uni => uni.Uni_id.Equals(id));
            return uniid;
        }

        //metodo para verificar si existe la universidad
        public static bool autentificarxNomUniversidad(string nombre)
        {
            var auto = dc.Tbl_Universidad.Any(usu => usu.Uni_nombre.Equals(nombre));
            return auto;
        }

        //metodo para verificar si existe el nombre de universidad
        public static Tbl_Universidad obtenerUniversidadxNomUniversidad(string nombre)
        {
            var uninom = dc.Tbl_Universidad.FirstOrDefault(usu => usu.Uni_nombre.Equals(nombre));
            return uninom;
        }
        public static void save(Tbl_Universidad uni)
        {
            try
            {
                uni.Uni_estado = 'A';
                dc.Tbl_Universidad.InsertOnSubmit(uni);
                dc.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw new ArgumentException("Los datos no han sido guardados <br/>" + ex.Message);
            }
        }

        public static void modify(Tbl_Universidad uni)
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

        public static void delete(Tbl_Universidad uni)
        {
            try
            {
                uni.Uni_estado = 'I';
                dc.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw new ArgumentException("Los datos no han sido eliminados <br/>" + ex.Message);
            }
        }

    }
}
