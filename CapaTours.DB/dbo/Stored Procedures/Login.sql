CREATE PROCEDURE Login
    @Correo VARCHAR(100),
    @Contrasenna VARCHAR(255)
AS
BEGIN
    SELECT  
        U.UsuarioID,
        U.Identificacion,
        U.Nombre,
        U.Correo,
        U.Estado,
        U.RolID,
        R.NombreRol
    FROM Usuarios U
    INNER JOIN Roles R ON U.RolID = R.RolID
    WHERE U.Correo = @Correo
      AND U.Contrasenna = @Contrasenna
      AND U.Estado = 1;
END
