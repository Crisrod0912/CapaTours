CREATE TABLE [dbo].[Pagos] (
	[PagoID]      BIGINT IDENTITY(1,1) PRIMARY KEY,
	[ReservaID]   BIGINT               NOT NULL,
	[Fecha]       DATETIME             NOT NULL,
	[Comprobante] NVARCHAR(MAX)        NULL,
	[Monto]       DECIMAL(10,2)        NOT NULL,
	FOREIGN KEY ([ReservaID]) REFERENCES [dbo].[Reservas]([ReservaID])
);
