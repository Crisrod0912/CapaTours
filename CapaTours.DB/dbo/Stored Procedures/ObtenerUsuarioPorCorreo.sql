CREATE PROCEDURE ObtenerUsuarioPorCorreo
    @Correo VARCHAR(100)
AS
BEGIN
    SELECT 
        UsuarioID, Identificacion, Nombre, ApellidoPaterno, ApellidoMaterno,
        Correo, Estado, RolID
    FROM Usuarios
    WHERE LTRIM(RTRIM(Correo)) = LTRIM(RTRIM(@Correo))
      AND Estado = 1;
END
