CREATE PROCEDURE AnularReserva
    @ReservaID BIGINT
AS
BEGIN
    UPDATE Reservas
    SET Estado = 'Cancelado'
    WHERE ReservaID = @ReservaID;
END
