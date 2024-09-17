USE [PreguntadOrt]
GO
/****** Object:  User [alumno]    Script Date: 17/9/2024 09:04:33 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 17/9/2024 09:04:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](255) NULL,
	[Foto] [text] NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dificultades]    Script Date: 17/9/2024 09:04:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dificultades](
	[IdDificultad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Dificultades] PRIMARY KEY CLUSTERED 
(
	[IdDificultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 17/9/2024 09:04:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[IdPregunta] [int] IDENTITY(1,1) NOT NULL,
	[IdCategoria] [int] NULL,
	[IdDificultad] [int] NULL,
	[Enunciado] [varchar](300) NULL,
	[Foto] [text] NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 17/9/2024 09:04:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[IdRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[IdPregunta] [int] NOT NULL,
	[Opcion] [int] NOT NULL,
	[Contenido] [varchar](100) NOT NULL,
	[Correcta] [bit] NOT NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[IdRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (1, N'Deportes', N'https://www.infisport.com/media/amasty/blog/SprintDeportesEquipo1_2.jpg')
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (2, N'Historia', N'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiE1FffXJEQAVoKEj1aqcrXjWT3ZkKqSapXFDvslxbcBC1J40ih6Nj811-MpqvGQhrQ8PL63JtzZ4N2lT0HFaKRsp2MdiGi8kLTdLEKR_RizKeKxuahzxz7lztX-NWZJLhVaAC9sOGaTgA/s1600/dip.jpg')
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (3, N'Peliculas y Series', N'https://chajarialdia.com.ar/wp-content/uploads/2024/05/Dia-del-cine-1.jpg')
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (4, N'Ciencia', N'https://cursodeinstalador.com/wp-content/uploads/2024/02/que-estudia-la-ciencia-1068x599.webp')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Dificultades] ON 

INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (1, N'Facil')
INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (2, N'Medio')
INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (3, N'Dificil')
SET IDENTITY_INSERT [dbo].[Dificultades] OFF
GO
SET IDENTITY_INSERT [dbo].[Preguntas] ON 

INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (1, 1, 1, N'¿En qué deporte se utiliza una raqueta y una pelota amarilla?', N'https://media.istockphoto.com/id/157680483/es/foto/tarjeta-amarilla.jpg?s=612x612&w=0&k=20&c=6zTgZvWMI-9Rp7sNm9fd85-rF_sYjukIuJVB304eCKg=')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (2, 1, 1, N'¿Cuántos jugadores conforman un equipo de fútbol en el campo de juego?', N'https://www.infobae.com/new-resizer/L-zGSUKQXVaHSV-fCS3Hry0FrZs=/1440x1440/filters:format(webp):quality(85)/s3.amazonaws.com/arc-wordpress-client-uploads/infobae-wp/wp-content/uploads/2017/01/18131140/futbol-1920-3-1024x575.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (3, 1, 2, N'¿Qué equipo ha ganado más títulos de la NBA?', N'https://elordenmundial.com/wp-content/uploads/2020/10/NBA-logo-baloncesto-historia-deporte-estados-unidos.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (4, 1, 2, N'¿En qué ciudad se celebraron los Juegos Olímpicos de 2016?', N'https://media.a24.com/p/644d72e5e77509a505bd58a92e255623/adjuntos/296/imagenes/008/759/0008759661/1200x675/smart/juegos-olimpicos-anosjpg.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (5, 1, 3, N'¿Quién fue el primer piloto de Fórmula 1 en ganar 7 campeonatos mundiales?', N'https://brandemia.org/contenido/subidas/2017/11/cabecera_formula1-scaled.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (6, 2, 1, N'¿Quién descubrió América en 1492?', N'https://www.shutterstock.com/image-vector/search-discovery-career-opportunity-new-600nw-2452496199.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (7, 2, 1, N'¿En qué año comenzó la Primera Guerra Mundial?', N'https://images.theconversation.com/files/535507/original/file-20230704-19-4krdlr.jpg?ixlib=rb-4.1.0&rect=0%2C28%2C1920%2C1247&q=20&auto=format&w=320&fit=clip&dpr=2&usm=12&cs=strip')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (8, 2, 2, N'¿Cuál fue la principal razón de la caída del Imperio Romano de Occidente?', N'https://concepto.de/wp-content/uploads/2024/02/imperio-romano.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (9, 2, 2, N'¿Quién fue el líder de la Revolución Rusa de 1917?', N'https://www.cadtm.org/local/cache-vignettes/L710xH373/bb98432bd52d14e49c688bc5340943-b5a09.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (10, 2, 3, N'¿Qué tratado de 1648 puso fin a la Guerra de los Treinta Años en Europa?', N'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Rocroi%2C_el_%C3%BAltimo_tercio%2C_por_Augusto_Ferrer-Dalmau.jpg/300px-Rocroi%2C_el_%C3%BAltimo_tercio%2C_por_Augusto_Ferrer-Dalmau.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (11, 3, 1, N'¿Quién es el protagonista de la saga de películas de "Indiana Jones"?', N'https://m.media-amazon.com/images/M/MV5BNTU2ODkyY2MtMjU1NC00NjE1LWEzYjgtMWQ3MzRhMTE0NDc0XkEyXkFqcGdeQXVyMjM4MzQ4OTQ@._V1_.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (12, 3, 1, N'¿Qué serie de televisión presenta a un grupo de amigos que viven en Nueva York?', N'https://resizer.glanacion.com/resizer/v2/los-nuevos-proyectos-que-cambiaran-nueva-york-en-CVKDCTXI5VD4JJW2C2KQHDPFSE.jpg?auth=31d7617e889ea4e296e051dae865e4213727b66f8ee9799591c507e5c41d418e&width=768&quality=70&smart=false')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (13, 3, 2, N'¿En qué año se estrenó la película "Titanic" dirigida por James Cameron?', N'https://i.blogs.es/4a9cb1/titanic/1366_2000.jpeg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (14, 3, 2, N'¿Cuál es el nombre del dragón en "Juego de Tronos" que es montado por Daenerys Targaryen?', N'https://estaticos-cdn.prensaiberica.es/clip/7892f8cc-05bc-4b7b-88b2-d7cbd553537c_16-9-discover-aspect-ratio_default_0.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (15, 3, 3, N'¿Qué director ganó el Óscar a Mejor Director por la película "El Renacido" en 2016?', N'https://img.lagaceta.com.ar/fotos/notas/2024/03/08/600x400_primera-gala-premios-oscar-fue-1926-1026712-093410.webp')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (16, 4, 1, N'¿Qué planeta del sistema solar es conocido como "el planeta rojo"?', N'https://www.ngenespanol.com/wp-content/uploads/2024/01/que-es-y-como-esta-compuesto-el-sistema-solar.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (17, 4, 1, N'¿Cuál es el nombre del proceso mediante el cual las plantas producen su propio alimento?', N'https://www.ngenespanol.com/wp-content/uploads/2023/08/las-plantas-se-mueven-por-estos-importantes-motivos.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (18, 4, 2, N'¿Qué científico formuló la teoría de la relatividad?', N'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Researcher_looking_through_microscope.jpg/1200px-Researcher_looking_through_microscope.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (19, 4, 2, N'¿Qué nombre recibe el cambio de estado de sólido a gas sin pasar por el estado líquido?', N'https://portaluniversidad.org.ar/wp-content/uploads/2023/05/gas-1.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (20, 4, 3, N'¿Cuál es el nombre del primer elemento de la tabla periódica?', N'https://revistanyt.com.ar/online/wp-content/uploads/2023/07/tper-557x400.jpg')
SET IDENTITY_INSERT [dbo].[Preguntas] OFF
GO
SET IDENTITY_INSERT [dbo].[Respuestas] ON 

INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (1, 1, 1, N'Tenis', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (3, 2, 2, N'11 jugadores', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (4, 3, 2, N'Boston Celtics y Los Angeles Lakers', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (5, 4, 1, N'Río de Janeiro, Brasil', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (6, 5, 1, N'Michael Schumacher', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (7, 6, 2, N'Cristóbal Colón', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (8, 7, 3, N'1914', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (9, 8, 1, N'Invasiones bárbaras, problemas internos y económicos', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (10, 9, 2, N'Vladimir Lenin', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (11, 10, 2, N'Tratado de Westfalia', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (12, 11, 3, N'Harrison Ford', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (13, 12, 1, N'Friends', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (14, 13, 3, N'1997', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (15, 14, 2, N'Drogon', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (16, 15, 3, N'Alejandro González Iñárritu', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (17, 16, 2, N'Marte', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (18, 17, 1, N'Fotosíntesis', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (19, 18, 3, N'Albert Einstein', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (20, 19, 4, N'Sublimación', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (21, 20, 4, N'Hidrógeno', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (22, 1, 2, N'Hockey', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (24, 2, 1, N'10 jugadores', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (25, 3, 1, N'Chicago Bulls', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (26, 4, 2, N'Brasilia, Brasil', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (29, 5, 2, N'Fangio', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (31, 6, 3, N'Milo Landivar', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (32, 7, 2, N'1916', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (34, 8, 3, N'Invasiones griegas', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (35, 9, 1, N'Vladimir Cordero', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (37, 10, 3, N'Tratado de Versalles', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (39, 11, 1, N'Harrison Ferrari', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (40, 12, 2, N'Gravity Falls', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (42, 13, 1, N'2001', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (43, 14, 3, N'Dragon Bill', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (45, 15, 2, N'Pablo Gonzalez Duwertz', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (46, 16, 1, N'Saturno', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (47, 17, 2, N'Molecula', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (48, 18, 2, N'Charles Newton', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (50, 19, 1, N'Subastractor', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (51, 20, 1, N'Hidrocarburo', 0)
SET IDENTITY_INSERT [dbo].[Respuestas] OFF
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Categorias] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categorias] ([IdCategoria])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Categorias]
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Dificultades] FOREIGN KEY([IdDificultad])
REFERENCES [dbo].[Dificultades] ([IdDificultad])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Dificultades]
GO
