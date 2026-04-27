CREATE PROCEDURE ConsultarReserva
    @ReservaID BIGINT
AS
BEGIN
    SELECT
        R.ReservaID,
        R.UsuarioID,
        R.TourID,
        R.CantidadPersonas,
        R.Estado,
        T.Nombre AS NombreTour,
        T.Precio,
        T.FechaInicio,
        T.FechaFin,
        U.Nombre,
        U.Correo
    FROM Reservas R
    INNER JOIN Tours T ON R.TourID = T.TourID
    INNER JOIN Usuarios U ON R.UsuarioID = U.UsuarioID 
    WHERE R.ReservaID = @ReservaID;
END
