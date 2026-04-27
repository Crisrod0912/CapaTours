CREATE PROCEDURE ObtenerUsuarioPorReserva
    @ReservaID BIGINT
AS
BEGIN
    SELECT UsuarioID
    FROM Reservas
    WHERE ReservaID = @ReservaID;
END
