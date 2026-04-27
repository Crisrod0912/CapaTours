CREATE PROCEDURE ActivarTour
    @TourID BIGINT
AS
BEGIN
    UPDATE Tours
    SET Estado = 1
    WHERE TourID = @TourID;
END
