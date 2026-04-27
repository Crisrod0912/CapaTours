CREATE PROCEDURE PagarReserva
    @ReservaID INT,
    @Comprobante NVARCHAR(MAX),
    @Monto DECIMAL(10,2),
    @CantidadPersonas INT
AS
BEGIN
    INSERT INTO Pagos (ReservaID, Comprobante, Monto, Fecha)
    VALUES (@ReservaID, @Comprobante, @Monto, GETDATE());

    UPDATE Reservas
    SET Estado = 'Confirmado',
        CantidadPersonas = @CantidadPersonas
    WHERE ReservaID = @ReservaID;
END
