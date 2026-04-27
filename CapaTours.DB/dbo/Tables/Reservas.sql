CREATE TABLE [dbo].[Reservas] (
	[ReservaID]        BIGINT IDENTITY(1,1) PRIMARY KEY,
	[UsuarioID]        BIGINT               NOT NULL,
	[TourID]           BIGINT               NOT NULL,
	[CantidadPersonas] INT                  NOT NULL,
	[Estado]           VARCHAR(50)          NOT NULL DEFAULT 'En Espera',
	FOREIGN KEY ([UsuarioID]) REFERENCES [dbo].[Usuarios]([UsuarioID]),
	FOREIGN KEY ([TourID]) REFERENCES [dbo].[Tours]([TourID]),
	CHECK ([Estado] IN ('Completado', 'Cancelado', 'Confirmado', 'En Espera'))
);
