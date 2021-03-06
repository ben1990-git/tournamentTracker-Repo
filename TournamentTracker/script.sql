USE [Tournaments]
GO
/****** Object:  Table [dbo].[MatchUpEntries]    Script Date: 2/13/2021 12:09:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchUpEntries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MatchUpId] [int] NOT NULL,
	[ParentMatchUpId] [int] NULL,
	[TeamCompetingId] [int] NULL,
	[Score] [float] NULL,
 CONSTRAINT [PK_MatchUpEntries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatchUps]    Script Date: 2/13/2021 12:09:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchUps](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WinnerId] [int] NULL,
	[MatchUpRound] [int] NOT NULL,
	[TournamentId] [int] NOT NULL,
 CONSTRAINT [PK_MatchUps] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[People]    Script Date: 2/13/2021 12:09:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[EmailAddress] [nvarchar](100) NOT NULL,
	[CellPhoneNumber] [varchar](20) NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prizes]    Script Date: 2/13/2021 12:09:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prizes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PlaceNumber] [int] NULL,
	[PlaceName] [nvarchar](50) NULL,
	[PrizeAmount] [money] NULL,
	[PrizePrecentage] [int] NOT NULL,
 CONSTRAINT [PK_Prizes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeamMembers]    Script Date: 2/13/2021 12:09:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamMembers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeamId] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
 CONSTRAINT [PK_TeamMembers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 2/13/2021 12:09:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeamName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tournament]    Script Date: 2/13/2021 12:09:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tournament](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TournamentName] [nvarchar](200) NOT NULL,
	[EntryFee] [money] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Tournament] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TournamentEntries]    Script Date: 2/13/2021 12:09:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TournamentEntries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TournamentId] [int] NOT NULL,
	[TeamId] [int] NOT NULL,
 CONSTRAINT [PK_TournamentEntries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TournamentPrizes]    Script Date: 2/13/2021 12:09:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TournamentPrizes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TournamentId] [int] NOT NULL,
	[PrizeId] [int] NULL,
 CONSTRAINT [PK_TournamentPrizes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MatchUpEntries]  WITH CHECK ADD  CONSTRAINT [FK_MatchUpEntries_MatchUps1] FOREIGN KEY([MatchUpId])
REFERENCES [dbo].[MatchUps] ([Id])
GO
ALTER TABLE [dbo].[MatchUpEntries] CHECK CONSTRAINT [FK_MatchUpEntries_MatchUps1]
GO
ALTER TABLE [dbo].[MatchUpEntries]  WITH CHECK ADD  CONSTRAINT [FK_MatchUpEntries_Teams] FOREIGN KEY([TeamCompetingId])
REFERENCES [dbo].[Teams] ([Id])
GO
ALTER TABLE [dbo].[MatchUpEntries] CHECK CONSTRAINT [FK_MatchUpEntries_Teams]
GO
ALTER TABLE [dbo].[MatchUps]  WITH CHECK ADD  CONSTRAINT [FK_MatchUps_Teams] FOREIGN KEY([WinnerId])
REFERENCES [dbo].[Teams] ([Id])
GO
ALTER TABLE [dbo].[MatchUps] CHECK CONSTRAINT [FK_MatchUps_Teams]
GO
ALTER TABLE [dbo].[TeamMembers]  WITH CHECK ADD  CONSTRAINT [FK_TeamMembers_People] FOREIGN KEY([PersonId])
REFERENCES [dbo].[People] ([Id])
GO
ALTER TABLE [dbo].[TeamMembers] CHECK CONSTRAINT [FK_TeamMembers_People]
GO
ALTER TABLE [dbo].[TeamMembers]  WITH CHECK ADD  CONSTRAINT [FK_TeamMembers_Teams] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Teams] ([Id])
GO
ALTER TABLE [dbo].[TeamMembers] CHECK CONSTRAINT [FK_TeamMembers_Teams]
GO
ALTER TABLE [dbo].[TournamentEntries]  WITH CHECK ADD  CONSTRAINT [FK_TournamentEntries_Teams] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Teams] ([Id])
GO
ALTER TABLE [dbo].[TournamentEntries] CHECK CONSTRAINT [FK_TournamentEntries_Teams]
GO
ALTER TABLE [dbo].[TournamentEntries]  WITH CHECK ADD  CONSTRAINT [FK_TournamentEntries_Tournament] FOREIGN KEY([TournamentId])
REFERENCES [dbo].[Tournament] ([Id])
GO
ALTER TABLE [dbo].[TournamentEntries] CHECK CONSTRAINT [FK_TournamentEntries_Tournament]
GO
ALTER TABLE [dbo].[TournamentPrizes]  WITH CHECK ADD  CONSTRAINT [FK_TournamentPrizes_Prizes] FOREIGN KEY([PrizeId])
REFERENCES [dbo].[Prizes] ([Id])
GO
ALTER TABLE [dbo].[TournamentPrizes] CHECK CONSTRAINT [FK_TournamentPrizes_Prizes]
GO
ALTER TABLE [dbo].[TournamentPrizes]  WITH CHECK ADD  CONSTRAINT [FK_TournamentPrizes_Tournament] FOREIGN KEY([TournamentId])
REFERENCES [dbo].[Tournament] ([Id])
GO
ALTER TABLE [dbo].[TournamentPrizes] CHECK CONSTRAINT [FK_TournamentPrizes_Tournament]
GO
/****** Object:  StoredProcedure [dbo].[spMatchup_GetByTournamet]    Script Date: 2/13/2021 12:09:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spMatchup_GetByTournamet]
@TournamentId int

AS
BEGIN

	SET NOCOUNT ON;

	select m.*
	from dbo.MatchUps m
	where m.TournamentId=@TournamentId
	order by MatchupRound;

END
GO
/****** Object:  StoredProcedure [dbo].[spMatchup_Insert]    Script Date: 2/13/2021 12:09:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spMatchup_Insert]
@TournamentId int,
@MatchupRound int,
@id int = 0 output

AS
BEGIN

	SET NOCOUNT ON;

	insert into dbo.MatchUps(TournamentId,MatchUpRound)
	values(@TournamentId,@MatchupRound);
	select @Id = SCOPE_IDENTITY()

END
GO
/****** Object:  StoredProcedure [dbo].[spMatchupEntries_GetByMatchup]    Script Date: 2/13/2021 12:09:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spMatchupEntries_GetByMatchup]
@MatchupId int

AS
BEGIN

	SET NOCOUNT ON;
	select*
	from MatchUpEntries
	where MatchUpId=@MatchupId

END
GO
/****** Object:  StoredProcedure [dbo].[spMatchupEntries_Insert]    Script Date: 2/13/2021 12:09:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spMatchupEntries_Insert]
@MatchupId int,
@ParentMatchupId int,
@TeamCompetingId int,
@id int = 0 output


AS
BEGIN

	SET NOCOUNT ON;
	insert into dbo.MatchUpEntries(MatchUpId,ParentMatchUpId,TeamCompetingId)
	values(@MatchupId,@ParentMatchupId,@TeamCompetingId)

	SELECT @id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[spMatchupEntries_Update]    Script Date: 2/13/2021 12:09:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spMatchupEntries_Update]
@Id int,
@TeamCompetingId int=null,
@Score float=null
AS

BEGIN

	SET NOCOUNT ON;
	update dbo.MatchUpEntries
	set TeamCompetingId=@TeamCompetingId,Score=@Score
	where id=@Id;
END
GO
/****** Object:  StoredProcedure [dbo].[spMatchups_Update]    Script Date: 2/13/2021 12:09:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spMatchups_Update]
@Id int,
@WinnerId int
AS
BEGIN

	SET NOCOUNT ON;
	update dbo.MatchUps
	set WinnerId=@WinnerId
	where id=@Id;

END
GO
/****** Object:  StoredProcedure [dbo].[spPeople_GetAll]    Script Date: 2/13/2021 12:09:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spPeople_GetAll]

AS
BEGIN

select *
from dbo.People

END
GO
/****** Object:  StoredProcedure [dbo].[spPeople_Insert]    Script Date: 2/13/2021 12:09:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spPeople_Insert]
@FirstName nvarchar(100),
@LastName nvarchar(100),
@EmailAddress nvarchar(100),
@CellPhoneNumber varchar(20),
@Id int = 0 output

AS
BEGIN

SET NOCOUNT ON;

insert into dbo.People(FirstName,LastName,EmailAddress,CellPhoneNumber)
values(@FirstName,@LastName,@EmailAddress,@CellPhoneNumber);

select @Id=SCOPE_IDENTITY();

	
END
GO
/****** Object:  StoredProcedure [dbo].[spPrizes_GetByTournament]    Script Date: 2/13/2021 12:09:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spPrizes_GetByTournament]
@TournamentId int
AS
BEGIN
SET NOCOUNT ON;

select p.*
from dbo.Prizes p
inner join dbo.TournamentPrizes t on p.id = t.PrizeId
	where t.TournamentId=@TournamentId;

END
GO
/****** Object:  StoredProcedure [dbo].[spPrizes_Insert]    Script Date: 2/13/2021 12:09:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spPrizes_Insert]
@placeNumber int,
@placeName varchar(50),
@prizeAmount money,
@prizePrecentage int,
@id int =0 output

	
AS
BEGIN

insert into dbo.Prizes(PlaceNumber,PlaceName,PrizeAmount,PrizePrecentage)
	values(@placeNumber,@placeName,@prizeAmount,@prizePrecentage);

    select @id=SCOPE_IDENTITY();
	
END
GO
/****** Object:  StoredProcedure [dbo].[spTeam_GetAll]    Script Date: 2/13/2021 12:09:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spTeam_GetAll]



AS
BEGIN
select *
from dbo.Teams
END
GO
/****** Object:  StoredProcedure [dbo].[spTeam_GetByTournament]    Script Date: 2/13/2021 12:09:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spTeam_GetByTournament]
@TournamentId int
AS
BEGIN

	SET NOCOUNT ON;

    select t.*
	from dbo.Teams t
	inner join dbo.TournamentEntries e on t.id =e.Id
	where e.TournamentId=@TournamentId;
END
GO
/****** Object:  StoredProcedure [dbo].[spTeamMembers_GetByTeam]    Script Date: 2/13/2021 12:09:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spTeamMembers_GetByTeam]
@TeamId int
	
AS
BEGIN
SET NOCOUNT ON;

select p.*
from dbo.TeamMembers m
inner join  dbo.People p on m.PersonId=p.Id
where m.TeamId=@TeamId;

END
GO
/****** Object:  StoredProcedure [dbo].[spTeamMembers_Insert]    Script Date: 2/13/2021 12:09:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spTeamMembers_Insert]
@TeamId int,
@PersonId int,
@Id int=0

AS
BEGIN
	
	SET NOCOUNT ON;

 insert into dbo.TeamMembers(TeamId,PersonId)
 values(@TeamId,@PersonId)
 select @Id = SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[spTeams_Insert]    Script Date: 2/13/2021 12:09:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



 CREATE Procedure [dbo].[spTeams_Insert]
 @TeamName varchar(100),
 @Id int=0 output

AS
BEGIN
insert into dbo.Teams(TeamName)
values(@TeamName)

select @Id= SCOPE_IDENTITY();


END
GO
/****** Object:  StoredProcedure [dbo].[spTournament_GetAll]    Script Date: 2/13/2021 12:09:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spTournament_GetAll]

AS
BEGIN

SET NOCOUNT ON;

select *
from dbo.Tournament
where Active=1;

END
GO
/****** Object:  StoredProcedure [dbo].[spTournament_Insert]    Script Date: 2/13/2021 12:09:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spTournament_Insert]
@TournamentName nvarchar(200),
@EntryFee money,
@Id int = 0 output

AS
BEGIN

SET NOCOUNT ON;

insert into dbo.Tournament(TournamentName,EntryFee,Active)
values(@TournamentName,@EntryFee,1)

select @Id = SCOPE_IDENTITY();

END
GO
/****** Object:  StoredProcedure [dbo].[spTournamentEntries_Insert]    Script Date: 2/13/2021 12:09:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[spTournamentEntries_Insert]
@TournamentId int,
@TeamId int,
@Id int = 0 output


AS
BEGIN

	SET NOCOUNT ON;

	insert into dbo.TournamentEntries(TournamentId,TeamId)
	values(@TournamentId,@TeamId)
	select @Id = SCOPE_IDENTITY(); 

END
GO
/****** Object:  StoredProcedure [dbo].[spTournamentPrizes_Insert]    Script Date: 2/13/2021 12:09:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spTournamentPrizes_Insert]
@TournamentId int,
@PrizeId int,
@Id int = 0 output

AS
BEGIN

	SET NOCOUNT ON;
	insert into dbo.TournamentPrizes(TournamentId,PrizeId)
	values (@TournamentId,@PrizeId)

	SELECT @Id = SCOPE_IDENTITY();

END
GO
/****** Object:  StoredProcedure [dbo].[spTournamet_Complate]    Script Date: 2/13/2021 12:09:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spTournamet_Complate]

@id int

AS
BEGIN

	SET NOCOUNT ON;
update dbo.Tournament
set Active=0
 where id=@id

END
GO
