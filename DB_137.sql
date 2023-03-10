USE [Data_137]
GO
/****** Object:  Table [dbo].[agresor]    Script Date: 2/2/2023 4:13:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agresor](
	[cantidad] [tinyint] NULL,
	[id_genero] [int] NOT NULL,
	[relacion_victima_agresor] [nvarchar](50) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NULL,
 CONSTRAINT [PK_agresor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[casos]    Script Date: 2/2/2023 4:13:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[casos](
	[agresor_id] [int] NOT NULL,
	[victima_id] [int] NOT NULL,
	[llamada_id] [int] NOT NULL,
	[llamante_id] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NULL,
 CONSTRAINT [PK_casos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genero]    Script Date: 2/2/2023 4:13:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genero](
	[nombre_genero] [nvarchar](50) NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_genero] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[llamada]    Script Date: 2/2/2023 4:13:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[llamada](
	[llamada_derivacion] [nvarchar](100) NULL,
	[fecha] [date] NULL,
	[hora] [time](7) NULL,
	[provincia] [nvarchar](50) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[llamante_id] [int] NULL,
	[latitud] [decimal](25, 0) NULL,
	[longitud] [decimal](25, 0) NULL,
 CONSTRAINT [PK_llamada] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[llamante]    Script Date: 2/2/2023 4:13:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[llamante](
	[llamante_descripcion] [nvarchar](50) NULL,
	[id_genero] [int] NOT NULL,
	[llamante_vinculo] [nvarchar](50) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_llamante] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[victima]    Script Date: 2/2/2023 4:13:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[victima](
	[edad_victima] [tinyint] NULL,
	[victima_rango_etario] [nvarchar](50) NULL,
	[id_genero] [int] NOT NULL,
	[victima_cantidad] [tinyint] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[agresor_id] [int] NULL,
	[violenciatipo_id] [int] NULL,
	[fecha] [date] NULL,
 CONSTRAINT [PK_victima] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[violencia_tipo]    Script Date: 2/2/2023 4:13:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[violencia_tipo](
	[nombre_violencia] [nvarchar](50) NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_violencia_tipo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[agresor]  WITH CHECK ADD  CONSTRAINT [FK_id_genero] FOREIGN KEY([id_genero])
REFERENCES [dbo].[genero] ([ID])
GO
ALTER TABLE [dbo].[agresor] CHECK CONSTRAINT [FK_id_genero]
GO
ALTER TABLE [dbo].[casos]  WITH CHECK ADD  CONSTRAINT [FK_llamada] FOREIGN KEY([llamada_id])
REFERENCES [dbo].[llamada] ([ID])
GO
ALTER TABLE [dbo].[casos] CHECK CONSTRAINT [FK_llamada]
GO
ALTER TABLE [dbo].[casos]  WITH CHECK ADD  CONSTRAINT [FK_llamante] FOREIGN KEY([llamante_id])
REFERENCES [dbo].[llamante] ([ID])
GO
ALTER TABLE [dbo].[casos] CHECK CONSTRAINT [FK_llamante]
GO
ALTER TABLE [dbo].[casos]  WITH CHECK ADD  CONSTRAINT [FK_se_compone] FOREIGN KEY([agresor_id])
REFERENCES [dbo].[agresor] ([ID])
GO
ALTER TABLE [dbo].[casos] CHECK CONSTRAINT [FK_se_compone]
GO
ALTER TABLE [dbo].[casos]  WITH CHECK ADD  CONSTRAINT [FK_victima] FOREIGN KEY([victima_id])
REFERENCES [dbo].[victima] ([ID])
GO
ALTER TABLE [dbo].[casos] CHECK CONSTRAINT [FK_victima]
GO
ALTER TABLE [dbo].[llamada]  WITH CHECK ADD  CONSTRAINT [fk_llamada_llamante] FOREIGN KEY([llamante_id])
REFERENCES [dbo].[llamante] ([ID])
GO
ALTER TABLE [dbo].[llamada] CHECK CONSTRAINT [fk_llamada_llamante]
GO
ALTER TABLE [dbo].[llamante]  WITH CHECK ADD  CONSTRAINT [FK_id_llamante] FOREIGN KEY([id_genero])
REFERENCES [dbo].[genero] ([ID])
GO
ALTER TABLE [dbo].[llamante] CHECK CONSTRAINT [FK_id_llamante]
GO
ALTER TABLE [dbo].[victima]  WITH CHECK ADD  CONSTRAINT [FK_id_victima] FOREIGN KEY([id_genero])
REFERENCES [dbo].[genero] ([ID])
GO
ALTER TABLE [dbo].[victima] CHECK CONSTRAINT [FK_id_victima]
GO
ALTER TABLE [dbo].[victima]  WITH CHECK ADD  CONSTRAINT [fk_victima_agresor] FOREIGN KEY([agresor_id])
REFERENCES [dbo].[agresor] ([ID])
GO
ALTER TABLE [dbo].[victima] CHECK CONSTRAINT [fk_victima_agresor]
GO
