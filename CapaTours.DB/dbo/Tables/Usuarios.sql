CREATE TABLE [dbo].[Usuarios] (
	[UsuarioID]            BIGINT IDENTITY(1,1) PRIMARY KEY,
	[Identificacion]       VARCHAR(15)          NOT NULL UNIQUE,
	[Nombre]               VARCHAR(50)          NOT NULL,
	[ApellidoPaterno]      VARCHAR(50)          NOT NULL,
	[ApellidoMaterno]      VARCHAR(50)          NOT NULL,
	[Correo]               VARCHAR(100)         NOT NULL UNIQUE,
	[Contrasenna]          VARCHAR(255)         NOT NULL,
	[TieneContrasennaTemp] BIT                  NULL,
	[FechaVencimientoTemp] DATETIME             NULL,
	[Estado]               BIT                  NOT NULL  DEFAULT 1,
	[RolID]                BIGINT               NOT NULL,
	FOREIGN KEY ([RolID]) REFERENCES [dbo].[Roles]([RolID])
);
