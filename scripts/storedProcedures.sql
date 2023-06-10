 USE db_GN;

DELIMITER //
CREATE PROCEDURE SP_BuscarMedicamentos (
    IN criterio VARCHAR(50)
)
BEGIN
    SELECT * FROM Medicamentos
    WHERE Nombre LIKE CONCAT('%', criterio, '%')
       OR Descripcion LIKE CONCAT('%', criterio, '%');
END //
DELIMITER ; 



DELIMITER //
CREATE PROCEDURE SP_BuscarProveedoresPorDireccion (
    IN criterio_pais VARCHAR(50),
    IN criterio_departamento VARCHAR(50)
)
BEGIN
    SELECT P.*
    FROM Proveedores P
    INNER JOIN Direccion D ON P.IDireccion = D.IDireccion
    WHERE D.Pais LIKE CONCAT('%', criterio_pais, '%')
        AND D.Departamento LIKE CONCAT('%', criterio_departamento, '%');
END;//
DELIMITER ;



DELIMITER //
CREATE PROCEDURE SP_ActualizarStock (
    IN medicamentoID INT,
    IN cantidad INT
)
BEGIN
    UPDATE Medicamentos
    SET CantidadStock = CantidadStock + cantidad
    WHERE IDMedicamento = medicamentoID;

    SELECT * FROM Medicamentos WHERE IDMedicamento = medicamentoID;
END;//
DELIMITER ;


DELIMITER //
CREATE PROCEDURE SP_ReporteVentas (
    IN fechaInicio DATE,
    IN fechaFin DATE
)
BEGIN
    SELECT *
    FROM Ventas
    WHERE FechaVenta BETWEEN fechaInicio AND fechaFin;
END;//
DELIMITER ;


DELIMITER //
CREATE PROCEDURE SP_RegistrarVenta (
    IN clienteID INT,
    IN medicamentoID INT,
    IN cantidad INT,
    IN IDVenta INT,
    IN IDDetalleVenta INT
)
BEGIN
    -- Insertar la venta en la tabla "Ventas"
    INSERT INTO Ventas (IDVenta, IDCliente, FechaVenta, TotalVenta)
    VALUES (IDVenta, clienteID, CURDATE(), 0); -- El campo "TotalVenta" se actualizará posteriormente

    -- Insertar los detalles de la venta en la tabla "DetalleVenta"
    INSERT INTO DetalleVenta (IDVenta, IDDetalleVenta, IDMedicamento, CantidadVendida)
    VALUES (IDVenta, IDDetalleVenta, medicamentoID, cantidad);

    -- Actualizar el stock del medicamento en la tabla "Medicamentos"
    UPDATE Medicamentos
    SET CantidadStock = CantidadStock - cantidad
    WHERE IDMedicamento = medicamentoID;

    -- Actualizar el total de la venta en la tabla "Ventas"
    UPDATE Ventas
    SET TotalVenta = (SELECT SUM(PrecioUnitario * CantidadVendida)
                      FROM DetalleVenta
                      WHERE IDVenta = IDVenta)
    WHERE IDVenta = IDVenta;
END;//
DELIMITER ;

