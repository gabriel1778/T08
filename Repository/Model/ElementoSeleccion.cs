using System;
using System.Collections.Generic;
using System.Text;

namespace Repository.Model
{
    public class ElementoSeleccion
    {
        private int idElementoSeleccion;
        private int idSeleccion;
        private string descripcion;

        public ElementoSeleccion(int idElementoSeleccion, int idSeleccion, string descripcion) 
        {
            this.idElementoSeleccion = idElementoSeleccion;
            this.idSeleccion = idSeleccion;
            if (descripcion.Length <= 255)
            {
                this.descripcion = descripcion;
            }
            else
            {
                this.descripcion = descripcion.Substring(0,255);
            }
        }

        public int IdElementoSeleccion
        {
            get
            {
                return this.idElementoSeleccion;
            }
            set
            {
                this.idElementoSeleccion = value;
            }
        }

        public int IdSeleccion
        {
            get 
            {
                return this.idSeleccion;
            }
            set
            {
                this.idSeleccion = value;
            }
        }

        public string Descripcion
        {
            get
            {
                return this.descripcion;
            }
            set
            {
                if (value.Length <= 255)
                {
                    this.descripcion = value;
                }
                else
                {
                    this.descripcion = value.Substring(0, 255);
                }
            }
        }


    }
}
