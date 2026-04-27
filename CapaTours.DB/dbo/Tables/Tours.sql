CREATE TABLE [dbo].[Tours] (
	[TourID]      BIGINT IDENTITY(1,1) PRIMARY KEY,
	[Nombre]      VARCHAR(50)          NOT NULL,
	[Destino]     VARCHAR(255)         NOT NULL,
	[Descripcion] VARCHAR(1000)        NOT NULL,
	[Itinerario]  VARCHAR(1000)        NOT NULL,
	[Precio]      DECIMAL(10,2)        NOT NULL,
	[Capacidad]   INT                  NOT NULL,
	[FechaInicio] DATETIME             NULL,
	[FechaFin]    DATETIME             NULL,
	[Estado]      BIT                  NOT NULL DEFAULT 1,
	[Descuento]   DECIMAL(3,1)         NULL,
	[Imagen]      VARCHAR(1000)        NULL
);
