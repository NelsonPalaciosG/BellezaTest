using System;
using System.Collections.Generic;
using System.Text;
using BellezaTestApp.Services;
using BellezaTestApp.Models;
using System.Collections.ObjectModel;
using Xamarin.Forms;
using System.Threading.Tasks;

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
