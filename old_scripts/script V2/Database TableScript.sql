USE [Door2doorZbc]
GO
/****** Object:  UserDefinedFunction [dbo].[geometry2json]    Script Date: 01/12/2021 09:53:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[geometry2json]( @geo geometry)
RETURNS nvarchar(MAX) AS
BEGIN
RETURN (
'{' +
(CASE @geo.STGeometryType()
WHEN 'POINT' THEN
'"type": "Point","coordinates":' +
REPLACE(REPLACE(REPLACE(REPLACE(@geo.ToString(),'POINT ',''),'(','['),')',']'),' ',',')
WHEN 'POLYGON' THEN
'"type": "Polygon","coordinates":' +
'[' + REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@geo.ToString(),'POLYGON ',''),'(','['),')',']'),'], ',']],['),', ','],['),' ',',') + ']'
WHEN 'MULTIPOLYGON' THEN
'"type": "MultiPolygon","coordinates":' +
'[' + REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@geo.ToString(),'MULTIPOLYGON ',''),'(','['),')',']'),'], ',']],['),', ','],['),' ',',') + ']'
WHEN 'MULTIPOINT' THEN
'"type": "MultiPoint","coordinates":' +
'[' + REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@geo.ToString(),'MULTIPOINT ',''),'(','['),')',']'),'], ',']],['),', ','],['),' ',',') + ']'
WHEN 'LINESTRING' THEN
'"type": "LineString","coordinates":' +
'[' + REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@geo.ToString(),'LINESTRING ',''),'(','['),')',']'),'], ',']],['),', ','],['),' ',',') + ']'
ELSE NULL
END)
+'}')
END
GO
/****** Object:  Table [dbo].[geometry_columns]    Script Date: 01/12/2021 09:53:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[geometry_columns](
	[f_table_catalog] [varchar](128) NOT NULL,
	[f_table_schema] [varchar](128) NOT NULL,
	[f_table_name] [varchar](256) NOT NULL,
	[f_geometry_column] [varchar](256) NOT NULL,
	[coord_dimension] [int] NOT NULL,
	[srid] [int] NOT NULL,
	[geometry_type] [varchar](30) NOT NULL,
 CONSTRAINT [geometry_columns_pk] PRIMARY KEY CLUSTERED 
(
	[f_table_catalog] ASC,
	[f_table_schema] ASC,
	[f_table_name] ASC,
	[f_geometry_column] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Level]    Script Date: 01/12/2021 09:53:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Level](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](80) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POI]    Script Date: 01/12/2021 09:53:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POI](
	[qgs_fid] [int] IDENTITY(1,1) NOT NULL,
	[geom] [geometry] NULL,
	[id] [int] NULL,
	[name] [nvarchar](max) NULL,
	[type] [int] NULL,
 CONSTRAINT [PK_POICopy] PRIMARY KEY CLUSTERED 
(
	[qgs_fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POIType]    Script Date: 01/12/2021 09:53:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POIType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](80) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 01/12/2021 09:53:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[qgs_fid] [int] IDENTITY(1,1) NOT NULL,
	[geom] [geometry] NULL,
	[roomid] [int] NULL,
	[name] [nvarchar](max) NULL,
	[RoomType] [int] NULL,
 CONSTRAINT [PK_RoomsCopy] PRIMARY KEY CLUSTERED 
(
	[qgs_fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomLabels]    Script Date: 01/12/2021 09:53:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomLabels](
	[qgs_fid] [int] IDENTITY(1,1) NOT NULL,
	[geom] [geometry] NULL,
	[id] [bigint] NULL,
	[name] [nvarchar](max) NULL,
 CONSTRAINT [PK_RoomLabels] PRIMARY KEY CLUSTERED 
(
	[qgs_fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomType]    Script Date: 01/12/2021 09:53:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SolidWalls]    Script Date: 01/12/2021 09:53:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SolidWalls](
	[qgs_fid] [int] IDENTITY(1,1) NOT NULL,
	[geom] [geometry] NULL,
 CONSTRAINT [PK_WallsCopyPloyGones] PRIMARY KEY CLUSTERED 
(
	[qgs_fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[spatial_ref_sys]    Script Date: 01/12/2021 09:53:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[spatial_ref_sys](
	[srid] [int] NOT NULL,
	[auth_name] [varchar](256) NULL,
	[auth_srid] [int] NULL,
	[srtext] [varchar](2048) NULL,
	[proj4text] [varchar](2048) NULL,
PRIMARY KEY CLUSTERED 
(
	[srid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WalkableAreaTesting]    Script Date: 01/12/2021 09:53:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WalkableAreaTesting](
	[qgs_fid] [int] IDENTITY(1,1) NOT NULL,
	[geom] [geometry] NULL,
	[id] [bigint] NULL,
	[name] [nvarchar](max) NULL,
 CONSTRAINT [PK_WalableAreaTesting] PRIMARY KEY CLUSTERED 
(
	[qgs_fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_RoomType] FOREIGN KEY([RoomType])
REFERENCES [dbo].[RoomType] ([id])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_RoomType]
GO
