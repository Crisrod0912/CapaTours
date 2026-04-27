CREATE TABLE [dbo].[AuditoriaErrores] (
	[ErrorID]   BIGINT IDENTITY(1,1) PRIMARY KEY,
	[UsuarioID] BIGINT               NOT NULL,
	[FechaHora] DATETIME             NOT NULL,
	[Mensaje]   VARCHAR(MAX)         NOT NULL,
	[Origen]    VARCHAR(250)         NOT NULL,
	FOREIGN KEY ([UsuarioID]) REFERENCES [dbo].[Usuarios]([UsuarioID])
);
