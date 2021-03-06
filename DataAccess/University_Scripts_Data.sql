USE [University]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Program]') AND type in (N'U'))
ALTER TABLE [dbo].[Program] DROP CONSTRAINT IF EXISTS [FK_Program_ProgramType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Program]') AND type in (N'U'))
ALTER TABLE [dbo].[Program] DROP CONSTRAINT IF EXISTS [FK_Program_Department]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 03-04-2018 22:11:57 ******/
DROP TABLE IF EXISTS [dbo].[Student]
GO
/****** Object:  Table [dbo].[ProgramType]    Script Date: 03-04-2018 22:11:57 ******/
DROP TABLE IF EXISTS [dbo].[ProgramType]
GO
/****** Object:  Table [dbo].[Program]    Script Date: 03-04-2018 22:11:57 ******/
DROP TABLE IF EXISTS [dbo].[Program]
GO
/****** Object:  Table [dbo].[News]    Script Date: 03-04-2018 22:11:57 ******/
DROP TABLE IF EXISTS [dbo].[News]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 03-04-2018 22:11:57 ******/
DROP TABLE IF EXISTS [dbo].[Events]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 03-04-2018 22:11:57 ******/
DROP TABLE IF EXISTS [dbo].[Department]
GO
USE [master]
GO
/****** Object:  Database [University]    Script Date: 03-04-2018 22:11:57 ******/
DROP DATABASE IF EXISTS [University]
GO
/****** Object:  Database [University]    Script Date: 03-04-2018 22:11:57 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'University')
BEGIN
CREATE DATABASE [University]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'University', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\University.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'University_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\University_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
END
GO
ALTER DATABASE [University] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [University].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [University] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [University] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [University] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [University] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [University] SET ARITHABORT OFF 
GO
ALTER DATABASE [University] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [University] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [University] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [University] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [University] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [University] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [University] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [University] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [University] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [University] SET  DISABLE_BROKER 
GO
ALTER DATABASE [University] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [University] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [University] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [University] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [University] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [University] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [University] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [University] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [University] SET  MULTI_USER 
GO
ALTER DATABASE [University] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [University] SET DB_CHAINING OFF 
GO
ALTER DATABASE [University] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [University] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [University] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [University] SET QUERY_STORE = OFF
GO
USE [University]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [University]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 03-04-2018 22:11:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Department]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Department](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](500) NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Events]    Script Date: 03-04-2018 22:11:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Events]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Events](
	[EventId] [int] IDENTITY(1,1) NOT NULL,
	[Category] [varchar](100) NOT NULL,
	[Description] [varchar](1000) NOT NULL,
	[Location] [varchar](1000) NOT NULL,
	[StartDateTime] [datetime] NOT NULL,
	[EndDateTime] [datetime] NOT NULL,
	[ImagePath] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[News]    Script Date: 03-04-2018 22:11:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[News]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[News](
	[NewsId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](1000) NOT NULL,
	[Abstract] [varchar](max) NOT NULL,
	[News] [text] NOT NULL,
	[AirDate] [date] NOT NULL,
	[ImagePath] [varchar](500) NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[NewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Program]    Script Date: 03-04-2018 22:11:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Program]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Program](
	[ProgramId] [int] IDENTITY(1,1) NOT NULL,
	[ProgramName] [varchar](500) NOT NULL,
	[TypeId] [int] NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[Abstract] [varchar](500) NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_Program] PRIMARY KEY CLUSTERED 
(
	[ProgramId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ProgramType]    Script Date: 03-04-2018 22:11:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProgramType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProgramType](
	[ProgramTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](10) NULL,
	[Credits] [int] NULL,
	[Duration] [int] NULL,
 CONSTRAINT [PK_ProgramType] PRIMARY KEY CLUSTERED 
(
	[ProgramTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Student]    Script Date: 03-04-2018 22:11:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Student]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Student](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NOT NULL,
	[Father] [varchar](200) NULL,
	[Mother] [varchar](200) NULL,
	[StreetName] [varchar](100) NOT NULL,
	[ApartmentNo] [varchar](10) NOT NULL,
	[PostalCode] [int] NOT NULL,
	[City] [varchar](100) NOT NULL,
	[Country] [varchar](100) NOT NULL,
	[Nationality] [varchar](50) NOT NULL,
	[DOB] [date] NOT NULL,
	[Sex] [varchar](50) NOT NULL,
	[PassportNumber] [varchar](100) NULL,
	[PassportExpiryDate] [date] NULL,
	[MobileNumber] [int] NOT NULL,
	[AlternateMobileNumber] [int] NULL,
	[Email] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [Description]) VALUES (1, N'Architecture and Civil Engineering', N'This department is a merger of the former Department of Architecture and Department of Civil and Environmental Engineering. The new department represents a broad field of knowledge theory ranging from engineering science to social science to the humanities and design-based, artistic research. These different perspectives enable strong interdisciplinary development in this field and a broader discussion of different aspects of sustainability. Ongoing cooperation between the two existing departments as regards research and education is already in place, and these conditions will be further improved in autumn 2017 when the departments move to their new, shared premises. Together, we will be a complete environment in the field of architecture and the built environment, well equipped to taken on common challenges in our pursuit of a sustainable society.
')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [Description]) VALUES (2, N'Department of Biology and Biological Engineering', N'1 January 2015 Chalmers started a new department with world-leading research in the field of biotechnology – Department of Biology and Biological Engineering. The interest in research and education in biotechnology has grown strong in recent years both in Sweden and globally. With the new department Chalmers is further strengthening its position in terms of medical research, development of healthy foods and of sustainable fuels for the future. The number of employees is 160, it consists of four divisions and is led by Stefan Hohmann.
')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [Description]) VALUES (3, N'Chemistry and Chemical Engineering', N'This is about our lives and natural resources, about energy, recycling and materials development. With our focus on sustainable development we work with research and education of the highest quality for smarter materials and more effective processes, for improved health and a better environment.
')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [Description]) VALUES (4, N'Computer Science and Engineering', N'The Department is shared between Chalmers University of Technology and University of Gothenburg, and conducts research and education in many fields: algorithms, computer architecture, computer security, distributed systems, electronics design, formal methods, logic, networking, software technology, software engineering, language technology and reliable computer systems. We offer a large range of courses on undergraduate and postgraduate levels at both universities.')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [Description]) VALUES (5, N'Electrical Engineering', N'At the department of Electrical Engineering research and education are performed in the areas of Communication and Antenna systems, Systems and Control, Signal processing and Biomedical engineering, and Electric Power Engineering. We work with challenges for a sustainable future in society of today, for example in the growing demands concerning efficient systems for communications and electrifying. Our knowledge is of use everywhere where there is advanced technology with integrated electronics, no matter if it involves electricity, electrical signals, optical signals or microwaves.')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [Description]) VALUES (7, N'Mathematical Sciences', N'The mathematical sciences are fundamental and indispensable to a large part of modern science and engineering. Progress in other disciplines is often linked to an increased use of mathematics. Mathematics is also a subject in itself, and fundamental research is a necessary condition for its many applications. The department of Mathematical Sciences is part of both Chalmers University of Technology and the University of Gothenburg, and it offers high-quality research and education in the fields of mathematics.

')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Events] ON 

INSERT [dbo].[Events] ([EventId], [Category], [Description], [Location], [StartDateTime], [EndDateTime], [ImagePath]) VALUES (1, N'Seminar', N'Kerry Vahala, Caltech: Towards Integrated Optical Time Standards and Frequency Synthesizers', N'Kollektorn, lecture room, MC2-huset, MC2', CAST(N'2018-03-10T10:00:00.000' AS DateTime), CAST(N'2018-03-10T11:00:00.000' AS DateTime), N'~/Frames/img_sm_1.jpg')
INSERT [dbo].[Events] ([EventId], [Category], [Description], [Location], [StartDateTime], [EndDateTime], [ImagePath]) VALUES (3, N'Seminar', N'Mapping anthropogenic resources in urban built environment: The case of residential buildings', N'SB-K580, meeting room, Arkitektur, Campus Johanneberg', CAST(N'2018-03-11T13:00:00.000' AS DateTime), CAST(N'2018-03-11T15:00:00.000' AS DateTime), N'~/Frames/img_sm_2.jpg')
INSERT [dbo].[Events] ([EventId], [Category], [Description], [Location], [StartDateTime], [EndDateTime], [ImagePath]) VALUES (6, N'Event', N'Graduation ceremony spring 2018', N'RunAn, conference hall, Kårhuset, Campus Johanneberg', CAST(N'2018-03-14T16:00:00.000' AS DateTime), CAST(N'2018-03-14T18:00:00.000' AS DateTime), N'~/Frames/img_sm_3.jpg')
INSERT [dbo].[Events] ([EventId], [Category], [Description], [Location], [StartDateTime], [EndDateTime], [ImagePath]) VALUES (8, N'Thesis defence', N'Zhaojun Li, Applied Chemistry', N'KA, lecture hall, Kemi, Campus Johanneberg', CAST(N'2018-03-03T10:00:00.000' AS DateTime), CAST(N'2018-03-03T12:00:00.000' AS DateTime), N'~/Frames/img_sm_1.jpg')
SET IDENTITY_INSERT [dbo].[Events] OFF
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([NewsId], [Title], [Abstract], [News], [AirDate], [ImagePath]) VALUES (1, N'Electric textile lights a lamp when stretched', N'Working up a sweat from carrying a heavy load? That is when the textile works at its best. Researchers at Chalmers University of Technology have developed a fabric that converts kinetic energy into electric power, in cooperation with the Swedish School of Textiles in Borås and the research institute Swerea IVF. The greater the load applied to the textile and the wetter it becomes the more electricity it generates. The results are now published in the Nature Partner journal Flexible Electronics', N'Chalmers researchers Anja Lund and Christian Müller have developed a woven fabric that generates electricity when it is stretched or exposed to pressure. The fabric can currently generate enough power to light an LED, send wireless signals or drive small electric units such as a pocket calculator or a digital watch.

The technology is based on the piezoelectric effect, which results in the generation of electricity from deformation of a piezoelectric material, such as when it is stretched. In the study the researchers created a textile by weaving a piezoelectric yarn together with an electrically conducting yarn, which is required to transport the generated electric current.

“The textile is flexible and soft and becomes even more efficient when moist or wet,” Lund says. “To demonstrate the results from our research we use a piece of the textile in the shoulder strap of a bag. The heavier the weight packed in the bag and the more of the bag that consists of our fabric, the more electric power we obtain. When our bag is loaded with 3 kilos of books, we produce a continuous output of 4 microwatts. That’s enough to intermittently light an LED. By making an entire bag from our textile, we could get enough energy to transmit wireless signals.”

The piezoelectric yarn is made up of twenty-four fibres, each as thin as a strand of hair. When the fibres are sufficiently moist they become enclosed in liquid and the yarn becomes more efficient, since this improves the electrical contact between the fibres. The technology is based on previous studies by the researchers in which they developed the piezoelectric fibres, to which they have now added a further dimension.

“The piezoelectric fibres consist of a piezoelectric shell around an electrically conducting core,” Lund says. “The piezoelectric yarn in combination with a commercial conducting yarn constitute an electric circuit connected in series.”

Previous work by the researchers on piezoelectric textiles has so far mainly focused on sensors and their ability to generate electric signals through pressure sensitivity. Using the energy to continuously drive electronic components is unique.

“Woven textiles from piezoelectric yarns makes the technology easily accessible and it could be useful in everyday life. It’s also possible to add more materials to the weave or to use it as a layer in a multi-layer product. It requires some modification, but it’s possible,” Lund says.

The researchers consider that the technology is, in principle, ready for larger scale production. It is now mainly up to industrial product developers to find out how to make use of the technology. Despite the advanced technology underlying the material, the cost is relatively low and is comparable with the price of Gore-Tex. Through their collaboration with the Swedish School of Textiles in Borås the researchers have been able to demonstrate that the yarn can be woven in industrial looms and is sufficiently wear-resistant to cope with the harsh conditions of mass production.

', CAST(N'2018-03-22' AS Date), N'~/Frames/img_sm_1.jpg')
INSERT [dbo].[News] ([NewsId], [Title], [Abstract], [News], [AirDate], [ImagePath]) VALUES (2, N'Ships in the English Channel have the highest rate of sulphur violations in northern Europe', N'Researchers at Chalmers University of Technology have shown that between 87 and 98 percent of ships comply with the tougher regulations for sulphur emissions that were introduced in northern Europe in 2015. The lowest levels of compliance were observed in the western part of the English Channel and in the middle of the Baltic Sea', N'Researchers at Chalmers University of Technology have shown that between 87 and 98 percent of ships comply with the tougher regulations for sulphur emissions that were introduced in northern Europe in 2015. The lowest levels of compliance were observed in the western part of the English Channel and in the middle of the Baltic Sea.

The highest permitted sulphur content in shipping fuel was drastically reduced at the end of 2014 for vessels sailing in the northern European Sulphur Emission Control Area (SECA) – from 1.00 to 0.10 per cent. Before the stricter regulations were implemented, sulphur emissions from the shipping industry were estimated to cause the premature death of 50,000 Europeans each year, because the sulphur forms particles that are swept inland by the wind.

Researchers at Chalmers University of Technology, Sweden, have developed a ground-breaking method for remotely monitoring emissions from marine vessels, which they’ve used to investigate the effects of the new regulations. The work has been carried out through the Danish Environmental Protection Agency and the EU projects Compmon and Envisum.

Some of the measurements were taken using an aeroplane flying over Denmark, the English Channel and the middle of the Baltic Sea, while others used fixed measuring stations in the approach to Gothenburg, Sweden, on the Oresund Bridge (between Copenhagen and Malmo) and on the Great Belt Bridge in central Denmark (see videos and photos below).

Johan Mellqvist, professor of optical remote sensing, heads the work at Chalmers.', CAST(N'2018-03-22' AS Date), N'~/Frames/img_sm_2.jpg')
INSERT [dbo].[News] ([NewsId], [Title], [Abstract], [News], [AirDate], [ImagePath]) VALUES (3, N'Untapped gold mine is lost from end-of-life vehicles', N'Vast quantities of scarce metals are being lost from Europe’s urban mine of vehicles, including 20 tonnes of gold each year – and the proportion of critical metals in vehicles is continuing to increase. A database is now being published that charts the metals and facilitates recycling. On 8 March Maria Ljunggren Söderman, researcher at Chalmers University of Technology, will present the results at IEA’s expert meeting', N'Vast quantities of scarce metals are being lost from Europe’s urban mine of vehicles, including 20 tonnes of gold each year – and the proportion of critical metals in vehicles is continuing to increase. A database is now being published that charts the metals and facilitates recycling. On 8 March Maria Ljunggren Söderman, researcher at Chalmers University of Technology, will present the results at IEA’s expert meeting.

Metals, such as gold, cobalt and lithium, are an indispensable part of our batteries, mobile phones, electronic gadgets and vehicles. At the same time, Europe is highly dependent on imports of metals, which makes some of them critical for the EU.

“These metals are required for the ongoing transition to greener technologies, such as electric cars, solar cells, LED lighting and wind power, so any supply risks are a strategic and economic problem for the EU. What’s more, these are finite resources that must be used in a sustainable way,” says Maria Ljunggren Söderman, Researcher at Environmental Systems Analysis at Chalmers University of Technology.

She is part of the extensive European research project Prosum, which has now compiled a new database with which to address the problem. The Urban Mine Platform – the only one of its kind in the world – charts what is known as the urban mine: the metals that are already in circulation and could be recycled from our end-of-life vehicles and electrical and electronic equipment.

Maria Ljunggren Söderman has been responsible for the survey of the 260 million light-duty vehicles in Europe’s vehicle fleet. She notes that the quantities of critical and scarce metals have increased substantially, and that vehicles also now include many new metals.

“This is mainly because we are constructing increasingly advanced vehicles, with a great deal of electronics, lightweight materials and catalytic converters. The increase in the numbers of electric vehicles adds to this development, even though they so far represent a small proportion of the vehicle fleet,” she says.

One such example is neodymium, one of the rare earth metals (REM). It is estimated that by 2020 there will be nearly 18,000 tonnes of neodymium in the active vehicle fleet – nine times the amount present in the year 2000.

Gold is another example – and the researchers were surprised by just how vast the quantities of hidden gold in our vehicles actually are. In 2015 there were an estimated 400 or so tonnes of gold in Europe’s vehicle fleet, while the vehicles that left the fleet contained in the region of 20 tonnes of gold – which, in addition, was not recycled.', CAST(N'2018-03-06' AS Date), N'~/Frames/img_sm_3.jpg')
INSERT [dbo].[News] ([NewsId], [Title], [Abstract], [News], [AirDate], [ImagePath]) VALUES (4, N'Unconventional superconductor may be used to create quantum computers of the future', N'With their insensitivity to decoherence what are known as Majorana particles could become stable building blocks of a quantum computer. The problem is that they only occur under very special circumstances. Now researchers at Chalmers University of Technology have succeeded in manufacturing a component that is able to host the sought-after particles', N'With their insensitivity to decoherence what are known as Majorana particles could become stable building blocks of a quantum computer. The problem is that they only occur under very special circumstances. Now researchers at Chalmers University of Technology have succeeded in manufacturing a component that is able to host the sought-after particles.

Researchers throughout the world are struggling to build a quantum computer. One of the great challenges is to overcome the sensitivity of quantum systems to decoherence, collaps of superpositions. One track within quantum computer research is therefore to make use of what are known as Majorana particles, which are also called Majorana fermions. Microsoft is also committed to the development of this type of quantum computer.

Majorana fermions are highly original particles, quite unlike those that make up the materials around us. In highly simplified terms, they can be seen as half electron. In a quantum computer the idea is to encode information in a pair of Majorana fermions which are separated in the material, which should, in principle, make the calculations immune to decoherence.

So where do you find Majorana fermions? 

In solid state materials they only appear to occur in what are known as topological superconductors – a new type of superconductor that is so new and special that it is hardly ever found in practice. But a research team at Chalmers University of Technology is now among the first in the world to submit results indicating that they have actually succeeded in manufacturing a topological superconductor.', CAST(N'2018-02-19' AS Date), N'~/Frames/img_sm_1.jpg')
SET IDENTITY_INSERT [dbo].[News] OFF
SET IDENTITY_INSERT [dbo].[Program] ON 

INSERT [dbo].[Program] ([ProgramId], [ProgramName], [TypeId], [Description], [Abstract], [DepartmentId]) VALUES (1, N'Architecture and Planning Beyond Sustainability', 2, N'Sustainable development is a political vision that entails huge challenges for social and technical innovation all over the world. It has consequences for all professions, not least for urban planning, architectural design and the full complexity of societal development can be addressed and managed through design for sustainable development.
This programme provides you with the skills and methods valid where design approaches are required. As a student, you are trained to find solutions that support sustainable development in a large variety of contexts and in dynamic situations. The perspective is holistic and systemic, comprising system levels and scales from urban structures, buildings and technical support systems to detailed construction elements. The programme is based on studios where real life situations and problems faced by society are handled in close contact with local stakeholders and actors.

The overall point of departure is the everyday life of people and the support of dignified lives and livelihoods in rapidly changing and sometimes extreme environments, through the development and implementation of aesthetic, affordable, socially and culturally appropriate, energy and material efficient, healthy and user friendly design solutions.', N'Human activities, not the least manifested in the built environment, are responsible for a large amount of the stress our societies put on the environment and there is a global challenge in meeting the need for sustainability while adapting to a local reality and situation. This programme focuses on methods and design approaches for understanding and analysing different local contexts in order to propose adequate solutions in designing for a sustainable future.', 1)
INSERT [dbo].[Program] ([ProgramId], [ProgramName], [TypeId], [Description], [Abstract], [DepartmentId]) VALUES (2, N'Architecture and Urban Design', 2, N'The Master’s Programme in Architecture and Urban Design provides the skills and knowledge needed to practice professionally. The programme emphasizes a research-oriented approach in order to anticipate future challenges for architects and urban designers. Its profile is design led and practical, as well as academic and theoretical.

A majority of the coursework is project-based and it takes place in design studios led by experienced architects and researchers. These studios function as lab environments that target current specializations within the field. Studios are supplemented with course modules that focus on history and theory, design and technology, as well as leadership and professional practice.

 



The Department of Architecture at Chalmers houses an excellent infrastructure in the form of studio spaces, an architecture library, model workshops and digital fabrication, a robot lab and several research groups and centres. A national and international network is provided through collaborations and partnerships with external practitioners, researchers, stakeholders and industry.', N'The field of Architecture and Urban Design is closely linked to some of today’s most pressing societal, environmental and cultural challenges. It encompasses a wide range of capabilities, from design and technology to critical thinking.', 1)
INSERT [dbo].[Program] ([ProgramId], [ProgramName], [TypeId], [Description], [Abstract], [DepartmentId]) VALUES (6, N'Design and Construction Project Management', 2, N'A construction project is a vehicle to bring about change. A built environment professional with responsibility for the construction and maintenance of e.g. roads, houses, airports, schools and hospitals needs to manage various vital resources for this change to happen, such as cost, time, people and materials. At the intersection between technology and management, the overall aim of the programme is to train you to manage projects in a built environment context.
 
To work as manager in the built environment sector means having knowledge on construction specific elements like technical, environmental, legal, and contractual demands. You will also be trained in skills needed to manage projects involving knowledge on project management methods, financial accounting methods, Building Information Modeling (BIM), logistics, quality management, strategic management, and, real estate and facility management. The strong collaborative characteristics of the construction industry, where projects are carried out in temporary and interdisciplinary project organizations supported by networks of colleagues, also needs training and knowledge related to organizational culture, leadership, communication, team work, decision making, collaborative relations, and knowledge and learning.', N'Design, construction and management of the built environment have a vital role in the development of a more sustainable society. The construction industry is resource intensive, so material, financial and human resources must be managed of responsibly and efficiently. Handling the challenges that arise in complex construction and infrastructure projects requires engineers and architects with managerial as well as technical competencies', 1)
INSERT [dbo].[Program] ([ProgramId], [ProgramName], [TypeId], [Description], [Abstract], [DepartmentId]) VALUES (7, N'Infrastructure and Environmental Engineering', 2, N'Infrastructure and environmental engineering is an interdisciplinary field that includes; traffic and road engineering, urban metabolism, water system engineering, engineering geology, geotechnical engineering, environmental engineering and sustainability.
Investments in infrastructure also form a considerable part of the global economy. Hence safe, economic and sustainable development requires continued progress in civil engineering with a specialisation towards infrastructure and environment.
 
To meet this societal need for qualified competence in planning, design, construction and maintenance of infrastructure systems in soil and water, this programme promotes the personal development of knowledge, skills and attitudes that are needed to start working as a professional engineer in the field of infrastructure and environmental engineering. An important task is to be knowledgeable and responsible for the interface between urban development and the environment.', N'Civil engineers play a major role in developing infrastructures and supporting human development, while contributing to the sustainable development of society. Contamination of soil and water, lack of access to drinking water, and unsustainable use of land and water resources remain major obstacles to global sustainability, while new challenges include threats from climate change and rapid urbanisation', 1)
INSERT [dbo].[Program] ([ProgramId], [ProgramName], [TypeId], [Description], [Abstract], [DepartmentId]) VALUES (8, N'Sound and Vibration', 2, N'Today the design of e.g. high-speed trains, cars, transport infrastructure and buildings is strongly influenced by the performance requirements for sound and vibration properties.

The main aim of the programme is to educate specialists in the field of sound and vibration who contribute to a competitive and innovative industry and to a sustainable society where the negative effects of noise and vibration on the natural and urban environments and people’s health and well-being are diminished.', N'We are affected by sound and vibration in our daily life. Beyond this basic shared experience, “sound and vibration” as an interdisciplinary subject incorporates fields as diverse as physics, mechanics, physiology, signal processing, psychology and electrical engineering. Sound and vibration properties are critical for the function and quality of environments, products and transportation.', 1)
INSERT [dbo].[Program] ([ProgramId], [ProgramName], [TypeId], [Description], [Abstract], [DepartmentId]) VALUES (9, N'Structural Engineering and Building Technology', 2, N'The aim of the programme is to provide knowledge and skills for a professional career within the fields of structural engineering and building technology. All phases of the engineering process related to planning, design, construction, operation, assessment and rehabilitation are covered, and different engineering roles relevant for the field is demonstrated. 

The programme should fulfil the market''s need for qualified competence: technical specialists and system generalists as well as researchers and academic teachers.', N'The built environment is fundamental for everyday life and comfort, and is essential for the global economy. This programme addresses issues related to structures and buildings and comprises development and operation of structures, structural systems and complex buildings for a modern, sustainable and resource efficient society', 1)
SET IDENTITY_INSERT [dbo].[Program] OFF
SET IDENTITY_INSERT [dbo].[ProgramType] ON 

INSERT [dbo].[ProgramType] ([ProgramTypeId], [Type], [Credits], [Duration]) VALUES (1, N'BSc', 300, 5)
INSERT [dbo].[ProgramType] ([ProgramTypeId], [Type], [Credits], [Duration]) VALUES (2, N'MSc', 120, 2)
SET IDENTITY_INSERT [dbo].[ProgramType] OFF
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Program_Department]') AND parent_object_id = OBJECT_ID(N'[dbo].[Program]'))
ALTER TABLE [dbo].[Program]  WITH CHECK ADD  CONSTRAINT [FK_Program_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Program_Department]') AND parent_object_id = OBJECT_ID(N'[dbo].[Program]'))
ALTER TABLE [dbo].[Program] CHECK CONSTRAINT [FK_Program_Department]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Program_ProgramType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Program]'))
ALTER TABLE [dbo].[Program]  WITH CHECK ADD  CONSTRAINT [FK_Program_ProgramType] FOREIGN KEY([TypeId])
REFERENCES [dbo].[ProgramType] ([ProgramTypeId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Program_ProgramType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Program]'))
ALTER TABLE [dbo].[Program] CHECK CONSTRAINT [FK_Program_ProgramType]
GO
USE [master]
GO
ALTER DATABASE [University] SET  READ_WRITE 
GO
