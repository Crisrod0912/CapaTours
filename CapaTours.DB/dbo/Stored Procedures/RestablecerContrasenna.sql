CREATE PROCEDURE RestablecerContrasenna
    @Correo VARCHAR(100),
    @Contrasenna VARCHAR(255)
AS
BEGIN
    UPDATE Usuarios
    SET Contrasenna = @Contrasenna,
        TieneContrasennaTemp = 0,
        FechaVencimientoTemp = NULL
    WHERE Correo = @Correo AND Estado = 1;
END
