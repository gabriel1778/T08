using System;
using System.Collections.Generic;
using System.Text;

namespace Repository.Model
{
    public class Usuario
    {
        private string nombre;
        private string login;
        private string password;
        private string claveinterna = "CLAV";


        public string Nombre
        {
            get
            {
                return nombre;
            }
            set
            {
                if (value.Length > 128)
                {
                    nombre = value.Substring(0, 128);
                }
                else
                {
                    nombre = value;
                }
            }
        }

        public bool isValidPassword(string s)
        {

            return s == SimEncrypt(password);

        }

        public string Login
        {
            get
            {
                return login;
            }
            set
            {
                if (value.Length > 20)
                    login = value.Substring(0, 20);
            }
        }

        public string Password
        {
            set
            {
                password = SimEncrypt(value);
            }

        }

        private string SimEncrypt(string password)
        {

            StringBuilder inSb = new StringBuilder(password);
            StringBuilder outSb = new StringBuilder(password.Length);

            char c;

            for (int i = 0; i < password.Length; i++)
            {
                c = inSb[i];
                c = (char)(c ^ (char)claveinterna[(i + 4) % 4]);
                outSb.Append(c);
            }

            return outSb.ToString();
        }
    }
}
