CREATE PROCEDURE EditarTour
    @TourID BIGINT,
    @Nombre VARCHAR(50),
    @Destino VARCHAR(255),
    @Precio DECIMAL(10,2),
    @Capacidad INT,
    @FechaInicio DATETIME,
    @FechaFin DATETIME,
    @Descripcion VARCHAR(1000),
    @Itinerario VARCHAR(1000),
    @Imagen VARCHAR(1000)
AS
BEGIN
    UPDATE Tours
    SET 
        Nombre = @Nombre,
        Destino = @Destino,
        Precio = @Precio,
        Capacidad = @Capacidad,
        FechaInicio = @FechaInicio,
        FechaFin = @FechaFin,
        Descripcion = @Descripcion,
        Itinerario = @Itinerario,
        Imagen = CASE 
                    WHEN @Imagen IS NOT NULL AND LTRIM(RTRIM(@Imagen)) <> '' 
                    THEN @Imagen 
                    ELSE Imagen 
                 END
    WHERE TourID = @TourID;
END
