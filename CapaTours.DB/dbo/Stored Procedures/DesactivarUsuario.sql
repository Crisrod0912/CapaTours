CREATE PROCEDURE DesactivarUsuario
    @UsuarioID BIGINT
AS
BEGIN
    UPDATE Usuarios
    SET Estado = 0
    WHERE UsuarioID = @UsuarioID;
END
