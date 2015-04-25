﻿using System;
using System.Collections.Generic;
using System.Text;

namespace Repository.Model
{
    public class Usuario
    {
        private string nombre;
        private string login;
        private string password;
        private string ClaveInterna = "skyn";



        public string Nombre
        {
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
            get { return nombre; }
        }

        public string Login
        {
            set
            {
                if (value.Length > 20)
                {
                    login = value.Substring(0, 20);
                }
                else
                {
                    login = value;
                }
            }
            get { return login; }
        }

        public string Password
        {
            set
            {
                if (value.Length > 20)
                {
                    password = value.Substring(0, 20);
                }
                else
                {
                    password = value;
                }

                password = SimEncrypt(password);
            }
            
        }
       





        public bool isvalidpassword(string s)
        {
           
            if (s==SimEncrypt( password ))
             return true;
            else return false;
       }


       private string SimEncrypt(string password)
       {

        StringBuilder inSb = new StringBuilder(password);
        StringBuilder outSb = new StringBuilder(password.Length);

        char c;

        for (int i = 0; i < password.Length; i++)
        {
            c = inSb[i];
                c = (char)(c ^ (char)ClaveInterna[(i+4)%4]);
            outSb.Append(c);

      }

       return outSb.ToString();
   }





    }
    
    
}
