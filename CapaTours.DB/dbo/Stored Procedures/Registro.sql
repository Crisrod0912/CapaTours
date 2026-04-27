CREATE PROCEDURE Registro
    @Identificacion VARCHAR(15),
    @Nombre VARCHAR(50),
    @ApellidoPaterno VARCHAR(50),
    @ApellidoMaterno VARCHAR(50),
    @Correo VARCHAR(100),
    @Contrasenna VARCHAR(255)
AS
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM Usuarios 
        WHERE Identificacion = @Identificacion OR Correo = @Correo
    )
    BEGIN
        INSERT INTO Usuarios (
            Identificacion, Contrasenna, Nombre, ApellidoPaterno,
            ApellidoMaterno, Correo, Estado, RolID
        )
        VALUES (
            @Identificacion, @Contrasenna, @Nombre, @ApellidoPaterno,
            @ApellidoMaterno, @Correo, 1, 2
        );

        PRINT 'Cuenta registrada correctamente.';
    END
    ELSE
    BEGIN
        PRINT 'La identificación o el correo ya están registrados.';
    END
END
