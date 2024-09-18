using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class cnArea
    {
        private static DataClasses1DataContext dc = new DataClasses1DataContext();

        //metodo para obtener las areas por su id
        public static Tbl_Area obtenerAreasxId(int id)
        {
            var areaid = dc.Tbl_Area.FirstOrDefault(area => area.Area_id.Equals(id));
            return areaid;
        }

        //metodo para verificar si existe la universidad
        public static bool autentificarxNomArea(string nombre)
        {
            var auto = dc.Tbl_Area.Any(area => area.Area_nombre.Equals(nombre));
            return auto;
        }

        //metodo para verificar si existe el nombre de universidad
        public static Tbl_Area obtenerAreaxNomArea(string nombre)
        {
            var areanom = dc.Tbl_Area.FirstOrDefault(area => area.Area_nombre.Equals(nombre));
            return areanom;
        }

        public static void save(Tbl_Area area)
        {
            try
            {
                area.Area_estado = 'A';
                dc.Tbl_Area.InsertOnSubmit(area);
                dc.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw new ArgumentException("Los datos no han sido guardados <br/>" + ex.Message);
            }
        }

        public static void modify(Tbl_Area area)
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

        public static void delete(Tbl_Area area)
        {
            try
            {
                dc.Tbl_Area.DeleteOnSubmit(area);
                dc.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw new ArgumentException("Los datos no han sido eliminados <br/>" + ex.Message);
            }
        }
    }
}
