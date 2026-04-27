CREATE PROCEDURE DesactivarTour
    @TourID BIGINT
AS
BEGIN
    UPDATE Tours
    SET Estado = 0
    WHERE TourID = @TourID;
END
