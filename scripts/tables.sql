 USE db_GN;

CREATE TABLE Clientes (
  IDCliente INT PRIMARY KEY,
  Nombre VARCHAR(50),
  Contrasena VARCHAR(50),
  Rol VARCHAR(50)
);

CREATE TABLE Direccion (
  IDireccion INT PRIMARY KEY,
  Pais VARCHAR(50),
  Departamento VARCHAR(50)
);

CREATE TABLE Proveedores (
  IDProveedor INT PRIMARY KEY,
  NombreProveedor VARCHAR(100),
  NumeroTelefono VARCHAR(20),
  CorreoElectronico VARCHAR(100),
  IDireccion INT,
  FOREIGN KEY (IDireccion) REFERENCES Direccion(IDireccion)
);


CREATE TABLE Marcas (
  IDMarca INT PRIMARY KEY,
  NombreMarca VARCHAR(100),
  Descripcion VARCHAR(255)
);

CREATE TABLE Medicamentos (
  IDMedicamento INT PRIMARY KEY,
  IDProveedor INT,
  Nombre VARCHAR(100),
  Descripcion VARCHAR(255),
  CantidadStock INT,
  FechaCaducidad DATE,
  IDMarca INT,
  FOREIGN KEY (IDMarca) REFERENCES Marcas(IDMarca),
  FOREIGN KEY (IDProveedor) REFERENCES Proveedores(IDProveedor)
  
);


CREATE TABLE Compras (
  IDCompra INT PRIMARY KEY,
  IDProveedor INT,
  FechaCompra DATE,
  TotalCompra DECIMAL(10, 2),
  FOREIGN KEY (IDProveedor) REFERENCES Proveedores(IDProveedor)
);



CREATE TABLE DetalleCompra (
  IDDetalleCompra INT PRIMARY KEY,
  IDCompra INT,
  IDMedicamento INT,
  CantidadComprada INT,
  PrecioUnitario DECIMAL(10, 2),
  FOREIGN KEY (IDCompra) REFERENCES Compras(IDCompra),
  FOREIGN KEY (IDMedicamento) REFERENCES Medicamentos(IDMedicamento)
);


CREATE TABLE Ventas (
  IDVenta INT PRIMARY KEY,
  IDCliente INT,
  FechaVenta DATE,
  TotalVenta DECIMAL(10, 2),
  FOREIGN KEY (IDCliente) REFERENCES Clientes(IDCliente)
);


CREATE TABLE DetalleVenta (
  IDDetalleVenta INT PRIMARY KEY,
  IDVenta INT,
  IDMedicamento INT,
  CantidadVendida INT,
  PrecioUnitario DECIMAL(10, 2),
  FOREIGN KEY (IDVenta) REFERENCES Ventas(IDVenta),
  FOREIGN KEY (IDMedicamento) REFERENCES Medicamentos(IDMedicamento)
);



CREATE TABLE MovimientosInventario (
  IDMovimiento INT PRIMARY KEY,
  TipoMovimiento VARCHAR(20),
  IDMedicamento INT,
  Cantidad INT,
  FechaMovimiento DATE,
  FOREIGN KEY (IDMedicamento) REFERENCES Medicamentos(IDMedicamento)
);


CREATE TABLE Almacenes (
  IDAlmacen INT PRIMARY KEY,
  NombreAlmacen VARCHAR(100),
  IDMedicamento INT,
  IDMovimiento INT,
  FOREIGN KEY (IDMedicamento) REFERENCES Medicamentos(IDMedicamento),
  FOREIGN KEY (IDMovimiento) REFERENCES MovimientosInventario(IDMovimiento)
);


INSERT INTO Clientes(IDCliente, Nombre, Contrasena, Rol)
VALUES (1, 'Cristiano Ronaldo', '123456', 'Administrador');
INSERT INTO Clientes(IDCliente, Nombre, Contrasena, Rol)
VALUES (2, 'Lionel Messi', '2468', 'Vendedor');
INSERT INTO Clientes(IDCliente, Nombre, Contrasena, Rol)
VALUES (3, 'Ronaldo Nazario', '2222', 'Vendedor');
INSERT INTO Clientes(IDCliente, Nombre, Contrasena, Rol)
VALUES (4, 'Zinedine Zidane', '6666', 'Cliente VIP');


INSERT INTO Direccion (IDireccion, Pais, Departamento)
VALUES (1, 'Bolivia', 'Santa Cruz');
INSERT INTO Direccion (IDireccion, Pais, Departamento)
VALUES (2, 'Argentina', 'Buenos Aires');
INSERT INTO Direccion (IDireccion, Pais, Departamento)
VALUES (3, 'Peru', 'Lima');
INSERT INTO Direccion (IDireccion, Pais, Departamento)
VALUES (4, 'Bolivia', 'Tarija');


INSERT INTO Proveedores (IDProveedor, NombreProveedor, NumeroTelefono, CorreoElectronico,IDireccion)
VALUES (1, 'Bago', '123456789', 'b@gmail.com',1);
INSERT INTO Proveedores (IDProveedor, NombreProveedor, NumeroTelefono, CorreoElectronico,IDireccion)
VALUES (2, 'FarmaCorp', '24680', 'f@gmail.com',2);
INSERT INTO Proveedores (IDProveedor, NombreProveedor, NumeroTelefono, CorreoElectronico,IDireccion)
VALUES (3, 'Vita',  '123456789', 'v@gmail.com',3);
INSERT INTO Proveedores (IDProveedor, NombreProveedor, NumeroTelefono, CorreoElectronico,IDireccion)
VALUES (4, 'Alfa', '123456789', 'rico@gmail.com',4);


INSERT INTO Marcas (IDMarca, NombreMarca, Descripcion)
VALUES(1, 'Laboratorio Chibolo', 'Descripción de la Marca A');
INSERT INTO Marcas (IDMarca, NombreMarca, Descripcion)
VALUES(2, 'Laboratorio Delta', 'Descripción de la Marca B');
INSERT INTO Marcas (IDMarca, NombreMarca, Descripcion)
VALUES(3, 'Laboratorio Uf', 'Descripción de la Marca C');
INSERT INTO Marcas (IDMarca, NombreMarca, Descripcion)
VALUES(4, 'Laboratorio Vick', 'Descripción de la Marca D');


INSERT INTO Medicamentos (IDMedicamento, IDProveedor, IDMarca, Nombre, Descripcion, CantidadStock, FechaCaducidad)
VALUES (1, 1, 1, 'Bill 13', 'Para el dolor de pancita', 150, '2023-12-31');
INSERT INTO Medicamentos (IDMedicamento, IDProveedor, IDMarca, Nombre, Descripcion, CantidadStock, FechaCaducidad)
VALUES (2, 1, 1, 'Ibuprofeno', 'Dolor general, resfrio', 250, '2024-12-31');
INSERT INTO Medicamentos (IDMedicamento, IDProveedor, IDMarca, Nombre, Descripcion, CantidadStock, FechaCaducidad)
VALUES (3, 1, 1, 'Viadil', 'Dolor estomago', 100, '2025-12-31');
INSERT INTO Medicamentos (IDMedicamento, IDProveedor, IDMarca, Nombre, Descripcion, CantidadStock, FechaCaducidad)
VALUES (4, 1, 1, 'Refrianex', 'Resfrio', 500, '2026-12-31');

INSERT INTO Compras (IDCompra, IDProveedor, FechaCompra, TotalCompra)
VALUES (1, 1, '2023-05-15', 500.00);

INSERT INTO DetalleCompra (IDDetalleCompra, IDCompra, IDMedicamento, CantidadComprada, PrecioUnitario)
VALUES (1, 1, 1, 100, 5.00);

INSERT INTO Ventas (IDVenta, IDCliente, FechaVenta, TotalVenta)
VALUES (1, 1, '2023-04-20', 200.00);

INSERT INTO Ventas (IDVenta, IDCliente, FechaVenta, TotalVenta)
VALUES (2, 2, '2023-05-20', 500.00);

INSERT INTO Ventas (IDVenta, IDCliente, FechaVenta, TotalVenta)
VALUES (3, 2, '2023-06-20', 500.00);

INSERT INTO DetalleVenta (IDDetalleVenta, IDVenta, IDMedicamento, CantidadVendida, PrecioUnitario)
VALUES (1, 1, 1, 20, 10.00);
INSERT INTO DetalleVenta (IDDetalleVenta, IDVenta, IDMedicamento, CantidadVendida, PrecioUnitario)
VALUES (2, 2, 2, 100, 10.00);

INSERT INTO MovimientosInventario (IDMovimiento, TipoMovimiento, IDMedicamento, Cantidad, FechaMovimiento)
VALUES (1, 'entrada', 1, 50, '2023-05-22');
INSERT INTO MovimientosInventario (IDMovimiento, TipoMovimiento, IDMedicamento, Cantidad, FechaMovimiento)
VALUES (2, 'salida', 1, 100, '2024-05-22');

INSERT INTO Almacenes (IDAlmacen, NombreAlmacen, IDMedicamento, IDMovimiento)
VALUES(1, 'Almacén A', 1, 1);
INSERT INTO Almacenes (IDAlmacen, NombreAlmacen, IDMedicamento, IDMovimiento)
VALUES(2, 'Almacén B', 2, 2);


 /*Auditoria*/

  
 CREATE TABLE AuditoriaClientes (
  IDAuditoria INT PRIMARY KEY AUTO_INCREMENT,
  IDCliente INT,
  Nombre VARCHAR(50),
  Contrasena VARCHAR(50),
  Rol VARCHAR(50),
  Accion VARCHAR(20),
  FechaAccion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE AuditoriaProveedores (
  IDAuditoria INT PRIMARY KEY AUTO_INCREMENT,
  IDProveedor INT,
  NombreProveedor VARCHAR(50),
  NumeroTelefono VARCHAR(15),
  CorreoElectronico VARCHAR(50),
  Accion VARCHAR(20),
  FechaAccion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE AuditoriaMedicamentos (
  IDAuditoria INT PRIMARY KEY AUTO_INCREMENT,
  IDMedicamento INT,
  IDProveedor INT,
  Nombre VARCHAR(50),
  Descripcion VARCHAR(100),
  CantidadStock INT,
  FechaCaducidad DATE,
  Accion VARCHAR(20),
  FechaAccion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE AuditoriaVentas (
  IDAuditoria INT PRIMARY KEY AUTO_INCREMENT,
  IDVenta INT,
  IDCliente INT,
  FechaVenta DATE,
  TotalVenta DECIMAL(10, 2),
  Accion VARCHAR(20),
  FechaAccion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE AuditoriaCompras (
  IDAuditoria INT PRIMARY KEY AUTO_INCREMENT,
  IDCompra INT,
  IDProveedor INT,
  FechaCompra DATE,
  TotalCompra DECIMAL(10, 2),
  Accion VARCHAR(20),
  FechaAccion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


 /*Indices*/
/*1*/
 CREATE INDEX idx_Medicamentos_IDProveedor ON Medicamentos(IDProveedor);

/*2*/
CREATE INDEX idx_Medicamentos_Nombre ON Medicamentos(Nombre);
CREATE INDEX idx_Almacenes_IDMovimiento ON Almacenes(IDMovimiento);

/*3*/
/*Indice simple*/
CREATE INDEX idx_Clientes_Rol ON Clientes(Rol);
/*Indice compuesto*/
CREATE INDEX idx_DetalleVenta_IDVenta_Medicamento ON DetalleVenta(IDVenta, IDMedicamento);

/*4*/
/*Indice simple*/

CREATE INDEX idx_Medicamentos_CantidadStock ON Medicamentos(CantidadStock);
CREATE INDEX idx_MovimientosInventario_TipoMovimiento ON MovimientosInventario(TipoMovimiento);
CREATE INDEX idx_Almacenes_IDMedicamento ON Almacenes(IDMedicamento);

/*CREATE INDEX idx_Almacenes_IDMovimiento ON Almacenes(IDMovimiento);*/

/*5*/
/*Indices compuestos*/
/*CREATE INDEX idx_DetalleVenta_IDVenta_Medicamento ON DetalleVenta(IDVenta, IDMedicamento);*/
CREATE INDEX idx_Clientes_Nombre_IDCliente ON Clientes(Nombre, IDCliente);
CREATE INDEX idx_Ventas_IDCliente_IDVenta ON Ventas(IDCliente, IDVenta);
/*Indices simples*/
CREATE INDEX idx_Clientes_Nombre ON Clientes(Nombre);
CREATE INDEX idx_Medicamentos_IDMedicamento ON Medicamentos(IDMedicamento);