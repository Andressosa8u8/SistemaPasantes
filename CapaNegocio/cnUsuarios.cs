using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;

namespace CapaNegocio
{
    public class cnUsuarios
    {
        //Instanciamos el dbml
        private static DataClasses1DataContext dc = new DataClasses1DataContext();
        //metodo para verificar credenciales
        public static bool autentificar(string nombre, string pass)
        {
            var auto = dc.Tbl_Usuarios.Any(usu => usu.Estado == "A" && usu.Usuario.Equals(nombre) && usu.Password.Equals(pass));
            return auto;
        }

        //metodo para verificar si existe el usuario
        public static Tbl_Usuarios obtenerUsuariosxCedula(string cedula)
        {
            var usuced = dc.Tbl_Usuarios.FirstOrDefault(usu => usu.Cedula.Equals(cedula));
            return usuced;
        }

        //metodo para verificar si existe el nombre
        public static bool autentificarxCedula(string cedula)
        {
            var auto = dc.Tbl_Usuarios.Any(usu => usu.Cedula.Equals(cedula));
            return auto;
        }

        //metodo para verificar si existe el nombre de usuario
        public static Tbl_Usuarios obtenerUsuariosxNomUsuario(string nombre)
        {
            var usunom = dc.Tbl_Usuarios.FirstOrDefault(usu => usu.Usuario.Equals(nombre));
            return usunom;
        }
        //metodo para verificar si existe el nombre
        public static bool autentificarxNomUsuario(string nombre)
        {
            var auto = dc.Tbl_Usuarios.Any(usu => usu.Usuario.Equals(nombre));
            return auto;
        }
        //metodo para verificar si existe el nombre
        public static bool autentificarxNom(string nombre)
        {
            var auto = dc.Tbl_Usuarios.Any(usu => usu.Estado == "A" && usu.Usuario.Equals(nombre));
            return auto;
        }
        //metodo para traer el objeto
        public static Tbl_Usuarios autentificarxLogin(string nombre, string pass)
        {
            var nlogin = dc.Tbl_Usuarios.Single(usu => usu.Estado == "A" && usu.Usuario.Equals(nombre) && usu.Password.Equals(pass));
            return nlogin;
        }
        //metodo para obtener los usuarios por su id
        public static Tbl_Usuarios obtenerUsuariosxId(int id)
        {
            var respid = dc.Tbl_Usuarios.FirstOrDefault(usu => usu.Usu_id.Equals(id));
            return respid;
        }
        //Metodo para obtener contraseña anterior
        public static bool autentificarxUsuario(int usu, string pass)
        {
            var auto = dc.Tbl_Usuarios.Any(usup => usup.Estado == "A" && usup.Usu_id.Equals(usu) && usup.Password.Equals(pass));
            return auto;
        }
        //metodo para verificar si existe el correo
        public static bool autentificarxCorreo(string correo)
        {
            var auto = dc.Tbl_Usuarios.Any(usu => usu.Estado == "A" && usu.Correo == (correo));
            return auto;
        }
        //metodo para obtener el correo
        public static Tbl_Usuarios obtenerCorreo(string correo)
        {
            var contra = dc.Tbl_Usuarios.Single(usu => usu.Estado == "A" && usu.Correo.Equals(correo));
            return contra;
        }
        //Metodo para verificar codigo del pasante mediante la session
        public static bool autentificarxCodigo(int Usu, int ced)
        {
            var auto = dc.Tbl_Usuarios.Any(pasa => pasa.Usu_id.Equals(Usu) && pasa.Cedula.Equals(ced));
            return auto;
        }

        public static void save(Tbl_Usuarios usu)
        {
            try
            {
                usu.Estado = "A";
                dc.Tbl_Usuarios.InsertOnSubmit(usu);
                dc.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw new ArgumentException("Los datos no han sido guardados <br/>" + ex.Message);
            }
        }
        public static void modify(Tbl_Usuarios usu)
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
        public static void delete(Tbl_Usuarios usu)
        {
            try
            {
                usu.Estado = "I";
                dc.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw new ArgumentException("Los datos no han sido eliminados <br/>" + ex.Message);
            }
        }
        public static void change(Tbl_Usuarios usu)
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
    }
}
