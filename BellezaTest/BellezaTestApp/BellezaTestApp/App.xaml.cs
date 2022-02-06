using System;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using BellezaTestApp.Views;

namespace BellezaTestApp
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();

            MainPage = new NavigationPage(new ProductoPage());
        }

        protected override void OnStart()
        {
        }

        protected override void OnSleep()
        {
        }

        protected override void OnResume()
        {
        }
    }
}
