USE [master]
GO
/****** Object:  Database [football]    Script Date: 2017-11-09 20:46:56 ******/
CREATE DATABASE [football]
GO
ALTER DATABASE [football] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [football].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [football] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [football] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [football] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [football] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [football] SET ARITHABORT OFF 
GO
ALTER DATABASE [football] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [football] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [football] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [football] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [football] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [football] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [football] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [football] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [football] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [football] SET  DISABLE_BROKER 
GO
ALTER DATABASE [football] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [football] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [football] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [football] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [football] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [football] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [football] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [football] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [football] SET  MULTI_USER 
GO
ALTER DATABASE [football] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [football] SET DB_CHAINING OFF 
GO
ALTER DATABASE [football] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [football] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [football] SET DELAYED_DURABILITY = DISABLED 
GO
USE [football]
GO
/****** Object:  User [pw]    Script Date: 2017-11-09 20:46:56 ******/
CREATE USER [pw] FOR LOGIN [pw] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  UserDefinedFunction [dbo].[fnTotalStadiums]    Script Date: 2017-11-09 20:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnTotalStadiums]()
RETURNS INT
AS
BEGIN
	DECLARE @TotalStadiums INT
	SELECT @TotalStadiums = COUNT(*) FROM stadiums
	RETURN @TotalStadiums
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnTotalTeams]    Script Date: 2017-11-09 20:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnTotalTeams]()
RETURNS INT
AS BEGIN
	DECLARE @TotalTeams INT = (SELECT COUNT(*) FROM teams)
	RETURN @TotalTeams
END
GO
/****** Object:  Table [dbo].[countries]    Script Date: 2017-11-09 20:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[countries](
	[Abbreviation] [nchar](3) NOT NULL,
	[Name] [nchar](128) NULL,
 CONSTRAINT [PK_countries] PRIMARY KEY CLUSTERED 
(
	[Abbreviation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_countries_name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[database_error_log]    Script Date: 2017-11-09 20:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[database_error_log](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[description] [varchar](255) NULL,
	[error_occurred] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[goals_details]    Script Date: 2017-11-09 20:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[goals_details](
	[goal_id] [bigint] NOT NULL,
	[match_Id] [bigint] NOT NULL,
	[scorer_Id] [bigint] NOT NULL,
	[conceded_goal_keeper_id] [bigint] NOT NULL,
	[assistant_Id] [bigint] NULL,
	[is_penalty] [bit] NOT NULL,
 CONSTRAINT [PK_goals_details] PRIMARY KEY CLUSTERED 
(
	[goal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jobs]    Script Date: 2017-11-09 20:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jobs](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](64) NOT NULL,
	[Parent_Job_Id] [bigint] NULL,
 CONSTRAINT [PK_jobs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_jobs_name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[leagues]    Script Date: 2017-11-09 20:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[leagues](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](128) NOT NULL,
	[Parent_League_id] [bigint] NULL,
	[Max_teams_number] [int] NOT NULL,
	[Relegated_teams_number] [int] NOT NULL,
 CONSTRAINT [PK_leagues] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_leagues_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[matches]    Script Date: 2017-11-09 20:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[matches](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[league_Id] [bigint] NOT NULL,
	[Home_Team_Id] [bigint] NULL,
	[Visitor_Team_Id] [bigint] NULL,
	[Date_Time] [datetime2](7) NULL,
	[Stadium_Id] [bigint] NULL,
 CONSTRAINT [PK_matches] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[people]    Script Date: 2017-11-09 20:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[people](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](128) NOT NULL,
	[Surname] [nchar](128) NULL,
	[Country_Id] [nchar](3) NULL,
	[Job_id] [bigint] NULL,
 CONSTRAINT [PK_people] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[squads]    Script Date: 2017-11-09 20:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[squads](
	[Person_Id] [bigint] NULL,
	[Team_Id] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stadiums]    Script Date: 2017-11-09 20:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stadiums](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](128) NOT NULL,
 CONSTRAINT [PK_stadiums] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_stadiums_name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teams]    Script Date: 2017-11-09 20:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teams](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](128) NOT NULL,
	[Stadium_Id] [bigint] NULL,
	[League_Id] [bigint] NULL,
 CONSTRAINT [PK_teams] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_teams_name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Teams_StadiumId] UNIQUE NONCLUSTERED 
(
	[Stadium_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transfers]    Script Date: 2017-11-09 20:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transfers](
	[id] [bigint] NOT NULL,
	[person_Id] [bigint] NULL,
	[Money_In_€] [money] NULL,
	[old_team_Id] [bigint] NULL,
	[new_team_Id] [bigint] NULL,
 CONSTRAINT [PK_transfers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 2017-11-09 20:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[Role] [nchar](32) NOT NULL,
	[Login] [nchar](32) NOT NULL,
	[Password] [nchar](32) NULL,
 CONSTRAINT [PK__users__3213E83FF13C14C6] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_users_login] UNIQUE NONCLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Matches_LeagueId]    Script Date: 2017-11-09 20:46:56 ******/
CREATE NONCLUSTERED INDEX [IX_Matches_LeagueId] ON [dbo].[matches]
(
	[league_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_People_Surname]    Script Date: 2017-11-09 20:46:56 ******/
CREATE NONCLUSTERED INDEX [IX_People_Surname] ON [dbo].[people]
(
	[Surname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Teams_Name]    Script Date: 2017-11-09 20:46:56 ******/
CREATE NONCLUSTERED INDEX [IX_Teams_Name] ON [dbo].[teams]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[goals_details] ADD  CONSTRAINT [DF_goals_details]  DEFAULT ((0)) FOR [is_penalty]
GO
ALTER TABLE [dbo].[goals_details]  WITH CHECK ADD  CONSTRAINT [FK_goals_details_assisitant] FOREIGN KEY([assistant_Id])
REFERENCES [dbo].[people] ([id])
GO
ALTER TABLE [dbo].[goals_details] CHECK CONSTRAINT [FK_goals_details_assisitant]
GO
ALTER TABLE [dbo].[goals_details]  WITH CHECK ADD  CONSTRAINT [FK_goals_details_keeper] FOREIGN KEY([conceded_goal_keeper_id])
REFERENCES [dbo].[people] ([id])
GO
ALTER TABLE [dbo].[goals_details] CHECK CONSTRAINT [FK_goals_details_keeper]
GO
ALTER TABLE [dbo].[goals_details]  WITH CHECK ADD  CONSTRAINT [FK_goals_details_matches] FOREIGN KEY([match_Id])
REFERENCES [dbo].[matches] ([Id])
GO
ALTER TABLE [dbo].[goals_details] CHECK CONSTRAINT [FK_goals_details_matches]
GO
ALTER TABLE [dbo].[goals_details]  WITH CHECK ADD  CONSTRAINT [FK_goals_details_scorer] FOREIGN KEY([scorer_Id])
REFERENCES [dbo].[people] ([id])
GO
ALTER TABLE [dbo].[goals_details] CHECK CONSTRAINT [FK_goals_details_scorer]
GO
ALTER TABLE [dbo].[jobs]  WITH CHECK ADD  CONSTRAINT [FK_jobs_hierarchy] FOREIGN KEY([Parent_Job_Id])
REFERENCES [dbo].[jobs] ([Id])
GO
ALTER TABLE [dbo].[jobs] CHECK CONSTRAINT [FK_jobs_hierarchy]
GO
ALTER TABLE [dbo].[leagues]  WITH CHECK ADD  CONSTRAINT [FK_leagues_hierarchy] FOREIGN KEY([Parent_League_id])
REFERENCES [dbo].[leagues] ([id])
GO
ALTER TABLE [dbo].[leagues] CHECK CONSTRAINT [FK_leagues_hierarchy]
GO
ALTER TABLE [dbo].[matches]  WITH CHECK ADD  CONSTRAINT [FK_matches_homeTeam] FOREIGN KEY([Home_Team_Id])
REFERENCES [dbo].[teams] ([Id])
GO
ALTER TABLE [dbo].[matches] CHECK CONSTRAINT [FK_matches_homeTeam]
GO
ALTER TABLE [dbo].[matches]  WITH CHECK ADD  CONSTRAINT [FK_matches_leagues] FOREIGN KEY([league_Id])
REFERENCES [dbo].[leagues] ([id])
GO
ALTER TABLE [dbo].[matches] CHECK CONSTRAINT [FK_matches_leagues]
GO
ALTER TABLE [dbo].[matches]  WITH CHECK ADD  CONSTRAINT [FK_matches_stadiums] FOREIGN KEY([Stadium_Id])
REFERENCES [dbo].[stadiums] ([id])
GO
ALTER TABLE [dbo].[matches] CHECK CONSTRAINT [FK_matches_stadiums]
GO
ALTER TABLE [dbo].[matches]  WITH CHECK ADD  CONSTRAINT [FK_matches_visitorTeam] FOREIGN KEY([Visitor_Team_Id])
REFERENCES [dbo].[teams] ([Id])
GO
ALTER TABLE [dbo].[matches] CHECK CONSTRAINT [FK_matches_visitorTeam]
GO
ALTER TABLE [dbo].[people]  WITH CHECK ADD  CONSTRAINT [FK_people_countries] FOREIGN KEY([Country_Id])
REFERENCES [dbo].[countries] ([Abbreviation])
GO
ALTER TABLE [dbo].[people] CHECK CONSTRAINT [FK_people_countries]
GO
ALTER TABLE [dbo].[people]  WITH CHECK ADD  CONSTRAINT [FK_people_jobs] FOREIGN KEY([Job_id])
REFERENCES [dbo].[jobs] ([Id])
GO
ALTER TABLE [dbo].[people] CHECK CONSTRAINT [FK_people_jobs]
GO
ALTER TABLE [dbo].[squads]  WITH CHECK ADD  CONSTRAINT [FK_squads_people] FOREIGN KEY([Person_Id])
REFERENCES [dbo].[people] ([id])
GO
ALTER TABLE [dbo].[squads] CHECK CONSTRAINT [FK_squads_people]
GO
ALTER TABLE [dbo].[squads]  WITH CHECK ADD  CONSTRAINT [FK_squads_teams] FOREIGN KEY([Team_Id])
REFERENCES [dbo].[teams] ([Id])
GO
ALTER TABLE [dbo].[squads] CHECK CONSTRAINT [FK_squads_teams]
GO
ALTER TABLE [dbo].[teams]  WITH CHECK ADD  CONSTRAINT [FK_teams_leagues] FOREIGN KEY([League_Id])
REFERENCES [dbo].[leagues] ([id])
GO
ALTER TABLE [dbo].[teams] CHECK CONSTRAINT [FK_teams_leagues]
GO
ALTER TABLE [dbo].[teams]  WITH CHECK ADD  CONSTRAINT [FK_teams_stadiums] FOREIGN KEY([Stadium_Id])
REFERENCES [dbo].[stadiums] ([id])
GO
ALTER TABLE [dbo].[teams] CHECK CONSTRAINT [FK_teams_stadiums]
GO
ALTER TABLE [dbo].[transfers]  WITH CHECK ADD  CONSTRAINT [FK_transfers_newTeam] FOREIGN KEY([new_team_Id])
REFERENCES [dbo].[teams] ([Id])
GO
ALTER TABLE [dbo].[transfers] CHECK CONSTRAINT [FK_transfers_newTeam]
GO
ALTER TABLE [dbo].[transfers]  WITH CHECK ADD  CONSTRAINT [FK_transfers_oldTeam] FOREIGN KEY([old_team_Id])
REFERENCES [dbo].[teams] ([Id])
GO
ALTER TABLE [dbo].[transfers] CHECK CONSTRAINT [FK_transfers_oldTeam]
GO
ALTER TABLE [dbo].[transfers]  WITH CHECK ADD  CONSTRAINT [FK_transfers_people] FOREIGN KEY([person_Id])
REFERENCES [dbo].[people] ([id])
GO
ALTER TABLE [dbo].[transfers] CHECK CONSTRAINT [FK_transfers_people]
GO
ALTER TABLE [dbo].[leagues]  WITH CHECK ADD  CONSTRAINT [CK_leagues_MaxTeamsNumber] CHECK  (([Max_teams_number]>=(2) AND [Max_teams_number]<=(20)))
GO
ALTER TABLE [dbo].[leagues] CHECK CONSTRAINT [CK_leagues_MaxTeamsNumber]
GO
ALTER TABLE [dbo].[matches]  WITH CHECK ADD  CONSTRAINT [CK_matches_sameTeams] CHECK  (([visitor_team_id]<>[home_team_id]))
GO
ALTER TABLE [dbo].[matches] CHECK CONSTRAINT [CK_matches_sameTeams]
GO
/****** Object:  StoredProcedure [dbo].[spCreateTables]    Script Date: 2017-11-09 20:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCreateTables]
AS
BEGIN
	CREATE TABLE teams (
		Id INT IDENTITY(1,1) PRIMARY KEY,
		[Name] NVARCHAR(30) NOT NULL,
		[DateOfFoundation] DATE NULL,
		[CountryAbbreviation] NVARCHAR(3) NULL,
	)

	CREATE TABLE countries (
		Abbreviation NVARCHAR(3) PRIMARY KEY,
		[Name] NVARCHAR(30) NOT NULL UNIQUE,
	)

	CREATE TABLE leagues (
		Id INT IDENTITY(1,1) PRIMARY KEY,
		[Name] NVARCHAR(30) NOT NULL,
		CountryAbbreviation NVARCHAR(3) NOT NULL
	)
END

GO
/****** Object:  StoredProcedure [dbo].[spDropTables]    Script Date: 2017-11-09 20:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spDropTables]
AS 
BEGIN
	DROP TABLE countries, leagues, teams
END
GO
/****** Object:  StoredProcedure [dbo].[spGenerateCountries]    Script Date: 2017-11-09 20:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGenerateCountries]
AS
BEGIN
	IF(EXISTS(SELECT * FROM countries))
	BEGIN
		RAISERROR('Countries are already generated!',16,1)
		RETURN
	END

	INSERT INTO countries VALUES('POL', 'Poland')
	INSERT INTO countries VALUES('ESP', 'Spain')
	INSERT INTO countries VALUES('NED', 'Netherlands')
	INSERT INTO countries VALUES('ENG', 'England')
	INSERT INTO countries VALUES('RUS', 'Russia')
	INSERT INTO countries VALUES('UKR', 'Ukraine')
	INSERT INTO countries VALUES('USA', 'United States of America')
	INSERT INTO countries VALUES('MEX', 'Mexico')
	INSERT INTO countries VALUES('GER', 'Germany')
	INSERT INTO countries VALUES('IRL', 'Ireland')
	INSERT INTO countries VALUES('CRO', 'Croatia')
	
END
GO
/****** Object:  StoredProcedure [dbo].[spGenerateJobs]    Script Date: 2017-11-09 20:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGenerateJobs]
AS
BEGIN
	IF(EXISTS(SELECT * FROM jobs))
	BEGIN
		RAISERROR('Jobs are already generated!',16,1)
		RETURN
	END
	
	DECLARE @FootballerJobId INT
	INSERT INTO jobs VALUES('Coach', NULL)
	INSERT INTO jobs VALUES('Footballer', NULL)

	SELECT @FootballerJobId = Id FROM jobs WHERE [Name] = 'Footballer'
	INSERT INTO jobs VALUES('Goalkeeper', @FootballerJobId)
	INSERT INTO jobs VALUES('Defender', @FootballerJobId)
	INSERT INTO jobs VALUES('Midfielder', @FootballerJobId)
	INSERT INTO jobs VALUES('Forward', @FootballerJobId)

END
GO
/****** Object:  StoredProcedure [dbo].[spGenerateLeagues]    Script Date: 2017-11-09 20:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGenerateLeagues]
@LeaguesPrefix NVARCHAR(64),
@LeaguesQuantity INT = 1
AS
BEGIN
	DECLARE @i INT = 1

	WHILE(@i <= @LeaguesQuantity)
	BEGIN
		INSERT INTO leagues VALUES(
			@LeaguesPrefix + ' ' + CAST(@i AS NVARCHAR(32)),
			CASE
				WHEN @i = 1
				THEN NULL
				ELSE IDENT_CURRENT('leagues') - 1
			END,

			RAND()*(18-20) + 18,

			CASE
				WHEN @i = @LeaguesQuantity
				THEN 0
				ELSE RAND()*(4-2)+2
			END
		)

		SET @i = @i + 1
	END

END
GO
/****** Object:  StoredProcedure [dbo].[spGeneratePeople]    Script Date: 2017-11-09 20:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGeneratePeople]
@NumberOfPeople INT = 1000
AS
BEGIN
	DECLARE @i INT = 0

	IF( @NumberOfPeople <= 0)
	BEGIN
		RAISERROR('Number of people must be greater than 0', 16,1)
		RETURN
	END

	WHILE(@i < @NumberOfPeople)
	BEGIN
		SET @i = @i + 1
		INSERT INTO people VALUES(
			'Name' + CAST(@i AS NVARCHAR(10)),
			'Surname' + CAST(@i AS NVARCHAR(10)),
			(SELECT TOP 1 Abbreviation FROM countries
			 ORDER BY NEWID()),
			(SELECT TOP 1 Id FROM jobs
			ORDER BY NEWID())
		)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spGenerateStadiums]    Script Date: 2017-11-09 20:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGenerateStadiums]
@NumberOfStadiums INT = 1000   
AS    
BEGIN
	IF(EXISTS(SELECT * FROM stadiums))
	BEGIN
		RAISERROR('Stadiums are already generated!', 16,1)
		RETURN
	END

	DBCC checkident('stadiums', reseed, 1)   
	DECLARE @i INT = 1
  
	WHILE(@i <= @NumberOfStadiums)    
	BEGIN
		INSERT INTO stadiums VALUES(    
			'Stadium ' + CAST(@i AS NVARCHAR(10))
		)  
	    
	   SET @i = @i + 1
	END    
END
GO
/****** Object:  StoredProcedure [dbo].[spGenerateTeams]    Script Date: 2017-11-09 20:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGenerateTeams]    
AS    
BEGIN
	IF(EXISTS(SELECT * FROM teams))
	BEGIN
		RAISERROR('Teams are already generated!',16,1)
		RETURN
	END
	DBCC CHECKIDENT('teams', RESEED, 1)  
	DECLARE @TotalTeams INT = 0  
  
	IF(dbo.fnTotalStadiums() < dbo.fnTotalTeams())  
	BEGIN  
		RAISERROR('Cannot generate teams. The number of stadiums too small', 16,1)  
		RETURN  
	END  
  
	CREATE TABLE #LeaguesCopy (    
		[id] [int] NOT NULL,    
		[Name] [nchar](128) NOT NULL,    
		[Parent_League_id] [int] NULL,    
		[Max_teams_number] [int] NOT NULL,    
		[Relegated_teams_number] [int] NOT NULL  
	)  
	INSERT INTO #LeaguesCopy SELECT * FROM leagues  
  
	CREATE TABLE #StadiumsCopy(  
		[id] [int] NOT NULL,  
		[Name] [nchar](128) NOT NULL 
	)  
	INSERT INTO #StadiumsCopy SELECT * FROM stadiums   
  
	WHILE(EXISTS(SELECT Id FROM #LeaguesCopy))    
	BEGIN    
		DECLARE @CurrentNumberOfTeams INT = 0  
		DECLARE @MaxTeams INT  
		SELECT TOP 1 @MaxTeams = Max_teams_number FROM #LeaguesCopy  
    
		WHILE(@CurrentNumberOfTeams < @MaxTeams)    
		BEGIN    
			SET @CurrentNumberOfTeams = @CurrentNumberOfTeams + 1    
			SET @TotalTeams = @TotalTeams + 1  
  
			DECLARE @RandomizedStadiumId INT  
			SELECT TOP 1 @RandomizedStadiumId = Id FROM #StadiumsCopy ORDER BY NEWID()  
			INSERT INTO teams VALUES(    
				'Team ' + CAST(@TotalTeams AS NVARCHAR(16)),    
				@RandomizedStadiumId,    
				(SELECT TOP 1 Id FROM #LeaguesCopy)    
			)
	END;    
    
	WITH FirstLeague (id) AS (    
		SELECT TOP 1 id FROM #LeaguesCopy    
	)    
	DELETE FROM FirstLeague  
  
	DELETE FROM #StadiumsCopy WHERE id = @RandomizedStadiumId   
	END    
END  
GO
USE [master]
GO
ALTER DATABASE [football] SET  READ_WRITE 
GO

exec spGenerateCountries
exec spGenerateJobs
exec spGenerateStadiums
exec spGenerateLeagues 'Ekstraklasa', 5
exec spGenerateLeagues 'La Liga', 5
exec spGenerateLeagues 'League', 3
exec spGeneratePeople 10000

update people
SET Job_id=rand()*(6-3) + 3
where people.Job_id=2

exec spGenerateTeams
