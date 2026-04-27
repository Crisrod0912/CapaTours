CREATE PROCEDURE RegistrarError
    @UsuarioID BIGINT,
    @Mensaje VARCHAR(MAX),
    @Origen VARCHAR(250)
AS
BEGIN
    INSERT INTO AuditoriaErrores (UsuarioID, FechaHora, Mensaje, Origen)
    VALUES (@UsuarioID, GETDATE(), @Mensaje, @Origen);
END
