CREATE PROCEDURE ObtenerUsuarioCompleto
    @Correo VARCHAR(100)
AS
BEGIN
    SELECT  
        U.UsuarioID,
        U.Identificacion,
        U.Nombre,
        U.ApellidoPaterno,
        U.ApellidoMaterno,
        U.Correo,
        U.Estado,
        U.RolID,
        R.NombreRol
    FROM Usuarios U
    INNER JOIN Roles R ON U.RolID = R.RolID
    WHERE U.Correo = @Correo;
END
