CREATE PROCEDURE ActivarUsuario
    @UsuarioID BIGINT
AS
BEGIN
    UPDATE Usuarios
    SET Estado = 1
    WHERE UsuarioID = @UsuarioID;
END
