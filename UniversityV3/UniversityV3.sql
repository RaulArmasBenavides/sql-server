CREATE DATABASE UniversityV3;

GO

USE UniversityV3

-- (2) Create Course table

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES T WHERE T.TABLE_NAME='Course') 

DROP TABLE dbo.Course 

CREATE TABLE [dbo].[Course] (

    [CourseId] INT           IDENTITY (1, 1) NOT NULL,

    [Name]     VARCHAR (30)  NOT NULL,

    [Detail]   VARCHAR (200) NULL,

    CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED ([CourseId] ASC)

);

-- (3) Create Student table

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES T WHERE T.TABLE_NAME='Student') 

DROP TABLE dbo.Student 

CREATE TABLE [dbo].[Student] (

    [StudentId] INT           IDENTITY (1, 1) NOT NULL,

    [Name]      VARCHAR (30)  NULL,

    [Course]    VARCHAR (30)  NULL,

    [Marks]     INT           NULL,

    [ExamDate]  DATETIME2 (7) NULL,

    CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED ([StudentId] ASC)

);

-- (4) Populate Course table

SET IDENTITY_INSERT [dbo].[Course] ON

INSERT INTO [dbo].[Course] ([CourseId], [Name], [Detail]) VALUES (1, N'DevOps for Databases', N'This is about DevOps for Databases')

INSERT INTO [dbo].[Course] ([CourseId], [Name], [Detail]) VALUES (2, N'Power BI Fundamentals', N'This is about Power BI Fundamentals')

INSERT INTO [dbo].[Course] ([CourseId], [Name], [Detail]) VALUES (3, N'T-SQL Programming', N'About T-SQL Programming')

INSERT INTO [dbo].[Course] ([CourseId], [Name], [Detail]) VALUES (4, N'Tabular Data Modeling', N'This is about Tabular Data Modeling')

INSERT INTO [dbo].[Course] ([CourseId], [Name], [Detail]) VALUES (5, N'Analysis Services Fundamentals', N'This is about Analysis Services Fundamentals')

SET IDENTITY_INSERT [dbo].[Course] OFF



-- (5) Populate Student table

SET IDENTITY_INSERT [dbo].[Student] ON

INSERT INTO [dbo].[Student] ([StudentId], [Name], [Course], [Marks], [ExamDate]) VALUES (1, N'Asif', N'Database Management System', 80, N'2016-01-01 00:00:00')

INSERT INTO [dbo].[Student] ([StudentId], [Name], [Course], [Marks], [ExamDate]) VALUES (2, N'Peter', N'Database Management System', 85, N'2016-01-01 00:00:00')

INSERT INTO [dbo].[Student] ([StudentId], [Name], [Course], [Marks], [ExamDate]) VALUES (3, N'Sam', N'Database Management System', 85, N'2016-01-01 00:00:00')

INSERT INTO [dbo].[Student] ([StudentId], [Name], [Course], [Marks], [ExamDate]) VALUES (4, N'Adil', N'Database Management System', 85, N'2016-01-01 00:00:00')

INSERT INTO [dbo].[Student] ([StudentId], [Name], [Course], [Marks], [ExamDate]) VALUES (5, N'Naveed', N'Database Management System', 90, N'2016-01-01 00:00:00')

SET IDENTITY_INSERT [dbo].[Student] OFF