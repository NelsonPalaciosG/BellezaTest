USE Belleza
GO

CREATE TABLE Tienda (
  Id INT IDENTITY(1,1)  PRIMARY KEY NOT NULL,
  Nombre VARCHAR (50) NOT NULL,
  Descripcion VARCHAR(200),
  Direccion VARCHAR(50) NOT NULL
)
SET IDENTITY_INSERT Tienda ON
INSERT INTO Tienda (Id, Nombre, Descripcion, Direccion) VALUES ( 1, 'Belleza', 'Tienda dedicada a la distribución de productos para la belleza femenina','CR 45 A 63 B 86')
SET IDENTITY_INSERT Tienda OFF
GO

CREATE TABLE Departamento_Venta (
  Id int IDENTITY(10,10) NOT NULL,
  Descripcion VARCHAR(50) NOT NULL,
  IdTienda INT FOREIGN KEY REFERENCES Tienda (Id),
  PRIMARY KEY(Id,IdTienda)
)
SET IDENTITY_INSERT Departamento_Venta ON
INSERT INTO Departamento_Venta (Id, Descripcion, IdTienda) VALUES ( 10, 'Sección de maquillaje para mujer', 1);
INSERT INTO Departamento_Venta (Id, Descripcion, IdTienda) VALUES ( 20, 'Sección de Aseo', 1);
INSERT INTO Departamento_Venta (Id, Descripcion, IdTienda) VALUES ( 30, 'Sección de Accesorios', 1);
INSERT INTO Departamento_Venta (Id, Descripcion, IdTienda) VALUES ( 40, 'Sección de tratamientos capilares', 1);
SET IDENTITY_INSERT Departamento_Venta OFF
GO

CREATE TABLE Producto (
  Id int IDENTITY(100,100) PRIMARY KEY NOT NULL,
  Descripcion VARCHAR(50) NOT NULL,
  PrecioVenta DECIMAL(19,2) NOT NULL,
  Color VARCHAR(50) NOT NULL ,
  IdTienda INT NOT NULL,
  IdDepartamento_Venta INT NOT NULL,
  CONSTRAINT FK_IdDepartamento_Venta FOREIGN KEY (IdDepartamento_Venta, IdTienda) REFERENCES Departamento_Venta(Id, IdTienda)
)
SET IDENTITY_INSERT Producto ON
INSERT INTO Producto (Id, Descripcion, PrecioVenta, Color, IdTienda, IdDepartamento_Venta) VALUES ( 100, 'Pestanina', 15200.00, 'Azul intenso', 1 , 10);
INSERT INTO Producto (Id, Descripcion, PrecioVenta, Color, IdTienda, IdDepartamento_Venta) VALUES ( 200, 'Pestanina', 16200.00, 'Turquesa', 1 , 10);
INSERT INTO Producto (Id, Descripcion, PrecioVenta, Color, IdTienda, IdDepartamento_Venta) VALUES ( 300, 'Pestanina', 15800.00, 'Negro', 1 , 10);
INSERT INTO Producto (Id, Descripcion, PrecioVenta, Color, IdTienda, IdDepartamento_Venta) VALUES ( 400, 'Desodorante', 10500.00, 'N/A', 1 , 20);
INSERT INTO Producto (Id, Descripcion, PrecioVenta, Color, IdTienda, IdDepartamento_Venta) VALUES ( 500, 'Talco', 25000.00, 'N/A', 1 , 20);
INSERT INTO Producto (Id, Descripcion, PrecioVenta, Color, IdTienda, IdDepartamento_Venta) VALUES ( 600, 'Pendientes mariposa', 7500.00, 'Plateado', 1 , 30);
INSERT INTO Producto (Id, Descripcion, PrecioVenta, Color, IdTienda, IdDepartamento_Venta) VALUES ( 700, 'Tratamiento de aguacate', 27000.00, 'Verde', 1 , 40);
INSERT INTO Producto (Id, Descripcion, PrecioVenta, Color, IdTienda, IdDepartamento_Venta) VALUES ( 800, 'Biotina', 50000.00, 'N/A', 1 , 40);
SET IDENTITY_INSERT Producto OFF
GO

CREATE TABLE Inventario (
  Id int IDENTITY(1,1) NOT NULL,
  Cantidad FLOAT NOT NULL,
  IdProducto INT FOREIGN KEY REFERENCES Producto (Id),
  PRIMARY KEY(Id,IdProducto)
)
SET IDENTITY_INSERT Inventario ON
INSERT INTO Inventario (Id, Cantidad, IdProducto) VALUES ( 1, 2, 100);
INSERT INTO Inventario (Id, Cantidad, IdProducto) VALUES ( 2, 5, 200);
INSERT INTO Inventario (Id, Cantidad, IdProducto) VALUES ( 3, 1, 400);
INSERT INTO Inventario (Id, Cantidad, IdProducto) VALUES ( 4, 6, 400);
INSERT INTO Inventario (Id, Cantidad, IdProducto) VALUES ( 5, 6, 500);
INSERT INTO Inventario (Id, Cantidad, IdProducto) VALUES ( 6, 10, 600);
INSERT INTO Inventario (Id, Cantidad, IdProducto) VALUES ( 7, 4, 800);
SET IDENTITY_INSERT Inventario OFF
GO

CREATE TABLE Cliente (
  Id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
  Cedula INT NOT NULL,
  Nombre VARCHAR(50) NOT NULL,
  Direccion VARCHAR(50) NOT NULL
)
SET IDENTITY_INSERT Cliente ON
INSERT INTO Cliente (Id, Cedula, Nombre, Direccion) VALUES ( 1, 1026146087, 'Pedro Cifuentes','CR 25 A 61 B 87');
INSERT INTO Cliente (Id, Cedula, Nombre, Direccion) VALUES ( 2, 1118546328, 'Arturo Zapata','CL 36 21 C 65');
INSERT INTO Cliente (Id, Cedula, Nombre, Direccion) VALUES ( 3, 32352089, 'Zamandulio Agudelo','CR 70 A 101 B 24');
SET IDENTITY_INSERT Cliente OFF
GO

CREATE TABLE TelefonoCliente (
  Telefono VARCHAR(15) NOT NULL,
  IdCliente INT  FOREIGN KEY REFERENCES Cliente (Id),
  PRIMARY KEY(IdCliente,Telefono)
)
INSERT INTO TelefonoCliente (Telefono, IdCliente) VALUES ('3006894455',1);
INSERT INTO TelefonoCliente (Telefono, IdCliente) VALUES ('3006898955',1);
INSERT INTO TelefonoCliente (Telefono, IdCliente) VALUES ('3006793525',2);
INSERT INTO TelefonoCliente (Telefono, IdCliente) VALUES ('3006894455',3);

CREATE TABLE Factura (
  Id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
  Valor DECIMAL(19,2) NOT NULL,
  FechaVenta DATETIME NOT NULL,
  IdCliente INT FOREIGN KEY REFERENCES Cliente (Id)
)
SET IDENTITY_INSERT Factura ON
INSERT INTO Factura (Id, Valor, FechaVenta, IdCliente) VALUES ( 1, 17500.00, 2000-01-25, 1);
INSERT INTO Factura (Id, Valor, FechaVenta, IdCliente) VALUES ( 2, 85000.00, 2000-01-25, 2);
INSERT INTO Factura (Id, Valor, FechaVenta, IdCliente) VALUES ( 3, 101200.00, 2000-01-25, 3);
INSERT INTO Factura (Id, Valor, FechaVenta, IdCliente) VALUES ( 4, 7500.00, 2000-01-23, 1);
SET IDENTITY_INSERT Factura OFF
GO

CREATE TABLE DetalleFactura (
  Id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
  Cantidad FLOAT NOT NULL,
  IdFactura INT FOREIGN KEY REFERENCES Factura (Id) ,
  IdProducto INT FOREIGN KEY REFERENCES Producto (Id) 
)
SET IDENTITY_INSERT DetalleFactura ON
INSERT INTO DetalleFactura (Id, Cantidad, IdFactura, IdProducto) VALUES ( 1, 5, 1, 100);
INSERT INTO DetalleFactura (Id, Cantidad, IdFactura, IdProducto) VALUES ( 2, 5, 2, 200);
INSERT INTO DetalleFactura (Id, Cantidad, IdFactura, IdProducto) VALUES ( 3, 5, 3, 300);
INSERT INTO DetalleFactura (Id, Cantidad, IdFactura, IdProducto) VALUES ( 4, 5, 4, 600);
SET IDENTITY_INSERT DetalleFactura OFF
GO

SELECT c.Cedula, c.Nombre,f.Id AS Numero_Factura, p.Descripcion AS Producto, dv.Descripcion AS Departamento_Tienda
FROM Departamento_Venta dv 
INNER JOIN Producto p ON dv.Id = p.IdDepartamento_Venta AND dv.IdTienda = p.IdTienda
INNER JOIN DetalleFactura df ON p.Id = df.IdProducto
INNER JOIN Factura f ON f.Id = df.IdFactura
INNER JOIN Cliente c ON c.Id = f.IdCliente
ORDER BY c.Cedula