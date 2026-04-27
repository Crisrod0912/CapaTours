CREATE PROCEDURE ObtenerReservasPorUsuario
    @UsuarioID BIGINT
AS
BEGIN
    SELECT 
        R.ReservaID,
        R.TourID,
        R.UsuarioID, 
        T.Nombre AS NombreTour,
        T.Precio,
        T.FechaInicio,
        T.FechaFin,
        R.CantidadPersonas,
        R.Estado
    FROM Reservas R
    INNER JOIN Tours T ON R.TourID = T.TourID
    WHERE R.UsuarioID = @UsuarioID
    ORDER BY 
        CASE R.Estado
            WHEN 'Confirmado' THEN 0
            WHEN 'Completado' THEN 1
            WHEN 'En Espera' THEN 2
            WHEN 'Cancelado' THEN 3
            ELSE 4
        END;
END
