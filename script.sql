USE [master]
GO
/****** Object:  Database [football]    Script Date: 2017-12-05 23:06:53 ******/
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
/****** Object:  User [pw]    Script Date: 2017-12-05 23:06:53 ******/
CREATE USER [pw] FOR LOGIN [pw] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  UserDefinedFunction [dbo].[fnGenerateMatchesForLeague]    Script Date: 2017-12-05 23:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[fnGenerateMatchesForLeague](@LeagueId BIGINT)
RETURNS @Table TABLE(league_id BIGINT, home_team_id BIGINT, visitor_team_id BIGINT, stadium_id BIGINT, date_time DATETIME2(7), result NVARCHAR(10))
AS BEGIN
	INSERT INTO @Table
	select @LeagueId as league_id, t1.id as home_team_id, t2.id as visitor_team_id, t1.Stadium_Id as stadium_id, NULL as date_Time, NULL as result
	from teams t1
	join teams t2 ON t1.League_Id = t2.League_Id and t1.Id <> t2.Id
	where t1.League_Id = @LeagueId

	RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetAllTeamsOfLeague]    Script Date: 2017-12-05 23:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[fnGetAllTeamsOfLeague](@LeagueId BIGINT)
RETURNS @Teams TABLE (Id BIGINT)
AS BEGIN
	INSERT INTO @Teams
	SELECT id FROM teams WHERE League_Id = 1

	RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnTotalStadiums]    Script Date: 2017-12-05 23:06:54 ******/
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
/****** Object:  UserDefinedFunction [dbo].[fnTotalTeams]    Script Date: 2017-12-05 23:06:54 ******/
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
/****** Object:  Table [dbo].[countries]    Script Date: 2017-12-05 23:06:54 ******/
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
/****** Object:  Table [dbo].[database_error_log]    Script Date: 2017-12-05 23:06:54 ******/
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
/****** Object:  Table [dbo].[goals_details]    Script Date: 2017-12-05 23:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[goals_details](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[assistant_id] [bigint] NULL,
	[goalkeeper_id] [bigint] NULL,
	[match_id] [bigint] NULL,
	[scorer_id] [bigint] NULL,
	[for_team_id] [bigint] NULL,
	[against_team_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jobs]    Script Date: 2017-12-05 23:06:54 ******/
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
/****** Object:  Table [dbo].[league_table]    Script Date: 2017-12-05 23:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[league_table](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[team_id] [bigint] NOT NULL,
	[points] [int] NULL,
	[matches_Played] [int] NULL,
	[wins] [int] NULL,
	[draws] [int] NULL,
	[defeats] [int] NULL,
	[goals_Balance] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[leagues]    Script Date: 2017-12-05 23:06:54 ******/
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
/****** Object:  Table [dbo].[matches]    Script Date: 2017-12-05 23:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[matches](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[league_id] [bigint] NULL,
	[home_team_id] [bigint] NULL,
	[visitor_team_id] [bigint] NULL,
	[stadium_id] [bigint] NULL,
	[date_time] [datetime2](7) NULL,
	[result] [nchar](10) NULL,
 CONSTRAINT [PK__matches__3213E83F223E231F] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[people]    Script Date: 2017-12-05 23:06:54 ******/
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
	[team_id] [bigint] NULL,
 CONSTRAINT [PK_people] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[squads]    Script Date: 2017-12-05 23:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[squads](
	[Person_Id] [bigint] NOT NULL,
	[Team_Id] [bigint] NULL,
 CONSTRAINT [PK_squads] PRIMARY KEY CLUSTERED 
(
	[Person_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_g6y7p6g43k24t6gv0mmc62yc9] UNIQUE NONCLUSTERED 
(
	[Person_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stadiums]    Script Date: 2017-12-05 23:06:54 ******/
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
/****** Object:  Table [dbo].[teams]    Script Date: 2017-12-05 23:06:54 ******/
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
/****** Object:  Table [dbo].[transfers]    Script Date: 2017-12-05 23:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transfers](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[money] [int] NOT NULL,
	[from_team_id] [bigint] NULL,
	[person_id] [bigint] NULL,
	[to_team_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 2017-12-05 23:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[login] [varchar](255) NULL,
	[password] [varchar](255) NULL,
	[role] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vTeam_goals_summary]    Script Date: 2017-12-05 23:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vTeam_goals_summary]
as
	with matches_goals(match_id, home_team_id, visitor_team_id, for_team_id, against_team_id)
	as (
		SELECT m.id, m.home_team_id, m.visitor_team_id, g.for_team_id, g.against_team_id
		from matches m
		LEFT JOIN goals_details g ON g.match_id = m.id
	)
	select 
		t.id as team_id, 
		mg.match_id as matchId, 
		ISNULL((case when t.Id = mg.for_team_id then 1 when t.Id = against_team_id then -1 end), 0 ) as goal
	from teams t
	JOIN matches_goals mg ON mg.home_team_id = t.Id or mg.visitor_team_id = t.Id
GO
/****** Object:  View [dbo].[vWAllFootballers]    Script Date: 2017-12-05 23:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vWAllFootballers]
AS
SELECT p.id, p.[Name], p.Surname, p.team_id
FROM people p
LEFT JOIN jobs j ON p.Job_id = j.Id
where p.Job_id = 2 or j.Parent_Job_Id = 2
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_People_Surname]    Script Date: 2017-12-05 23:06:54 ******/
CREATE NONCLUSTERED INDEX [IX_People_Surname] ON [dbo].[people]
(
	[Surname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Teams_Name]    Script Date: 2017-12-05 23:06:54 ******/
CREATE NONCLUSTERED INDEX [IX_Teams_Name] ON [dbo].[teams]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[goals_details]  WITH CHECK ADD  CONSTRAINT [FK_goals_teams] FOREIGN KEY([for_team_id])
REFERENCES [dbo].[teams] ([Id])
GO
ALTER TABLE [dbo].[goals_details] CHECK CONSTRAINT [FK_goals_teams]
GO
ALTER TABLE [dbo].[goals_details]  WITH CHECK ADD  CONSTRAINT [FK_matches_goals] FOREIGN KEY([match_id])
REFERENCES [dbo].[matches] ([id])
GO
ALTER TABLE [dbo].[goals_details] CHECK CONSTRAINT [FK_matches_goals]
GO
ALTER TABLE [dbo].[goals_details]  WITH CHECK ADD  CONSTRAINT [FK75essn4woaq2rdvansm13dau4] FOREIGN KEY([assistant_id])
REFERENCES [dbo].[people] ([id])
GO
ALTER TABLE [dbo].[goals_details] CHECK CONSTRAINT [FK75essn4woaq2rdvansm13dau4]
GO
ALTER TABLE [dbo].[goals_details]  WITH CHECK ADD  CONSTRAINT [FK87u5iqcsbj2ckquxyg5uj0bt6] FOREIGN KEY([scorer_id])
REFERENCES [dbo].[people] ([id])
GO
ALTER TABLE [dbo].[goals_details] CHECK CONSTRAINT [FK87u5iqcsbj2ckquxyg5uj0bt6]
GO
ALTER TABLE [dbo].[goals_details]  WITH CHECK ADD  CONSTRAINT [FKh1rej4o6pco85pewxqascailx] FOREIGN KEY([for_team_id])
REFERENCES [dbo].[teams] ([Id])
GO
ALTER TABLE [dbo].[goals_details] CHECK CONSTRAINT [FKh1rej4o6pco85pewxqascailx]
GO
ALTER TABLE [dbo].[goals_details]  WITH CHECK ADD  CONSTRAINT [FKhlup6n6jmcfxujmw4jffi0n4j] FOREIGN KEY([against_team_id])
REFERENCES [dbo].[teams] ([Id])
GO
ALTER TABLE [dbo].[goals_details] CHECK CONSTRAINT [FKhlup6n6jmcfxujmw4jffi0n4j]
GO
ALTER TABLE [dbo].[goals_details]  WITH CHECK ADD  CONSTRAINT [FKlxq2etlgaihklbcy8dbu9si3s] FOREIGN KEY([match_id])
REFERENCES [dbo].[matches] ([id])
GO
ALTER TABLE [dbo].[goals_details] CHECK CONSTRAINT [FKlxq2etlgaihklbcy8dbu9si3s]
GO
ALTER TABLE [dbo].[goals_details]  WITH CHECK ADD  CONSTRAINT [FKpr6gyrje5sddcrksk4jin0xs] FOREIGN KEY([goalkeeper_id])
REFERENCES [dbo].[people] ([id])
GO
ALTER TABLE [dbo].[goals_details] CHECK CONSTRAINT [FKpr6gyrje5sddcrksk4jin0xs]
GO
ALTER TABLE [dbo].[jobs]  WITH CHECK ADD  CONSTRAINT [FK_jobs_hierarchy] FOREIGN KEY([Parent_Job_Id])
REFERENCES [dbo].[jobs] ([Id])
GO
ALTER TABLE [dbo].[jobs] CHECK CONSTRAINT [FK_jobs_hierarchy]
GO
ALTER TABLE [dbo].[jobs]  WITH CHECK ADD  CONSTRAINT [FKihrnengo81ehnihbvjgx6bylx] FOREIGN KEY([Parent_Job_Id])
REFERENCES [dbo].[jobs] ([Id])
GO
ALTER TABLE [dbo].[jobs] CHECK CONSTRAINT [FKihrnengo81ehnihbvjgx6bylx]
GO
ALTER TABLE [dbo].[league_table]  WITH CHECK ADD  CONSTRAINT [FKs99vr5vaavcxebmkuujsw9oun] FOREIGN KEY([team_id])
REFERENCES [dbo].[teams] ([Id])
GO
ALTER TABLE [dbo].[league_table] CHECK CONSTRAINT [FKs99vr5vaavcxebmkuujsw9oun]
GO
ALTER TABLE [dbo].[leagues]  WITH CHECK ADD  CONSTRAINT [FK_leagues_hierarchy] FOREIGN KEY([Parent_League_id])
REFERENCES [dbo].[leagues] ([id])
GO
ALTER TABLE [dbo].[leagues] CHECK CONSTRAINT [FK_leagues_hierarchy]
GO
ALTER TABLE [dbo].[matches]  WITH CHECK ADD  CONSTRAINT [FK23dnop04r2pfj2wvo21vakpph] FOREIGN KEY([league_id])
REFERENCES [dbo].[leagues] ([id])
GO
ALTER TABLE [dbo].[matches] CHECK CONSTRAINT [FK23dnop04r2pfj2wvo21vakpph]
GO
ALTER TABLE [dbo].[matches]  WITH CHECK ADD  CONSTRAINT [FK8k68nekawp47js52dq8720voe] FOREIGN KEY([home_team_id])
REFERENCES [dbo].[teams] ([Id])
GO
ALTER TABLE [dbo].[matches] CHECK CONSTRAINT [FK8k68nekawp47js52dq8720voe]
GO
ALTER TABLE [dbo].[matches]  WITH CHECK ADD  CONSTRAINT [FKcrhtu0qelpencoxb8egat04gm] FOREIGN KEY([visitor_team_id])
REFERENCES [dbo].[teams] ([Id])
GO
ALTER TABLE [dbo].[matches] CHECK CONSTRAINT [FKcrhtu0qelpencoxb8egat04gm]
GO
ALTER TABLE [dbo].[matches]  WITH CHECK ADD  CONSTRAINT [FKrrg1mqie8f84r20oh3vdb36m8] FOREIGN KEY([stadium_id])
REFERENCES [dbo].[stadiums] ([id])
GO
ALTER TABLE [dbo].[matches] CHECK CONSTRAINT [FKrrg1mqie8f84r20oh3vdb36m8]
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
ALTER TABLE [dbo].[people]  WITH CHECK ADD  CONSTRAINT [FK90csifbkadfg0r9i15ja4i564] FOREIGN KEY([Country_Id])
REFERENCES [dbo].[countries] ([Abbreviation])
GO
ALTER TABLE [dbo].[people] CHECK CONSTRAINT [FK90csifbkadfg0r9i15ja4i564]
GO
ALTER TABLE [dbo].[people]  WITH CHECK ADD  CONSTRAINT [FKgg41mdphd370lwk9sfe4x9pja] FOREIGN KEY([Job_id])
REFERENCES [dbo].[jobs] ([Id])
GO
ALTER TABLE [dbo].[people] CHECK CONSTRAINT [FKgg41mdphd370lwk9sfe4x9pja]
GO
ALTER TABLE [dbo].[people]  WITH CHECK ADD  CONSTRAINT [FKsdwlni8x8h83meongfawlw5k8] FOREIGN KEY([team_id])
REFERENCES [dbo].[teams] ([Id])
GO
ALTER TABLE [dbo].[people] CHECK CONSTRAINT [FKsdwlni8x8h83meongfawlw5k8]
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
ALTER TABLE [dbo].[teams]  WITH CHECK ADD  CONSTRAINT [FKcmnrlwu7alyse9s3x5tgvxyqj] FOREIGN KEY([League_Id])
REFERENCES [dbo].[leagues] ([id])
GO
ALTER TABLE [dbo].[teams] CHECK CONSTRAINT [FKcmnrlwu7alyse9s3x5tgvxyqj]
GO
ALTER TABLE [dbo].[teams]  WITH CHECK ADD  CONSTRAINT [FKpmiefb1tdyvxsk0dn5t0publq] FOREIGN KEY([Stadium_Id])
REFERENCES [dbo].[stadiums] ([id])
GO
ALTER TABLE [dbo].[teams] CHECK CONSTRAINT [FKpmiefb1tdyvxsk0dn5t0publq]
GO
ALTER TABLE [dbo].[transfers]  WITH CHECK ADD  CONSTRAINT [FK8i375j3iqdelks54mjgdkpcc7] FOREIGN KEY([person_id])
REFERENCES [dbo].[people] ([id])
GO
ALTER TABLE [dbo].[transfers] CHECK CONSTRAINT [FK8i375j3iqdelks54mjgdkpcc7]
GO
ALTER TABLE [dbo].[transfers]  WITH CHECK ADD  CONSTRAINT [FKdsj54nuftn4fhbtnaygf2ex5t] FOREIGN KEY([to_team_id])
REFERENCES [dbo].[teams] ([Id])
GO
ALTER TABLE [dbo].[transfers] CHECK CONSTRAINT [FKdsj54nuftn4fhbtnaygf2ex5t]
GO
ALTER TABLE [dbo].[transfers]  WITH CHECK ADD  CONSTRAINT [FKeotry2up7hfvfgt3b3fobdvyj] FOREIGN KEY([from_team_id])
REFERENCES [dbo].[teams] ([Id])
GO
ALTER TABLE [dbo].[transfers] CHECK CONSTRAINT [FKeotry2up7hfvfgt3b3fobdvyj]
GO
ALTER TABLE [dbo].[leagues]  WITH CHECK ADD  CONSTRAINT [CK_leagues_MaxTeamsNumber] CHECK  (([Max_teams_number]>=(2) AND [Max_teams_number]<=(20)))
GO
ALTER TABLE [dbo].[leagues] CHECK CONSTRAINT [CK_leagues_MaxTeamsNumber]
GO
/****** Object:  StoredProcedure [dbo].[spCreateTables]    Script Date: 2017-12-05 23:06:54 ******/
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
/****** Object:  StoredProcedure [dbo].[spDropTables]    Script Date: 2017-12-05 23:06:54 ******/
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
/****** Object:  StoredProcedure [dbo].[spGenerateCountries]    Script Date: 2017-12-05 23:06:54 ******/
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
/****** Object:  StoredProcedure [dbo].[spGenerateEmptyLeagueTable]    Script Date: 2017-12-05 23:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGenerateEmptyLeagueTable]
AS
BEGIN
	CREATE TABLE #Teams ( Id BIGINT )

	INSERT INTO #Teams
	SELECT Id FROM teams

	WHILE(EXISTS(SELECT * FROM #Teams))
	BEGIN
		DECLARE @CurrentTeamId BIGINT
		SELECT TOP 1 @CurrentTeamId = Id FROM #Teams

		INSERT INTO league_table VALUES (@CurrentTeamId, 0,0,0,0,0,0)
		DELETE FROM #Teams WHERE Id = @CurrentTeamId
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spGenerateJobs]    Script Date: 2017-12-05 23:06:54 ******/
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
/****** Object:  StoredProcedure [dbo].[spGenerateLeagues]    Script Date: 2017-12-05 23:06:54 ******/
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
			@LeaguesPrefix + ' ' + RTRIM(CAST(@i AS NVARCHAR(32))),
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
/****** Object:  StoredProcedure [dbo].[spGenerateMatches]    Script Date: 2017-12-05 23:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGenerateMatches]
AS
BEGIN
	
	IF(OBJECT_ID('leagues') IS NULL)
	BEGIN
		RAISERROR('Cannot generate matches. No leagues available.', 16,1)
		RETURN
	END
	IF(OBJECT_ID('teams') IS NULL)
	BEGIN
		RAISERROR('Cannot generate matches. No teams available.', 16,1)
		RETURN
	END

	create table #leagueIds(id bigint)
	insert into #leagueIds SELECT id FROM leagues

	CREATE TABLE #TeamsOfCurrentLeague (Id BIGINT)

	WHILE(EXISTS(SELECT * FROM #leagueIds))
	BEGIN
		DECLARE @CurrentLeague BIGINT
		SELECT TOP 1 @CurrentLeague = Id FROM #leagueIds

		insert into matches
		select league_id, home_team_id, visitor_team_id, stadium_id, date_time, result from dbo.fnGenerateMatchesForLeague(@CurrentLeague)

		
		INSERT INTO #TeamsOfCurrentLeague
		select id FROM teams where League_Id = @CurrentLeague

		WHILE(EXISTS(select * from #TeamsOfCurrentLeague))
		BEGIN
			DECLARE @HomeMatchDate DATETIME2(7) = GETDATE()
			DECLARE @CurrentTeamId BIGINT
			SELECT TOP 1 @CurrentTeamId = Id FROM #TeamsOfCurrentLeague

			WHILE(EXISTS(SELECT * FROM matches where home_team_id = @CurrentTeamId and date_time IS NULL))
			BEGIN
				UPDATE matches 
					SET date_time = @HomeMatchDate
					WHERE id = (SELECT TOP 1 id FROM matches WHERE home_team_id = @CurrentTeamId and date_time IS NULL)
				SET @HomeMatchDate = DATEADD(DAY, 14, @HomeMatchDate)
			END

			DELETE FROM #TeamsOfCurrentLeague WHERE Id = @CurrentTeamId
		END

		DELETE FROM #leagueIds WHERE id = @CurrentLeague

	END
END
GO
/****** Object:  StoredProcedure [dbo].[spGeneratePeople]    Script Date: 2017-12-05 23:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spGeneratePeople]  
@NumberOfPeople INT = 10000  
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
   'Name' + RTRIM(CAST(@i AS NVARCHAR(10))),  
   'Surname' + RTRIM(CAST(@i AS NVARCHAR(10))),  
   (SELECT TOP 1 Abbreviation FROM countries  
    ORDER BY NEWID()),  
   (SELECT TOP 1 Id FROM jobs  
   ORDER BY NEWID()),
   (SELECT TOP 1 Id FROM teams  
   ORDER BY NEWID())
  )  
 END  
END
GO
/****** Object:  StoredProcedure [dbo].[spGenerateSquads]    Script Date: 2017-12-05 23:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGenerateSquads]
AS
BEGIN
	IF(OBJECT_ID('people') IS NULL)
	BEGIN
		RAISERROR('Cannot generate squads. No people available.', 16,1)
		RETURN
	END
	IF(OBJECT_ID('teams') IS NULL)
	BEGIN
		RAISERROR('Cannot generate squads. No teams available.', 16,1)
		RETURN
	END

	CREATE TABLE #PeopleIds(ID BIGINT)
	CREATE TABLE #TeamIds(ID BIGINT)

	INSERT INTO #PeopleIds SELECT ID FROM people
	INSERT INTO #TeamIds SELECT ID FROM teams


	WHILE(EXISTS(SELECT * FROM #PeopleIds))
	BEGIN
		DECLARE @CurrentPersonId INT
		SELECT TOP 1 @CurrentPersonId = ID FROM #PeopleIds

		INSERT INTO squads VALUES(
			@CurrentPersonId,
			(SELECT TOP 1 ID FROM teams ORDER BY NEWID())
		)

		DELETE FROM #PeopleIds WHERE ID = @CurrentPersonId
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spGenerateStadiums]    Script Date: 2017-12-05 23:06:54 ******/
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
			'Stadium ' + RTRIM(CAST(@i AS NVARCHAR))
		)  
	    
	   SET @i = @i + 1
	END    
END
GO
/****** Object:  StoredProcedure [dbo].[spGenerateTeams]    Script Date: 2017-12-05 23:06:54 ******/
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
				'Team ' + RTRIM(CAST(@TotalTeams AS NVARCHAR(16))),    
				@RandomizedStadiumId,    
				(SELECT TOP 1 Id FROM #LeaguesCopy)    
			)
			DELETE FROM #StadiumsCopy WHERE id = @RandomizedStadiumId 
	END;    
    
	WITH FirstLeague (id) AS (    
		SELECT TOP 1 id FROM #LeaguesCopy    
	)    
	DELETE FROM FirstLeague    
	END    
END 
GO
USE [master]
GO
ALTER DATABASE [football] SET  READ_WRITE 
GO
use football

exec spGenerateStadiums
exec spGenerateLeagues 'Ekstraklasa', 5
exec spGenerateLeagues 'La Liga', 6
exec spGenerateLeagues 'League', 7
exec spGenerateTeams
exec spGenerateCountries
exec spGenerateJobs
exec spGeneratePeople
exec spGenerateMatches
exec spGenerateEmptyLeagueTable
exec spGenerateSquads

update people
set Job_id = RAND()*(6-3) + 3 WHERE Job_id = 2

select * from database_error_log