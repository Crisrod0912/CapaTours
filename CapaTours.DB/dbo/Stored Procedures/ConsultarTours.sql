CREATE PROCEDURE ConsultarTours
    @TourID BIGINT
AS
BEGIN
    IF (@TourID = 0) SET @TourID = NULL;

    SELECT
        TourID,
        Nombre,
        Destino,
        Precio,
        Capacidad,
        FechaInicio,
        FechaFin,
        Estado,
        Descuento,
        Descripcion,
        Itinerario,
        Imagen
    FROM Tours
    WHERE TourID = ISNULL(@TourID, TourID)
    ORDER BY 
        CASE WHEN Estado = 1 THEN 0 ELSE 1 END,
        CASE WHEN FechaInicio IS NOT NULL THEN 0 ELSE 1 END,
        FechaInicio,
        CASE WHEN FechaFin IS NOT NULL THEN 0 ELSE 1 END,
        FechaFin;

    IF @TourID IS NOT NULL
    BEGIN
        SELECT
            R.UsuarioID,
            U.Nombre + ' ' + U.ApellidoPaterno + ' ' + U.ApellidoMaterno AS NombreUsuario,
            R.Calificacion,
            R.Titulo,
            R.Contenido
        FROM Resennas R
        INNER JOIN Usuarios U ON R.UsuarioID = U.UsuarioID
        WHERE R.TourID = @TourID;
    END
END
