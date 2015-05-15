using System;
using System.Collections.Generic;
using System.Text;

namespace Repository.Model
{
   
    public class TipoEncuesta
    {
        private int idTipoEncuesta;

        public int IdTipoEncuesta
        {
            get
            {
                return idTipoEncuesta;
            }
            set
            {
                idTipoEncuesta = value;
            }
        }

        private string nombreEncuesta;

        public string NombreEncuesta
        {
            get
            {
                return nombreEncuesta;
            }
            set
            {
                if (value.Length < 128)
                {
                    nombreEncuesta = value;
                }
            }
        }
    }
}
