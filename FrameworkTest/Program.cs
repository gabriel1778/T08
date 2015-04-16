using System;
using System.Collections.Generic;
using System.Text;
using Repository.Model;




namespace FrameworkTest {
  class Program {
    static void Main(string[] args) {


        Console.Read();


        Demo de = new Demo();
        de.MyProperty1 = 7;
        Console.WriteLine(de.MyProperty1.ToString());


        Console.ReadKey();


    }
  }
}
