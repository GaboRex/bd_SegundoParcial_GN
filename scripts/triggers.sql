 USE db_GN;

 DELIMITER //

CREATE TRIGGER ActualizarStockDespuesDeCompra
AFTER INSERT ON DetalleCompra
FOR EACH ROW
BEGIN
  UPDATE Medicamentos
  SET CantidadStock = CantidadStock + NEW.CantidadComprada
  WHERE IDMedicamento = NEW.IDMedicamento;
END //

DELIMITER ;



 DELIMITER //
CREATE TRIGGER RegistrarFechaVenta
BEFORE INSERT ON Ventas
FOR EACH ROW
BEGIN
  SET NEW.FechaVenta = CURRENT_TIMESTAMP;
END;
//

DELIMITER ;


DELIMITER //

CREATE TRIGGER VerificarStockVenta
BEFORE INSERT ON DetalleVenta
FOR EACH ROW
BEGIN
  DECLARE stock_actual INT;
  SET stock_actual = (SELECT CantidadStock FROM Medicamentos WHERE IDMedicamento = NEW.IDMedicamento);
  IF NEW.CantidadVendida > stock_actual THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No hay suficiente stock para realizar la venta';
  END IF;
END//

DELIMITER ;


DELIMITER //
CREATE TRIGGER VerificarRolClienteVenta
BEFORE INSERT ON Ventas
FOR EACH ROW
BEGIN
  DECLARE cliente_rol VARCHAR(50);
  SET cliente_rol = (SELECT Rol FROM Clientes WHERE IDCliente = NEW.IDCliente);
  IF cliente_rol <> 'Vendedor' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El cliente no tiene permisos para realizar una venta';
  END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER ValidarStockMinimo_Insert
BEFORE INSERT ON Medicamentos
FOR EACH ROW
BEGIN
  DECLARE stock_minimo INT;
  SET stock_minimo = 10; -- Establecer el límite mínimo de stock deseado

  IF NEW.CantidadStock < stock_minimo THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Advertencia: El stock está por debajo del límite mínimo.';
  END IF;
END //

CREATE TRIGGER ValidarStockMinimo_Update
BEFORE UPDATE ON Medicamentos
FOR EACH ROW
BEGIN
  DECLARE stock_minimo INT;
  SET stock_minimo = 10; -- Establecer el límite mínimo de stock deseado

  IF NEW.CantidadStock < stock_minimo THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Advertencia: El stock esta por debajo del limite minimo.';
  END IF;
END //
DELIMITER ;




DELIMITER //
CREATE TRIGGER Audit_Clientes
AFTER INSERT ON Clientes
FOR EACH ROW
BEGIN
  INSERT INTO AuditoriaClientes (IDCliente, Nombre, Contrasena, Rol, Accion)
  VALUES (NEW.IDCliente, NEW.Nombre, NEW.Contrasena, NEW.Rol, 'INSERT');
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER Audit_Medicamentos
AFTER INSERT ON Medicamentos
FOR EACH ROW
BEGIN
  INSERT INTO AuditoriaMedicamentos (IDMedicamento, IDProveedor, Nombre, Descripcion, CantidadStock, FechaCaducidad, Accion)
  VALUES (NEW.IDMedicamento, NEW.IDProveedor, NEW.Nombre, NEW.Descripcion, NEW.CantidadStock, NEW.FechaCaducidad, 'INSERT');
END;//
DELIMITER ;


DELIMITER //
CREATE TRIGGER Audit_Proveedores
AFTER INSERT ON Proveedores
FOR EACH ROW
BEGIN
  INSERT INTO AuditoriaProveedores (IDProveedor, NombreProveedor, Direccion, NumeroTelefono, CorreoElectronico, Accion)
  VALUES (NEW.IDProveedor, NEW.NombreProveedor, NEW.Direccion, NEW.NumeroTelefono, NEW.CorreoElectronico, 'INSERT');
END;//
DELIMITER ;


DELIMITER //
CREATE TRIGGER Audit_Ventas
AFTER INSERT ON Ventas
FOR EACH ROW
BEGIN
  INSERT INTO AuditoriaVentas (IDVenta, IDCliente, FechaVenta, TotalVenta, Accion)
  VALUES (NEW.IDVenta, NEW.IDCliente, NEW.FechaVenta, NEW.TotalVenta, 'INSERT');
END;//
DELIMITER ;

DELIMITER //
CREATE TRIGGER Audit_Compras
AFTER INSERT ON Compras
FOR EACH ROW
BEGIN
  INSERT INTO AuditoriaCompras (IDCompra, IDProveedor, FechaCompra, TotalCompra, Accion)
  VALUES (NEW.IDCompra, NEW.IDProveedor, NEW.FechaCompra, NEW.TotalCompra, 'INSERT');
END;//
DELIMITER ;

