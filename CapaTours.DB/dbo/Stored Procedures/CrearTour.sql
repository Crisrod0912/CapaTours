CREATE PROCEDURE CrearTour
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
    INSERT INTO Tours (
        Nombre, Destino, Precio, Capacidad, FechaInicio, FechaFin,
        Descripcion, Itinerario, Estado, Descuento, Imagen
    )
    VALUES (
        @Nombre, @Destino, @Precio, @Capacidad, @FechaInicio, @FechaFin,
        @Descripcion, @Itinerario, 1, 0, @Imagen
    );
END
