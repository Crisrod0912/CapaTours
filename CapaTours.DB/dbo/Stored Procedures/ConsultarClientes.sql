CREATE PROCEDURE ConsultarClientes
    @UsuarioID BIGINT
AS
BEGIN
    IF (@UsuarioID = 0)
        SET @UsuarioID = NULL;

    SELECT 
        UsuarioID, 
        Identificacion, 
        Nombre, 
        ApellidoPaterno,
        ApellidoMaterno,
        Correo, 
        Estado,
        RolID
    FROM Usuarios
    WHERE UsuarioID = ISNULL(@UsuarioID, UsuarioID)
      AND RolID = 2
    ORDER BY 
        CASE WHEN Estado = 1 THEN 0 ELSE 1 END;
END
