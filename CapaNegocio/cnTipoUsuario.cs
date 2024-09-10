using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class cnTipoUsuario
    {
        //Instanciamos el dbml
        private static DataClasses1DataContext dc = new DataClasses1DataContext();

        //Metodo para obtener responsables por usuario
        public static Tbl_TipoUsuario obtenerTusuarioxUsuario(int id)
        {
            var tpuid = dc.Tbl_TipoUsuario.FirstOrDefault(tip => tip.Tusu_id.Equals(id) && tip.Estado == "A");
            return tpuid;
        }
    }
}
