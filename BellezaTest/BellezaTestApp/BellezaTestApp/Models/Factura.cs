using System;
using System.Collections.Generic;
using System.Text;

namespace BellezaTestApp.Models
{
    public class Factura
    {
        public int Id { get; set; }

        public decimal Valor { get; set; }

        public DateTime FechaVenta { get; set; }

    }
}
