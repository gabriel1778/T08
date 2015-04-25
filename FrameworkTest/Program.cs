using System;
using System.Collections.Generic;
using System.Text;
using Repository.Model;




namespace FrameworkTest {
  class Program {
    static void Main(string[] args) {


        Console.Read();

 
        Usuario u = new Usuario();
        u.Login = "abc";
        u.Password = "abc";
        u.Nombre = "dsadas";

        if (u.isvalidpassword("aaa") == true) {
            Console.WriteLine("ERROR!");
        }


        if (u.isvalidpassword("abc") == false) {
            Console.WriteLine("ERROR!");
        }
 
        Console.ReadKey();


    }
  }
}
