using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class cnCargos
    {
        private static DataClasses1DataContext dc = new DataClasses1DataContext();
        //metodo para obtener los cargo por su id
        public static Tbl_Cargo obtenerCargoxId(int id)
        {
            var carid = dc.Tbl_Cargo.FirstOrDefault(car => car.Cargo_id.Equals(id));
            return carid;
        }

        //metodo para verificar si existe el cargo
        public static bool autentificarxNomCargo(string nombre)
        {
            var auto = dc.Tbl_Cargo.Any(car => car.Cargo_nombre.Equals(nombre));
            return auto;
        }

        //metodo para verificar si existe el nombre de cargo
        public static Tbl_Cargo obtenerCargoxNomCargo(string nombre)
        {
            var carnom = dc.Tbl_Cargo.FirstOrDefault(car => car.Cargo_nombre.Equals(nombre));
            return carnom;
        }

        public static void save(Tbl_Cargo car)
        {
            try
            {
                car.Cargo_estado = 'A';
                dc.Tbl_Cargo.InsertOnSubmit(car);
                dc.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw new ArgumentException("Los datos no han sido guardados <br/>" + ex.Message);
            }
        }

        public static void modify(Tbl_Cargo car)
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

        public static void delete(Tbl_Cargo car)
        {
            try
            {
                dc.Tbl_Cargo.DeleteOnSubmit(car);
                dc.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw new ArgumentException("Los datos no han sido eliminados <br/>" + ex.Message);
            }
        }
    }
}
