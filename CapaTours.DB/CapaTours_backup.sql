-- Crear la base de datos.
IF DB_ID('CapaTours') IS NULL
BEGIN
	CREATE DATABASE CapaTours;
END
GO

-- Utilizar la base de datos.
USE CapaTours;
GO

-- =============================================
-- TABLAS
-- =============================================

-- Tabla de Roles.
BEGIN
    CREATE TABLE dbo.Roles (
        RolID     BIGINT IDENTITY(1,1) PRIMARY KEY,
        NombreRol VARCHAR(50)          NOT NULL
    );

    -- Inserción de datos en la tabla Roles.
    INSERT INTO dbo.Roles (NombreRol) VALUES
    (N'Administrador'),
    (N'Usuario');
END
GO

-- Tabla de Usuarios.
BEGIN
    CREATE TABLE dbo.Usuarios (
        UsuarioID            BIGINT IDENTITY(1,1) PRIMARY KEY,
        Identificacion       VARCHAR(15)          NOT NULL UNIQUE,
        Nombre               VARCHAR(50)          NOT NULL,
        ApellidoPaterno      VARCHAR(50)          NOT NULL,
        ApellidoMaterno      VARCHAR(50)          NOT NULL,
        Correo               VARCHAR(100)         NOT NULL UNIQUE,
        Contrasenna          VARCHAR(255)         NOT NULL,
        TieneContrasennaTemp BIT                  NULL,
        FechaVencimientoTemp DATETIME             NULL,
        Estado               BIT                  NOT NULL  DEFAULT 1,
        RolID                BIGINT               NOT NULL,
        FOREIGN KEY (RolID) REFERENCES dbo.Roles(RolID)
    );

    -- Inserción de datos en la tabla Usuarios.
    INSERT INTO dbo.Usuarios (Identificacion, Nombre, ApellidoPaterno, ApellidoMaterno, Correo, Contrasenna, TieneContrasennaTemp, FechaVencimientoTemp, Estado, RolID) VALUES
    (N'117310079', N'Cristopher', N'Rodríguez', N'Fernández', N'crodriguez@gmail.com', N'Cris1204', NULL, NULL, 1, 1),
    (N'228704528', N'Daniel', N'Vega', N'Márvez', N'dvega@gmail.com', N'Dani2399', NULL, NULL, 1, 1),
    (N'339174527', N'Cliente #1', N'Apellido #1', N'Apellido #2', N'cliente1@gmail.com', N'Cliente1234', NULL, NULL, 1, 2),
    (N'445673482', N'Cliente #2', N'Apellido #1', N'Apellido #2', N'cliente2@gmail.com', N'Cliente5678', NULL, NULL, 1, 2);
END
GO

-- Tabla de Tours.
BEGIN
    CREATE TABLE dbo.Tours (
        TourID      BIGINT IDENTITY(1,1) PRIMARY KEY,
        Nombre      VARCHAR(50)          NOT NULL,
        Destino     VARCHAR(255)         NOT NULL,
        Descripcion VARCHAR(1000)        NOT NULL,
        Itinerario  VARCHAR(1000)        NOT NULL,
        Precio      DECIMAL(10,2)        NOT NULL,
        Capacidad   INT                  NOT NULL,
        FechaInicio DATETIME             NULL,
        FechaFin    DATETIME             NULL,
        Estado      BIT                  NOT NULL DEFAULT 1,
        Descuento   DECIMAL(3,1)         NULL,
        Imagen      VARCHAR(1000)        NULL
    );

    -- Inserción de datos en la tabla Tours.
    INSERT INTO dbo.Tours(Nombre, Destino, Descripcion, Itinerario, Precio, Capacidad, FechaInicio, FechaFin, Estado, Descuento, Imagen) VALUES
    (N'Aventura en Volcán Arenal', N'La Fortuna, Alajuela', N'Explora el imponente Volcán Arenal y disfruta de aguas termales naturales.', N'Día 1: llegada y senderismo, Día 2: aguas termales, Día 3: tour de canopy.', CAST(62400.00 AS Decimal(10, 2)), 25, CAST(N'2025-05-15T00:00:00.000' AS DateTime), CAST(N'2025-05-17T00:00:00.000' AS DateTime), 1, CAST(10.0 AS Decimal(3, 1)), N'/img/tours/7e875af4-564d-4a42-9bf2-beae0b98f8cc.jpg'),
    (N'Tour Catarata La Paz', N'Vara Blanca, Heredia', N'Visita a una de las cataratas más impresionantes rodeadas de jardines tropicales.', N'Día 1: jardines y mariposario, Día 2: visita a la catarata, Día 3: tour de colibríes.', CAST(44460.00 AS Decimal(10, 2)), 20, CAST(N'2025-05-18T00:00:00.000' AS DateTime), CAST(N'2025-05-20T00:00:00.000' AS DateTime), 1, CAST(5.0 AS Decimal(3, 1)), N'/img/tours/c417bcdf-e8e6-4466-9c1a-05fc5442665c.jpg'),
    (N'Expedición Corcovado', N'Parque Nacional Corcovado, Osa', N'Descubre la biodiversidad única del Parque Nacional Corcovado en una expedición guiada.', N'Día 1: traslado a Drake Bay, Día 2: caminata parque nacional, Día 3: visita a playa escondida.', CAST(182000.00 AS Decimal(10, 2)), 15, CAST(N'2025-06-10T00:00:00.000' AS DateTime), CAST(N'2025-06-12T00:00:00.000' AS DateTime), 1, CAST(0.0 AS Decimal(3, 1)), N'/img/tours/298a6c89-d7e7-4707-a633-acf8716c578c.jpg'),
    (N'Aventura Canopy Monteverde', N'Monteverde, Puntarenas', N'Vive la emoción de deslizarte en canopy por el bosque nuboso de Monteverde.', N'Día 1: llegada y tour de puentes colgantes, Día 2: canopy extremo, Día 3: tour de café.', CAST(49400.00 AS Decimal(10, 2)), 30, CAST(N'2025-05-22T00:00:00.000' AS DateTime), CAST(N'2025-05-24T00:00:00.000' AS DateTime), 1, CAST(7.5 AS Decimal(3, 1)), N'/img/tours/0f4dce6e-c3c7-46c0-9dca-7904bfd126e3.jpg'),
    (N'Rafting Río Pacuare', N'Turrialba, Cartago', N'Experimenta la adrenalina de uno de los mejores ríos de rafting del mundo.', N'Día 1: introducción y preparación, Día 2: rafting y campamento, Día 3: rafting final.', CAST(67600.00 AS Decimal(10, 2)), 12, CAST(N'2025-05-25T00:00:00.000' AS DateTime), CAST(N'2025-05-27T00:00:00.000' AS DateTime), 1, CAST(8.0 AS Decimal(3, 1)), N'/img/tours/90c0a0f7-7fa5-4e9c-81e1-1e7a9bda9257.jpg'),
    (N'Tour de Café Doka Estate', N'Sabanilla, Alajuela', N'Conoce todo sobre la producción del café costarricense en una auténtica finca.', N'Día 1: visita a cafetal, Día 2: proceso de beneficio y tostado, Día 3: degustación premium.', CAST(23400.00 AS Decimal(10, 2)), 40, CAST(N'2025-05-30T00:00:00.000' AS DateTime), CAST(N'2025-06-01T00:00:00.000' AS DateTime), 1, CAST(0.0 AS Decimal(3, 1)), N'/img/tours/4b03008c-dd96-4eb4-9026-60e3eff10d87.jpg'),
    (N'Safari Flotante Río Peñas Blancas', N'La Fortuna, Alajuela', N'Relájate en un safari flotante por el río, observando fauna silvestre.', N'Día 1: traslado y preparación, Día 2: safari de día completo, Día 3: safari temprano matutino.', CAST(39000.00 AS Decimal(10, 2)), 18, CAST(N'2025-06-05T00:00:00.000' AS DateTime), CAST(N'2025-06-07T00:00:00.000' AS DateTime), 1, CAST(5.0 AS Decimal(3, 1)), N'/img/tours/a5688c4c-7a4c-42fb-8a60-70fb9428b54b.jpg'),
    (N'Isla Tortuga Tour', N'Golfo de Nicoya, Puntarenas', N'Disfruta un día en una isla paradisíaca con arena blanca y aguas cristalinas.', N'Día 1: navegación y snorkel, Día 2: paseo en kayak y relax, Día 3: tour de pesca.', CAST(72800.00 AS Decimal(10, 2)), 50, CAST(N'2025-06-08T00:00:00.000' AS DateTime), CAST(N'2025-06-10T00:00:00.000' AS DateTime), 1, CAST(10.0 AS Decimal(3, 1)), N'/img/tours/cc1cb402-cb8a-4337-9cca-680f3e76bab4.jpg');
END
GO

-- Tabla de Reservas.
BEGIN
    CREATE TABLE dbo.Reservas (
        ReservaID        BIGINT IDENTITY(1,1) PRIMARY KEY,
        UsuarioID        BIGINT               NOT NULL,
        TourID           BIGINT               NOT NULL,
        CantidadPersonas INT                  NOT NULL,
        Estado           VARCHAR(50)          NOT NULL DEFAULT 'En Espera',
        FOREIGN KEY (UsuarioID) REFERENCES dbo.Usuarios(UsuarioID),
        FOREIGN KEY (TourID) REFERENCES dbo.Tours(TourID),
        CHECK (Estado IN ('Completado', 'Cancelado', 'Confirmado', 'En Espera'))
    );
END
GO

-- Tabla de Pagos.
BEGIN
    CREATE TABLE dbo.Pagos (
        PagoID      BIGINT IDENTITY(1,1) PRIMARY KEY,
        ReservaID   BIGINT               NOT NULL,
        Fecha       DATETIME             NOT NULL,
        Comprobante NVARCHAR(MAX)        NULL,
        Monto       DECIMAL(10,2)        NOT NULL,
        FOREIGN KEY (ReservaID) REFERENCES dbo.Reservas(ReservaID)
    );
END
GO

-- Tabla de Reseñas.
BEGIN
    CREATE TABLE dbo.Resennas (
        ResennaID    BIGINT IDENTITY(1,1) PRIMARY KEY,
        UsuarioID    BIGINT               NOT NULL,
        TourID       BIGINT               NOT NULL,
        ReservaID    BIGINT               NOT NULL,
        Calificacion INT                  NOT NULL,
        Titulo       VARCHAR(50)          NOT NULL,
        Contenido    VARCHAR(1000)        NOT NULL,
        FOREIGN KEY (UsuarioID) REFERENCES dbo.Usuarios(UsuarioID),
        FOREIGN KEY (TourID) REFERENCES dbo.Tours(TourID),
        FOREIGN KEY (ReservaID) REFERENCES dbo.Reservas(ReservaID),
        CHECK (Calificacion BETWEEN 1 AND 5)
    );
END
GO

-- Tabla de Auditoría de Errores.
BEGIN
    CREATE TABLE dbo.AuditoriaErrores (
        ErrorID   BIGINT IDENTITY(1,1) PRIMARY KEY,
        UsuarioID BIGINT               NOT NULL,
        FechaHora DATETIME             NOT NULL,
        Mensaje   VARCHAR(MAX)         NOT NULL,
        Origen    VARCHAR(250)         NOT NULL,
        FOREIGN KEY (UsuarioID) REFERENCES dbo.Usuarios(UsuarioID)
    );
END
GO

-- =============================================
-- PROCEDIMIENTOS ALMACENADOS
-- =============================================

-- Procedimiento almacenado para Activar Tour.
CREATE PROCEDURE dbo.ActivarTour
    @TourID BIGINT
AS
BEGIN
    UPDATE dbo.Tours
    SET Estado = 1
    WHERE TourID = @TourID;
END
GO

-- Procedimiento almacenado para Activar Usuario.
CREATE PROCEDURE dbo.ActivarUsuario
    @UsuarioID BIGINT
AS
BEGIN
    UPDATE dbo.Usuarios
    SET Estado = 1
    WHERE UsuarioID = @UsuarioID;
END
GO

-- Procedimiento almacenado para Actualizar Perfil.
CREATE PROCEDURE dbo.ActualizarPerfil
    @UsuarioID BIGINT,
    @Correo VARCHAR(100)
AS
BEGIN
    UPDATE dbo.Usuarios
    SET Correo = @Correo
    WHERE UsuarioID = @UsuarioID AND Estado = 1;
END
GO

-- Procedimiento almacenado para Anular Reserva.
CREATE PROCEDURE dbo.AnularReserva
    @ReservaID BIGINT
AS
BEGIN
    UPDATE dbo.Reservas
    SET Estado = 'Cancelado'
    WHERE ReservaID = @ReservaID;
END
GO

-- Procedimiento almacenado para Consultar Clientes.
CREATE PROCEDURE dbo.ConsultarClientes
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
    FROM dbo.Usuarios
    WHERE UsuarioID = ISNULL(@UsuarioID, UsuarioID)
      AND RolID = 2
    ORDER BY 
        CASE WHEN Estado = 1 THEN 0 ELSE 1 END;
END
GO

-- Procedimiento almacenado para Consultar Reserva.
CREATE PROCEDURE dbo.ConsultarReserva
    @ReservaID BIGINT
AS
BEGIN
    SELECT
        R.ReservaID,
        R.UsuarioID,
        R.TourID,
        R.CantidadPersonas,
        R.Estado,
        T.Nombre AS NombreTour,
        T.Precio,
        T.FechaInicio,
        T.FechaFin,
        U.Nombre,
        U.Correo
    FROM dbo.Reservas R
    INNER JOIN dbo.Tours T ON R.TourID = T.TourID
    INNER JOIN dbo.Usuarios U ON R.UsuarioID = U.UsuarioID 
    WHERE R.ReservaID = @ReservaID;
END
GO

-- Procedimiento almacenado para Consultar Tours.
CREATE PROCEDURE dbo.ConsultarTours
    @TourID BIGINT
AS
BEGIN
    IF (@TourID = 0) SET @TourID = NULL;

    SELECT
        TourID,
        Nombre,
        Destino,
        Precio,
        Capacidad,
        FechaInicio,
        FechaFin,
        Estado,
        Descuento,
        Descripcion,
        Itinerario,
        Imagen
    FROM dbo.Tours
    WHERE TourID = ISNULL(@TourID, TourID)
    ORDER BY 
        CASE WHEN Estado = 1 THEN 0 ELSE 1 END,
        CASE WHEN FechaInicio IS NOT NULL THEN 0 ELSE 1 END,
        FechaInicio,
        CASE WHEN FechaFin IS NOT NULL THEN 0 ELSE 1 END,
        FechaFin;

    IF @TourID IS NOT NULL
    BEGIN
        SELECT
            R.UsuarioID,
            U.Nombre + ' ' + U.ApellidoPaterno + ' ' + U.ApellidoMaterno AS NombreUsuario,
            R.Calificacion,
            R.Titulo,
            R.Contenido
        FROM dbo.Resennas R
        INNER JOIN dbo.Usuarios U ON R.UsuarioID = U.UsuarioID
        WHERE R.TourID = @TourID;
    END
END
GO

-- Procedimiento almacenado para Consultar Tours Activos.
CREATE PROCEDURE dbo.ConsultarToursActivos
AS
BEGIN
    SELECT * FROM dbo.Tours WHERE Estado = 1;
END
GO

-- Procedimiento almacenado para Crear Reseña.
CREATE PROCEDURE dbo.CrearResenna
    @UsuarioID BIGINT,
    @TourID BIGINT,
    @ReservaID BIGINT,
    @Calificacion INT,
    @Titulo VARCHAR(50),
    @Contenido VARCHAR(1000)
AS
BEGIN
    INSERT INTO dbo.Resennas (UsuarioID, TourID, ReservaID, Calificacion, Titulo, Contenido)
    VALUES (@UsuarioID, @TourID, @ReservaID, @Calificacion, @Titulo, @Contenido);
END
GO

-- Procedimiento almacenado para Crear Reserva de Tour.
CREATE PROCEDURE dbo.CrearReservaTour
    @UsuarioID BIGINT,
    @TourID BIGINT,
    @CantidadPersonas INT
AS
BEGIN
    DECLARE @CapacidadDisponible INT;

    SELECT @CapacidadDisponible = (T.Capacidad - ISNULL(SUM(R.CantidadPersonas), 0))
    FROM dbo.Tours T
    LEFT JOIN dbo.Reservas R ON T.TourID = R.TourID AND R.Estado IN ('En Espera', 'Confirmado')
    WHERE T.TourID = @TourID
    GROUP BY T.Capacidad;

    IF @CapacidadDisponible >= @CantidadPersonas
    BEGIN
        INSERT INTO dbo.Reservas (UsuarioID, TourID, CantidadPersonas)
        VALUES (@UsuarioID, @TourID, @CantidadPersonas);
    END
    ELSE
    BEGIN
        RAISERROR('No hay suficiente capacidad disponible.', 16, 1);
    END
END
GO

-- Procedimiento almacenado para Crear Tour.
CREATE PROCEDURE dbo.CrearTour
    @Nombre VARCHAR(50),
    @Destino VARCHAR(255),
    @Precio DECIMAL(10,2),
    @Capacidad INT,
    @FechaInicio DATETIME,
    @FechaFin DATETIME,
    @Descripcion VARCHAR(1000),
    @Itinerario VARCHAR(1000),
    @Imagen VARCHAR(1000)
AS
BEGIN
    INSERT INTO dbo.Tours (
        Nombre, Destino, Precio, Capacidad, FechaInicio, FechaFin,
        Descripcion, Itinerario, Estado, Descuento, Imagen
    )
    VALUES (
        @Nombre, @Destino, @Precio, @Capacidad, @FechaInicio, @FechaFin,
        @Descripcion, @Itinerario, 1, 0, @Imagen
    );
END
GO

-- Procedimiento almacenado para Desactivar Tour.
CREATE PROCEDURE dbo.DesactivarTour
    @TourID BIGINT
AS
BEGIN
    UPDATE dbo.Tours
    SET Estado = 0
    WHERE TourID = @TourID;
END
GO

-- Procedimiento almacenado para Desactivar Usuario.
CREATE PROCEDURE dbo.DesactivarUsuario
    @UsuarioID BIGINT
AS
BEGIN
    UPDATE dbo.Usuarios
    SET Estado = 0
    WHERE UsuarioID = @UsuarioID;
END
GO

-- Procedimiento almacenado para Editar Tour.
CREATE PROCEDURE dbo.EditarTour
    @TourID BIGINT,
    @Nombre VARCHAR(50),
    @Destino VARCHAR(255),
    @Precio DECIMAL(10,2),
    @Capacidad INT,
    @FechaInicio DATETIME,
    @FechaFin DATETIME,
    @Descripcion VARCHAR(1000),
    @Itinerario VARCHAR(1000),
    @Imagen VARCHAR(1000)
AS
BEGIN
    UPDATE dbo.Tours
    SET 
        Nombre = @Nombre,
        Destino = @Destino,
        Precio = @Precio,
        Capacidad = @Capacidad,
        FechaInicio = @FechaInicio,
        FechaFin = @FechaFin,
        Descripcion = @Descripcion,
        Itinerario = @Itinerario,
        Imagen = CASE 
                    WHEN @Imagen IS NOT NULL AND LTRIM(RTRIM(@Imagen)) <> '' 
                    THEN @Imagen 
                    ELSE Imagen 
                 END
    WHERE TourID = @TourID;
END
GO

-- Procedimiento almacenado para Listar Reseñas Por Tour.
CREATE PROCEDURE dbo.ListarResennasPorTour
    @TourID BIGINT
AS
BEGIN
    SELECT R.Titulo, R.Contenido, R.Calificacion, U.Nombre AS Usuario
    FROM dbo.Resennas R
    INNER JOIN dbo.Usuarios U ON R.UsuarioID = U.UsuarioID
    WHERE R.TourID = @TourID;
END
GO

-- Procedimiento almacenado para Iniciar Sesión.
CREATE PROCEDURE dbo.Login
    @Correo VARCHAR(100),
    @Contrasenna VARCHAR(255)
AS
BEGIN
    SELECT  
        U.UsuarioID,
        U.Identificacion,
        U.Nombre,
        U.Correo,
        U.Estado,
        U.RolID,
        R.NombreRol
    FROM dbo.Usuarios U
    INNER JOIN dbo.Roles R ON U.RolID = R.RolID
    WHERE U.Correo = @Correo
      AND U.Contrasenna = @Contrasenna
      AND U.Estado = 1;
END
GO

-- Procedimiento almacenado para Obtener Reservas en Administrador.
CREATE PROCEDURE dbo.ObtenerReservasAdmin
AS
BEGIN
    SELECT 
        R.ReservaID,
        T.Nombre AS NombreTour,
        U.Nombre AS Cliente,
        U.Identificacion,
        R.CantidadPersonas,
        R.Estado,
        T.Precio,
        T.FechaInicio,
        T.FechaFin,
        P.Fecha AS FechaComprobante,
        P.Monto AS MontoComprobante,
        P.Comprobante
    FROM dbo.Reservas R
    INNER JOIN dbo.Tours T ON R.TourID = T.TourID
    INNER JOIN dbo.Usuarios U ON R.UsuarioID = U.UsuarioID
    LEFT JOIN dbo.Pagos P ON R.ReservaID = P.ReservaID
    ORDER BY 
        CASE R.Estado
            WHEN 'Confirmado' THEN 0
            WHEN 'Completado' THEN 1
            WHEN 'En Espera' THEN 2
            WHEN 'Cancelado' THEN 3
            ELSE 4
        END
END
GO

-- Procedimiento almacenado para Obtener Reservas Por Usuario
CREATE PROCEDURE dbo.ObtenerReservasPorUsuario
    @UsuarioID BIGINT
AS
BEGIN
    SELECT 
        R.ReservaID,
        R.TourID,
        R.UsuarioID, 
        T.Nombre AS NombreTour,
        T.Precio,
        T.FechaInicio,
        T.FechaFin,
        R.CantidadPersonas,
        R.Estado
    FROM dbo.Reservas R
    INNER JOIN dbo.Tours T ON R.TourID = T.TourID
    WHERE R.UsuarioID = @UsuarioID
    ORDER BY 
        CASE R.Estado
            WHEN 'Confirmado' THEN 0
            WHEN 'Completado' THEN 1
            WHEN 'En Espera' THEN 2
            WHEN 'Cancelado' THEN 3
            ELSE 4
        END;
END
GO

-- Procedimiento almacenado para Obtener Usuario Completo.
CREATE PROCEDURE dbo.ObtenerUsuarioCompleto
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
    FROM dbo.Usuarios U
    INNER JOIN dbo.Roles R ON U.RolID = R.RolID
    WHERE U.Correo = @Correo;
END
GO

-- Procedimiento almacenado para Obtener Usuario Por Correo.
CREATE PROCEDURE dbo.ObtenerUsuarioPorCorreo
    @Correo VARCHAR(100)
AS
BEGIN
    SELECT 
        UsuarioID, Identificacion, Nombre, ApellidoPaterno, ApellidoMaterno,
        Correo, Estado, RolID
    FROM dbo.Usuarios
    WHERE LTRIM(RTRIM(Correo)) = LTRIM(RTRIM(@Correo))
      AND Estado = 1;
END
GO

-- Procedimiento almacenado para Obtener Usuario Por Reserva.
CREATE PROCEDURE dbo.ObtenerUsuarioPorReserva
    @ReservaID BIGINT
AS
BEGIN
    SELECT UsuarioID
    FROM dbo.Reservas
    WHERE ReservaID = @ReservaID;
END
GO

-- Procedimiento almacenado para Pagar Reserva.
CREATE PROCEDURE dbo.PagarReserva
    @ReservaID INT,
    @Comprobante NVARCHAR(MAX),
    @Monto DECIMAL(10,2),
    @CantidadPersonas INT
AS
BEGIN
    INSERT INTO dbo.Pagos (ReservaID, Comprobante, Monto, Fecha)
    VALUES (@ReservaID, @Comprobante, @Monto, GETDATE());

    UPDATE dbo.Reservas
    SET Estado = 'Confirmado',
        CantidadPersonas = @CantidadPersonas
    WHERE ReservaID = @ReservaID;
END
GO

-- Procedimiento almacenado para Registrar Error.
CREATE PROCEDURE dbo.RegistrarError
    @UsuarioID BIGINT,
    @Mensaje VARCHAR(MAX),
    @Origen VARCHAR(250)
AS
BEGIN
    INSERT INTO dbo.AuditoriaErrores (UsuarioID, FechaHora, Mensaje, Origen)
    VALUES (@UsuarioID, GETDATE(), @Mensaje, @Origen);
END
GO

-- Procedimiento almacenado para Registro.
CREATE PROCEDURE dbo.Registro
    @Identificacion VARCHAR(15),
    @Nombre VARCHAR(50),
    @ApellidoPaterno VARCHAR(50),
    @ApellidoMaterno VARCHAR(50),
    @Correo VARCHAR(100),
    @Contrasenna VARCHAR(255)
AS
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM dbo.Usuarios 
        WHERE Identificacion = @Identificacion OR Correo = @Correo
    )
    BEGIN
        INSERT INTO dbo.Usuarios (
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
GO

-- Procedimiento almacenado para Reestablecer Contraseña.
CREATE PROCEDURE dbo.RestablecerContrasenna
    @Correo VARCHAR(100),
    @Contrasenna VARCHAR(255)
AS
BEGIN
    UPDATE dbo.Usuarios
    SET Contrasenna = @Contrasenna,
        TieneContrasennaTemp = 0,
        FechaVencimientoTemp = NULL
    WHERE Correo = @Correo AND Estado = 1;
END
GO
