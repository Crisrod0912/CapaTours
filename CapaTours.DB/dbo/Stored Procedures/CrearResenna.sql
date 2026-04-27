CREATE PROCEDURE CrearResenna
    @UsuarioID BIGINT,
    @TourID BIGINT,
    @ReservaID BIGINT,
    @Calificacion INT,
    @Titulo VARCHAR(50),
    @Contenido VARCHAR(1000)
AS
BEGIN
    INSERT INTO Resennas (UsuarioID, TourID, ReservaID, Calificacion, Titulo, Contenido)
    VALUES (@UsuarioID, @TourID, @ReservaID, @Calificacion, @Titulo, @Contenido);
END
