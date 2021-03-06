USE [librarymg]
GO
/****** Object:  Table [dbo].[librarymg.Book]    Script Date: 2021-03-08 12:59:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[librarymg.Book](
	[Bcode] [int] NOT NULL,
	[Bname] [varchar](15) NULL,
	[Mdate] [date] NOT NULL,
	[Genre] [varchar](15) NOT NULL,
	[Price] [int] NOT NULL,
	[Bsid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Bcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[librarymg.Bookshelf]    Script Date: 2021-03-08 12:59:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[librarymg.Bookshelf](
	[Id] [int] NOT NULL,
	[Genre] [varchar](15) NULL,
	[Sgssn] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[librarymg.Borrow]    Script Date: 2021-03-08 12:59:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[librarymg.Borrow](
	[Cssn] [int] NOT NULL,
	[Sbcode] [int] NOT NULL,
	[Mssn] [int] NOT NULL,
	[Bexdate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Cssn] ASC,
	[Sbcode] ASC,
	[Mssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[librarymg.Buy]    Script Date: 2021-03-08 12:59:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[librarymg.Buy](
	[sspssn] [int] NOT NULL,
	[sbcode] [int] NOT NULL,
	[smssn] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sspssn] ASC,
	[sbcode] ASC,
	[smssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[librarymg.Cashaddress]    Script Date: 2021-03-08 12:59:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[librarymg.Cashaddress](
	[cassn] [int] NOT NULL,
	[hnum] [varchar](15) NOT NULL,
	[street] [varchar](15) NOT NULL,
	[city] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cassn] ASC,
	[hnum] ASC,
	[street] ASC,
	[city] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[librarymg.Cashier]    Script Date: 2021-03-08 12:59:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[librarymg.Cashier](
	[cssn] [int] NOT NULL,
	[Fname] [varchar](15) NOT NULL,
	[Lname] [varchar](15) NOT NULL,
	[Birthday] [date] NULL,
	[Salary] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[librarymg.Cashphone]    Script Date: 2021-03-08 12:59:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[librarymg.Cashphone](
	[Cpssn] [int] NOT NULL,
	[Phonenum] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cpssn] ASC,
	[Phonenum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[librarymg.Member]    Script Date: 2021-03-08 12:59:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[librarymg.Member](
	[Ssn] [int] NOT NULL,
	[Fname] [varchar](15) NOT NULL,
	[Lname] [varchar](15) NOT NULL,
	[Birthday] [date] NULL,
	[Regdate] [date] NOT NULL,
	[Expdate] [date] NOT NULL,
	[Cpssn] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Ssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[librarymg.Memphone]    Script Date: 2021-03-08 12:59:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[librarymg.Memphone](
	[Mssn] [int] NOT NULL,
	[Phonenum] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Mssn] ASC,
	[Phonenum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[librarymg.Shelfaddress]    Script Date: 2021-03-08 12:59:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[librarymg.Shelfaddress](
	[shssn] [int] NOT NULL,
	[hnum] [varchar](15) NOT NULL,
	[street] [varchar](15) NOT NULL,
	[city] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[shssn] ASC,
	[hnum] ASC,
	[street] ASC,
	[city] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[librarymg.Shelfguy]    Script Date: 2021-03-08 12:59:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[librarymg.Shelfguy](
	[Shssn] [int] NOT NULL,
	[Fname] [varchar](15) NOT NULL,
	[Lname] [varchar](15) NOT NULL,
	[Birthday] [date] NULL,
	[Salary] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Shssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[librarymg.Shelfphone]    Script Date: 2021-03-08 12:59:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[librarymg.Shelfphone](
	[shssn] [int] NOT NULL,
	[pnum] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[shssn] ASC,
	[pnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[librarymg.Member] ADD  CONSTRAINT [DF_librarymg.Member_Cpssn]  DEFAULT ((0)) FOR [Cpssn]
GO
ALTER TABLE [dbo].[librarymg.Book]  WITH CHECK ADD  CONSTRAINT [FK_librarymg.Book_librarymg.Bookshelf] FOREIGN KEY([Bsid])
REFERENCES [dbo].[librarymg.Bookshelf] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[librarymg.Book] CHECK CONSTRAINT [FK_librarymg.Book_librarymg.Bookshelf]
GO
ALTER TABLE [dbo].[librarymg.Bookshelf]  WITH CHECK ADD  CONSTRAINT [FK_librarymg.Bookshelf_librarymg.Shelfguy] FOREIGN KEY([Sgssn])
REFERENCES [dbo].[librarymg.Shelfguy] ([Shssn])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[librarymg.Bookshelf] CHECK CONSTRAINT [FK_librarymg.Bookshelf_librarymg.Shelfguy]
GO
ALTER TABLE [dbo].[librarymg.Borrow]  WITH CHECK ADD  CONSTRAINT [FK_librarymg.Borrow_librarymg.Book] FOREIGN KEY([Sbcode])
REFERENCES [dbo].[librarymg.Book] ([Bcode])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[librarymg.Borrow] CHECK CONSTRAINT [FK_librarymg.Borrow_librarymg.Book]
GO
ALTER TABLE [dbo].[librarymg.Borrow]  WITH CHECK ADD  CONSTRAINT [FK_librarymg.Borrow_librarymg.Cashier] FOREIGN KEY([Cssn])
REFERENCES [dbo].[librarymg.Cashier] ([cssn])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[librarymg.Borrow] CHECK CONSTRAINT [FK_librarymg.Borrow_librarymg.Cashier]
GO
ALTER TABLE [dbo].[librarymg.Borrow]  WITH CHECK ADD  CONSTRAINT [FK_librarymg.Borrow_librarymg.Member] FOREIGN KEY([Mssn])
REFERENCES [dbo].[librarymg.Member] ([Ssn])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[librarymg.Borrow] CHECK CONSTRAINT [FK_librarymg.Borrow_librarymg.Member]
GO
ALTER TABLE [dbo].[librarymg.Buy]  WITH CHECK ADD  CONSTRAINT [FK_librarymg.Buy_librarymg.Book] FOREIGN KEY([sbcode])
REFERENCES [dbo].[librarymg.Book] ([Bcode])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[librarymg.Buy] CHECK CONSTRAINT [FK_librarymg.Buy_librarymg.Book]
GO
ALTER TABLE [dbo].[librarymg.Buy]  WITH CHECK ADD  CONSTRAINT [FK_librarymg.Buy_librarymg.Cashier] FOREIGN KEY([sspssn])
REFERENCES [dbo].[librarymg.Cashier] ([cssn])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[librarymg.Buy] CHECK CONSTRAINT [FK_librarymg.Buy_librarymg.Cashier]
GO
ALTER TABLE [dbo].[librarymg.Buy]  WITH CHECK ADD  CONSTRAINT [FK_librarymg.Buy_librarymg.Member] FOREIGN KEY([smssn])
REFERENCES [dbo].[librarymg.Member] ([Ssn])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[librarymg.Buy] CHECK CONSTRAINT [FK_librarymg.Buy_librarymg.Member]
GO
ALTER TABLE [dbo].[librarymg.Cashaddress]  WITH CHECK ADD  CONSTRAINT [FK_library.Cashaddress_librarymg.Cashier] FOREIGN KEY([cassn])
REFERENCES [dbo].[librarymg.Cashier] ([cssn])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[librarymg.Cashaddress] CHECK CONSTRAINT [FK_library.Cashaddress_librarymg.Cashier]
GO
ALTER TABLE [dbo].[librarymg.Cashphone]  WITH CHECK ADD  CONSTRAINT [FK_librarymg.Cashphone_librarymg.Cashier] FOREIGN KEY([Cpssn])
REFERENCES [dbo].[librarymg.Cashier] ([cssn])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[librarymg.Cashphone] CHECK CONSTRAINT [FK_librarymg.Cashphone_librarymg.Cashier]
GO
ALTER TABLE [dbo].[librarymg.Member]  WITH CHECK ADD  CONSTRAINT [FK_librarymg.Member_librarymg.Cashier] FOREIGN KEY([Cpssn])
REFERENCES [dbo].[librarymg.Cashier] ([cssn])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[librarymg.Member] CHECK CONSTRAINT [FK_librarymg.Member_librarymg.Cashier]
GO
ALTER TABLE [dbo].[librarymg.Memphone]  WITH CHECK ADD  CONSTRAINT [FK_librarymg.Memphone_librarymg.Member] FOREIGN KEY([Mssn])
REFERENCES [dbo].[librarymg.Member] ([Ssn])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[librarymg.Memphone] CHECK CONSTRAINT [FK_librarymg.Memphone_librarymg.Member]
GO
ALTER TABLE [dbo].[librarymg.Shelfaddress]  WITH CHECK ADD  CONSTRAINT [FK_library.Shelfaddress_librarymg.Shelfguy] FOREIGN KEY([shssn])
REFERENCES [dbo].[librarymg.Shelfguy] ([Shssn])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[librarymg.Shelfaddress] CHECK CONSTRAINT [FK_library.Shelfaddress_librarymg.Shelfguy]
GO
ALTER TABLE [dbo].[librarymg.Shelfphone]  WITH CHECK ADD  CONSTRAINT [FK_librarymgr.Shelfphone_librarymg.Shelfguy] FOREIGN KEY([shssn])
REFERENCES [dbo].[librarymg.Shelfguy] ([Shssn])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[librarymg.Shelfphone] CHECK CONSTRAINT [FK_librarymgr.Shelfphone_librarymg.Shelfguy]
GO
