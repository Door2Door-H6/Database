Create database Door2DoorZbc;
USE [Door2DoorZbc]
GO
/****** Object:  Table [dbo].[geometry_columns]    Script Date: 03/12/2021 12:56:02 ******/
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
/****** Object:  Table [dbo].[Level]    Script Date: 03/12/2021 12:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Level](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](128) NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POI]    Script Date: 03/12/2021 12:56:02 ******/
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
/****** Object:  Table [dbo].[POIType]    Script Date: 03/12/2021 12:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POIType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](128) NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 03/12/2021 12:56:02 ******/
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
/****** Object:  Table [dbo].[RoomLabels]    Script Date: 03/12/2021 12:56:02 ******/
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
/****** Object:  Table [dbo].[RoomType]    Script Date: 03/12/2021 12:56:02 ******/
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
/****** Object:  Table [dbo].[SolidWalls]    Script Date: 03/12/2021 12:56:02 ******/
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
/****** Object:  Table [dbo].[spatial_ref_sys]    Script Date: 03/12/2021 12:56:02 ******/
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
/****** Object:  Table [dbo].[WalkableAreaTesting]    Script Date: 03/12/2021 12:56:02 ******/
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
INSERT [dbo].[geometry_columns] ([f_table_catalog], [f_table_schema], [f_table_name], [f_geometry_column], [coord_dimension], [srid], [geometry_type]) VALUES (N'Door2DoorZbc', N'dbo', N'POICopy', N'geom', 2, 4326, N'POINT')
GO
INSERT [dbo].[geometry_columns] ([f_table_catalog], [f_table_schema], [f_table_name], [f_geometry_column], [coord_dimension], [srid], [geometry_type]) VALUES (N'Door2DoorZbc', N'dbo', N'ReprojectedPOI', N'geom', 2, 4326, N'POINT')
GO
INSERT [dbo].[geometry_columns] ([f_table_catalog], [f_table_schema], [f_table_name], [f_geometry_column], [coord_dimension], [srid], [geometry_type]) VALUES (N'Door2DoorZbc', N'dbo', N'ReprojectedRooms', N'geom', 2, 4326, N'MULTIPOLYGON')
GO
INSERT [dbo].[geometry_columns] ([f_table_catalog], [f_table_schema], [f_table_name], [f_geometry_column], [coord_dimension], [srid], [geometry_type]) VALUES (N'Door2DoorZbc', N'dbo', N'ReprojectedWalls', N'geom', 3, 4326, N'MULTILINESTRING')
GO
INSERT [dbo].[geometry_columns] ([f_table_catalog], [f_table_schema], [f_table_name], [f_geometry_column], [coord_dimension], [srid], [geometry_type]) VALUES (N'Door2DoorZbc', N'dbo', N'RoomLabels', N'geom', 2, 4326, N'POINT')
GO
INSERT [dbo].[geometry_columns] ([f_table_catalog], [f_table_schema], [f_table_name], [f_geometry_column], [coord_dimension], [srid], [geometry_type]) VALUES (N'Door2DoorZbc', N'dbo', N'RoomsCopy', N'geom', 2, 4326, N'MULTIPOLYGON')
GO
INSERT [dbo].[geometry_columns] ([f_table_catalog], [f_table_schema], [f_table_name], [f_geometry_column], [coord_dimension], [srid], [geometry_type]) VALUES (N'Door2DoorZbc', N'dbo', N'WalableAreaTesting', N'geom', 2, 4326, N'MULTILINESTRING')
GO
INSERT [dbo].[geometry_columns] ([f_table_catalog], [f_table_schema], [f_table_name], [f_geometry_column], [coord_dimension], [srid], [geometry_type]) VALUES (N'Door2DoorZbc', N'dbo', N'WalkableArea', N'geom', 2, 4326, N'MULTILINESTRING')
GO
INSERT [dbo].[geometry_columns] ([f_table_catalog], [f_table_schema], [f_table_name], [f_geometry_column], [coord_dimension], [srid], [geometry_type]) VALUES (N'Door2DoorZbc', N'dbo', N'WallsCopyPloyGones', N'geom', 2, 4326, N'MULTIPOLYGON')
GO
SET IDENTITY_INSERT [dbo].[POI] ON
GO
INSERT [dbo].[POI] ([qgs_fid], [geom], [id], [name], [type]) VALUES (1, 0xE6100000010C8EE166381ACC883F56A5AA0D235A883F, 1, N'B30 Door', 1)
GO
INSERT [dbo].[POI] ([qgs_fid], [geom], [id], [name], [type]) VALUES (2, 0xE6100000010C369B4C8174B88D3F953EF7E50DE2893F, 2, N'WC3 Door', 2)
GO
INSERT [dbo].[POI] ([qgs_fid], [geom], [id], [name], [type]) VALUES (3, 0xE6100000010CC66F2EC692DF8F3F953EF7E50DE2893F, 3, N'WC1 Door', 2)
GO
INSERT [dbo].[POI] ([qgs_fid], [geom], [id], [name], [type]) VALUES (4, 0xE6100000010C7DD61A816616913F953EF7E50DE2893F, 4, N'WC3 Door', 2)
GO
INSERT [dbo].[POI] ([qgs_fid], [geom], [id], [name], [type]) VALUES (5, 0xE6100000010CCFC7B6F58681803F08BBAE2A38FA8D3F, 5, N'B24 Door', 1)
GO
INSERT [dbo].[POI] ([qgs_fid], [geom], [id], [name], [type]) VALUES (6, 0xE6100000010CAE3424BC810C8F3F08BBAE2A38FA8D3F, 6, N'B00 Door', 1)
GO
INSERT [dbo].[POI] ([qgs_fid], [geom], [id], [name], [type]) VALUES (7, 0xE6100000010C78CE69F08C29973F08BBAE2A38FA8D3F, 7, N'B25 Door', 1)
GO
INSERT [dbo].[POI] ([qgs_fid], [geom], [id], [name], [type]) VALUES (8, 0xE6100000010CA16F66994E04903F2AAACAAA046A783F, 8, N'InfoStander', 3)
GO
INSERT [dbo].[POI] ([qgs_fid], [geom], [id], [name], [type]) VALUES (9, 0xE6100000010C298B7966ABC97E3F21F33BADE0FA8B3F, 9, N'Depot Door', 1)
GO
INSERT [dbo].[POI] ([qgs_fid], [geom], [id], [name], [type]) VALUES (10, 0xE6100000010CE7D60084021C9F3F08BBAE2A38FA8D3F, 10, N'B14 Door', 1)
GO
INSERT [dbo].[POI] ([qgs_fid], [geom], [id], [name], [type]) VALUES (11, 0xE6100000010CA301810E221CA03F4F6147B3FE94903F, 11, N'B14,B12 Door', 1)
GO
INSERT [dbo].[POI] ([qgs_fid], [geom], [id], [name], [type]) VALUES (12, 0xE6100000010C29E6D68155C3A03F4BA882E9AA40933F, 12, N'B12 kontor,B12 Door', 1)
GO
INSERT [dbo].[POI] ([qgs_fid], [geom], [id], [name], [type]) VALUES (13, 0xE6100000010C031346FEE67CA13F11152B1CDDA3903F, 13, N'B12,B10 Door', 1)
GO
INSERT [dbo].[POI] ([qgs_fid], [geom], [id], [name], [type]) VALUES (14, 0xE6100000010C6168693341DEA23F39B6D9D1B1A9903F, 14, N'B10,B08 Door', 1)
GO
INSERT [dbo].[POI] ([qgs_fid], [geom], [id], [name], [type]) VALUES (15, 0xE6100000010C1FEFB7AEFE20A43F75E904C0DA48923F, 15, N'B08,B08 Kitchen Door', 1)
GO
INSERT [dbo].[POI] ([qgs_fid], [geom], [id], [name], [type]) VALUES (16, 0xE6100000010C3D3EF76EB772A43F515B66AAC391913F, 16, N'B08 Door', 1)
GO
INSERT [dbo].[POI] ([qgs_fid], [geom], [id], [name], [type]) VALUES (17, 0xE6100000010C2AF7CF1224BEA43FF950FC387158923F, 17, N'B02 wc Door', 1)
GO
INSERT [dbo].[POI] ([qgs_fid], [geom], [id], [name], [type]) VALUES (18, 0xE6100000010C74827E652571A53F8817893F5257923F, 18, N'B02 Door', 1)
GO
INSERT [dbo].[POI] ([qgs_fid], [geom], [id], [name], [type]) VALUES (19, 0xE6100000010C1307393C7888A53F4DC246F43C9F8F3F, 19, N'Stairs to bacement', 4)
GO
INSERT [dbo].[POI] ([qgs_fid], [geom], [id], [name], [type]) VALUES (20, 0xE6100000010CFBF4AC98893D9F3F6E43DD99DEB7893F, 20, N'Atrium Door', 1)
GO
SET IDENTITY_INSERT [dbo].[POI] OFF
GO
SET IDENTITY_INSERT [dbo].[Room] ON
GO
INSERT [dbo].[Room] ([qgs_fid], [geom], [roomid], [name], [RoomType]) VALUES (1, 0xE610000001040500000069EEBA74658C813F4942B3A2E006963FEF756E014334903F60BE5E73DE06963F7D755EA9EF34903F08BBAE2A38FA8D3F69EEBA74658C813F08BBAE2A38FA8D3F69EEBA74658C813F4942B3A2E006963F01000000020000000002000000FFFFFFFF0000000006000000000000000003, 1, N'B16', 1)
GO
INSERT [dbo].[Room] ([qgs_fid], [geom], [roomid], [name], [RoomType]) VALUES (2, 0xE6100000010405000000A0A03D938CBA4B3F4942B3A2E006963F1D5709AADE53813F4942B3A2E006963F1D5709AADE53813F08BBAE2A38FA8D3FA0A03D938CBA4B3F08BBAE2A38FA8D3FA0A03D938CBA4B3F4942B3A2E006963F01000000020000000002000000FFFFFFFF0000000006000000000000000003, 2, N'B24', 1)
GO
INSERT [dbo].[Room] ([qgs_fid], [geom], [roomid], [name], [RoomType]) VALUES (3, 0xE61000000104050000007540C7668650903F4942B3A2E006963FF8DC0826643A983F4942B3A2E006963FF8DC0826643A983F08BBAE2A38FA8D3F0340B70E3351903F08BBAE2A38FA8D3F7540C7668650903F4942B3A2E006963F01000000020000000002000000FFFFFFFF0000000006000000000000000003, 3, N'B25', 1)
GO
INSERT [dbo].[Room] ([qgs_fid], [geom], [roomid], [name], [RoomType]) VALUES (4, 0xE61000000104050000007EA7618BA756983F4942B3A2E006963FED9265122614A03F4942B3A2E006963FED9265122614A03F08BBAE2A38FA8D3F7EA7618BA756983F08BBAE2A38FA8D3F7EA7618BA756983F4942B3A2E006963F01000000020000000002000000FFFFFFFF0000000006000000000000000003, 4, N'B26', 1)
GO
INSERT [dbo].[Room] ([qgs_fid], [geom], [roomid], [name], [RoomType]) VALUES (5, 0xE6100000010405000000EFAF4A026FDA773F953EF7E50DE2893F9CC38BEC19CC883F953EF7E50DE2893FBA66828B1ECC883F78F32F753A11503FEFAF4A026FDA773FC908EDC24211503FEFAF4A026FDA773F953EF7E50DE2893F01000000020000000002000000FFFFFFFF0000000006000000000000000003, 5, N'B30', 1)
GO
INSERT [dbo].[Room] ([qgs_fid], [geom], [roomid], [name], [RoomType]) VALUES (6, 0xE6100000010405000000817E198F1AEE8E3F953EF7E50DE2893FA104C85A1177903F953EF7E50DE2893FA104C85A1177903F80005238A274853F817E198F1AEE8E3F80005238A274853F817E198F1AEE8E3F953EF7E50DE2893F01000000020000000002000000FFFFFFFF0000000006000000000000000003, 6, N'Wc1', 2)
GO
INSERT [dbo].[Room] ([qgs_fid], [geom], [roomid], [name], [RoomType]) VALUES (7, 0xE610000001040500000027CF20C05493903F80005238A274853F27CF20C05493903F953EF7E50DE2893FB79268AE798F913F953EF7E50DE2893FB79268AE798F913F80005238A274853F27CF20C05493903F80005238A274853F01000000020000000002000000FFFFFFFF0000000006000000000000000003, 7, N'Wc2', 2)
GO
INSERT [dbo].[Room] ([qgs_fid], [geom], [roomid], [name], [RoomType]) VALUES (8, 0xE6100000010407000000A4A7A14400B88C3F953EF7E50DE2893F75E967C493B58E3F953EF7E50DE2893F359F165B91B58E3F7C0E12E7B93B853FB79268AE798F913F7C0E12E7B93B853FB79268AE798F913F01C9F16A60A67D3FA4A7A14400B88C3F01C9F16A60A67D3FA4A7A14400B88C3F953EF7E50DE2893F01000000020000000002000000FFFFFFFF0000000006000000000000000003, 8, N'Wc3', 2)
GO
INSERT [dbo].[Room] ([qgs_fid], [geom], [roomid], [name], [RoomType]) VALUES (9, 0xE61000000104050000007D03DD199BE6913F92ED3C82856B893FDBA9A3FF8BEAA63F92ED3C82856B893FDBA9A3FF8BEAA63F1EE7A6F81AB6483F7D03DD199BE6913F1EE7A6F81AB6483F7D03DD199BE6913F92ED3C82856B893F01000000020000000002000000FFFFFFFF0000000006000000000000000003, 9, N'Atrium', 5)
GO
INSERT [dbo].[Room] ([qgs_fid], [geom], [roomid], [name], [RoomType]) VALUES (10, 0xE610000001040500000030F811C54722A03F4942B3A2E006963F625DFF726175A13F4942B3A2E006963F625DFF726175A13F50A9424D324F933F30F811C54722A03F50A9424D324F933F30F811C54722A03F4942B3A2E006963F01000000020000000002000000FFFFFFFF0000000006000000000000000003, 10, N'B12 kontor', 4)
GO
INSERT [dbo].[Room] ([qgs_fid], [geom], [roomid], [name], [RoomType]) VALUES (11, 0xE610000001040500000030F811C54722A03FDFBBB424BE32933F625DFF726175A13FDFBBB424BE32933F625DFF726175A13F08BBAE2A38FA8D3F30F811C54722A03F08BBAE2A38FA8D3F30F811C54722A03FDFBBB424BE32933F01000000020000000002000000FFFFFFFF0000000006000000000000000003, 11, N'B12', 4)
GO
INSERT [dbo].[Room] ([qgs_fid], [geom], [roomid], [name], [RoomType]) VALUES (12, 0xE6100000010405000000A5C2AB258383A13F4942B3A2E006963F472799D39CD6A23F4942B3A2E006963F472799D39CD6A23FD5CE9B0B38FA8D3FA5C2AB258383A13F08BBAE2A38FA8D3FA5C2AB258383A13F4942B3A2E006963F01000000020000000002000000FFFFFFFF0000000006000000000000000003, 12, N'B10', 4)
GO
INSERT [dbo].[Room] ([qgs_fid], [geom], [roomid], [name], [RoomType]) VALUES (13, 0xE61000000104050000008A8C4586BEE4A23F4942B3A2E006963F3D3EF76EB772A43F4942B3A2E006963F3D3EF76EB772A43F8817893F5257923F8A8C4586BEE4A23F8817893F5257923F8A8C4586BEE4A23F4942B3A2E006963F01000000020000000002000000FFFFFFFF0000000006000000000000000003, 13, N'B10-K???kken', 4)
GO
INSERT [dbo].[Room] ([qgs_fid], [geom], [roomid], [name], [RoomType]) VALUES (14, 0xE61000000104050000008A8C4586BEE4A23FF19BF816DE3A923F3D3EF76EB772A43FF19BF816DE3A923F3D3EF76EB772A43F08BBAE2A38FA8D3F8A8C4586BEE4A23F08BBAE2A38FA8D3F8A8C4586BEE4A23FF19BF816DE3A923F01000000020000000002000000FFFFFFFF0000000006000000000000000003, 14, N'B08 indgang', 4)
GO
INSERT [dbo].[Room] ([qgs_fid], [geom], [roomid], [name], [RoomType]) VALUES (15, 0xE6100000010405000000BAA230E2B8CCA63FDCF7C7530202923F715EA8CF99ABA53FDCF7C7530202923F976B21E5EEADA53F95E3D0833BE58E3FBAA230E2B8CCA63F95E3D0833BE58E3FBAA230E2B8CCA63FDCF7C7530202923F01000000020000000002000000FFFFFFFF0000000006000000000000000003, 15, N'B gang trappe', 5)
GO
INSERT [dbo].[Room] ([qgs_fid], [geom], [roomid], [name], [RoomType]) VALUES (16, 0xE610000001040700000080A3A321D980A43F4942B3A2E006963FBAA230E2B8CCA63F4942B3A2E006963FBAA230E2B8CCA63F8817893F5257923FBEAEEDDF9A04A53F8817893F5257923F896DF08E7504A53F97E93F93A121943F80A3A321D980A43F425B0371E51E943F80A3A321D980A43F4942B3A2E006963F01000000020000000002000000FFFFFFFF0000000006000000000000000003, 16, N'B02', 4)
GO
INSERT [dbo].[Room] ([qgs_fid], [geom], [roomid], [name], [RoomType]) VALUES (17, 0xE610000001040500000080A3A321D980A43F8817893F5257923F80A3A321D980A43FF1EB3EEB7002943F7B49412D79F6A43FFF92A595E204943F7B49412D79F6A43F106803F97859923F80A3A321D980A43F8817893F5257923F01000000020000000002000000FFFFFFFF0000000006000000000000000003, 17, N'B02 wc', 2)
GO
INSERT [dbo].[Room] ([qgs_fid], [geom], [roomid], [name], [RoomType]) VALUES (18, 0xE6100000010405000000DEB57F84ABC97E3FE71D7ED94FC18D3FC462C446ABC97E3F03732F37F61A8A3FA0A03D938CBA4B3F8C467200F51A8A3FA0A03D938CBA4B3FE71D7ED94FC18D3FDEB57F84ABC97E3FE71D7ED94FC18D3F01000000020000000002000000FFFFFFFF0000000006000000000000000003, 18, N'B depot', 3)
GO
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomLabels] ON
GO
INSERT [dbo].[RoomLabels] ([qgs_fid], [geom], [id], [name]) VALUES (1, 0xE6100000010CCB080E4A0717713F996EF4E625A8923F, 1, N'B26')
GO
INSERT [dbo].[RoomLabels] ([qgs_fid], [geom], [id], [name]) VALUES (2, 0xE6100000010C2B31C165E66B883F7A4C57C1A57B923F, 2, N'B24')
GO
INSERT [dbo].[RoomLabels] ([qgs_fid], [geom], [id], [name]) VALUES (3, 0xE6100000010CB7C5FB56CF43943FDA5736237B8A923F, 3, N'B16')
GO
INSERT [dbo].[RoomLabels] ([qgs_fid], [geom], [id], [name]) VALUES (4, 0xE6100000010C1ADC58B700349C3F7A4C57C1A57B923F, 4, N'B14')
GO
INSERT [dbo].[RoomLabels] ([qgs_fid], [geom], [id], [name]) VALUES (5, 0xE6100000010C263C384A0DC8A03FC6FA0C1BFFEC903F, 5, N'B12')
GO
INSERT [dbo].[RoomLabels] ([qgs_fid], [geom], [id], [name]) VALUES (6, 0xE6100000010C263C384A0DC8A03FE7F46CB8D7CE943F, 6, N'B12 Kontor')
GO
INSERT [dbo].[RoomLabels] ([qgs_fid], [geom], [id], [name]) VALUES (7, 0xE6100000010C4E8AA91E5928A23FC766EE56ABC7923F, 7, N'B10')
GO
INSERT [dbo].[RoomLabels] ([qgs_fid], [geom], [id], [name]) VALUES (8, 0xE6100000010CE774C867BAADA33FC777D783AC2B943F, 8, N'B08 K???kken')
GO
INSERT [dbo].[RoomLabels] ([qgs_fid], [geom], [id], [name]) VALUES (9, 0xE6100000010C5F2C615E9AA2A33F151A255BE96E903F, 9, N'B08')
GO
INSERT [dbo].[RoomLabels] ([qgs_fid], [geom], [id], [name]) VALUES (10, 0xE6100000010C8F4BAED206C0A53F361485F8C150943F, 10, N'B02')
GO
INSERT [dbo].[RoomLabels] ([qgs_fid], [geom], [id], [name]) VALUES (11, 0xE6100000010CCC2822B3C28C9E3F8B2B49DD2F9B7B3F, 11, N'Atrium')
GO
INSERT [dbo].[RoomLabels] ([qgs_fid], [geom], [id], [name]) VALUES (12, 0xE6100000010C29E1465597D68F3F9EB490FF8ABD873F, 12, N'Wc 2')
GO
INSERT [dbo].[RoomLabels] ([qgs_fid], [geom], [id], [name]) VALUES (13, 0xE6100000010C8D0BA946D708913FAB455F12CBD3873F, 13, N'wc 3')
GO
INSERT [dbo].[RoomLabels] ([qgs_fid], [geom], [id], [name]) VALUES (14, 0xE6100000010CAAB3CACD419B8F3F9870EC4B862D823F, 14, N'Wc 1')
GO
INSERT [dbo].[RoomLabels] ([qgs_fid], [geom], [id], [name]) VALUES (15, 0xE6100000010CBB9A7E1F76C9813FD3CA7B37DB6A7C3F, 15, N'B30')
GO
INSERT [dbo].[RoomLabels] ([qgs_fid], [geom], [id], [name]) VALUES (16, 0xE6100000010C550608FEB6836F3F1184F9FAA30E8C3F, 16, N'Depot')
GO
SET IDENTITY_INSERT [dbo].[RoomLabels] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomType] ON
GO
INSERT [dbo].[RoomType] ([id], [TypeName]) VALUES (1, N'Class room')
GO
INSERT [dbo].[RoomType] ([id], [TypeName]) VALUES (2, N'Toilet')
GO
INSERT [dbo].[RoomType] ([id], [TypeName]) VALUES (3, N'Storage')
GO
INSERT [dbo].[RoomType] ([id], [TypeName]) VALUES (4, N'Teachers Room')
GO
INSERT [dbo].[RoomType] ([id], [TypeName]) VALUES (5, N'Others')
GO
SET IDENTITY_INSERT [dbo].[RoomType] OFF
GO
SET IDENTITY_INSERT [dbo].[SolidWalls] ON
GO
INSERT [dbo].[SolidWalls] ([qgs_fid], [geom]) VALUES (1, 0xE61000000104410000008629630AE5E5913FBDE6A8E39527453F8629630AE5E5913F942F0B9E8D2B453F9C78DC720C988C3F942F0B9E8D2B453F9C78DC720C988C3FC908EDC24211503FB79268AE798F913FC908EDC24211503FB79268AE798F913F8B1C61C88F347D3F9912F079797F8C3F8B1C61C88F347D3F9912F079797F8C3F03732F37F61A8A3F52656A5D9DF48C3F03732F37F61A8A3F52656A5D9DF48C3F953EF7E50DE2893FA4A7A14400B88C3F953EF7E50DE2893FA4A7A14400B88C3F01C9F16A60A67D3FB79268AE798F913F01C9F16A60A67D3FB79268AE798F913F7C0E12E7B93B853F359F165B91B58E3F7C0E12E7B93B853F359F165B91B58E3F80005238A274853F75E967C493B58E3F80005238A274853F75E967C493B58E3F953EF7E50DE2893FE589BC377E9C8E3F953EF7E50DE2893FE589BC377E9C8E3F03732F37F61A8A3FAF65C33357128F3F03732F37F61A8A3FAF65C33357128F3F953EF7E50DE2893F817E198F1AEE8E3F953EF7E50DE2893F817E198F1AEE8E3F80005238A274853FA104C85A1177903F80005238A274853FA104C85A1177903F953EF7E50DE2893F21C50A071C5D903F953EF7E50DE2893F21C50A071C5D903F03732F37F61A8A3F4712CFA418AF903F03732F37F61A8A3F4712CFA418AF903F953EF7E50DE2893F27CF20C05493903F953EF7E50DE2893F27CF20C05493903F80005238A274853FB79268AE798F913F80005238A274853FB79268AE798F913F953EF7E50DE2893FB025F8110983913F953EF7E50DE2893FB025F8110983913F03732F37F61A8A3FD7E5BC487A8F913F03732F37F61A8A3FD7E5BC487A8F913F8C467200F51A8A3F17841E02ABA89E3F8C467200F51A8A3F17841E02ABA89E3F3262CAD017CF893F8E3C348E3B149E3F3262CAD017CF893F8E3C348E3B149E3FDDC2E5B162B7893F17841E02ABA89E3FDDC2E5B162B7893F17841E02ABA89E3F92ED3C82856B893F7D03DD199BE6913F92ED3C82856B893F7D03DD199BE6913F1EE7A6F81AB6483FDBA9A3FF8BEAA63F1EE7A6F81AB6483FDBA9A3FF8BEAA63F92ED3C82856B893FEA10F3E989D19F3F92ED3C82856B893FEA10F3E989D19F3FEB54ADF87AB7893F3AACEEAEFC32A03FEB54ADF87AB7893F3AACEEAEFC32A03F40F4911730CF893FEA10F3E989D19F3F40F4911730CF893FEA10F3E989D19F3F8C467200F51A8A3F625DFF726175A13F8C467200F51A8A3F625DFF726175A13F7429014DFD2B8A3FA5C2AB258383A13F7429014DFD2B8A3FA5C2AB258383A13F8C467200F51A8A3FBAA230E2B8CCA63F8C467200F51A8A3FBAA230E2B8CCA63FD5B1EB8CB5498A3F1DDBEA9749F8A63FD5B1EB8CB5498A3F1DDBEA9749F8A63FFFE3DBADF8128A3F1E0F50B2ADF8A63FFFE3DBADF8128A3F1E0F50B2ADF8A63FBDE6A8E39527453F8629630AE5E5913FBDE6A8E39527453F01000000020000000002000000FFFFFFFF0000000006000000000000000003)
GO
INSERT [dbo].[SolidWalls] ([qgs_fid], [geom]) VALUES (2, 0xE610000001042C0000007D0EA1C2E33E813F08BBAE2A38FA8D3F1D5709AADE53813F08BBAE2A38FA8D3F1D5709AADE53813F4942B3A2E006963FA0A03D938CBA4B3F4942B3A2E006963FA0A03D938CBA4B3F08BBAE2A38FA8D3FBC493EC8378C7F3F08BBAE2A38FA8D3FBC493EC8378C7F3FE71D7ED94FC18D3FF5DFE219B93A7F3FE71D7ED94FC18D3FF5DFE219B93A7F3F60884F61C4B28C3FDEB57F84ABC97E3F60884F61C4B28C3FDEB57F84ABC97E3FE71D7ED94FC18D3FA0A03D938CBA4B3FE71D7ED94FC18D3FA0A03D938CBA4B3F8C467200F51A8A3FEF67F9986CDA773F8C467200F51A8A3FEF67F9986CDA773F03732F37F61A8A3FC462C446ABC97E3F03732F37F61A8A3FC462C446ABC97E3F8A5C217372378B3FDC8C27DCB83A7F3F8A5C217372378B3FDC8C27DCB83A7F3F03732F37F61A8A3FA8583DB7A004893F03732F37F61A8A3FA8583DB7A004893FDC5C6B6F611F893F9CC38BEC19CC883FDC5C6B6F611F893F9CC38BEC19CC883F953EF7E50DE2893FEFAF4A026FDA773F953EF7E50DE2893FEFAF4A026FDA773FC908EDC24211503FBC454AFDC719893FC908EDC24211503FBC454AFDC719893F942F0B9E8D2B453FD5EC7854E97D763F942F0B9E8D2B453FD5EC7854E97D763F92ED3C82856B893FCF63AF245FD6403F92ED3C82856B893FCF63AF245FD6403F09228761985E963F2863F7C0FECC963F09228761985E963F2863F7C0FECC963F4942B3A2E006963F7540C7668650903F4942B3A2E006963FC96A4CD50751903FE83C1F33FEBF903F43A0F36FC434903F9D96F577FBBF903FEF756E014334903F60BE5E73DE06963F274B8252DF4A903F4942B3A2E006963F69EEBA74658C813F4942B3A2E006963F69EEBA74658C813F08BBAE2A38FA8D3F29552D9C8B3C8E3F08BBAE2A38FA8D3F29552D9C8B3C8E3FE71D7ED94FC18D3F7D0EA1C2E33E813FE71D7ED94FC18D3F7D0EA1C2E33E813F08BBAE2A38FA8D3F01000000020000000002000000FFFFFFFF0000000006000000000000000003)
GO
INSERT [dbo].[SolidWalls] ([qgs_fid], [geom]) VALUES (3, 0xE6100000010405000000A8583DB7A004893F5309831A0338503F9CC38BEC19CC883F5309831A0338503F9CC38BEC19CC883F7EEE4443A574873FA8583DB7A004893F7EEE4443A574873FA8583DB7A004893F5309831A0338503F01000000020000000002000000FFFFFFFF0000000006000000000000000003)
GO
INSERT [dbo].[SolidWalls] ([qgs_fid], [geom]) VALUES (4, 0xE6100000010444000000896DF08E7504A53F97E93F93A121943FBEAEEDDF9A04A53FEB2FAAFE2E05943FBEAEEDDF9A04A53F8817893F5257923F2F6EBAC33C3DA53F8817893F5257923F2F6EBAC33C3DA53FF19BF816DE3A923F7B49412D79F6A43FF19BF816DE3A923F7B49412D79F6A43FFF92A595E204943F80A3A321D980A43FF1EB3EEB7002943F80A3A321D980A43F8817893F5257923F7254F635FD8CA43F8817893F5257923F7254F635FD8CA43FF19BF816DE3A923F80A3A321D980A43FF19BF816DE3A923F80A3A321D980A43F0D415C8B10F3913F3D3EF76EB772A43F0D415C8B10F3913F3D3EF76EB772A43FF19BF816DE3A923F1148B44A9F58A43FF19BF816DE3A923F1148B44A9F58A43F8817893F5257923F3D3EF76EB772A43F8817893F5257923F3D3EF76EB772A43F4942B3A2E006963F8A8C4586BEE4A23F4942B3A2E006963F8A8C4586BEE4A23F8817893F5257923FEDBE1F14A7EEA33F8817893F5257923FEDBE1F14A7EEA33FF19BF816DE3A923F8A8C4586BEE4A23FF19BF816DE3A923F8A8C4586BEE4A23F8324DA085A0F913F472799D39CD6A23F8324DA085A0F913F472799D39CD6A23F4942B3A2E006963FA5C2AB258383A13F4942B3A2E006963FA5C2AB258383A13F0F8BBF373E06913F625DFF726175A13F0F8BBF373E06913F625DFF726175A13FDFBBB424BE32933F4AE6262BC0F9A03FDFBBB424BE32933F4AE6262BC0F9A03F50A9424D324F933F625DFF726175A13F50A9424D324F933F625DFF726175A13F4942B3A2E006963F30F811C54722A03F4942B3A2E006963F30F811C54722A03F50A9424D324F933F955C92F4C78FA03F50A9424D324F933F955C92F4C78FA03FDFBBB424BE32933F30F811C54722A03FDFBBB424BE32933F30F811C54722A03FD35F2E7622FD903FED9265122614A03FD35F2E7622FD903FED9265122614A03F4942B3A2E006963F7EA7618BA756983F4942B3A2E006963F7EA7618BA756983F08BBAE2A38FA8D3F54297B0156B09E3F08BBAE2A38FA8D3F54297B0156B09E3FE71D7ED94FC18D3F963550AB9390973FE71D7ED94FC18D3F963550AB9390973F08BBAE2A38FA8D3FF8DC0826643A983F08BBAE2A38FA8D3FF8DC0826643A983F4942B3A2E006963F9276202EEFA0973F4942B3A2E006963F9276202EEFA0973F09228761985E963F1DDBEA9749F8A63F09228761985E963F1DDBEA9749F8A63F49944DA4649E8D3FBAA230E2B8CCA63F49944DA4649E8D3FBAA230E2B8CCA63F340A174F0BB88D3FE52AD1E98060A53F7987EA20C9BD8D3F065ED70C8F60A53F68410853B1F68D3FBAA230E2B8CCA63F8AA55ABFF3F08D3FBAA230E2B8CCA63FF19BF816DE3A923F54F74EFA34A7A53FF19BF816DE3A923F54F74EFA34A7A53F8817893F5257923FBAA230E2B8CCA63F8817893F5257923FBAA230E2B8CCA63F4942B3A2E006963F80A3A321D980A43F4942B3A2E006963F80A3A321D980A43F425B0371E51E943F896DF08E7504A53F97E93F93A121943F01000000020000000002000000FFFFFFFF0000000006000000000000000003)
GO
INSERT [dbo].[SolidWalls] ([qgs_fid], [geom]) VALUES (5, 0xE61000000104190000008A8C4586BEE4A23FE71D7ED94FC18D3F8A8C4586BEE4A23FF5336BBA4FC18D3FA5C2AB258383A13FE71D7ED94FC18D3FA5C2AB258383A13FF3999BA448B08D3F625DFF726175A13FF3999BA448B08D3F625DFF726175A13FE71D7ED94FC18D3FBD3CA46E46849F3FE71D7ED94FC18D3FBD3CA46E46849F3F08BBAE2A38FA8D3FED9265122614A03F08BBAE2A38FA8D3FED9265122614A03F79275E60C427903F30F811C54722A03F79275E60C427903F30F811C54722A03F08BBAE2A38FA8D3F625DFF726175A13F08BBAE2A38FA8D3F625DFF726175A13F76F1EF21E030903FA5C2AB258383A13F76F1EF21E030903FA5C2AB258383A13F08BBAE2A38FA8D3F472799D39CD6A23FD5CE9B0B38FA8D3F472799D39CD6A23FEB2B0BF3FB39903F8A8C4586BEE4A23FEB2B0BF3FB39903F8A8C4586BEE4A23F08BBAE2A38FA8D3F3D3EF76EB772A43F08BBAE2A38FA8D3F3D3EF76EB772A43FDC4B9D75B21D913F80A3A321D980A43FDC4B9D75B21D913F80A3A321D980A43FE71D7ED94FC18D3F8A8C4586BEE4A23FE71D7ED94FC18D3F01000000020000000002000000FFFFFFFF0000000006000000000000000003)
GO
INSERT [dbo].[SolidWalls] ([qgs_fid], [geom]) VALUES (6, 0xE61000000104090000004D23273EA3BC963FE71D7ED94FC18D3FFC7B7F766CE48F3FE71D7ED94FC18D3FFC7B7F766CE48F3F08BBAE2A38FA8D3F7D755EA9EF34903F08BBAE2A38FA8D3F03CFB7DFD834903F547342C43AD58F3F899910451C51903FEBBF953A40D58F3F0340B70E3351903F08BBAE2A38FA8D3F4D23273EA3BC963F08BBAE2A38FA8D3F4D23273EA3BC963FE71D7ED94FC18D3F01000000020000000002000000FFFFFFFF0000000006000000000000000003)
GO
SET IDENTITY_INSERT [dbo].[SolidWalls] OFF
GO
INSERT [dbo].[spatial_ref_sys] ([srid], [auth_name], [auth_srid], [srtext], [proj4text]) VALUES (4326, N'EPSG', 4326, N'GEOGCS["WGS 84",DATUM["WGS_1984",SPHEROID["WGS 84",6378137,298.257223563,AUTHORITY["EPSG","7030"]],AUTHORITY["EPSG","6326"]],PRIMEM["Greenwich",0,AUTHORITY["EPSG","8901"]],UNIT["degree",0.0174532925199433,AUTHORITY["EPSG","9122"]],AUTHORITY["EPSG","4326"]]', N'+proj=longlat +datum=WGS84 +no_defs')
GO
SET IDENTITY_INSERT [dbo].[WalkableAreaTesting] ON
GO
INSERT [dbo].[WalkableAreaTesting] ([qgs_fid], [geom], [id], [name]) VALUES (1, 0xE61000000104020000002A04503AD4C08A3FFD179DD760B8573FB054A969A1BD8A3F4A2BC3FE7485783F01000000010000000002000000FFFFFFFF0000000005000000000000000002, 1, N'B indgang infostander')
GO
INSERT [dbo].[WalkableAreaTesting] ([qgs_fid], [geom], [id], [name]) VALUES (2, 0xE6100000010402000000B054A969A1BD8A3F4A2BC3FE7485783FFBDD680F6DC38F3FD96493C6D6AB783F01000000010000000002000000FFFFFFFF0000000005000000000000000002, 2, N'B stander')
GO
INSERT [dbo].[WalkableAreaTesting] ([qgs_fid], [geom], [id], [name]) VALUES (3, 0xE6100000010402000000B054A969A1BD8A3F4A2BC3FE7485783F89424D74F6B48A3F4891CD538261883F01000000010000000002000000FFFFFFFF0000000005000000000000000002, 3, N'B30 exit')
GO
INSERT [dbo].[WalkableAreaTesting] ([qgs_fid], [geom], [id], [name]) VALUES (4, 0xE610000001040200000089424D74F6B48A3F4891CD538261883F8EE166381ACC883F56A5AA0D235A883F01000000010000000002000000FFFFFFFF0000000005000000000000000002, 4, N'B30 entry')
GO
INSERT [dbo].[WalkableAreaTesting] ([qgs_fid], [geom], [id], [name]) VALUES (5, 0xE610000001040200000089424D74F6B48A3F4891CD538261883FDAC849B1CDB28A3F5049BC3817118C3F01000000010000000002000000FFFFFFFF0000000005000000000000000002, 5, N'B gang cross')
GO
INSERT [dbo].[WalkableAreaTesting] ([qgs_fid], [geom], [id], [name]) VALUES (6, 0xE6100000010402000000DAC849B1CDB28A3F5049BC3817118C3FEAC25ED94FA1803F250EFF8A4EFD8B3F01000000010000000002000000FFFFFFFF0000000005000000000000000002, 6, N'B26,depot exit')
GO
INSERT [dbo].[WalkableAreaTesting] ([qgs_fid], [geom], [id], [name]) VALUES (7, 0xE6100000010402000000EAC25ED94FA1803F250EFF8A4EFD8B3FF7DBE243D8A6803F5DFD797CCFDB8D3F01000000010000000002000000FFFFFFFF0000000005000000000000000002, 7, N'B26 entry')
GO
INSERT [dbo].[WalkableAreaTesting] ([qgs_fid], [geom], [id], [name]) VALUES (8, 0xE6100000010402000000EAC25ED94FA1803F250EFF8A4EFD8B3F298B7966ABC97E3F21F33BADE0FA8B3F01000000010000000002000000FFFFFFFF0000000005000000000000000002, 8, N'depot entry')
GO
INSERT [dbo].[WalkableAreaTesting] ([qgs_fid], [geom], [id], [name]) VALUES (9, 0xE6100000010402000000DAC849B1CDB28A3F5049BC3817118C3F807F6F87B5128F3FE24D343BA0118C3F01000000010000000002000000FFFFFFFF0000000005000000000000000002, 9, N'B24 exit')
GO
INSERT [dbo].[WalkableAreaTesting] ([qgs_fid], [geom], [id], [name]) VALUES (10, 0xE6100000010402000000807F6F87B5128F3FE24D343BA0118C3FD8DA3F0CB5168F3F6BB09D6968E18D3F01000000010000000002000000FFFFFFFF0000000005000000000000000002, 10, N'B24 entry')
GO
INSERT [dbo].[WalkableAreaTesting] ([qgs_fid], [geom], [id], [name]) VALUES (11, 0xE6100000010402000000807F6F87B5128F3FE24D343BA0118C3F657100E6EF31973F7B51A30F3B128C3F01000000010000000002000000FFFFFFFF0000000005000000000000000002, 11, N'B16 exit')
GO
INSERT [dbo].[WalkableAreaTesting] ([qgs_fid], [geom], [id], [name]) VALUES (12, 0xE6100000010402000000657100E6EF31973F7B51A30F3B128C3F53BEEEBC6E32973FD6AC204D02DF8D3F01000000010000000002000000FFFFFFFF0000000005000000000000000002, 12, N'B16 entry')
GO
INSERT [dbo].[WalkableAreaTesting] ([qgs_fid], [geom], [id], [name]) VALUES (13, 0xE6100000010402000000657100E6EF31973F7B51A30F3B128C3F14B9FE8C452E9F3F99A587A339138C3F01000000010000000002000000FFFFFFFF0000000005000000000000000002, 13, N'B14 , Artrium exit')
GO
INSERT [dbo].[WalkableAreaTesting] ([qgs_fid], [geom], [id], [name]) VALUES (14, 0xE610000001040200000014B9FE8C452E9F3F99A587A339138C3FC1D4F5C046249F3F930474B59BE08D3F01000000010000000002000000FFFFFFFF0000000005000000000000000002, 14, N'B24 entry')
GO
INSERT [dbo].[WalkableAreaTesting] ([qgs_fid], [geom], [id], [name]) VALUES (15, 0xE610000001040200000014B9FE8C452E9F3F99A587A339138C3F3F6E2A6AAEBCA43FFE54F5DD58148C3F01000000010000000002000000FFFFFFFF0000000005000000000000000002, 15, N'B02,B08,B10,B12 exit')
GO
INSERT [dbo].[WalkableAreaTesting] ([qgs_fid], [geom], [id], [name]) VALUES (16, 0xE61000000104020000003F6E2A6AAEBCA43FFE54F5DD58148C3F484BDF5546BDA43F285429CCA8948F3F01000000010000000002000000FFFFFFFF0000000005000000000000000002, 16, N'B gang k???lder exit')
GO
INSERT [dbo].[WalkableAreaTesting] ([qgs_fid], [geom], [id], [name]) VALUES (17, 0xE6100000010402000000484BDF5546BDA43F285429CCA8948F3F981287E5E1BDA43F7418398D3995913F01000000010000000002000000FFFFFFFF0000000005000000000000000002, 17, N'B02,B08,B10 exit')
GO
INSERT [dbo].[WalkableAreaTesting] ([qgs_fid], [geom], [id], [name]) VALUES (18, 0xE6100000010402000000981287E5E1BDA43F7418398D3995913F189E243FCB17A43F7A4D4688FC93913F01000000010000000002000000FFFFFFFF0000000005000000000000000002, 18, N'B10 exit')
GO
INSERT [dbo].[WalkableAreaTesting] ([qgs_fid], [geom], [id], [name]) VALUES (19, 0xE6100000010402000000189E243FCB17A43F7A4D4688FC93913FF5494EF39718A43F6F5BE6E0E647923F01000000010000000002000000FFFFFFFF0000000005000000000000000002, 19, N'B10 entry')
GO
INSERT [dbo].[WalkableAreaTesting] ([qgs_fid], [geom], [id], [name]) VALUES (20, 0xE6100000010402000000189E243FCB17A43F7A4D4688FC93913F56EA63BBB04AA33FEFCF82BCB495903F01000000010000000002000000FFFFFFFF0000000005000000000000000002, 20, N'B10 exit')
GO
INSERT [dbo].[WalkableAreaTesting] ([qgs_fid], [geom], [id], [name]) VALUES (21, 0xE610000001040200000056EA63BBB04AA33FEFCF82BCB495903FA0F0165124DDA23FBCC88883E890903F01000000010000000002000000FFFFFFFF0000000005000000000000000002, 21, N'B10 entry')
GO
INSERT [dbo].[WalkableAreaTesting] ([qgs_fid], [geom], [id], [name]) VALUES (22, 0xE6100000010402000000A0F0165124DDA23FBCC88883E890903F012CD6EE3A21A23F4519E2B2B58D903F01000000010000000002000000FFFFFFFF0000000005000000000000000002, 22, N'B10 point')
GO
SET IDENTITY_INSERT [dbo].[WalkableAreaTesting] OFF
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_RoomType] FOREIGN KEY([RoomType])
REFERENCES [dbo].[RoomType] ([id])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_RoomType]
GO

