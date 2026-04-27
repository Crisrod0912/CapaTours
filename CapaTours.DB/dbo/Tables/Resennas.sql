CREATE TABLE [dbo].[Resennas] (
	[ResennaID]    BIGINT IDENTITY(1,1) PRIMARY KEY,
	[UsuarioID]    BIGINT               NOT NULL,
	[TourID]       BIGINT               NOT NULL,
	[ReservaID]    BIGINT               NOT NULL,
	[Calificacion] INT                  NOT NULL,
	[Titulo]       VARCHAR(50)          NOT NULL,
	[Contenido]    VARCHAR(1000)        NOT NULL,
	FOREIGN KEY ([UsuarioID]) REFERENCES [dbo].[Usuarios]([UsuarioID]),
	FOREIGN KEY ([TourID]) REFERENCES [dbo].[Tours]([TourID]),
	FOREIGN KEY ([ReservaID]) REFERENCES [dbo].[Reservas]([ReservaID]),
	CHECK ([Calificacion] BETWEEN 1 AND 5)
);
