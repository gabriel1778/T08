using System;
using System.Collections.Generic;
using System.Text;

namespace Repository.Model
{
    public class Seleccion
    {
        private int idSeleccion = 0;
        private string descripcion = "Seleccion sin Descripcion valida";

        public Seleccion(int idSeleccion, string descripcion)
        {
            this.idSeleccion = idSeleccion;
            if (descripcion.Length < 256)
            {
                this.descripcion = descripcion;
            }
        }

        public int IdSeleccion
        {
            get
            {
                return idSeleccion;
            }
            set
            {
                idSeleccion = value;

            }
            
        }
        public string Descripcion
        {
            get
            {
                return descripcion;

            }
            set
            {
                if (value.Length < 256)
                {
                    descripcion = value.Substring(0, 255);
                    
                }
                    
            }
        
        }
    }
}
