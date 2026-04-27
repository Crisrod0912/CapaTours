CREATE PROCEDURE CrearReservaTour
    @UsuarioID BIGINT,
    @TourID BIGINT,
    @CantidadPersonas INT
AS
BEGIN
    DECLARE @CapacidadDisponible INT;

    SELECT @CapacidadDisponible = (T.Capacidad - ISNULL(SUM(R.CantidadPersonas), 0))
    FROM Tours T
    LEFT JOIN Reservas R ON T.TourID = R.TourID AND R.Estado IN ('En Espera', 'Confirmado')
    WHERE T.TourID = @TourID
    GROUP BY T.Capacidad;

    IF @CapacidadDisponible >= @CantidadPersonas
    BEGIN
        INSERT INTO Reservas (UsuarioID, TourID, CantidadPersonas)
        VALUES (@UsuarioID, @TourID, @CantidadPersonas);
    END
    ELSE
    BEGIN
        RAISERROR('No hay suficiente capacidad disponible.', 16, 1);
    END
END
