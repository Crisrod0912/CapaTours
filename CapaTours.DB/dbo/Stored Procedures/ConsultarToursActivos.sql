CREATE PROCEDURE ConsultarToursActivos
AS
BEGIN
    SELECT * FROM Tours WHERE Estado = 1;
END
