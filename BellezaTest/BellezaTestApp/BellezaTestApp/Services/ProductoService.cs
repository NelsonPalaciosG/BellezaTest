using BellezaTestApp.Models;
using System.Collections.ObjectModel;

namespace BellezaTestApp.Services
{
    public class ProductoService
    {
        public ObservableCollection<Producto> productos { get; set; }

        public ProductoService()
        {
            if (productos == null)
            {
                productos = new ObservableCollection<Producto>();
            }
        }

        public ObservableCollection<Producto> Consultar()
        {
            return productos;
        }

    }
}
