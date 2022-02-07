using BellezaTestApp.Models;
using BellezaTestApp.Services;
using System.Collections.ObjectModel;

namespace BellezaTestApp.ViewModels
{
    public class ProductoViewModel : Producto
    {
        public ObservableCollection<Producto> Productos { get; set; }

        ProductoService service = new ProductoService();

        Producto modelo;

        public ProductoViewModel()
        {
            Productos = service.Consultar();
        }
    }
}
