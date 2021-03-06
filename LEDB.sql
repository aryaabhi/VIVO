USE [CPM]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_AnyDataInTables]    Script Date: 03/06/2014 15:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE TABLE [dbo].[tblBusinessSummary] (
	[tdcelement] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[t1] [int] NULL ,
	[t2] [int] NULL ,
	[t3] [int] NULL ,
	[t4] [int] NULL ,
	[t5] [int] NULL ,
	[t6] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblBusinessVolume] (
	[Business] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[BusinessForm] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[CashSavings] [float] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblBusinessVolumeTotal] (
	[Business] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[TotalVolume] [float] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblCVC] (
	[CVCID] [int] IDENTITY (1, 1) NOT NULL ,
	[ProjectID] [int] NOT NULL ,
	[CVCElement] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CustomerName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SupplierName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PGPartnerOrg] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NOSAddition] [int] NULL ,
	[CustomerAmt] [int] NULL ,
	[PGAmt] [int] NULL ,
	[CVCProb] [int] NULL ,
	[ProbAdjAmt] [int] NULL ,
	[CVCDescription] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblCash] (
	[CashID] [int] IDENTITY (1, 1) NOT NULL ,
	[ProjectID] [int] NOT NULL ,
	[CashElement] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CashSubElement] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CashAccMethod] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CashSavings] [int] NULL ,
	[CashProbability] [int] NULL ,
	[CashProbAdjAmt] [int] NULL ,
	[CashDescription] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblCustomReport] (
	[ReportID] [int] IDENTITY (1, 1) NOT NULL ,
	[ReportName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ReportText] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblDeletedProjects] (
	[ProjectID] [int] NULL ,
	[ProjectName] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ProjectLeaderID] [int] NULL ,
	[CommittedForecast] [bit] NULL ,
	[Status] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ProjectStartYear] [smallint] NULL ,
	[ProjectStartMonth] [smallint] NULL ,
	[ProjectStartMonthYearLiteral] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SavingsStartYear] [smallint] NULL ,
	[SavingsStartMonth] [smallint] NULL ,
	[SavingsStartMonthYearLiteral] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[RecoverableLosses] [float] NULL ,
	[CostBucket] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CostAmt] [float] NULL ,
	[Probability] [float] NULL ,
	[RowCreatedDateTime] [smalldatetime] NULL ,
	[Category] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Plant] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Business] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LossType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Description] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ReasonForChange] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[BusinessForm] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[TDCSubElement] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ImpliedSavStartMonth] [smallint] NULL ,
	[ImpliedSavStartYear] [smallint] NULL ,
	[ProjectStage] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Department] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OtherBusiness] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Standards] [bit] NULL ,
	[IsTDC] [bit] NULL ,
	[IsCash] [bit] NULL ,
	[IsCVC] [bit] NULL ,
	[IsSC] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblFinancialMonth] (
	[FinancialMonth] [int] NOT NULL ,
	[NoMonths] [float] NULL ,
	[M1] [int] NOT NULL ,
	[M2] [int] NULL ,
	[M3] [int] NULL ,
	[M4] [int] NULL ,
	[M5] [int] NULL ,
	[M6] [int] NULL ,
	[M7] [int] NULL ,
	[M8] [int] NULL ,
	[M9] [int] NULL ,
	[M10] [int] NULL ,
	[M11] [int] NULL ,
	[M12] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblFinancialMonthReverse] (
	[FinancialMonth] [int] NULL ,
	[NoMonths] [float] NULL ,
	[M1] [int] NULL ,
	[M2] [int] NULL ,
	[M3] [int] NULL ,
	[M4] [int] NULL ,
	[M5] [int] NULL ,
	[M6] [int] NULL ,
	[M7] [int] NULL ,
	[M8] [int] NULL ,
	[M9] [int] NULL ,
	[M10] [int] NULL ,
	[M11] [int] NULL ,
	[M12] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblPersonnel] (
	[PersonnelID] [int] NULL ,
	[ProjectLeader] [nvarchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[TeamGroupID] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblProjectAttachments] (
	[AttachmentId] [int] IDENTITY (1, 1) NOT NULL ,
	[ProjectId] [int] NOT NULL ,
	[FileName] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ContentType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Attachment] [image] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblProjectPersonnel] (
	[ProjectID] [int] NULL ,
	[PersonnelID] [int] NULL ,
	[RowCreatedDateTime] [smalldatetime] NULL ,
	[RowCreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblProjects] (
	[ProjectID] [int] IDENTITY (1, 1) NOT NULL ,
	[ProjectName] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ProjectLeaderID] [int] NULL ,
	[CommittedForecast] [bit] NULL ,
	[Status] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ProjectStartYear] [smallint] NULL ,
	[ProjectStartMonth] [smallint] NULL ,
	[ProjectStartMonthYearLiteral] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SavingsStartYear] [smallint] NULL ,
	[SavingsStartMonth] [smallint] NULL ,
	[SavingsStartMonthYearLiteral] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[RecoverableLosses] [float] NULL ,
	[CostBucket] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CostAmt] [float] NULL ,
	[Probability] [float] NULL ,
	[RowCreatedDateTime] [smalldatetime] NULL ,
	[Category] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Plant] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Business] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LossType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Description] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ReasonForChange] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[BusinessForm] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[TDCSubElement] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ImpliedSavStartMonth] [smallint] NULL ,
	[ImpliedSavStartYear] [smallint] NULL ,
	[ProjectStage] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Department] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OtherBusiness] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Standards] [bit] NULL ,
	[IsTDC] [bit] NULL ,
	[IsCash] [bit] NULL ,
	[IsCVC] [bit] NULL ,
	[isSC] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblReportTags] (
	[EMPS] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[EMPSTag] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblSC] (
	[SCTID] [int] IDENTITY (1, 1) NOT NULL ,
	[ProjectID] [int] NOT NULL ,
	[SupplyChain] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SCElement] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SCSubElement] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SCTimeCurrent] [int] NULL ,
	[SCTimeExpected] [int] NULL ,
	[SCTimeEffect] [int] NULL ,
	[SCProbability] [int] NULL ,
	[SCDescription] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblTDC] (
	[TDCId] [int] IDENTITY (1, 1) NOT NULL ,
	[ProjectID] [int] NOT NULL ,
	[FiscalYear] [int] NULL ,
	[ProbAdjustedAmt] [int] NULL ,
	[TimeAdjustedAmt] [int] NULL ,
	[TotalAdjustedAmt] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblTeamGroups] (
	[TeamGroupID] [int] NOT NULL ,
	[TeamGroupName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[GroupGoalAmt] [float] NULL ,
	[ActiveYN] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblTeamMonthlySpending] (
	[TeamID] [int] NULL ,
	[SpendingYear] [smallint] NULL ,
	[SpendingMonth] [smallint] NULL ,
	[SpendingMonthYearLiteral] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SpendingAmt] [float] NULL ,
	[RowCreatedDateTime] [smalldatetime] NULL ,
	[RowCreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[RowModifiedDateTime] [smalldatetime] NULL ,
	[RowModifiedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblTeams] (
	[TeamID] [int] NOT NULL ,
	[TeamGroupID] [int] NULL ,
	[TeamName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[TeamLeaderID] [int] NULL ,
	[TeamSponsorID] [int] NULL ,
	[TeamFinanceRepID] [int] NULL ,
	[TeamBaseCaseAmt] [float] NULL ,
	[TeamIdealStateAmt] [float] NULL ,
	[TeamCBNGoalAmt] [float] NULL ,
	[ActiveYN] [bit] NOT NULL 
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.Laura
AS
SELECT     tblProjects.*, tblPersonnel.ProjectLeader AS ProjectLEader
FROM         tblProjects INNER JOIN
                      tblPersonnel ON tblProjects.ProjectLeaderID = tblPersonnel.PersonnelID
WHERE     (tblProjects.Plant = 'St.Louis') AND (tblProjects.Department IS NOT NULL) AND (tblProjects.Department <> '')

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.MSM
AS
SELECT     tblProjects.*, tblPersonnel.ProjectLeader AS Expr1
FROM         tblProjects INNER JOIN
                      tblPersonnel ON tblProjects.ProjectLeaderID = tblPersonnel.PersonnelID
WHERE     (tblProjects.OtherBusiness = 'MSM')

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


GO


CREATE Procedure InsertProject 	
	(
-- data points for tblProjects
	@ProjectName nvarchar(200),
	@ProjectLeaderID int,
	@CommittedForecast bit=0,
	@Status nvarchar(50),
	@ProjectStartYear smallint=0,
	@ProjectStartMonth smallint=0,
	@ProjectStartMonthYearLiteral nvarchar(10),
	@SavingsStartYear smallint=0,
	@SavingsStartMonth smallint=0,
	@SavingsStartMonthYearLiteral nvarchar(10),
	@RecoverableLosses float=0,
	@CostBucket nvarchar(50)=NULL,
	@CostAmt float=0,
	@Probability float=0,
	@Category nvarchar(50),
	@Plant nvarchar(50),
	@Business nvarchar(50), 
	@LossType nvarchar(50),
	@Description nvarchar(255),
	@ReasonForChange nvarchar(255),
	@BusinessForm nvarchar(50),
	@TDCSubElement nvarchar(50)=NULL,
	@ImpliedSavStartMonth smallint=0, 
	@ImpliedSavStartYear smallint=0,
	@ProjectStage nvarchar(50),
	@Department nvarchar(50),
	@OtherBusiness nvarchar(20),
	@Standards bit=0, 
	@IsTDC bit=0,
	@IsCash bit=0,
	@IsCVC bit=0,
	@IsSC bit=0,
-- data point for  tblTDC
	@FiscalYear int=0,
	@ProbabilityAdjustedAmt int=0,
	@TimeAdjustedAmt int=0,
	@TotalAdjustedAmt int=0,
-- datapoints for tblCash
	@CashElement nvarchar(50)=NULL,
	@CashSubElement nvarchar(50)=NULL,
	@CashAccMethod nvarchar(50)=NULL,
	@CashSavings int=0,
	@CashProbability int=0,
	@CashProbAdjAmt int=0,
	@CashDescription nvarchar(250)=NULL,
-- datapoints for tblCVC
	@CVCElement nvarchar(50)=NULL,
	@CustomerName nvarchar(50)=NULL,
	@SupplierName nvarchar(50)=NULL,
	@PGPartnerOrg nvarchar(50)=NULL,
	@NOSAddition int=0,
	@CustomerAmt int=0,
	@PGAmt int=0,
	@CVCProb int=0,
	@ProbAdjAmt int=0,
	@CVCDescription nvarchar(250)=NULL,
-- datapoints for tblCVC
	@SupplyChain nvarchar(50)=NULL,
	@SCElement nvarchar(50)=NULL,
	@SCSubElement nvarchar(50)=NULL,
	@SCTimeCurrent int=0,
	@SCTimeExpected int=0,
	@SCTimeEffect int=0,
	@SCProbability int=0,
	@SCDescription nvarchar(250)=NULL
) AS 
BEGIN TRAN
Declare @ProjectIdentity int
-- Insert record in tblProjects
INSERT INTO tblProjects 
(ProjectName, ProjectLeaderID, CommittedForecast, Status, ProjectStartYear, ProjectStartMonth, ProjectStartMonthYearLiteral, SavingsStartYear, SavingsStartMonth, SavingsStartMonthYearLiteral, RecoverableLosses, CostBucket, CostAmt, Probability, Category, Plant, Business, LossType, Description, ReasonForChange, BusinessForm, TDCSubElement, ImpliedSavStartMonth, ImpliedSavStartYear, ProjectStage, Department,OtherBusiness,Standards,IsTDC,IsCash,IsCVC,IsSC) values
(@ProjectName, @ProjectLeaderID, @CommittedForecast, @Status, @ProjectStartYear, @ProjectStartMonth, @ProjectStartMonthYearLiteral, @SavingsStartYear, @SavingsStartMonth, @SavingsStartMonthYearLiteral, @RecoverableLosses, @CostBucket, @CostAmt, @Probability, @Category, @Plant, @Business, @LossType, @Description, @ReasonForChange, @BusinessForm, @TDCSubElement, @ImpliedSavStartMonth, @ImpliedSavStartYear, @ProjectStage, @Department,@OtherBusiness,@Standards,@IsTDC,@IsCash,@IsCVC,@IsSC)
select @ProjectIdentity = @@Identity
-- Insert current fiscial year in tblTDC
INSERT INTO tblTDC
(ProjectID, FiscalYEar, ProbAdjustedAmt, TimeAdjustedAmt, TotalAdjustedAmt) values 
(@ProjectIdentity, @FiscalYear, @ProbabilityAdjustedAmt, @TimeAdjustedAmt, @TotalAdjustedAmt)
-- Insert next fiscial Year in tblTDC
INSERT INTO tblTDC
(ProjectID, FiscalYEar, ProbAdjustedAmt, TimeAdjustedAmt, TotalAdjustedAmt) values 
(@ProjectIdentity, @FiscalYear+1, @ProbabilityAdjustedAmt, @RecoverableLosses - @TimeAdjustedAmt, @ProbabilityAdjustedAmt - @TotalAdjustedAmt)
-- Insert record in tblCash
INSERT INTO tblCash
(ProjectID, CashElement, CashSubElement, CashAccMethod, CashSavings, CashProbability, CashProbAdjAmt, CashDescription) values
(@ProjectIdentity, @CashElement, @CashSubElement, @CashAccMethod, @CashSavings, @CashProbability, @CashProbAdjAmt, @CashDescription)
INSERT INTO tblCVC 
(ProjectID,CVCElement,CustomerName,SupplierName,PGPartnerOrg,NOSAddition,CustomerAmt,PGAmt,CVCProb,ProbAdjAmt,CVCDescription) values
(@ProjectIdentity, @CVCElement,@CustomerName,@SupplierName,@PGPartnerOrg,@NOSAddition,@CustomerAmt,@PGAmt,@CVCProb,@ProbAdjAmt,@CVCDescription)
INSERT INTO tblSC 
(ProjectID, SupplyChain,SCElement,SCSubElement,SCTimeCurrent,SCTimeExpected,SCTimeEffect, SCProbability,SCDescription) values
(@ProjectIdentity, @SupplyChain,@SCElement,@SCSubElement,@SCTimeCurrent,@SCTimeExpected,@SCTimeEffect, @SCProbability,@SCDescription)
COMMIT TRAN


GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


GO


CREATE Procedure InsertReport 	
	(@ReportName nvarchar(50),
	@ReportText nvarchar(4000)
 ) AS 
declare @identity_val int
INSERT INTO tblCustomReport (ReportName, ReportText) values( @ReportName, @ReportText)
select @identity_val = @@Identity
return @identity_val


GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


GO


CREATE PROCEDURE ProjectCopy @ProjectID int AS

Declare @ProjectIdentity int

BEGIN TRAN

-- Insert record in tblProjects
INSERT INTO tblProjects 
SELECT    ProjectName, ProjectLeaderID, CommittedForecast, Status, ProjectStartYear, ProjectStartMonth, ProjectStartMonthYearLiteral, SavingsStartYear, SavingsStartMonth, SavingsStartMonthYearLiteral, RecoverableLosses, CostBucket, CostAmt, Probability, GetDate(),  Category, Plant, Business, LossType, Description, ReasonForChange, BusinessForm, TDCSubElement, ImpliedSavStartMonth, ImpliedSavStartYear, ProjectStage, Department,OtherBusiness,Standards,IsTDC,IsCash,IsCVC,IsSC
FROM         tblProjects
WHERE     (ProjectID = @ProjectID
)

select @ProjectIdentity = @@Identity

-- Insert record in tblTDC
INSERT INTO tblTDC
SELECT    @ProjectIdentity, FiscalYear, ProbAdjustedAmt, TimeAdjustedAmt, TotalAdjustedAmt
FROM         tblTDC
WHERE     (ProjectID = @ProjectID)

-- Insert record in tblCash
INSERT INTO tblCash
SELECT    @ProjectIdentity, CashElement, CashSubElement, CashAccMethod, CashSavings, CashProbability, CashProbAdjAmt, CashDescription
FROM         tblCash
WHERE     (ProjectID = @ProjectID)

INSERT INTO tblCVC 
SELECT    @ProjectIdentity,CVCElement,CustomerName,SupplierName,PGPartnerOrg,NOSAddition,CustomerAmt,PGAmt,CVCProb,ProbAdjAmt,CVCDescription
FROM         tblCVC
WHERE     (ProjectID = @ProjectID)

INSERT INTO tblSC 
SELECT    @ProjectIdentity, SupplyChain,SCElement,SCSubElement,SCTimeCurrent,SCTimeExpected,SCTimeEffect, SCProbability,SCDescription
FROM         tblSC
WHERE     (ProjectID = @ProjectID)

COMMIT TRAN

GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


GO


CREATE  PROCEDURE ProjectSumAll AS
SELECT     COUNT(tblProjects.ProjectName) AS [No of Projects], SUM(tblTDC.TotalAdjustedAmt) AS [Total Adjusted Amount], 
                      SUM(tblProjects.RecoverableLosses) AS [Total Recoverable Losses], SUM(tblTDC.ProbAdjustedAmt) AS [Probability Adjusted Amount], 
                      SUM(tblTDC.TimeAdjustedAmt) AS [Time Adjusted Amount]
FROM   tblProjects RIGHT OUTER JOIN tblTDC on tblProjects.ProjectID = tblTDC.ProjectID


GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


GO


CREATE PROCEDURE ProjectSumBusiness @Year char(4), @Business char(20)='All',@ProjectStage nvarchar(50) =NULL AS

if @ProjectStage = 'All'
Select @ProjectStage = NULL
Declare @committed Bit
Select @committed = NULL
if @ProjectStage = 'Committed to Forecast'
Begin
Select @committed = 1
Select @Projectstage = 'Committed to Finance'
End
if @ProjectStage = 'All( Except Committed to Forecast)'
Begin
Select @committed = 0
Select @ProjectStage = NULL
End

Declare @total Float
Declare @multiplier Float
Create table #temptable
(
Descr nvarchar(30),
T1  float(8), 
T2  float(8), 
T3  float(8),
T4  float(8), 
T5  float(8), 
)
Select @total = sum(totalvolume) from tblbusinessvolumetotal
Select @multiplier = totalvolume/@total from tblbusinessvolumetotal where business = @business

Insert into #temptable
SELECT  'All Projects',   COUNT(tblProjects.ProjectName) , SUM(tblTDC.TotalAdjustedAmt), 
SUM(tblProjects.RecoverableLosses), SUM(tblTDC.ProbAdjustedAmt), 
                      SUM(tblTDC.TimeAdjustedAmt)
FROM   tblProjects RIGHT OUTER JOIN tblTDC on tblProjects.ProjectID = tblTDC.ProjectID
WHERE tblTDC.FiscalYear = @Year
AND tblProjects.ProjectStage = COALESCE(@ProjectStage,  tblProjects.ProjectStage)
AND tblProjects.CommittedForecast = COALESCE(@committed,  tblProjects.CommittedForecast)
And tblProjects.Business= @Business
and Category='HomeCare' 
and CostBucket<>NULL
Insert into #temptable
SELECT  'Pipeline (>50% Prob)',   COUNT(tblProjects.ProjectName) , SUM(tblTDC.TotalAdjustedAmt), 
SUM(tblProjects.RecoverableLosses), SUM(tblTDC.ProbAdjustedAmt), 
                      SUM(tblTDC.TimeAdjustedAmt)
FROM   tblProjects RIGHT OUTER JOIN tblTDC on tblProjects.ProjectID = tblTDC.ProjectID
WHERE tblTDC.FiscalYear = @Year
AND tblProjects.ProjectStage = COALESCE(@ProjectStage,  tblProjects.ProjectStage)
And tblProjects.Business= @Business
and Category='HomeCare' 
And Probability >=50
and CostBucket<>NULL 
and CommittedForecast=1
Insert into #temptable
SELECT  'Total In BPE(>75% Prob)',   COUNT(tblProjects.ProjectName) , SUM(tblTDC.TotalAdjustedAmt),
 SUM(tblProjects.RecoverableLosses), SUM(tblTDC.ProbAdjustedAmt), 
                      SUM(tblTDC.TimeAdjustedAmt)
FROM   tblProjects RIGHT OUTER JOIN tblTDC on tblProjects.ProjectID = tblTDC.ProjectID
WHERE tblTDC.FiscalYear = @Year
AND tblProjects.ProjectStage = COALESCE(@ProjectStage,  tblProjects.ProjectStage)
And tblProjects.Business= @Business
and Category='HomeCare' 
And Probability >=75
and CostBucket<>NULL 
and CommittedForecast=1
Insert into #temptable
SELECT   'All Projects',  COUNT(tblProjects.ProjectName) , CAST(@multiplier * SUM(tblTDC.TotalAdjustedAmt) as int) , 
                     CAST(@multiplier *  SUM(tblProjects.RecoverableLosses) as int) , CAST(@multiplier * SUM(tblTDC.ProbAdjustedAmt) as int) , 
                     CAST(@multiplier *  SUM(tblTDC.TimeAdjustedAmt) as int) 
FROM   tblProjects RIGHT OUTER JOIN tblTDC on tblProjects.ProjectID = tblTDC.ProjectID
WHERE tblTDC.FiscalYear = @Year
AND tblProjects.ProjectStage = COALESCE(@ProjectStage,  tblProjects.ProjectStage)
AND tblProjects.CommittedForecast = COALESCE(@committed,  tblProjects.CommittedForecast)
and Category='HomeCare' 
And tblProjects.Business= 'All'
and CostBucket<>NULL
Insert into #temptable
SELECT   'Pipeline (>50% Prob)',  COUNT(tblProjects.ProjectName) , CAST(@multiplier * SUM(tblTDC.TotalAdjustedAmt) as int) , 
                     CAST(@multiplier *  SUM(tblProjects.RecoverableLosses) as int) , CAST(@multiplier * SUM(tblTDC.ProbAdjustedAmt) as int) , 
                     CAST(@multiplier *  SUM(tblTDC.TimeAdjustedAmt) as int) 
FROM   tblProjects RIGHT OUTER JOIN tblTDC on tblProjects.ProjectID = tblTDC.ProjectID
WHERE tblTDC.FiscalYear = @Year
AND tblProjects.ProjectStage = COALESCE(@ProjectStage,  tblProjects.ProjectStage)
And tblProjects.Business= 'All'
And Probability >=50
and CostBucket<>NULL 
and Category='HomeCare' 
and CommittedForecast=1
Insert into #temptable
SELECT   'Total In BPE(>75% Prob)',  COUNT(tblProjects.ProjectName) , CAST(@multiplier * SUM(tblTDC.TotalAdjustedAmt) as int) , 
                     CAST(@multiplier *  SUM(tblProjects.RecoverableLosses) as int) , CAST(@multiplier * SUM(tblTDC.ProbAdjustedAmt) as int) , 
                     CAST(@multiplier *  SUM(tblTDC.TimeAdjustedAmt) as int) 
FROM   tblProjects RIGHT OUTER JOIN tblTDC on tblProjects.ProjectID = tblTDC.ProjectID
WHERE tblTDC.FiscalYear = @Year
AND tblProjects.ProjectStage = COALESCE(@ProjectStage,  tblProjects.ProjectStage)
And tblProjects.Business= 'All'
And Probability >= 75
and CostBucket<>NULL 
and Category='HomeCare' 
and CommittedForecast=1
Select Descr as [Projects] , Sum(T1) as [Number of Projects],Sum(T2) as  [Total (Time and Prob) Adjusted Amt],Sum(T3) as  [Recoverable Loss], Sum(T4) as [Probability Adjusted Amt],Sum(T5) as [Time Adjusted Amt]   from #temptable Group by Descr

GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


GO


CREATE    PROCEDURE ProjectSumCVC @Year char(4), @Category nvarchar(50) =NULL  AS
SELECT     COUNT(tblProjects.ProjectName) AS [No of Projects], 
		SUM(tblCVC.NosAddition) AS [Total NOS Addition], 
                      	SUM( tblCVC.CustomerAmt) AS [Total Customer Amount], 
		SUM(tblCVC.PGAmt) AS [Total PG Amount], 
		SUM(tblCVC.ProbAdjAmt) AS [Probability Adjusted Amount]
FROM   tblProjects RIGHT OUTER JOIN tblCVC on tblProjects.ProjectID = tblCVC.ProjectID
WHERE ((tblProjects.SavingsStartYear = @Year and tblProjects.SavingsStartMonth>6) 
	or (tblProjects.SavingsStartYear = @Year+1 and tblProjects.SavingsStartMonth<=6)) 
AND tblProjects.Category = COALESCE(@Category,  tblProjects.Category)
AND (tblCVC.CVCElement<> NULL or tblCVC.CustomerName<> NULL or tblCVC.SupplierName<> NULL)

GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


GO


CREATE    PROCEDURE ProjectSumCash @Year char(4), @Category nvarchar(50) =NULL  AS
SELECT     COUNT(tblProjects.ProjectName) AS [No of Projects], SUM( tblCash.CashSavings) AS [Total Cash Savings], 
                      SUM( tblCash.CashProbAdjAmt) AS [Total Prob Adjusted Cash Savings]
FROM   tblProjects RIGHT OUTER JOIN tblCash on tblProjects.ProjectID = tblCash.ProjectID
WHERE ((tblProjects.SavingsStartYear = @Year and tblProjects.SavingsStartMonth>6) 
	or (tblProjects.SavingsStartYear = @Year+1 and tblProjects.SavingsStartMonth<=6)) 
AND tblProjects.Category = COALESCE(@Category,  tblProjects.Category)
AND tblCash.CashElement<> NULL

GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


GO

CREATE         PROCEDURE ProjectSumPillars @Year char(4) ='2004', @ProjectStage nvarchar(50)=NULL, @Pillars char(20) AS

Declare @committed Bit
Select @committed = NULL

if @ProjectStage = 'Committed to Forecast'
Begin
Select @committed = 1
Select @Projectstage = 'Committed to Finance'
End

if @ProjectStage = 'All'
Select @ProjectStage = NULL

if @ProjectStage = 'All( Except Committed to Forecast)'
Begin
Select @committed = 0
Select @ProjectStage = NULL
End

Create table #temptable
(
Descr nvarchar(30),
T1  float(8), 
T2  float(8), 
T3  float(8),
T4  float(8), 
T5  float(8), 
)
Insert into #temptable
SELECT    'All Projects', COUNT(tblProjects.ProjectName) , SUM(tblTDC.TotalAdjustedAmt) , 
                      SUM(tblProjects.RecoverableLosses), SUM(tblTDC.ProbAdjustedAmt) , 
                      SUM(tblTDC.TimeAdjustedAmt) 
FROM   tblProjects RIGHT OUTER JOIN tblTDC on tblProjects.ProjectID = tblTDC.ProjectID
WHERE tblTDC.FiscalYear = @Year
AND tblProjects.ProjectStage = COALESCE(@ProjectStage,  tblProjects.ProjectStage)
AND tblProjects.CommittedForecast = COALESCE(@committed,  tblProjects.CommittedForecast)
And tblProjects.OtherBusiness= @Pillars
and Category='HomeCare' 

Insert into #temptable
SELECT    'Pipeline (>50% Prob)', COUNT(tblProjects.ProjectName) , SUM(tblTDC.TotalAdjustedAmt) , 
                      SUM(tblProjects.RecoverableLosses), SUM(tblTDC.ProbAdjustedAmt) , 
                      SUM(tblTDC.TimeAdjustedAmt) 
FROM   tblProjects RIGHT OUTER JOIN tblTDC on tblProjects.ProjectID = tblTDC.ProjectID
WHERE tblTDC.FiscalYear = @Year
AND tblProjects.ProjectStage = COALESCE(@ProjectStage,  tblProjects.ProjectStage)
And tblProjects.OtherBusiness= @Pillars
and Category='HomeCare' 
and CommittedForecast=1
and Probability >= 50
Insert into #temptable
SELECT    'Total In BPE(>75% Prob)', COUNT(tblProjects.ProjectName) , SUM(tblTDC.TotalAdjustedAmt) , 
                      SUM(tblProjects.RecoverableLosses), SUM(tblTDC.ProbAdjustedAmt) , 
                      SUM(tblTDC.TimeAdjustedAmt) 
FROM   tblProjects RIGHT OUTER JOIN tblTDC on tblProjects.ProjectID = tblTDC.ProjectID
WHERE tblTDC.FiscalYear = @Year
AND tblProjects.ProjectStage =COALESCE(@ProjectStage,  tblProjects.ProjectStage)
And tblProjects.OtherBusiness= @Pillars
and Category='HomeCare' 
and CommittedForecast=1
and Probability >= 75
Select Descr as [Projects], T1 AS [No of Projects], T2  AS [Total Adjusted Amount], T3  AS [Total Recoverable Losses], 
T4 AS [Probability Adjusted Amount], T5 AS [Time Adjusted Amount]  from #temptable
GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


GO


CREATE     PROCEDURE ProjectSumPlant @Year char(4), @Plant char(20)='All',@ProjectStage nvarchar(50) =NULL AS
if @ProjectStage = 'All'
Select @ProjectStage = NULL

Declare @committed Bit
Select @committed = NULL
if @ProjectStage = 'Committed to Forecast'
Begin
Select @committed = 1
Select @Projectstage = 'Committed to Finance'
End
if @ProjectStage = 'All( Except Committed to Forecast)'
Begin
Select @committed = 0
Select @ProjectStage = NULL
End


Create table #temptable
(
Descr nvarchar(30),
T1  float(8), 
T2  float(8), 
T3  float(8),
T4  float(8), 
T5  float(8), 
)
Insert into #temptable
SELECT    'All Projects', COUNT(tblProjects.ProjectName) , SUM(tblTDC.TotalAdjustedAmt) , 
                      SUM(tblProjects.RecoverableLosses), SUM(tblTDC.ProbAdjustedAmt) , 
                      SUM(tblTDC.TimeAdjustedAmt) 
FROM   tblProjects RIGHT OUTER JOIN tblTDC on tblProjects.ProjectID = tblTDC.ProjectID
WHERE tblTDC.FiscalYear = @Year
AND tblProjects.ProjectStage = COALESCE(@ProjectStage,  tblProjects.ProjectStage)
AND tblProjects.CommittedForecast = COALESCE(@committed,  tblProjects.CommittedForecast)
And tblProjects.Plant= @Plant
and CostBucket<>NULL 
and Category='HomeCare' 

Insert into #temptable
SELECT    'Pipeline (>50% Prob)', COUNT(tblProjects.ProjectName) , SUM(tblTDC.TotalAdjustedAmt) , 
                      SUM(tblProjects.RecoverableLosses), SUM(tblTDC.ProbAdjustedAmt) , 
                      SUM(tblTDC.TimeAdjustedAmt) 
FROM   tblProjects RIGHT OUTER JOIN tblTDC on tblProjects.ProjectID = tblTDC.ProjectID
WHERE tblTDC.FiscalYear = @Year
AND tblProjects.ProjectStage =COALESCE(@ProjectStage,  tblProjects.ProjectStage)
And tblProjects.Plant= @Plant
and CostBucket<>NULL 
and Category='HomeCare' 
and CommittedForecast=1
and Probability >= 50
Insert into #temptable
SELECT    'Total In BPE(>75% Prob)', COUNT(tblProjects.ProjectName) , SUM(tblTDC.TotalAdjustedAmt) , 
                      SUM(tblProjects.RecoverableLosses), SUM(tblTDC.ProbAdjustedAmt) , 
                      SUM(tblTDC.TimeAdjustedAmt) 
FROM   tblProjects RIGHT OUTER JOIN tblTDC on tblProjects.ProjectID = tblTDC.ProjectID
WHERE tblTDC.FiscalYear = @Year
AND tblProjects.ProjectStage = COALESCE(@ProjectStage,  tblProjects.ProjectStage)
And tblProjects.Plant= @Plant
and CostBucket<>NULL 
and Category='HomeCare' 
and CommittedForecast=1
and Probability >= 75
Select Descr as [Projects], T1 AS [No of Projects], T2  AS [Total Adjusted Amount], T3  AS [Total Recoverable Losses], 
T4 AS [Probability Adjusted Amount], T5 AS [Time Adjusted Amount]  from #temptable

GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


GO


CREATE    PROCEDURE ProjectSumSC @Year char(4), @Category nvarchar(50) =NULL  AS
SELECT     COUNT(tblProjects.ProjectName) AS [No of Projects], SUM(tblSC.SCTimeEffect) AS [Total Supply Chain Effect]
FROM   tblProjects RIGHT OUTER JOIN tblSC on tblProjects.ProjectID = tblSC.ProjectID
WHERE ((tblProjects.SavingsStartYear = @Year and tblProjects.SavingsStartMonth>6) 
	or (tblProjects.SavingsStartYear = @Year+1 and tblProjects.SavingsStartMonth<=6)) 
AND tblProjects.Category = COALESCE(@Category,  tblProjects.Category)
AND (tblSC.SupplyChain<> NULL or tblSC.SCElement<> NULL)

GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


GO


CREATE     PROCEDURE ProjectSumTDCElement @Year char(4), @TDCElement char(20)='All',@ProjectStage nvarchar(50) =NULL AS
if @ProjectStage = 'All'
Select @ProjectStage = NULL

Declare @committed Bit
Select @committed = NULL
if @ProjectStage = 'Committed to Forecast'
Begin
Select @committed = 1
Select @Projectstage = 'Committed to Finance'
End
if @ProjectStage = 'All( Except Committed to Forecast)'
Begin
Select @committed = 0
Select @ProjectStage = NULL
End

Create table #temptable
(
Descr nvarchar(30),
T1  float(8), 
T2  float(8), 
T3  float(8),
T4  float(8), 
T5  float(8), 
)
Insert into #temptable
SELECT    'All Projects', COUNT(tblProjects.ProjectName) , SUM(tblTDC.TotalAdjustedAmt) , 
                      SUM(tblProjects.RecoverableLosses), SUM(tblTDC.ProbAdjustedAmt) , 
                      SUM(tblTDC.TimeAdjustedAmt) 
FROM   tblProjects RIGHT OUTER JOIN tblTDC on tblProjects.ProjectID = tblTDC.ProjectID
WHERE tblTDC.FiscalYear = @Year
AND tblProjects.ProjectStage = COALESCE(@ProjectStage,  tblProjects.ProjectStage)
AND tblProjects.CommittedForecast = COALESCE(@committed,  tblProjects.CommittedForecast)
And tblProjects.CostBucket= @TDCElement
and CostBucket<>NULL 
and Category='HomeCare' 

Insert into #temptable
SELECT    'Pipeline (>50% Prob)', COUNT(tblProjects.ProjectName) , SUM(tblTDC.TotalAdjustedAmt) , 
                      SUM(tblProjects.RecoverableLosses), SUM(tblTDC.ProbAdjustedAmt) , 
                      SUM(tblTDC.TimeAdjustedAmt) 
FROM   tblProjects RIGHT OUTER JOIN tblTDC on tblProjects.ProjectID = tblTDC.ProjectID
WHERE tblTDC.FiscalYear = @Year
AND tblProjects.ProjectStage = COALESCE(@ProjectStage,  tblProjects.ProjectStage)
And tblProjects.CostBucket= @TDCElement
and CostBucket<>NULL 
and Category='HomeCare' 
and CommittedForecast=1
and Probability >= 50

Insert into #temptable
SELECT    'Total In BPE(>75% Prob)', COUNT(tblProjects.ProjectName) , SUM(tblTDC.TotalAdjustedAmt) , 
                      SUM(tblProjects.RecoverableLosses), SUM(tblTDC.ProbAdjustedAmt) , 
                      SUM(tblTDC.TimeAdjustedAmt) 
FROM   tblProjects RIGHT OUTER JOIN tblTDC on tblProjects.ProjectID = tblTDC.ProjectID
WHERE tblTDC.FiscalYear = @Year
AND tblProjects.ProjectStage =COALESCE(@ProjectStage,  tblProjects.ProjectStage)
And tblProjects.CostBucket= @TDCElement
and CostBucket<>NULL 
and Category='HomeCare' 
and CommittedForecast=1
and Probability >= 75
Select Descr as [Projects], T1 AS [No of Projects], T2  AS [Total Adjusted Amount], T3  AS [Total Recoverable Losses], 
T4 AS [Probability Adjusted Amount], T5 AS [Time Adjusted Amount]  from #temptable

GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


GO


CREATE      PROCEDURE ProjectSumTDCSubElement @Year char(4), @TDCSubElement char(20)='All',@ProjectStage nvarchar(50) =NULL AS
if @ProjectStage = 'All'
Select @ProjectStage = NULL

Declare @committed Bit
Select @committed = NULL
if @ProjectStage = 'Committed to Forecast'
Begin
Select @committed = 1
Select @Projectstage = 'Committed to Finance'
End
if @ProjectStage = 'All( Except Committed to Forecast)'
Begin
Select @committed = 0
Select @ProjectStage = NULL
End

Create table #temptable
(
Descr nvarchar(30),
T1  float(8), 
T2  float(8), 
T3  float(8),
T4  float(8), 
T5  float(8), 
)
IF @TDCSubElement <> 'Purchasing'
Insert into #temptable
SELECT    'All Projects', COUNT(tblProjects.ProjectName) , SUM(tblTDC.TotalAdjustedAmt) , 
                      SUM(tblProjects.RecoverableLosses), SUM(tblTDC.ProbAdjustedAmt) , 
                      SUM(tblTDC.TimeAdjustedAmt) 
FROM   tblProjects RIGHT OUTER JOIN tblTDC on tblProjects.ProjectID = tblTDC.ProjectID
WHERE tblTDC.FiscalYear = @Year
AND tblProjects.ProjectStage = COALESCE(@ProjectStage,  tblProjects.ProjectStage)
AND tblProjects.CommittedForecast = COALESCE(@committed,  tblProjects.CommittedForecast)
And tblProjects.TDCSubElement= @TDCSubElement
and CostBucket<>NULL 
and Category='HomeCare' 
Else
Insert into #temptable
SELECT    'All Projects', COUNT(tblProjects.ProjectName) , SUM(tblTDC.TotalAdjustedAmt) , 
                      SUM(tblProjects.RecoverableLosses), SUM(tblTDC.ProbAdjustedAmt) , 
                      SUM(tblTDC.TimeAdjustedAmt) 
FROM   tblProjects RIGHT OUTER JOIN tblTDC on tblProjects.ProjectID = tblTDC.ProjectID
WHERE tblTDC.FiscalYear = @Year
AND tblProjects.ProjectStage =COALESCE(@ProjectStage,  tblProjects.ProjectStage)
AND tblProjects.CommittedForecast = COALESCE(@committed,  tblProjects.CommittedForecast)
And (tblProjects.TDCSubElement= 'RM Pricing' or tblProjects.TDCSubElement= 'PM Pricing')
and CostBucket<>NULL 
and Category='HomeCare' 

IF @TDCSubElement <> 'Purchasing' 
Insert into #temptable
SELECT    'Pipeline (>50% Prob)', COUNT(tblProjects.ProjectName) , SUM(tblTDC.TotalAdjustedAmt) , 
                      SUM(tblProjects.RecoverableLosses), SUM(tblTDC.ProbAdjustedAmt) , 
                      SUM(tblTDC.TimeAdjustedAmt) 
FROM   tblProjects RIGHT OUTER JOIN tblTDC on tblProjects.ProjectID = tblTDC.ProjectID
WHERE tblTDC.FiscalYear = @Year
AND tblProjects.ProjectStage = COALESCE(@ProjectStage,  tblProjects.ProjectStage)
And tblProjects.TDCSubElement= @TDCSubElement
and Probability >= 50
and CostBucket<>NULL 
and Category='HomeCare' 
and CommittedForecast=1
Else
Insert into #temptable
SELECT    'Pipeline (>50% Prob)', COUNT(tblProjects.ProjectName) , SUM(tblTDC.TotalAdjustedAmt) , 
                      SUM(tblProjects.RecoverableLosses), SUM(tblTDC.ProbAdjustedAmt) , 
                      SUM(tblTDC.TimeAdjustedAmt) 
FROM   tblProjects RIGHT OUTER JOIN tblTDC on tblProjects.ProjectID = tblTDC.ProjectID
WHERE tblTDC.FiscalYear = @Year
AND tblProjects.ProjectStage = COALESCE(@ProjectStage,  tblProjects.ProjectStage)
And (tblProjects.TDCSubElement= 'RM Pricing' or tblProjects.TDCSubElement= 'PM Pricing')
and Probability >= 50
and CostBucket<>NULL 
and Category='HomeCare' 
and CommittedForecast=1

IF @TDCSubElement <> 'Purchasing' 
Insert into #temptable
SELECT    'Total In BPE(>75% Prob)', COUNT(tblProjects.ProjectName) , SUM(tblTDC.TotalAdjustedAmt) , 
                      SUM(tblProjects.RecoverableLosses), SUM(tblTDC.ProbAdjustedAmt) , 
                      SUM(tblTDC.TimeAdjustedAmt) 
FROM   tblProjects RIGHT OUTER JOIN tblTDC on tblProjects.ProjectID = tblTDC.ProjectID
WHERE tblTDC.FiscalYear = @Year
AND tblProjects.ProjectStage = COALESCE(@ProjectStage,  tblProjects.ProjectStage)
And tblProjects.TDCSubElement= @TDCSubElement
and Probability >= 75
and CostBucket<>NULL 
and Category='HomeCare' 
and CommittedForecast=1
Else
Insert into #temptable
SELECT    'Total In BPE(>75% Prob)', COUNT(tblProjects.ProjectName) , SUM(tblTDC.TotalAdjustedAmt) , 
                      SUM(tblProjects.RecoverableLosses), SUM(tblTDC.ProbAdjustedAmt) , 
                      SUM(tblTDC.TimeAdjustedAmt) 
FROM   tblProjects RIGHT OUTER JOIN tblTDC on tblProjects.ProjectID = tblTDC.ProjectID
WHERE tblTDC.FiscalYear = @Year
AND tblProjects.ProjectStage = COALESCE(@ProjectStage,  tblProjects.ProjectStage)
And (tblProjects.TDCSubElement= 'RM Pricing' or tblProjects.TDCSubElement= 'PM Pricing')
and Probability >= 75
and CostBucket<>NULL 
and Category='HomeCare' 
and CommittedForecast=1
Select Descr as [Projects], T1 AS [No of Projects], T2  AS [Total Adjusted Amount], T3  AS [Total Recoverable Losses], 
T4 AS [Probability Adjusted Amount], T5 AS [Time Adjusted Amount]  from #temptable

GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


GO


CREATE    PROCEDURE ProjectSumYearAll @Year char(4), @ProjectStage nvarchar(50) =NULL  AS
if @ProjectStage = 'All'
Select @ProjectStage = NULL

Declare @committed Bit
Select @committed = NULL
if @ProjectStage = 'Committed to Forecast'
Begin
Select @committed = 1
Select @Projectstage = 'Committed to Finance'
End

SELECT     COUNT(tblProjects.ProjectName) AS [No of Projects], SUM(tblTDC.TotalAdjustedAmt) AS [Total Adjusted Amount], 
                      SUM(tblProjects.RecoverableLosses) AS [Total Recoverable Losses], SUM(tblTDC.ProbAdjustedAmt) AS [Probability Adjusted Amount], 
                      SUM(tblTDC.TimeAdjustedAmt) AS [Time Adjusted Amount]
FROM   tblProjects RIGHT OUTER JOIN tblTDC on tblProjects.ProjectID = tblTDC.ProjectID
WHERE tblTDC.FiscalYear = @Year
AND tblProjects.ProjectStage = COALESCE(@ProjectStage,  tblProjects.ProjectStage)
AND tblProjects.CommittedForecast = COALESCE(@committed,  tblProjects.CommittedForecast)

GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO


GO


CREATE  PROCEDURE ProjectsSelectAll AS
SELECT     tblProjects.ProjectID, tblProjects.Business, tblProjects.BusinessForm, tblProjects.CostBucket, tblProjects.TDCSubElement, tblProjects.ProjectName, 
                      tblPersonnel.ProjectLeader, tblProjects.RecoverableLosses,tblProjects.SavingsStartMonthYearLiteral, 
                      tblProjects.Probability, tblTDC.TotalAdjustedAmt, tblProjects.Status
FROM   tblPersonnel RIGHT OUTER JOIN
       		tblProjects ON tblPersonnel.PersonnelID = tblProjects.ProjectLeaderID
		RIGHT OUTER JOIN tblTDC on tblProjects.ProjectID = tblTDC.ProjectID


GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO


GO


CREATE   PROCEDURE ProjectsSelectAllWithStat AS
SELECT     tblProjects.ProjectID, tblProjects.Business, tblProjects.BusinessForm, tblProjects.CostBucket, tblProjects.TDCSubElement, tblProjects.ProjectName, 
                      tblPersonnel.ProjectLeader, tblProjects.RecoverableLosses, tblProjects.SavingsStartMonthYearLiteral, 
                      tblProjects.Probability, tblTDC.TotalAdjustedAmt, tblTDC.TotalAdjustedAmt / tblBusinessVolumeTotal.TotalVolume AS DollarPerStat, 
                      tblProjects.Status
FROM         tblTDC, tblPersonnel RIGHT OUTER JOIN
                      tblProjects LEFT OUTER JOIN
                      tblBusinessVolumeTotal 
		ON tblProjects.Business = tblBusinessVolumeTotal.Business 
		ON tblPersonnel.PersonnelID = tblProjects.ProjectLeaderID
WHERE tblProjects.ProjectID = tblTDC.ProjectID		


GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


GO



CREATE          PROCEDURE ProjectsSelectBusiness  @Year char(4) ='2004', @Business char(20)='All', @ProjectStage nvarchar(50) =NULL AS
Declare @total Float
Declare @multiplier Float
Select @total = sum(totalvolume) from tblbusinessvolumetotal
Select @multiplier = totalvolume/@total from tblbusinessvolumetotal where business = @business
Declare @committed Bit
Select @committed = NULL
if @ProjectStage = 'Committed to Forecast'
Begin
Select @committed = 1
Select @Projectstage = 'Committed to Finance'
End

if @ProjectStage = 'All( Except Committed to Forecast)'
Begin
Select @committed = 0
Select @ProjectStage = NULL
End

if @ProjectStage = 'All'
Select @ProjectStage = NULL

SELECT     tblProjects.ProjectID, tblProjects.Business, tblProjects.BusinessForm, tblProjects.CostBucket, tblProjects.TDCSubElement, tblProjects.ProjectName, 
                      tblPersonnel.ProjectLeader, tblProjects.RecoverableLosses, tblProjects.SavingsStartMonthYearLiteral, 
                      tblProjects.Probability, tblTDC.TotalAdjustedAmt, tblTDC.TotalAdjustedAmt / tblBusinessVolumeTotal.TotalVolume AS DollarPerStat,  tblProjects.Status
FROM         tblTDC, tblPersonnel RIGHT OUTER JOIN
                      tblProjects LEFT OUTER JOIN
                      tblBusinessVolumeTotal 
		ON tblProjects.Business = tblBusinessVolumeTotal.Business 
		ON tblPersonnel.PersonnelID = tblProjects.ProjectLeaderID
WHERE tblProjects.ProjectID = tblTDC.ProjectID		
And tblTDC.FiscalYear = @Year
AND tblProjects.ProjectStage  =COALESCE(@ProjectStage,  tblProjects.ProjectStage)
AND tblProjects.CommittedForecast = COALESCE(@committed,  tblProjects.CommittedForecast)
And tblProjects.Business=@Business
UNION
SELECT     tblProjects.ProjectID, tblProjects.Business, tblProjects.BusinessForm, tblProjects.CostBucket, tblProjects.TDCSubElement, tblProjects.ProjectName, 
                      tblPersonnel.ProjectLeader, CAST(@multiplier* tblProjects.RecoverableLosses as Int) as RecoverableLosses, tblProjects.SavingsStartMonthYearLiteral, 
                      tblProjects.Probability,CAST(@multiplier* tblTDC.TotalAdjustedAmt as Int) as TotalAdjustedAmt, CAST(tblTDC.TotalAdjustedAmt as Float)/@total  AS DollarPerStat, tblProjects.Status
FROM         tblTDC, tblPersonnel RIGHT OUTER JOIN
                      tblProjects LEFT OUTER JOIN
                      tblBusinessVolumeTotal 
		ON tblProjects.Business = tblBusinessVolumeTotal.Business 
		ON tblPersonnel.PersonnelID = tblProjects.ProjectLeaderID
WHERE tblProjects.ProjectID = tblTDC.ProjectID		
And tblTDC.FiscalYear = @Year 
AND tblProjects.ProjectStage = COALESCE(@ProjectStage,  tblProjects.ProjectStage)
AND tblProjects.CommittedForecast = COALESCE(@committed,  tblProjects.CommittedForecast)
And tblProjects.Business= 'All'
ORDER BY  tblProjects.Business,  tblProjects.BusinessForm,  tblProjects.CostBucket,  tblProjects.TDCSubElement

GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


GO



CREATE  PROCEDURE ProjectsSelectCVC @Year char(4) ='2004', @Category nvarchar(50) =NULL AS

SELECT tblProjects.ProjectID, tblProjects.Business, tblProjects.BusinessForm, tblCVC.CVCElement, tblProjects.ProjectName, 
                tblPersonnel.ProjectLeader, tblCVC.NosAddition, tblCVC.CustomerAmt, tblCVC.PGAmt, tblCVC.CVCProb, tblCVC.ProbAdjAmt, tblProjects.Status
FROM   tblPersonnel RIGHT OUTER JOIN
       		tblProjects ON tblPersonnel.PersonnelID = tblProjects.ProjectLeaderID
		RIGHT OUTER JOIN tblCVC on tblProjects.ProjectID = tblCVC.ProjectID
WHERE ((tblProjects.SavingsStartYear = @Year and tblProjects.SavingsStartMonth>6) 
	or (tblProjects.SavingsStartYear = @Year+1 and tblProjects.SavingsStartMonth<=6)) 
AND tblProjects.Category = COALESCE(@Category,  tblProjects.Category)
AND (tblCVC.CVCElement<> NULL or tblCVC.CustomerName<> NULL or tblCVC.SupplierName<> NULL)

GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


GO




CREATE   PROCEDURE ProjectsSelectCash @Year char(4) ='2004', @Category nvarchar(50) =NULL AS

SELECT tblProjects.ProjectID, tblProjects.Business, tblProjects.BusinessForm, tblCash.CashElement, tblCash.CashSubElement, 
tblCash.CashAccMethod, tblProjects.ProjectName, tblPersonnel.ProjectLeader, tblCash.CashSavings, tblCash.CashProbability, tblCash.CashProbAdjAmt, tblProjects.Status
FROM   tblPersonnel RIGHT OUTER JOIN
       		tblProjects ON tblPersonnel.PersonnelID = tblProjects.ProjectLeaderID
		RIGHT OUTER JOIN tblCash on tblProjects.ProjectID = tblCash.ProjectID
WHERE ((tblProjects.SavingsStartYear = @Year and tblProjects.SavingsStartMonth>6) 
	or (tblProjects.SavingsStartYear = @Year+1 and tblProjects.SavingsStartMonth<=6)) 
AND tblProjects.Category = COALESCE(@Category,  tblProjects.Category)
AND tblCash.CashElement<> NULL

GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


GO


CREATE     PROCEDURE ProjectsSelectPillars  @Year char(4) ='2004', @ProjectStage nvarchar(50)=NULL, @Pillars char(20), @sortColumn char(20) = NULL AS

Declare @committed Bit
Select @committed = NULL

if @ProjectStage = 'Committed to Forecast'
Begin
Select @committed = 1
Select @Projectstage = 'Committed to Finance'
End

if @ProjectStage = 'All'
Select @ProjectStage = NULL

if @ProjectStage = 'All( Except Committed to Forecast)'
Begin
Select @committed = 0
Select @ProjectStage = NULL
End


SELECT     tblProjects.ProjectID, tblProjects.Business, tblProjects.BusinessForm, tblProjects.CostBucket, tblProjects.TDCSubElement, tblProjects.ProjectName, 
                      tblPersonnel.ProjectLeader, tblProjects.RecoverableLosses, tblProjects.SavingsStartMonthYearLiteral, 
                      tblProjects.Probability, tblTDC.TotalAdjustedAmt, tblTDC.TotalAdjustedAmt / tblBusinessVolumeTotal.TotalVolume AS DollarPerStat, 
                      tblProjects.Status
FROM         tblTDC, tblPersonnel RIGHT OUTER JOIN
                      tblProjects LEFT OUTER JOIN
                      tblBusinessVolumeTotal 
		ON tblProjects.Business = tblBusinessVolumeTotal.Business 
		ON tblPersonnel.PersonnelID = tblProjects.ProjectLeaderID
WHERE tblProjects.ProjectID = tblTDC.ProjectID		
And tblTDC.FiscalYear = @Year
AND tblProjects.ProjectStage  =COALESCE(@ProjectStage,  tblProjects.ProjectStage)
AND tblProjects.CommittedForecast = COALESCE(@committed,  tblProjects.CommittedForecast)
And tblProjects.OtherBusiness= @Pillars
ORDER BY  
CASE 
WHEN @sortColumn = 'Business' THEN tblProjects.Business
WHEN @sortColumn = 'BusinessForm' THEN  tblProjects.BusinessForm
WHEN @sortColumn = 'CostBucket' THEN  tblProjects.CostBucket
WHEN @sortColumn = 'TDCSubElement' THEN  tblProjects.TDCSubElement
WHEN @sortColumn = 'ProjectName' THEN   tblProjects.ProjectName
WHEN @sortColumn = 'ProjectLeader' THEN  tblPersonnel.ProjectLeader
WHEN @sortColumn = 'SavingsStartMonthYearLiteral' THEN   tblProjects.SavingsStartMonthYearLiteral
WHEN @sortColumn = 'Status' THEN  tblProjects.Status
ELSE tblPersonnel.ProjectLeader
END

GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO


GO


CREATE      PROCEDURE ProjectsSelectPlant  @Year char(4) ='2004', @Plant char(20)='All', @ProjectStage nvarchar(50) =NULL, @sortColumn char(20) = NULL  AS

if @ProjectStage = 'All'
Select @ProjectStage = NULL

Declare @committed Bit
Select @committed = NULL
if @ProjectStage = 'Committed to Forecast'
Begin
Select @committed = 1
Select @Projectstage = 'Committed to Finance'
End

if @ProjectStage = 'All( Except Committed to Forecast)'
Begin
Select @committed = 0
Select @ProjectStage = NULL
End

SELECT     tblProjects.ProjectID, tblProjects.Business, tblProjects.BusinessForm, tblProjects.CostBucket, tblProjects.TDCSubElement, tblProjects.ProjectName, 
                      tblPersonnel.ProjectLeader, tblProjects.RecoverableLosses, tblProjects.SavingsStartMonthYearLiteral, 
                      tblProjects.Probability, tblTDC.TotalAdjustedAmt, tblTDC.TotalAdjustedAmt / tblBusinessVolumeTotal.TotalVolume AS DollarPerStat, 
                      tblProjects.Status
FROM         tblTDC, tblPersonnel RIGHT OUTER JOIN
                      tblProjects LEFT OUTER JOIN
                      tblBusinessVolumeTotal 
		ON tblProjects.Business = tblBusinessVolumeTotal.Business 
		ON tblPersonnel.PersonnelID = tblProjects.ProjectLeaderID
WHERE tblProjects.ProjectID = tblTDC.ProjectID		
And tblProjects.Plant= @Plant
And tblTDC.FiscalYear = @Year
AND tblProjects.ProjectStage  =COALESCE(@ProjectStage,  tblProjects.ProjectStage)
AND tblProjects.CommittedForecast = COALESCE(@committed,  tblProjects.CommittedForecast)
ORDER BY  
CASE 
WHEN @sortColumn = 'Business' THEN tblProjects.Business
WHEN @sortColumn = 'BusinessForm' THEN  tblProjects.BusinessForm
WHEN @sortColumn = 'CostBucket' THEN  tblProjects.CostBucket
WHEN @sortColumn = 'TDCSubElement' THEN  tblProjects.TDCSubElement
WHEN @sortColumn = 'ProjectName' THEN   tblProjects.ProjectName
WHEN @sortColumn = 'ProjectLeader' THEN  tblPersonnel.ProjectLeader
WHEN @sortColumn = 'SavingsStartMonthYearLiteral' THEN   tblProjects.SavingsStartMonthYearLiteral
WHEN @sortColumn = 'Status' THEN  tblProjects.Status
ELSE tblPersonnel.ProjectLeader
END

GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


GO




CREATE   PROCEDURE ProjectsSelectSC @Year char(4) ='2004', @Category nvarchar(50) =NULL AS

SELECT tblProjects.ProjectID, tblProjects.Business, tblProjects.BusinessForm, tblSC.SupplyChain, tblSC.SCElement, tblSC.SCSubElement,tblProjects.ProjectName, 
                tblPersonnel.ProjectLeader, tblSC.SCTimeCurrent, tblSC.SCTimeExpected, tblSC.SCTimeEffect, tblSC.SCProbability, tblProjects.Status
FROM   tblPersonnel RIGHT OUTER JOIN
       		tblProjects ON tblPersonnel.PersonnelID = tblProjects.ProjectLeaderID
		RIGHT OUTER JOIN tblSC on tblProjects.ProjectID = tblSC.ProjectID
WHERE ((tblProjects.SavingsStartYear = @Year and tblProjects.SavingsStartMonth>6) 
	or (tblProjects.SavingsStartYear = @Year+1 and tblProjects.SavingsStartMonth<=6)) 
AND tblProjects.Category = COALESCE(@Category,  tblProjects.Category)
AND (tblSC.SupplyChain<> NULL or tblSC.SCElement<> NULL)


GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO


GO


CREATE     PROCEDURE ProjectsSelectTDCElement  @Year char(4) ='2004', @TDCElement char(20)='All', @ProjectStage nvarchar(50) =NULL, @sortColumn char(20) = NULL  AS
if @ProjectStage = 'All'
Select @ProjectStage = NULL

Declare @committed Bit
Select @committed = NULL

if @ProjectStage = 'Committed to Forecast'
Begin
Select @committed = 1
Select @Projectstage = 'Committed to Finance'
End

if @ProjectStage = 'All( Except Committed to Forecast)'
Begin
Select @committed = 0
Select @ProjectStage = NULL
End

SELECT     tblProjects.ProjectID, tblProjects.Business, tblProjects.BusinessForm, tblProjects.CostBucket, tblProjects.TDCSubElement, tblProjects.ProjectName, 
                      tblPersonnel.ProjectLeader, tblProjects.RecoverableLosses, tblProjects.SavingsStartMonthYearLiteral, 
                      tblProjects.Probability, tblTDC.TotalAdjustedAmt, tblTDC.TotalAdjustedAmt / tblBusinessVolumeTotal.TotalVolume AS DollarPerStat, 
                      tblProjects.Status
FROM         tblTDC, tblPersonnel RIGHT OUTER JOIN
                      tblProjects LEFT OUTER JOIN
                      tblBusinessVolumeTotal 
		ON tblProjects.Business = tblBusinessVolumeTotal.Business 
		ON tblPersonnel.PersonnelID = tblProjects.ProjectLeaderID
WHERE tblProjects.ProjectID = tblTDC.ProjectID		
And tblTDC.FiscalYear = @Year
AND tblProjects.ProjectStage  =COALESCE(@ProjectStage,  tblProjects.ProjectStage)
AND tblProjects.CommittedForecast = COALESCE(@committed,  tblProjects.CommittedForecast)
And tblProjects.CostBucket= @TDCElement
ORDER BY  
CASE 
WHEN @sortColumn = 'Business' THEN tblProjects.Business
WHEN @sortColumn = 'BusinessForm' THEN  tblProjects.BusinessForm
WHEN @sortColumn = 'CostBucket' THEN  tblProjects.CostBucket
WHEN @sortColumn = 'TDCSubElement' THEN  tblProjects.TDCSubElement
WHEN @sortColumn = 'ProjectName' THEN   tblProjects.ProjectName
WHEN @sortColumn = 'ProjectLeader' THEN  tblPersonnel.ProjectLeader
WHEN @sortColumn = 'SavingsStartMonthYearLiteral' THEN   tblProjects.SavingsStartMonthYearLiteral
WHEN @sortColumn = 'Status' THEN  tblProjects.Status
ELSE tblProjects.ProjectName
END

GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO


GO


CREATE      PROCEDURE ProjectsSelectTDCSubElement  @Year char(4) ='2004', @TDCSubElement char(20)='All',@ProjectStage nvarchar(50) =NULL, @sortColumn char(20) = NULL  AS
if @ProjectStage = 'All'
Select @ProjectStage = NULL

Declare @committed Bit
Select @committed = NULL
if @ProjectStage = 'Committed to Forecast'
Begin
Select @committed = 1
Select @Projectstage = 'Committed to Finance'
End

if @ProjectStage = 'All( Except Committed to Forecast)'
Begin
Select @committed = 0
Select @ProjectStage = NULL
End

IF @TDCSubElement <> 'Purchasing' 
SELECT     tblProjects.ProjectID, tblProjects.Business, tblProjects.BusinessForm, tblProjects.CostBucket, tblProjects.TDCSubElement, tblProjects.ProjectName, 
                      tblPersonnel.ProjectLeader, tblProjects.RecoverableLosses, tblProjects.SavingsStartMonthYearLiteral, 
                      tblProjects.Probability, tblTDC.TotalAdjustedAmt, tblTDC.TotalAdjustedAmt / tblBusinessVolumeTotal.TotalVolume AS DollarPerStat, 
                      tblProjects.Status
FROM         tblTDC, tblPersonnel RIGHT OUTER JOIN
                      tblProjects LEFT OUTER JOIN
                      tblBusinessVolumeTotal 
		ON tblProjects.Business = tblBusinessVolumeTotal.Business 
		ON tblPersonnel.PersonnelID = tblProjects.ProjectLeaderID
WHERE tblProjects.ProjectID = tblTDC.ProjectID		
And tblTDC.FiscalYear = @Year
AND tblProjects.ProjectStage =COALESCE(@ProjectStage,  tblProjects.ProjectStage)
AND tblProjects.CommittedForecast = COALESCE(@committed,  tblProjects.CommittedForecast)
And tblProjects.TDCSubElement= @TDCSubElement
ORDER BY  
CASE 
WHEN @sortColumn = 'Business' THEN tblProjects.Business
WHEN @sortColumn = 'BusinessForm' THEN  tblProjects.BusinessForm
WHEN @sortColumn = 'CostBucket' THEN  tblProjects.CostBucket
WHEN @sortColumn = 'TDCSubElement' THEN  tblProjects.TDCSubElement
WHEN @sortColumn = 'ProjectName' THEN   tblProjects.ProjectName
WHEN @sortColumn = 'ProjectLeader' THEN  tblPersonnel.ProjectLeader
WHEN @sortColumn = 'SavingsStartMonthYearLiteral' THEN   tblProjects.SavingsStartMonthYearLiteral
WHEN @sortColumn = 'Status' THEN  tblProjects.Status
ELSE tblProjects.ProjectName
END
ElSE
SELECT     tblProjects.ProjectID, tblProjects.Business, tblProjects.BusinessForm, tblProjects.CostBucket, tblProjects.TDCSubElement, tblProjects.ProjectName, 
                      tblPersonnel.ProjectLeader, tblProjects.RecoverableLosses, tblProjects.SavingsStartMonthYearLiteral, 
                      tblProjects.Probability, tblTDC.TotalAdjustedAmt, tblTDC.TotalAdjustedAmt / tblBusinessVolumeTotal.TotalVolume AS DollarPerStat, 
                      tblProjects.Status
FROM         tblTDC, tblPersonnel RIGHT OUTER JOIN
                      tblProjects LEFT OUTER JOIN
                      tblBusinessVolumeTotal 
		ON tblProjects.Business = tblBusinessVolumeTotal.Business 
		ON tblPersonnel.PersonnelID = tblProjects.ProjectLeaderID
WHERE tblProjects.ProjectID = tblTDC.ProjectID		
And tblTDC.FiscalYear = @Year
AND tblProjects.ProjectStage = COALESCE(@ProjectStage,  tblProjects.ProjectStage)
AND tblProjects.CommittedForecast = COALESCE(@committed,  tblProjects.CommittedForecast)
And (tblProjects.TDCSubElement= 'RM Pricing' or tblProjects.TDCSubElement= 'PM Pricing')
ORDER BY  
CASE 
WHEN @sortColumn = 'Business' THEN tblProjects.Business
WHEN @sortColumn = 'BusinessForm' THEN  tblProjects.BusinessForm
WHEN @sortColumn = 'CostBucket' THEN  tblProjects.CostBucket
WHEN @sortColumn = 'TDCSubElement' THEN  tblProjects.TDCSubElement
WHEN @sortColumn = 'ProjectName' THEN   tblProjects.ProjectName
WHEN @sortColumn = 'ProjectLeader' THEN  tblPersonnel.ProjectLeader
WHEN @sortColumn = 'SavingsStartMonthYearLiteral' THEN   tblProjects.SavingsStartMonthYearLiteral
WHEN @sortColumn = 'Status' THEN  tblProjects.Status
ELSE tblProjects.ProjectName
END

GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO


GO


CREATE PROCEDURE ProjectsSelectYear @Year char(4) ='2004', @ProjectStage nvarchar(50) =NULL AS
if @ProjectStage = 'All'
Select @ProjectStage = NULL

Declare @committed Bit
Select @committed = NULL
if @ProjectStage = 'Committed to Forecast'
Begin
Select @committed = 1
Select @Projectstage = 'Committed to Finance'
End

SELECT tblProjects.ProjectID, tblProjects.Business, tblProjects.BusinessForm, tblProjects.CostBucket, tblProjects.TDCSubElement, tblProjects.ProjectName, 
                tblPersonnel.ProjectLeader, tblProjects.RecoverableLosses, tblProjects.SavingsStartMonthYearLiteral, 
                tblProjects.Probability, tblTDC.TotalAdjustedAmt,  tblProjects.Status
FROM   tblPersonnel RIGHT OUTER JOIN
       		tblProjects ON tblPersonnel.PersonnelID = tblProjects.ProjectLeaderID
		RIGHT OUTER JOIN tblTDC on tblProjects.ProjectID = tblTDC.ProjectID
WHERE tblTDC.FiscalYear = @Year
AND tblProjects.ProjectStage   =COALESCE(@ProjectStage,  tblProjects.ProjectStage)
AND tblProjects.CommittedForecast = COALESCE(@committed,  tblProjects.CommittedForecast)

GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


GO




CREATE  PROCEDURE ProjectsSelectYearCDSN @Year char(4) ='2004', @ProjectStage nvarchar(50) =NULL AS
if @ProjectStage = 'All'
Select @ProjectStage = NULL

Declare @committed Bit
Select @committed = NULL
if @ProjectStage = 'Committed to Forecast'
Begin
Select @committed = 1
Select @Projectstage = 'Committed to Finance'
End

SELECT 
tblProjects.ProjectID, 
tblProjects.ProjectName, 
tblPersonnel.ProjectLeader, 
tblProjects.SavingsStartMonthYearLiteral, 
tblTDC.TotalAdjustedAmt,  
tblCVC.NosAddition,
tblCVC.ProbAdjAmt,
tblCash.CashProbAdjAmt,
tblSC.SCTimeEffect,
tblProjects.Status
FROM   tblPersonnel RIGHT OUTER JOIN
       		tblProjects ON tblPersonnel.PersonnelID = tblProjects.ProjectLeaderID
		RIGHT OUTER JOIN tblTDC on tblProjects.ProjectID = tblTDC.ProjectID
		RIGHT OUTER JOIN tblCash on tblProjects.ProjectID = tblCash.ProjectID
		RIGHT OUTER JOIN tblSC on tblProjects.ProjectID = tblSC.ProjectID
		RIGHT OUTER JOIN tblCVC on tblProjects.ProjectID = tblCVC.ProjectID
WHERE tblTDC.FiscalYear = @Year
AND tblProjects.ProjectStage   =COALESCE(@ProjectStage,  tblProjects.ProjectStage)
AND tblProjects.CommittedForecast = COALESCE(@committed,  tblProjects.CommittedForecast)
AND ((tblCash.CashElement<> NULL)
OR (tblSC.SupplyChain<> NULL or tblSC.SCElement<> NULL)
OR (tblCVC.CVCElement<> NULL or tblCVC.CustomerName<> NULL or tblCVC.SupplierName<> NULL))

GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO


GO


CREATE    PROCEDURE ProjectsSelectYearWithStat @Year char(4) ='2004', @ProjectStage nvarchar(50) =NULL AS
if @ProjectStage = 'All'
Select @ProjectStage = NULL

Declare @committed Bit
Select @committed = NULL
if @ProjectStage = 'Committed to Forecast'
Begin
Select @committed = 1
Select @Projectstage = 'Committed to Finance'
End

SELECT     tblProjects.ProjectID, tblProjects.Business, tblProjects.BusinessForm, tblProjects.CostBucket, tblProjects.TDCSubElement, tblProjects.ProjectName, 
                      tblPersonnel.ProjectLeader, tblProjects.RecoverableLosses, tblProjects.SavingsStartMonthYearLiteral, 
                      tblProjects.Probability, tblTDC.TotalAdjustedAmt, tblTDC.TotalAdjustedAmt / tblBusinessVolumeTotal.TotalVolume AS DollarPerStat, 
                      tblProjects.Status
FROM         tblTDC, tblPersonnel RIGHT OUTER JOIN
                      tblProjects LEFT OUTER JOIN
                      tblBusinessVolumeTotal 
		ON tblProjects.Business = tblBusinessVolumeTotal.Business 
		ON tblPersonnel.PersonnelID = tblProjects.ProjectLeaderID
WHERE tblProjects.ProjectID = tblTDC.ProjectID		
And tblTDC.FiscalYear = @Year
AND tblProjects.ProjectStage =COALESCE(@ProjectStage,  tblProjects.ProjectStage)
AND tblProjects.CommittedForecast = COALESCE(@committed,  tblProjects.CommittedForecast)

GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO


GO


CREATE   PROCEDURE SearchProjectLeader @QueryString NVarChar(50) AS
SELECT     tblProjects.ProjectID, tblProjects.Business, tblProjects.BusinessForm, tblProjects.CostBucket, tblProjects.TDCSubElement, tblProjects.ProjectName, 
                      tblPersonnel.ProjectLeader, tblProjects.RecoverableLosses, tblProjects.SavingsStartMonthYearLiteral, 
                      tblProjects.Probability,  
                      tblProjects.Status
FROM         tblPersonnel RIGHT OUTER JOIN
                      tblProjects
		ON tblPersonnel.PersonnelID = tblProjects.ProjectLeaderID
WHERE (tblPersonnel.ProjectLeader LIKE '%' + @QueryString + '%')


GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO


GO


CREATE   PROCEDURE SearchProjectName @QueryString NVarChar(50) AS
SELECT     tblProjects.ProjectID, tblProjects.Business, tblProjects.BusinessForm, tblProjects.CostBucket, tblProjects.TDCSubElement, tblProjects.ProjectName, 
                      tblPersonnel.ProjectLeader, tblProjects.RecoverableLosses, tblProjects.SavingsStartMonthYearLiteral, 
                      tblProjects.Probability,  
                      tblProjects.Status
FROM         tblPersonnel RIGHT OUTER JOIN
                      tblProjects
		ON tblPersonnel.PersonnelID = tblProjects.ProjectLeaderID
Where (tblProjects.ProjectName LIKE '%' + @QueryString + '%')


GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO


GO


CREATE   PROCEDURE SearchStatus @QueryString NVarChar(50) AS
SELECT     tblProjects.ProjectID, tblProjects.Business, tblProjects.BusinessForm, tblProjects.CostBucket, tblProjects.TDCSubElement, tblProjects.ProjectName, 
                      tblPersonnel.ProjectLeader, tblProjects.RecoverableLosses, tblProjects.SavingsStartMonthYearLiteral, 
                      tblProjects.Probability,  
                      tblProjects.Status
FROM         tblPersonnel RIGHT OUTER JOIN
                      tblProjects
		ON tblPersonnel.PersonnelID = tblProjects.ProjectLeaderID
WHERE (tblProjects.Status LIKE '%' + @QueryString + '%')


GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


GO


CREATE  PROCEDURE SelectBusinessVolume AS
SELECT Business, BusinessForm, CashSavings as Volume FROM tblBusinessVolume


GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


GO


CREATE PROCEDURE SelectBusinessVolumeTotal AS
SELECT Business, TotalVolume FROM tblBusinessVolumeTotal


GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


GO


CREATE  PROCEDURE SelectReport @ReportID int  AS
SELECT ReportText From tblCustomReport where ReportID = @ReportID


GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


GO


CREATE  PROCEDURE SelectReportList AS
SELECT ReportID, ReportName 
From tblCustomReport
Where ReportName <> ""


GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


GO


CREATE       PROCEDURE SummaryBusiness @Probability int=50, @Year char(4) AS
Declare @HandDish Float(8)
Declare @ADW Float(8)
Declare @Aircare Float(8)
Declare @MrClean Float(8)
Declare @Swiffer Float(8)
Declare @total Float(8)
Select @HandDish = totalvolume from tblbusinessvolumetotal where Business='HandDish'
Select @ADW = totalvolume from tblbusinessvolumetotal where Business='ADW(Cascade)'
Select @Aircare = totalvolume from tblbusinessvolumetotal where Business='Aircare(Febreze)'
Select @MrClean = totalvolume from tblbusinessvolumetotal where Business='Mr. Clean'
Select @Swiffer = totalvolume from tblbusinessvolumetotal where Business='Swiffer'
Select @total = sum(totalvolume) from tblbusinessvolumetotal
Create table #temptable
(
TDCElement nvarchar(50), 
HandDish int, 
ADW int,
AirCare int, 
MrClean int, 
Swiffer int, 
Total int, 
)
Insert into #temptable
Select CostBucket, sum(tblTDC.TotalAdjustedAmt * T1), sum(tblTDC.TotalAdjustedAmt * T2),
             		      sum(tblTDC.TotalAdjustedAmt * T3), sum(tblTDC.TotalAdjustedAmt * T4), 
		      sum(tblTDC.TotalAdjustedAmt * T5),sum(tblTDC.TotalAdjustedAmt * T1) + sum(tblTDC.TotalAdjustedAmt * T2) + sum(tblTDC.TotalAdjustedAmt * T3) + sum(tblTDC.TotalAdjustedAmt * T4) +  sum(tblTDC.TotalAdjustedAmt * T5) 
FROM tblProjects , tblBusinessSummary, tblTDC
WHERE   tblBusinessSummary.tdcelement = tblProjects.Business 
and tblTDC.ProjectID = tblProjects.ProjectID
and CostBucket<>NULL 
and Probability>=@Probability
and Category='HomeCare' 
and CommittedForecast=1
and tblTDC.FiscalYear = @Year
GROUP BY CostBucket
Insert into #temptable
Select CostBucket, tblTDC.TotalAdjustedAmt *  @HandDish/@total,tblTDC.TotalAdjustedAmt  * @ADW/@total ,
             		      tblTDC.TotalAdjustedAmt * @Aircare/@total , tblTDC.TotalAdjustedAmt * @MrClean/@total, 
		      tblTDC.TotalAdjustedAmt * @Swiffer/@total, tblTDC.TotalAdjustedAmt
FROM tblProjects, tblTDC
WHERE tblProjects.ProjectID =tblTDC.ProjectID 
and tblTDC.FiscalYear = @Year
and tblProjects.Business = 'All' 
and Probability>=@Probability
and Category='HomeCare' 
and CommittedForecast=1
Insert into #temptable
Select 'TotalSavings', Sum(HandDish) as 'Hand Dish', Sum(ADW) as 'ADW(Cascade)', Sum(Aircare) as 'Aircare(Febreze)', 
			Sum(MrClean) as 'Mr. Clean', Sum(Swiffer) as 'Swiffer', Sum(Total) as Total 
from #temptable
Create table #temptable1
(
TDCElement nvarchar(50), 
HandDish int, 
ADW int,
AirCare int, 
MrClean int, 
Swiffer int, 
Total int, 
)
Insert into #temptable1
Select TDCElement, Sum(HandDish) as 'Hand Dish', Sum(ADW) as 'ADW(Cascade)', Sum(Aircare) as 'Aircare(Febreze)', 
			Sum(MrClean) as 'Mr. Clean', Sum(Swiffer) as 'Swiffer', Sum(Total) as Total 
from #temptable
Where TDCElement ='RM'
Group BY TDCElement
Insert into #temptable1
Select TDCElement, Sum(HandDish) as 'Hand Dish', Sum(ADW) as 'ADW(Cascade)', Sum(Aircare) as 'Aircare(Febreze)', 
			Sum(MrClean) as 'Mr. Clean', Sum(Swiffer) as 'Swiffer', Sum(Total) as Total 
from #temptable
Where TDCElement ='PM'
Group BY TDCElement
Insert into #temptable1
Select TDCElement, Sum(HandDish) as 'Hand Dish', Sum(ADW) as 'ADW(Cascade)', Sum(Aircare) as 'Aircare(Febreze)', 
			Sum(MrClean) as 'Mr. Clean', Sum(Swiffer) as 'Swiffer', Sum(Total) as Total 
from #temptable
Where TDCElement ='MOE'
Group BY TDCElement
Insert into #temptable1
Select TDCElement, Sum(HandDish) as 'Hand Dish', Sum(ADW) as 'ADW(Cascade)', Sum(Aircare) as 'Aircare(Febreze)', 
			Sum(MrClean) as 'Mr. Clean', Sum(Swiffer) as 'Swiffer', Sum(Total) as Total 
from #temptable
Where TDCElement ='GMC'
Group BY TDCElement
Insert into #temptable1
Select TDCElement, Sum(HandDish) as 'Hand Dish', Sum(ADW) as 'ADW(Cascade)', Sum(Aircare) as 'Aircare(Febreze)', 
			Sum(MrClean) as 'Mr. Clean', Sum(Swiffer) as 'Swiffer', Sum(Total) as Total 
from #temptable
Where TDCElement ='FPLC'
Group BY TDCElement
Insert into #temptable1
Select TDCElement, Sum(HandDish) as 'Hand Dish', Sum(ADW) as 'ADW(Cascade)', Sum(Aircare) as 'Aircare(Febreze)', 
			Sum(MrClean) as 'Mr. Clean', Sum(Swiffer) as 'Swiffer', Sum(Total) as Total 
from #temptable
Where TDCElement ='PSNME'
Group BY TDCElement
Insert into #temptable1
Select TDCElement, Sum(HandDish) as 'Hand Dish', Sum(ADW) as 'ADW(Cascade)', Sum(Aircare) as 'Aircare(Febreze)', 
			Sum(MrClean) as 'Mr. Clean', Sum(Swiffer) as 'Swiffer', Sum(Total) as Total 
from #temptable
Where TDCElement ='Other NON TDC'
Group BY TDCElement
Insert into #temptable1
Select TDCElement, Sum(HandDish) as 'Hand Dish', Sum(ADW) as 'ADW(Cascade)', Sum(Aircare) as 'Aircare(Febreze)', 
			Sum(MrClean) as 'Mr. Clean', Sum(Swiffer) as 'Swiffer', Sum(Total) as Total 
from #temptable
Where TDCElement ='TotalSavings'
Group BY TDCElement
Select * from #temptable1


GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


GO


CREATE     PROCEDURE SummaryMonthlyBusiness @Probability int=50, @Year char(4)  AS
Declare @HandDish float(8)
Declare @ADW float(8)
Declare @Aircare float(8)
Declare @MrClean float(8)
Declare @Swiffer float(8)
Declare @total float(8)
Select @HandDish = totalvolume from tblbusinessvolumetotal where Business='HandDish'
Select @ADW = totalvolume from tblbusinessvolumetotal where Business='ADW(Cascade)'
Select @Aircare = totalvolume from tblbusinessvolumetotal where Business='Aircare(Febreze)'
Select @MrClean = totalvolume from tblbusinessvolumetotal where Business='Mr. Clean'
Select @Swiffer = totalvolume from tblbusinessvolumetotal where Business='Swiffer'
Select @total = sum(totalvolume) from tblbusinessvolumetotal
Create table #temptable1
(
Descr VARCHAR(50),
MonthCheck int,
YearCheck int,
T1 float(8),
T2 float(8),
T3 float(8),
T4 float(8),
T5 float(8),
T6 float(8),
T7 float(8),
T8 float(8),
T9 float(8),
T10 float(8),
T11 float(8),
T12 float(8),
T13 float(8)
)
Insert into #temptable1  
Select Business ,ImpliedSavStartMonth,ImpliedSavStartYear, M1*tblTDC.TotalAdjustedAmt/NoMonths, M2*tblTDC.TotalAdjustedAmt/NoMonths, M3*tblTDC.TotalAdjustedAmt/NoMonths, M4*tblTDC.TotalAdjustedAmt/NoMonths, M5*tblTDC.TotalAdjustedAmt/NoMonths, M6*tblTDC.TotalAdjustedAmt/NoMonths, M7*tblTDC.TotalAdjustedAmt/NoMonths,
M8*tblTDC.TotalAdjustedAmt/NoMonths, M9*tblTDC.TotalAdjustedAmt/NoMonths, M10*tblTDC.TotalAdjustedAmt/NoMonths, M11*tblTDC.TotalAdjustedAmt/NoMonths, M12*tblTDC.TotalAdjustedAmt/NoMonths, 0
FROM tblProjects, tblFinancialMonth, tblTDC
WHERE tblProjects.ProjectID =tblTDC.ProjectID 
and tblProjects.ImpliedSavStartMonth = tblFinancialMonth.FinancialMonth
and Business<>NULL
and Business <> 'All'
and tblTDC.TotalAdjustedAmt <> NULL
and tblTDC.TotalAdjustedAmt <> 0 
and Probability>=@Probability
and Category='HomeCare' 
and CommittedForecast=1
and tblTDC.FiscalYear = @Year
Insert into #temptable1  
Select 'HandDish' ,ImpliedSavStartMonth,ImpliedSavStartYear, @HandDish/@total *M1*tblTDC.TotalAdjustedAmt/NoMonths, @HandDish/@total *M2*tblTDC.TotalAdjustedAmt/NoMonths, @HandDish/@total *M3*tblTDC.TotalAdjustedAmt/NoMonths, @HandDish/@total *M4*tblTDC.TotalAdjustedAmt/NoMonths, @HandDish/@total *M5*tblTDC.TotalAdjustedAmt/NoMonths, @HandDish/@total *M6*tblTDC.TotalAdjustedAmt/NoMonths, @HandDish/@total *M7*tblTDC.TotalAdjustedAmt/NoMonths,
@HandDish/@total *M8*tblTDC.TotalAdjustedAmt/NoMonths, @HandDish/@total *M9*tblTDC.TotalAdjustedAmt/NoMonths, @HandDish/@total *M10*tblTDC.TotalAdjustedAmt/NoMonths, @HandDish/@total *M11*tblTDC.TotalAdjustedAmt/NoMonths, @HandDish/@total *M12*tblTDC.TotalAdjustedAmt/NoMonths, 0
FROM tblProjects, tblFinancialMonth, tblTDC
WHERE tblProjects.ProjectID =tblTDC.ProjectID 
and tblProjects.ImpliedSavStartMonth = tblFinancialMonth.FinancialMonth
and Business = 'All'
and tblTDC.TotalAdjustedAmt <> NULL
and tblTDC.TotalAdjustedAmt <> 0 
and Probability>=@Probability
and Category='HomeCare' 
and CommittedForecast=1
and tblTDC.FiscalYear = @Year
Insert into #temptable1  
Select 'ADW(Cascade)' ,ImpliedSavStartMonth,ImpliedSavStartYear, @ADW/@total *M1*tblTDC.TotalAdjustedAmt/NoMonths, @ADW/@total *M2*tblTDC.TotalAdjustedAmt/NoMonths, @ADW/@total *M3*tblTDC.TotalAdjustedAmt/NoMonths, @ADW/@total *M4*tblTDC.TotalAdjustedAmt/NoMonths, @ADW/@total *M5*tblTDC.TotalAdjustedAmt/NoMonths, @ADW/@total *M6*tblTDC.TotalAdjustedAmt/NoMonths, @ADW/@total *M7*tblTDC.TotalAdjustedAmt/NoMonths,
@ADW/@total *M8*tblTDC.TotalAdjustedAmt/NoMonths, @ADW/@total *M9*tblTDC.TotalAdjustedAmt/NoMonths, @ADW/@total *M10*tblTDC.TotalAdjustedAmt/NoMonths, @ADW/@total *M11*tblTDC.TotalAdjustedAmt/NoMonths, @ADW/@total *M12*tblTDC.TotalAdjustedAmt/NoMonths, 0
FROM tblProjects, tblFinancialMonth, tblTDC
WHERE tblProjects.ProjectID =tblTDC.ProjectID 
and tblProjects.ImpliedSavStartMonth = tblFinancialMonth.FinancialMonth
and Business = 'All'
and tblTDC.TotalAdjustedAmt <> NULL

and tblTDC.TotalAdjustedAmt <> 0 
and Probability>=@Probability
and Category='HomeCare' 
and CommittedForecast=1
and tblTDC.FiscalYear = @Year
Insert into #temptable1  
Select 'Aircare(Febreze)' ,ImpliedSavStartMonth,ImpliedSavStartYear, @Aircare/@total *M1*tblTDC.TotalAdjustedAmt/NoMonths, @Aircare/@total *M2*tblTDC.TotalAdjustedAmt/NoMonths, @Aircare/@total *M3*tblTDC.TotalAdjustedAmt/NoMonths, @Aircare/@total *M4*tblTDC.TotalAdjustedAmt/NoMonths, @Aircare/@total *M5*tblTDC.TotalAdjustedAmt/NoMonths, @Aircare/@total *M6*tblTDC.TotalAdjustedAmt/NoMonths, @Aircare/@total *M7*tblTDC.TotalAdjustedAmt/NoMonths,
@Aircare/@total *M8*tblTDC.TotalAdjustedAmt/NoMonths, @Aircare/@total *M9*tblTDC.TotalAdjustedAmt/NoMonths, @Aircare/@total *M10*tblTDC.TotalAdjustedAmt/NoMonths, @Aircare/@total *M11*tblTDC.TotalAdjustedAmt/NoMonths, @Aircare/@total *M12*tblTDC.TotalAdjustedAmt/NoMonths, 0
FROM tblProjects, tblFinancialMonth, tblTDC
WHERE tblProjects.ProjectID =tblTDC.ProjectID 
and tblProjects.ImpliedSavStartMonth = tblFinancialMonth.FinancialMonth
and Business = 'All'
and tblTDC.TotalAdjustedAmt <> NULL
and tblTDC.TotalAdjustedAmt <> 0 
and Probability>=@Probability
and Category='HomeCare' 
and CommittedForecast=1
and tblTDC.FiscalYear = @Year
Insert into #temptable1  
Select 'Mr. Clean' ,ImpliedSavStartMonth,ImpliedSavStartYear, @MrClean/@total *M1*tblTDC.TotalAdjustedAmt/NoMonths, @MrClean/@total *M2*tblTDC.TotalAdjustedAmt/NoMonths, @MrClean/@total *M3*tblTDC.TotalAdjustedAmt/NoMonths, @MrClean/@total *M4*tblTDC.TotalAdjustedAmt/NoMonths, @MrClean/@total *M5*tblTDC.TotalAdjustedAmt/NoMonths, @MrClean/@total *M6*tblTDC.TotalAdjustedAmt/NoMonths, @MrClean/@total *M7*tblTDC.TotalAdjustedAmt/NoMonths,
@MrClean/@total *M8*tblTDC.TotalAdjustedAmt/NoMonths, @MrClean/@total *M9*tblTDC.TotalAdjustedAmt/NoMonths, @MrClean/@total *M10*tblTDC.TotalAdjustedAmt/NoMonths, @MrClean/@total *M11*tblTDC.TotalAdjustedAmt/NoMonths, @MrClean/@total *M12*tblTDC.TotalAdjustedAmt/NoMonths, 0
FROM tblProjects, tblFinancialMonth, tblTDC
WHERE tblProjects.ProjectID =tblTDC.ProjectID 
and tblProjects.ImpliedSavStartMonth = tblFinancialMonth.FinancialMonth
and Business = 'All'
and tblTDC.TotalAdjustedAmt <> NULL
and tblTDC.TotalAdjustedAmt <> 0 
and Probability>=@Probability
and Category='HomeCare' 
and CommittedForecast=1
and tblTDC.FiscalYear = @Year
Insert into #temptable1  
Select 'Swiffer' ,ImpliedSavStartMonth,ImpliedSavStartYear, @Swiffer/@total *M1*tblTDC.TotalAdjustedAmt/NoMonths, @Swiffer/@total *M2*tblTDC.TotalAdjustedAmt/NoMonths, @Swiffer/@total *M3*tblTDC.TotalAdjustedAmt/NoMonths, @Swiffer/@total *M4*tblTDC.TotalAdjustedAmt/NoMonths, @Swiffer/@total *M5*tblTDC.TotalAdjustedAmt/NoMonths, @Swiffer/@total *M6*tblTDC.TotalAdjustedAmt/NoMonths, @Swiffer/@total *M7*tblTDC.TotalAdjustedAmt/NoMonths,
@Swiffer/@total *M8*tblTDC.TotalAdjustedAmt/NoMonths, @Swiffer/@total *M9*tblTDC.TotalAdjustedAmt/NoMonths, @Swiffer/@total *M10*tblTDC.TotalAdjustedAmt/NoMonths, @Swiffer/@total *M11*tblTDC.TotalAdjustedAmt/NoMonths, @Swiffer/@total *M12*tblTDC.TotalAdjustedAmt/NoMonths, 0
FROM tblProjects, tblFinancialMonth, tblTDC
WHERE tblProjects.ProjectID =tblTDC.ProjectID 
and tblProjects.ImpliedSavStartMonth = tblFinancialMonth.FinancialMonth
and Business = 'All'
and tblTDC.TotalAdjustedAmt <> NULL
and tblTDC.TotalAdjustedAmt <> 0 
and Probability>=@Probability
and Category='HomeCare' 
and CommittedForecast=1
and tblTDC.FiscalYear = @Year
Create table #temptable2
(
Business VARCHAR(50),
Jul int,
Aug Int,
Sep Int,
Oct Int,
Nov Int,
Dec Int,
Jan Int,
Feb Int,
Mar Int,
Apr Int,
May Int,
June Int,
Total Int
)
Insert into #temptable2
Select Descr, Sum(T1),Sum(T2) ,Sum(T3),Sum(T4),Sum(T5) ,Sum(T6), Sum(T7), Sum(T8),Sum(T9) ,Sum(T10),Sum(T11) ,Sum(T12),
		  Sum(T1+T2+T3+T4+T5+T6+T7+T8+T9+T10+T11+T12)
from #temptable1
Group By Descr
Insert into #temptable2
Select 'TotalSavings' , Sum(T1),Sum(T2) ,Sum(T3),Sum(T4),Sum(T5) ,Sum(T6), Sum(T7), Sum(T8),Sum(T9) ,Sum(T10),Sum(T11) ,Sum(T12),
Sum(T1+T2+T3+T4+T5+T6+T7+T8+T9+T10+T11+T12)
from #temptable1
Select * from #temptable2


GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


GO


CREATE         PROCEDURE SummaryMonthlyPlant @Probability int=50,  @Year char(4)  AS
Create table #temptable1
(
Descr VARCHAR(50),
MonthCheck int,
YearCheck int,
T1 float(8),
T2 float(8),
T3 float(8),
T4 float(8),
T5 float(8),
T6 float(8),
T7 float(8),
T8 float(8),
T9 float(8),
T10 float(8),
T11 float(8),
T12 float(8),
T13 float(8)
)
Insert into #temptable1  
Select Plant ,ImpliedSavStartMonth,ImpliedSavStartYear, M1*tblTDC.TotalAdjustedAmt/NoMonths, M2*tblTDC.TotalAdjustedAmt/NoMonths, M3*tblTDC.TotalAdjustedAmt/NoMonths, M4*tblTDC.TotalAdjustedAmt/NoMonths, M5*tblTDC.TotalAdjustedAmt/NoMonths, M6*tblTDC.TotalAdjustedAmt/NoMonths, M7*tblTDC.TotalAdjustedAmt/NoMonths,
M8*tblTDC.TotalAdjustedAmt/NoMonths, M9*tblTDC.TotalAdjustedAmt/NoMonths, M10*tblTDC.TotalAdjustedAmt/NoMonths, M11*tblTDC.TotalAdjustedAmt/NoMonths, M12*tblTDC.TotalAdjustedAmt/NoMonths, 0
FROM tblProjects, tblFinancialMonth, tblTDC
WHERE tblProjects.ProjectID =tblTDC.ProjectID 
and tblProjects.ImpliedSavStartMonth = tblFinancialMonth.FinancialMonth
and Plant<>NULL
and tblTDC.TotalAdjustedAmt <> NULL
and tblTDC.TotalAdjustedAmt <> 0 
and Probability>=@Probability
and Category='HomeCare' 
and CommittedForecast=1
and tblTDC.FiscalYear = @Year
Create table #temptable2
(
Plant VARCHAR(50),
Jul int,
Aug Int,
Sep Int,
Oct Int,
Nov Int,
Dec Int,
Jan Int,
Feb Int,
Mar Int,
Apr Int,
May Int,
June Int,
Total Int
)
Insert into #temptable2
Select Descr as Plant, Sum(T1),Sum(T2) ,Sum(T3),Sum(T4),Sum(T5) ,Sum(T6), Sum(T7), Sum(T8),Sum(T9) ,Sum(T10),Sum(T11) ,Sum(T12),
		  Sum(T1+T2+T3+T4+T5+T6+T7+T8+T9+T10+T11+T12)
from #temptable1
Group By Descr
Insert into #temptable2
Select 'TotalSavings' , Sum(T1),Sum(T2) ,Sum(T3),Sum(T4),Sum(T5) ,Sum(T6), Sum(T7), Sum(T8),Sum(T9) ,Sum(T10),Sum(T11) ,Sum(T12),
Sum(T1+T2+T3+T4+T5+T6+T7+T8+T9+T10+T11+T12)
from #temptable1
Select * from #temptable2


GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


GO


CREATE     PROCEDURE  SummaryPlant @Probability int=50, @Year char(4) AS
Declare @HandDish Float(8)
Declare @ADW Float(8)
Declare @Aircare Float(8)
Declare @MrClean Float(8)
Declare @Swiffer Float(8)
Declare @total Float(8)
Select @HandDish = totalvolume from tblbusinessvolumetotal where Business='HandDish'
Select @ADW = totalvolume from tblbusinessvolumetotal where Business='ADW(Cascade)'
Select @Aircare = totalvolume from tblbusinessvolumetotal where Business='Aircare(Febreze)'
Select @MrClean = totalvolume from tblbusinessvolumetotal where Business='Mr. Clean'
Select @Swiffer = totalvolume from tblbusinessvolumetotal where Business='Swiffer'
Select @total = sum(totalvolume) from tblbusinessvolumetotal
Create table #temptable
(
Descr VARCHAR(50),
T1 int,
T2 Int ,
T3 Int,
T4 Int,
T5 Int,
T6 Int
)
Insert into #temptable
Select Plant , sum(tblTDC.TotalAdjustedAmt * T1) , sum(tblTDC.TotalAdjustedAmt * T2) ,
             	sum(tblTDC.TotalAdjustedAmt * T3) , sum(tblTDC.TotalAdjustedAmt * T4), 
		sum(tblTDC.TotalAdjustedAmt * T5),sum(tblTDC.TotalAdjustedAmt * T1) + sum(tblTDC.TotalAdjustedAmt * T2) + sum(tblTDC.TotalAdjustedAmt * T3) + sum(tblTDC.TotalAdjustedAmt * T4) +  sum(tblTDC.TotalAdjustedAmt * T5)  
FROM tblProjects , tblBusinessSummary, tblTDC
WHERE tblProjects.ProjectID =tblTDC.ProjectID 
and tblTDC.FiscalYear = @Year
and tblBusinessSummary.tdcelement = tblProjects.Business 
and Plant<>NULL 
and Probability>=@Probability
and Category='HomeCare' 
and CommittedForecast=1
GROUP BY Plant
Insert into #temptable
Select Plant, tblTDC.TotalAdjustedAmt *  @HandDish/@total,tblTDC.TotalAdjustedAmt  * @ADW/@total ,
             		      tblTDC.TotalAdjustedAmt * @Aircare/@total , tblTDC.TotalAdjustedAmt * @MrClean/@total, 
		      tblTDC.TotalAdjustedAmt * @Swiffer/@total, tblTDC.TotalAdjustedAmt
FROM tblProjects, tblTDC
WHERE tblProjects.ProjectID =tblTDC.ProjectID 
and tblTDC.FiscalYear = @Year
and tblProjects.Business = 'All' 
and Probability>=@Probability
and Category='HomeCare' 
and Plant<>NULL
and CommittedForecast=1
Insert into #temptable
Select 'TotalSavings', Sum(T1) , Sum(T2), Sum(T3), 
			Sum(T4), Sum(T5) , Sum(T6)  
from #temptable
Select Descr as Plant, Sum(T1) as 'Hand Dish', Sum(T2) as 'ADW(Cascade)', Sum(T3) as 'Aircare(Febreze)', 
			sum(T4) as 'Mr. Clean', Sum(T5) as 'Swiffer', Sum(T6) as 'Total' 
from #temptable
Group By Descr


GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


GO


CREATE        PROCEDURE TestProjectsSelectBusiness  @Year char(4) ='2004', @Business char(20)='All', @ProjectStage nvarchar(50) =NULL AS
Declare @total Float
Declare @multiplier Float
Select @total = sum(totalvolume) from tblbusinessvolumetotal
Select @multiplier = totalvolume/@total from tblbusinessvolumetotal where business = @business
SELECT     tblProjects.ProjectID, tblProjects.Business, tblProjects.BusinessForm, tblProjects.CostBucket, tblProjects.TDCSubElement, tblProjects.ProjectName, 
                      tblPersonnel.ProjectLeader, tblProjects.RecoverableLosses, tblProjects.SavingsStartMonthYearLiteral, 
                      tblProjects.Probability, tblTDC.TotalAdjustedAmt, tblTDC.TotalAdjustedAmt / tblBusinessVolumeTotal.TotalVolume AS DollarPerStat,  tblProjects.Status
FROM         tblTDC, tblPersonnel RIGHT OUTER JOIN
                      tblProjects LEFT OUTER JOIN
                      tblBusinessVolumeTotal 
		ON tblProjects.Business = tblBusinessVolumeTotal.Business 
		ON tblPersonnel.PersonnelID = tblProjects.ProjectLeaderID
WHERE tblProjects.ProjectID = tblTDC.ProjectID		
And tblTDC.FiscalYear = @Year
AND tblProjects.ProjectStage  =COALESCE(@ProjectStage,  tblProjects.ProjectStage)
And tblProjects.Business=@Business
UNION
SELECT     tblProjects.ProjectID, tblProjects.Business, tblProjects.BusinessForm, tblProjects.CostBucket, tblProjects.TDCSubElement, tblProjects.ProjectName, 
                      tblPersonnel.ProjectLeader, CAST(@multiplier* tblProjects.RecoverableLosses as Int) as RecoverableLosses, tblProjects.SavingsStartMonthYearLiteral, 
                      tblProjects.Probability,CAST(@multiplier* tblTDC.TotalAdjustedAmt as Int) as TotalAdjustedAmt, CAST(tblTDC.TotalAdjustedAmt as Float)/@total  AS DollarPerStat, tblProjects.Status
FROM         tblTDC, tblPersonnel RIGHT OUTER JOIN
                      tblProjects LEFT OUTER JOIN
                      tblBusinessVolumeTotal 
		ON tblProjects.Business = tblBusinessVolumeTotal.Business 
		ON tblPersonnel.PersonnelID = tblProjects.ProjectLeaderID
WHERE tblProjects.ProjectID = tblTDC.ProjectID		
And tblTDC.FiscalYear = @Year 
AND tblProjects.ProjectStage = @ProjectStage
And tblProjects.Business=COALESCE(@ProjectStage,  tblProjects.ProjectStage)
ORDER BY  tblProjects.Business,  tblProjects.BusinessForm, tblProjects.CostBucket, tblProjects.TDCSubElement

GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


GO


CREATE  PROCEDURE TestSum @ReportID int  AS
SELECT ReportText From tblCustomReport where ReportID = @ReportID


GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


GO


CREATE PROCEDURE TestSummary @Probability int=50, @Year char(4) AS
Declare @HandDish int
Declare @ADW int
Declare @Aircare int
Declare @MrClean int
Declare @Swiffer int
Declare @total Int
Select @HandDish = totalvolume from tblbusinessvolumetotal where Business='HandDish'
Select @ADW = totalvolume from tblbusinessvolumetotal where Business='ADW(Cascade)'
Select @Aircare = totalvolume from tblbusinessvolumetotal where Business='Aircare(Febreze)'
Select @MrClean = totalvolume from tblbusinessvolumetotal where Business='Mr. Clean'
Select @Swiffer = totalvolume from tblbusinessvolumetotal where Business='Swiffer'
Select @total = sum(totalvolume) from tblbusinessvolumetotal
Create table #temptable
(
TDCElement nvarchar(50), 
HandDish int, 
ADW int,
AirCare int, 
MrClean int, 
Swiffer int, 
Total int, 
)
Insert into #temptable
Select CostBucket, sum(TotalAdjustedAmt * T1), sum(TotalAdjustedAmt * T2),
             		      sum(TotalAdjustedAmt * T3), sum(TotalAdjustedAmt * T4), 
		      sum(TotalAdjustedAmt * T5),sum(TotalAdjustedAmt * T1) + sum(TotalAdjustedAmt * T2) + sum(TotalAdjustedAmt * T3) + sum(TotalAdjustedAmt * T4) +  sum(TotalAdjustedAmt * T5) 
FROM tblProjects , tblBusinessSummary
WHERE   tblBusinessSummary.tdcelement = tblProjects.Business 
and CostBucket<>NULL 
and Probability>@Probability
and Category='HomeCare' 
and CommittedForecast=1
and ((SavingsStartYear=@Year and SavingsStartMonth>6) or (SavingsStartYear=@Year+1 and SavingsStartMonth<6))
GROUP BY CostBucket
Insert into #temptable
Select CostBucket, TotalAdjustedAmt *  @HandDish/@total,TotalAdjustedAmt  * @ADW/@total ,
             		      TotalAdjustedAmt * @Aircare/@total , TotalAdjustedAmt * @MrClean/@total, 
		      TotalAdjustedAmt * @Swiffer/@total, TotalAdjustedAmt
FROM tblProjects
WHERE tblProjects.Business = 'All' 
and Probability>@Probability
and Category='HomeCare' 
and CommittedForecast=1
and ((SavingsStartYear=@Year and SavingsStartMonth>6) or (SavingsStartYear=@Year+1 and SavingsStartMonth<6))
Insert into #temptable
Select 'TotalSavings', Sum(HandDish) as 'Hand Dish', Sum(ADW) as 'ADW(Cascade)', Sum(Aircare) as 'Aircare(Febreze)', 
			Sum(MrClean) as 'Mr. Clean', Sum(Swiffer) as 'Swiffer', Sum(Total) as Total 
from #temptable
Create table #temptable1
(
TDCElement nvarchar(50), 
HandDish int, 
ADW int,
AirCare int, 
MrClean int, 
Swiffer int, 
Total int, 
)
Insert into #temptable1
Select TDCElement, Sum(HandDish) as 'Hand Dish', Sum(ADW) as 'ADW(Cascade)', Sum(Aircare) as 'Aircare(Febreze)', 
			Sum(MrClean) as 'Mr. Clean', Sum(Swiffer) as 'Swiffer', Sum(Total) as Total 
from #temptable
Where TDCElement ='RM'
Group BY TDCElement
Insert into #temptable1
Select TDCElement, Sum(HandDish) as 'Hand Dish', Sum(ADW) as 'ADW(Cascade)', Sum(Aircare) as 'Aircare(Febreze)', 
			Sum(MrClean) as 'Mr. Clean', Sum(Swiffer) as 'Swiffer', Sum(Total) as Total 
from #temptable
Where TDCElement ='PM'
Group BY TDCElement
Insert into #temptable1
Select TDCElement, Sum(HandDish) as 'Hand Dish', Sum(ADW) as 'ADW(Cascade)', Sum(Aircare) as 'Aircare(Febreze)', 
			Sum(MrClean) as 'Mr. Clean', Sum(Swiffer) as 'Swiffer', Sum(Total) as Total 
from #temptable
Where TDCElement ='MOE'
Group BY TDCElement
Insert into #temptable1
Select TDCElement, Sum(HandDish) as 'Hand Dish', Sum(ADW) as 'ADW(Cascade)', Sum(Aircare) as 'Aircare(Febreze)', 
			Sum(MrClean) as 'Mr. Clean', Sum(Swiffer) as 'Swiffer', Sum(Total) as Total 
from #temptable
Where TDCElement ='GMC'
Group BY TDCElement
Insert into #temptable1
Select TDCElement, Sum(HandDish) as 'Hand Dish', Sum(ADW) as 'ADW(Cascade)', Sum(Aircare) as 'Aircare(Febreze)', 
			Sum(MrClean) as 'Mr. Clean', Sum(Swiffer) as 'Swiffer', Sum(Total) as Total 
from #temptable
Where TDCElement ='FPLC'
Group BY TDCElement
Insert into #temptable1
Select TDCElement, Sum(HandDish) as 'Hand Dish', Sum(ADW) as 'ADW(Cascade)', Sum(Aircare) as 'Aircare(Febreze)', 
			Sum(MrClean) as 'Mr. Clean', Sum(Swiffer) as 'Swiffer', Sum(Total) as Total 
from #temptable
Where TDCElement ='PSNME'
Group BY TDCElement
Insert into #temptable1
Select TDCElement, Sum(HandDish) as 'Hand Dish', Sum(ADW) as 'ADW(Cascade)', Sum(Aircare) as 'Aircare(Febreze)', 
			Sum(MrClean) as 'Mr. Clean', Sum(Swiffer) as 'Swiffer', Sum(Total) as Total 
from #temptable
Where TDCElement ='Other NON TDC'
Group BY TDCElement
Insert into #temptable1
Select TDCElement, Sum(HandDish) as 'Hand Dish', Sum(ADW) as 'ADW(Cascade)', Sum(Aircare) as 'Aircare(Febreze)', 
			Sum(MrClean) as 'Mr. Clean', Sum(Swiffer) as 'Swiffer', Sum(Total) as Total 
from #temptable
Where TDCElement ='TotalSavings'
Group BY TDCElement
Select * from #temptable1


GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


GO


CREATE PROCEDURE UpdateBusinessVolume
	(@Business nvarchar(50),
	@BusinessForm nvarchar(50),
	@CashSavings float)
AS
UPDATE tblBusinessVolume
SET Business=@Business,BusinessForm=@BusinessForm,CashSavings=@CashSavings
WHERE BusinessForm=@BusinessForm


GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


GO


CREATE Procedure UpdateProject 	
	(
-- data points for tblProjects
	@ProjectID int,
	@ProjectName nvarchar(200),
	@ProjectLeaderID int,
	@CommittedForecast bit,
	@Status nvarchar(50),
	@ProjectStartYear smallint,
	@ProjectStartMonth smallint,
	@ProjectStartMonthYearLiteral nvarchar(10),
	@SavingsStartYear smallint,
	@SavingsStartMonth smallint,
	@SavingsStartMonthYearLiteral nvarchar(10),
	@RecoverableLosses float=0,
	@CostBucket nvarchar(50)=NULL,
	@CostAmt float=0,
	@Probability float=0,
	@Category nvarchar(50),
	@Plant nvarchar(50),
	@Business nvarchar(50), 
	@LossType nvarchar(50),
	@Description nvarchar(255),
	@ReasonForChange nvarchar(255),
	@BusinessForm nvarchar(50),
	@TDCSubElement nvarchar(50)=NULL,
	@ImpliedSavStartMonth smallint, 
	@ImpliedSavStartYear smallint,
	@ProjectStage nvarchar(50),
	@Department nvarchar(50),
	@OtherBusiness nvarchar(20),
	@Standards bit, 
	@IsTDC bit,
	@IsCash bit,
	@IsCVC bit,
	@IsSC bit,
-- data point for  tblTDC
	@FiscalYear int=0,
	@ProbabilityAdjustedAmt int=0,
	@TimeAdjustedAmt int=0,
	@TotalAdjustedAmt int=0,
-- datapoints for tblCash
	@CashElement nvarchar(50)=NULL,
	@CashSubElement nvarchar(50)=NULL,
	@CashAccMethod nvarchar(50)=NULL,
	@CashSavings int=0,
	@CashProbability int=0,
	@CashProbAdjAmt int=0,
	@CashDescription nvarchar(250)=NULL,
-- datapoints for tblCVC
	@CVCElement nvarchar(50)=NULL,
	@CustomerName nvarchar(50)=NULL,
	@SupplierName nvarchar(50)=NULL,
	@PGPartnerOrg nvarchar(50)=NULL,
	@NOSAddition int=0,
	@CustomerAmt int=0,
	@PGAmt int=0,
	@CVCProb int=0,
	@ProbAdjAmt int=0,
	@CVCDescription nvarchar(250)=NULL,
-- datapoints for tblCVC
	@SupplyChain nvarchar(50)=NULL,
	@SCElement nvarchar(50)=NULL,
	@SCSubElement nvarchar(50)=NULL,
	@SCTimeCurrent int=0,
	@SCTimeExpected int=0,
	@SCTimeEffect int=0,
	@SCProbability int=0,
	@SCDescription nvarchar(250)=NULL
) AS 
BEGIN TRAN
-- Update record in tblProjects
UPDATE tblProjects
SET 
ProjectName=@ProjectName, 
ProjectLeaderID=@ProjectLeaderID, 
CommittedForecast=@CommittedForecast, 
Status=@Status, 
ProjectStartYear=@ProjectStartYear, 
ProjectStartMonth=@ProjectStartMonth, 
ProjectStartMonthYearLiteral=@ProjectStartMonthYearLiteral, 
SavingsStartYear=@SavingsStartYear, 
SavingsStartMonth=@SavingsStartMonth, 
SavingsStartMonthYearLiteral=@SavingsStartMonthYearLiteral,
RecoverableLosses=@RecoverableLosses, 
CostBucket=@CostBucket, 
CostAmt=@CostAmt, 
Probability=@Probability, 
Category=@Category, 
Plant=@Plant, 
Business=@Business, 
LossType=@LossType, 
Description=@Description, 
ReasonForChange=@ReasonForChange, 
BusinessForm=@BusinessForm, 
TDCSubElement=@TDCSubElement, 
ImpliedSavStartMonth=@ImpliedSavStartMonth, 
ImpliedSavStartYear=@ImpliedSavStartYear, 
ProjectStage=@ProjectStage, 
Department= @Department,
OtherBusiness=@OtherBusiness,
Standards= @Standards, 
IsTDC=@IsTDC,
IsCash=@IsCash,
IsCVC=@IsCVC,
IsSC=@IsSC
WHERE ProjectID=@ProjectID
-- Delete existing extries of tblTDC on update
DELETE FROM tblTDC
WHERE ProjectID=@ProjectID
-- Insert current fiscial year in tblTDC
INSERT INTO tblTDC
(ProjectID, FiscalYEar, ProbAdjustedAmt, TimeAdjustedAmt, TotalAdjustedAmt) values 
(@ProjectID, @FiscalYear, @ProbabilityAdjustedAmt, @TimeAdjustedAmt, @TotalAdjustedAmt)
-- Insert next fiscial Year in tblTDC
INSERT INTO tblTDC
(ProjectID, FiscalYEar, ProbAdjustedAmt, TimeAdjustedAmt, TotalAdjustedAmt) values 
(@ProjectID, @FiscalYear+1, @ProbabilityAdjustedAmt, @RecoverableLosses - @TimeAdjustedAmt, @ProbabilityAdjustedAmt - @TotalAdjustedAmt)
-- Update record in tblCash
UPDATE tblCash
SET 
CashElement=@CashElement,
CashSubElement=@CashSubElement,
CashAccMethod=@CashAccMethod,
CashSavings=@CashSavings,
CashProbability=@CashProbability,
CashProbAdjAmt=@CashProbAdjAmt,
CashDescription=@CashDescription
WHERE ProjectID=@ProjectID
-- Update record in tblCVC
UPDATE tblCVC
SET 
CVCElement=@CVCElement,
CustomerName=@CustomerName,
SupplierName=@SupplierName,
PGPartnerOrg=@PGPartnerOrg,
NOSAddition=@NOSAddition,
CustomerAmt=@CustomerAmt,
PGAmt=@PGAmt,
CVCProb=@CVCProb,
ProbAdjAmt=@ProbAdjAmt,
CVCDescription=@CVCDescription
WHERE ProjectID=@ProjectID
-- Update record in tblSC
UPDATE tblSC
SET 
SupplyChain=@SupplyChain,
SCElement=@SCElement,
SCSubElement=@SCSubElement,
SCTimeCurrent=@SCTimeCurrent,
SCTimeExpected=@SCTimeExpected,
SCTimeEffect=@SCTimeEffect,
SCProbability=@SCProbability,
SCDescription=@SCDescription
WHERE ProjectID=@ProjectID
COMMIT TRAN


GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


GO



CREATE     PROCEDURE UpdatetblTDC AS
Create table #temptable
(
ProjectID int,
FiscalYear int, 
ProbabilityAdjustedAmt int, 
TimeAdjustedAmt int,
TotalAdjustedAmt int
)
Insert into #temptable
Select ProjectID, ImpliedSavStartYear, (RecoverableLosses * Probability)/100, ((19 - ImpliedSavStartMonth)*RecoverableLosses)/12 , ((19 - ImpliedSavStartMonth)* RecoverableLosses)/12 * Probability / 100
From tblProjects
Where ImpliedSavStartMonth > 6
Insert into #temptable
Select ProjectID,ImpliedSavStartYear+1,(RecoverableLosses * Probability)/100, RecoverableLosses - (((19 - ImpliedSavStartMonth)*RecoverableLosses)/12), ((RecoverableLosses * Probability)/100) -(((19 - ImpliedSavStartMonth)* RecoverableLosses)/12 * Probability / 100)
From tblProjects
Where ImpliedSavStartMonth > 6
Insert into #temptable
Select ProjectID, ImpliedSavStartYear-1, (RecoverableLosses * Probability)/100, ((7 - ImpliedSavStartMonth)*RecoverableLosses)/12 , ((7 - ImpliedSavStartMonth)* RecoverableLosses)/12 * Probability / 100
From tblProjects
Where ImpliedSavStartMonth <= 6
Insert into #temptable
Select ProjectID,  ImpliedSavStartYear,(RecoverableLosses * Probability)/100, RecoverableLosses - (((7 - ImpliedSavStartMonth)*RecoverableLosses)/12), ((RecoverableLosses * Probability)/100) -(((7 - ImpliedSavStartMonth)* RecoverableLosses)/12 * Probability / 100)
From tblProjects
Where ImpliedSavStartMonth <= 6
Insert into tblTDC (ProjectID, FiscalYear, ProbAdjustedAmt, TimeAdjustedAmt, TotalAdjustedAmt)
Select * from #temptable order by ProjectID

GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


create proc dbo.dt_addtosourcecontrol
    @vchSourceSafeINI varchar(255) = '',
    @vchProjectName   varchar(255) ='',
    @vchComment       varchar(255) ='',
    @vchLoginName     varchar(255) ='',
    @vchPassword      varchar(255) =''
as
set nocount on
declare @iReturn int
declare @iObjectId int
select @iObjectId = 0
declare @iStreamObjectId int
select @iStreamObjectId = 0
declare @VSSGUID varchar(100)
select @VSSGUID = 'SQLVersionControl.VCS_SQL'
declare @vchDatabaseName varchar(255)
select @vchDatabaseName = db_name()
declare @iReturnValue int
select @iReturnValue = 0
declare @iPropertyObjectId int
declare @vchParentId varchar(255)
declare @iObjectCount int
select @iObjectCount = 0
    exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT
    if @iReturn <> 0 GOTO E_OAError
    /* Create Project in SS */
    exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
											'AddProjectToSourceSafe',
											NULL,
											@vchSourceSafeINI,
											@vchProjectName output,
											@@SERVERNAME,
											@vchDatabaseName,
											@vchLoginName,
											@vchPassword,
											@vchComment
    if @iReturn <> 0 GOTO E_OAError
    /* Set Database Properties */
    begin tran SetProperties
    /* add high level object */
    exec @iPropertyObjectId = dbo.dt_adduserobject_vcs 'VCSProjectID'
    select @vchParentId = CONVERT(varchar(255),@iPropertyObjectId)
    exec dbo.dt_setpropertybyid @iPropertyObjectId, 'VCSProjectID', @vchParentId , NULL
    exec dbo.dt_setpropertybyid @iPropertyObjectId, 'VCSProject' , @vchProjectName , NULL
    exec dbo.dt_setpropertybyid @iPropertyObjectId, 'VCSSourceSafeINI' , @vchSourceSafeINI , NULL
    exec dbo.dt_setpropertybyid @iPropertyObjectId, 'VCSSQLServer', @@SERVERNAME, NULL
    exec dbo.dt_setpropertybyid @iPropertyObjectId, 'VCSSQLDatabase', @vchDatabaseName, NULL
    if @@error <> 0 GOTO E_General_Error
    commit tran SetProperties
    
    select @iObjectCount = 0;
CleanUp:
    select @vchProjectName
    select @iObjectCount
    return
E_General_Error:
    /* this is an all or nothing.  No specific error messages */
    goto CleanUp
E_OAError:
    exec dbo.dt_displayoaerror @iObjectId, @iReturn
    goto CleanUp


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


create proc dbo.dt_addtosourcecontrol_u
    @vchSourceSafeINI nvarchar(255) = '',
    @vchProjectName   nvarchar(255) ='',
    @vchComment       nvarchar(255) ='',
    @vchLoginName     nvarchar(255) ='',
    @vchPassword      nvarchar(255) =''
as
	-- This procedure should no longer be called;  dt_addtosourcecontrol should be called instead.
	-- Calls are forwarded to dt_addtosourcecontrol to maintain backward compatibility
	set nocount on
	exec dbo.dt_addtosourcecontrol 
		@vchSourceSafeINI, 
		@vchProjectName, 
		@vchComment, 
		@vchLoginName, 
		@vchPassword


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/*
**	Add an object to the dtproperties table
*/
create procedure dbo.dt_adduserobject
as
	set nocount on
	/*
	** Create the user object if it does not exist already
	*/
	begin transaction
		insert dbo.dtproperties (property) VALUES ('DtgSchemaOBJECT')
		update dbo.dtproperties set objectid=@@identity 
			where id=@@identity and property='DtgSchemaOBJECT'
	commit
	return @@identity


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


create procedure dbo.dt_adduserobject_vcs
    @vchProperty varchar(64)
as
set nocount on
declare @iReturn int
    /*
    ** Create the user object if it does not exist already
    */
    begin transaction
        select @iReturn = objectid from dbo.dtproperties where property = @vchProperty
        if @iReturn IS NULL
        begin
            insert dbo.dtproperties (property) VALUES (@vchProperty)
            update dbo.dtproperties set objectid=@@identity
                    where id=@@identity and property=@vchProperty
            select @iReturn = @@identity
        end
    commit
    return @iReturn


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


create proc dbo.dt_checkinobject
    @chObjectType  char(4),
    @vchObjectName varchar(255),
    @vchComment    varchar(255)='',
    @vchLoginName  varchar(255),
    @vchPassword   varchar(255)='',
    @iVCSFlags     int = 0,
    @iActionFlag   int = 0,   /* 0 => AddFile, 1 => CheckIn */
    @txStream1     Text = '', /* drop stream   */ /* There is a bug that if items are NULL they do not pass to OLE servers */
    @txStream2     Text = '', /* create stream */
    @txStream3     Text = ''  /* grant stream  */
as
	set nocount on
	declare @iReturn int
	declare @iObjectId int
	select @iObjectId = 0
	declare @iStreamObjectId int
	declare @VSSGUID varchar(100)
	select @VSSGUID = 'SQLVersionControl.VCS_SQL'
	declare @iPropertyObjectId int
	select @iPropertyObjectId  = 0
    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')
    declare @vchProjectName   varchar(255)
    declare @vchSourceSafeINI varchar(255)
    declare @vchServerName    varchar(255)
    declare @vchDatabaseName  varchar(255)
    declare @iReturnValue	  int
    declare @pos			  int
    declare @vchProcLinePiece varchar(255)
    
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSProject',       @vchProjectName   OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSourceSafeINI', @vchSourceSafeINI OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLServer',     @vchServerName    OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLDatabase',   @vchDatabaseName  OUT
    if @chObjectType = 'PROC'
    begin
        if @iActionFlag = 1
        begin
            /* Procedure Can have up to three streams
            Drop Stream, Create Stream, GRANT stream */
            begin tran compile_all
            /* try to compile the streams */
            exec (@txStream1)
            if @@error <> 0 GOTO E_Compile_Fail
            exec (@txStream2)
            if @@error <> 0 GOTO E_Compile_Fail
            exec (@txStream3)
            if @@error <> 0 GOTO E_Compile_Fail
        end
        exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT
        if @iReturn <> 0 GOTO E_OAError
        exec @iReturn = master.dbo.sp_OAGetProperty @iObjectId, 'GetStreamObject', @iStreamObjectId OUT
        if @iReturn <> 0 GOTO E_OAError
        
        if @iActionFlag = 1
        begin
            
            declare @iStreamLength int
			
			select @pos=1
			select @iStreamLength = datalength(@txStream2)
			
			if @iStreamLength > 0
			begin
			
				while @pos < @iStreamLength
				begin
						
					select @vchProcLinePiece = substring(@txStream2, @pos, 255)
					
					exec @iReturn = master.dbo.sp_OAMethod @iStreamObjectId, 'AddStream', @iReturnValue OUT, @vchProcLinePiece
            		if @iReturn <> 0 GOTO E_OAError
            		
					select @pos = @pos + 255
					
				end
            
				exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
														'CheckIn_StoredProcedure',
														NULL,
														@sProjectName = @vchProjectName,
														@sSourceSafeINI = @vchSourceSafeINI,
														@sServerName = @vchServerName,
														@sDatabaseName = @vchDatabaseName,
														@sObjectName = @vchObjectName,
														@sComment = @vchComment,
														@sLoginName = @vchLoginName,
														@sPassword = @vchPassword,
														@iVCSFlags = @iVCSFlags,
														@iActionFlag = @iActionFlag,
														@sStream = ''
                                        
			end
        end
        else
        begin
        
            select colid, text into #ProcLines
            from syscomments
            where id = object_id(@vchObjectName)
            order by colid
            declare @iCurProcLine int
            declare @iProcLines int
            select @iCurProcLine = 1
            select @iProcLines = (select count(*) from #ProcLines)
            while @iCurProcLine <= @iProcLines
            begin
                select @pos = 1
                declare @iCurLineSize int
                select @iCurLineSize = len((select text from #ProcLines where colid = @iCurProcLine))
                while @pos <= @iCurLineSize
                begin                
                    select @vchProcLinePiece = convert(varchar(255),
                        substring((select text from #ProcLines where colid = @iCurProcLine),
                                  @pos, 255 ))
                    exec @iReturn = master.dbo.sp_OAMethod @iStreamObjectId, 'AddStream', @iReturnValue OUT, @vchProcLinePiece
                    if @iReturn <> 0 GOTO E_OAError
                    select @pos = @pos + 255                  
                end
                select @iCurProcLine = @iCurProcLine + 1
            end
            drop table #ProcLines
            exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
													'CheckIn_StoredProcedure',
													NULL,
													@sProjectName = @vchProjectName,
													@sSourceSafeINI = @vchSourceSafeINI,
													@sServerName = @vchServerName,
													@sDatabaseName = @vchDatabaseName,
													@sObjectName = @vchObjectName,
													@sComment = @vchComment,
													@sLoginName = @vchLoginName,
													@sPassword = @vchPassword,
													@iVCSFlags = @iVCSFlags,
													@iActionFlag = @iActionFlag,
													@sStream = ''
        end
        if @iReturn <> 0 GOTO E_OAError
        if @iActionFlag = 1
        begin
            commit tran compile_all
            if @@error <> 0 GOTO E_Compile_Fail
        end
    end
CleanUp:
	return
E_Compile_Fail:
	declare @lerror int
	select @lerror = @@error
	rollback tran compile_all
	RAISERROR (@lerror,16,-1)
	goto CleanUp
E_OAError:
	if @iActionFlag = 1 rollback tran compile_all
	exec dbo.dt_displayoaerror @iObjectId, @iReturn
	goto CleanUp


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


create proc dbo.dt_checkinobject_u
    @chObjectType  char(4),
    @vchObjectName nvarchar(255),
    @vchComment    nvarchar(255)='',
    @vchLoginName  nvarchar(255),
    @vchPassword   nvarchar(255)='',
    @iVCSFlags     int = 0,
    @iActionFlag   int = 0,   /* 0 => AddFile, 1 => CheckIn */
    @txStream1     text = '',  /* drop stream   */ /* There is a bug that if items are NULL they do not pass to OLE servers */
    @txStream2     text = '',  /* create stream */
    @txStream3     text = ''   /* grant stream  */
as	
	-- This procedure should no longer be called;  dt_checkinobject should be called instead.
	-- Calls are forwarded to dt_checkinobject to maintain backward compatibility.
	set nocount on
	exec dbo.dt_checkinobject
		@chObjectType,
		@vchObjectName,
		@vchComment,
		@vchLoginName,
		@vchPassword,
		@iVCSFlags,
		@iActionFlag,   
		@txStream1,		
		@txStream2,		
		@txStream3		


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


create proc dbo.dt_checkoutobject
    @chObjectType  char(4),
    @vchObjectName varchar(255),
    @vchComment    varchar(255),
    @vchLoginName  varchar(255),
    @vchPassword   varchar(255),
    @iVCSFlags     int = 0,
    @iActionFlag   int = 0/* 0 => Checkout, 1 => GetLatest, 2 => UndoCheckOut */
as
	set nocount on
	declare @iReturn int
	declare @iObjectId int
	select @iObjectId =0
	declare @VSSGUID varchar(100)
	select @VSSGUID = 'SQLVersionControl.VCS_SQL'
	declare @iReturnValue int
	select @iReturnValue = 0
	declare @vchTempText varchar(255)
	/* this is for our strings */
	declare @iStreamObjectId int
	select @iStreamObjectId = 0
    declare @iPropertyObjectId int
    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')
    declare @vchProjectName   varchar(255)
    declare @vchSourceSafeINI varchar(255)
    declare @vchServerName    varchar(255)
    declare @vchDatabaseName  varchar(255)
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSProject',       @vchProjectName   OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSourceSafeINI', @vchSourceSafeINI OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLServer',     @vchServerName    OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLDatabase',   @vchDatabaseName  OUT
    if @chObjectType = 'PROC'
    begin
        /* Procedure Can have up to three streams
           Drop Stream, Create Stream, GRANT stream */
        exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT
        if @iReturn <> 0 GOTO E_OAError
        exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
												'CheckOut_StoredProcedure',
												NULL,
												@sProjectName = @vchProjectName,
												@sSourceSafeINI = @vchSourceSafeINI,
												@sObjectName = @vchObjectName,
												@sServerName = @vchServerName,
												@sDatabaseName = @vchDatabaseName,
												@sComment = @vchComment,
												@sLoginName = @vchLoginName,
												@sPassword = @vchPassword,
												@iVCSFlags = @iVCSFlags,
												@iActionFlag = @iActionFlag
        if @iReturn <> 0 GOTO E_OAError
        exec @iReturn = master.dbo.sp_OAGetProperty @iObjectId, 'GetStreamObject', @iStreamObjectId OUT
        if @iReturn <> 0 GOTO E_OAError
        create table #commenttext (id int identity, sourcecode varchar(255))
        select @vchTempText = 'STUB'
        while @vchTempText is not null
        begin
            exec @iReturn = master.dbo.sp_OAMethod @iStreamObjectId, 'GetStream', @iReturnValue OUT, @vchTempText OUT
            if @iReturn <> 0 GOTO E_OAError
            
            if (@vchTempText = '') set @vchTempText = null
            if (@vchTempText is not null) insert into #commenttext (sourcecode) select @vchTempText
        end
        select 'VCS'=sourcecode from #commenttext order by id
        select 'SQL'=text from syscomments where id = object_id(@vchObjectName) order by colid
    end
CleanUp:
    return
E_OAError:
    exec dbo.dt_displayoaerror @iObjectId, @iReturn
    GOTO CleanUp


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


create proc dbo.dt_checkoutobject_u
    @chObjectType  char(4),
    @vchObjectName nvarchar(255),
    @vchComment    nvarchar(255),
    @vchLoginName  nvarchar(255),
    @vchPassword   nvarchar(255),
    @iVCSFlags     int = 0,
    @iActionFlag   int = 0/* 0 => Checkout, 1 => GetLatest, 2 => UndoCheckOut */
as
	-- This procedure should no longer be called;  dt_checkoutobject should be called instead.
	-- Calls are forwarded to dt_checkoutobject to maintain backward compatibility.
	set nocount on
	exec dbo.dt_checkoutobject
		@chObjectType,  
		@vchObjectName, 
		@vchComment,    
		@vchLoginName,  
		@vchPassword,  
		@iVCSFlags,    
		@iActionFlag 


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE dbo.dt_displayoaerror
    @iObject int,
    @iresult int
as
set nocount on
declare @vchOutput      varchar(255)
declare @hr             int
declare @vchSource      varchar(255)
declare @vchDescription varchar(255)
    exec @hr = master.dbo.sp_OAGetErrorInfo @iObject, @vchSource OUT, @vchDescription OUT
    select @vchOutput = @vchSource + ': ' + @vchDescription
    raiserror (@vchOutput,16,-1)
    return


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE dbo.dt_displayoaerror_u
    @iObject int,
    @iresult int
as
	-- This procedure should no longer be called;  dt_displayoaerror should be called instead.
	-- Calls are forwarded to dt_displayoaerror to maintain backward compatibility.
	set nocount on
	exec dbo.dt_displayoaerror
		@iObject,
		@iresult


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/*
**	Drop one or all the associated properties of an object or an attribute 
**
**	dt_dropproperties objid, null or '' -- drop all properties of the object itself
**	dt_dropproperties objid, property -- drop the property
*/
create procedure dbo.dt_droppropertiesbyid
	@id int,
	@property varchar(64)
as
	set nocount on
	if (@property is null) or (@property = '')
		delete from dbo.dtproperties where objectid=@id
	else
		delete from dbo.dtproperties 
			where objectid=@id and property=@property


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/*
**	Drop an object from the dbo.dtproperties table
*/
create procedure dbo.dt_dropuserobjectbyid
	@id int
as
	set nocount on
	delete from dbo.dtproperties where objectid=@id


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/* 
**	Generate an ansi name that is unique in the dtproperties.value column 
*/ 
create procedure dbo.dt_generateansiname(@name varchar(255) output) 
as 
	declare @prologue varchar(20) 
	declare @indexstring varchar(20) 
	declare @index integer 
 
	set @prologue = 'MSDT-A-' 
	set @index = 1 
 
	while 1 = 1 
	begin 
		set @indexstring = cast(@index as varchar(20)) 
		set @name = @prologue + @indexstring 
		if not exists (select value from dtproperties where value = @name) 
			break 
		 
		set @index = @index + 1 
 
		if (@index = 10000) 
			goto TooMany 
	end 
 
Leave: 
 
	return 
 
TooMany: 
 
	set @name = 'DIAGRAM' 
	goto Leave 


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/*
**	Retrieve the owner object(s) of a given property
*/
create procedure dbo.dt_getobjwithprop
	@property varchar(30),
	@value varchar(255)
as
	set nocount on
	if (@property is null) or (@property = '')
	begin
		raiserror('Must specify a property name.',-1,-1)
		return (1)
	end
	if (@value is null)
		select objectid id from dbo.dtproperties
			where property=@property
	else
		select objectid id from dbo.dtproperties
			where property=@property and value=@value


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/*
**	Retrieve the owner object(s) of a given property
*/
create procedure dbo.dt_getobjwithprop_u
	@property varchar(30),
	@uvalue nvarchar(255)
as
	set nocount on
	if (@property is null) or (@property = '')
	begin
		raiserror('Must specify a property name.',-1,-1)
		return (1)
	end
	if (@uvalue is null)
		select objectid id from dbo.dtproperties
			where property=@property
	else
		select objectid id from dbo.dtproperties
			where property=@property and uvalue=@uvalue


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/*
**	Retrieve properties by id's
**
**	dt_getproperties objid, null or '' -- retrieve all properties of the object itself
**	dt_getproperties objid, property -- retrieve the property specified
*/
create procedure dbo.dt_getpropertiesbyid
	@id int,
	@property varchar(64)
as
	set nocount on
	if (@property is null) or (@property = '')
		select property, version, value, lvalue
			from dbo.dtproperties
			where  @id=objectid
	else
		select property, version, value, lvalue
			from dbo.dtproperties
			where  @id=objectid and @property=property


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/*
**	Retrieve properties by id's
**
**	dt_getproperties objid, null or '' -- retrieve all properties of the object itself
**	dt_getproperties objid, property -- retrieve the property specified
*/
create procedure dbo.dt_getpropertiesbyid_u
	@id int,
	@property varchar(64)
as
	set nocount on
	if (@property is null) or (@property = '')
		select property, version, uvalue, lvalue
			from dbo.dtproperties
			where  @id=objectid
	else
		select property, version, uvalue, lvalue
			from dbo.dtproperties
			where  @id=objectid and @property=property


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


create procedure dbo.dt_getpropertiesbyid_vcs
    @id       int,
    @property varchar(64),
    @value    varchar(255) = NULL OUT
as
    set nocount on
    select @value = (
        select value
                from dbo.dtproperties
                where @id=objectid and @property=property
                )


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


create procedure dbo.dt_getpropertiesbyid_vcs_u
    @id       int,
    @property varchar(64),
    @value    nvarchar(255) = NULL OUT
as
    -- This procedure should no longer be called;  dt_getpropertiesbyid_vcsshould be called instead.
	-- Calls are forwarded to dt_getpropertiesbyid_vcs to maintain backward compatibility.
	set nocount on
    exec dbo.dt_getpropertiesbyid_vcs
		@id,
		@property,
		@value output


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


create proc dbo.dt_isundersourcecontrol
    @vchLoginName varchar(255) = '',
    @vchPassword  varchar(255) = '',
    @iWhoToo      int = 0 /* 0 => Just check project; 1 => get list of objs */
as
	set nocount on
	declare @iReturn int
	declare @iObjectId int
	select @iObjectId = 0
	declare @VSSGUID varchar(100)
	select @VSSGUID = 'SQLVersionControl.VCS_SQL'
	declare @iReturnValue int
	select @iReturnValue = 0
	declare @iStreamObjectId int
	select @iStreamObjectId   = 0
	declare @vchTempText varchar(255)
    declare @iPropertyObjectId int
    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')
    declare @vchProjectName   varchar(255)
    declare @vchSourceSafeINI varchar(255)
    declare @vchServerName    varchar(255)
    declare @vchDatabaseName  varchar(255)
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSProject',       @vchProjectName   OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSourceSafeINI', @vchSourceSafeINI OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLServer',     @vchServerName    OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLDatabase',   @vchDatabaseName  OUT
    if (@vchProjectName = '')	set @vchProjectName		= null
    if (@vchSourceSafeINI = '') set @vchSourceSafeINI	= null
    if (@vchServerName = '')	set @vchServerName		= null
    if (@vchDatabaseName = '')	set @vchDatabaseName	= null
    
    if (@vchProjectName is null) or (@vchSourceSafeINI is null) or (@vchServerName is null) or (@vchDatabaseName is null)
    begin
        RAISERROR('Not Under Source Control',16,-1)
        return
    end
    if @iWhoToo = 1
    begin
        /* Get List of Procs in the project */
        exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT
        if @iReturn <> 0 GOTO E_OAError
        exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
												'GetListOfObjects',
												NULL,
												@vchProjectName,
												@vchSourceSafeINI,
												@vchServerName,
												@vchDatabaseName,
												@vchLoginName,
												@vchPassword
        if @iReturn <> 0 GOTO E_OAError
        exec @iReturn = master.dbo.sp_OAGetProperty @iObjectId, 'GetStreamObject', @iStreamObjectId OUT
        if @iReturn <> 0 GOTO E_OAError
        create table #ObjectList (id int identity, vchObjectlist varchar(255))
        select @vchTempText = 'STUB'
        while @vchTempText is not null
        begin
            exec @iReturn = master.dbo.sp_OAMethod @iStreamObjectId, 'GetStream', @iReturnValue OUT, @vchTempText OUT
            if @iReturn <> 0 GOTO E_OAError
            
            if (@vchTempText = '') set @vchTempText = null
            if (@vchTempText is not null) insert into #ObjectList (vchObjectlist ) select @vchTempText
        end
        select vchObjectlist from #ObjectList order by id
    end
CleanUp:
    return
E_OAError:
    exec dbo.dt_displayoaerror @iObjectId, @iReturn
    goto CleanUp


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


create proc dbo.dt_isundersourcecontrol_u
    @vchLoginName nvarchar(255) = '',
    @vchPassword  nvarchar(255) = '',
    @iWhoToo      int = 0 /* 0 => Just check project; 1 => get list of objs */
as
	-- This procedure should no longer be called;  dt_isundersourcecontrol should be called instead.
	-- Calls are forwarded to dt_isundersourcecontrol to maintain backward compatibility.
	set nocount on
	exec dbo.dt_isundersourcecontrol
		@vchLoginName,
		@vchPassword,
		@iWhoToo 


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


create procedure dbo.dt_removefromsourcecontrol
as
    set nocount on
    declare @iPropertyObjectId int
    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')
    exec dbo.dt_droppropertiesbyid @iPropertyObjectId, null
    /* -1 is returned by dt_droppopertiesbyid */
    if @@error <> 0 and @@error <> -1 return 1
    return 0


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/*
**	If the property already exists, reset the value; otherwise add property
**		id -- the id in sysobjects of the object
**		property -- the name of the property
**		value -- the text value of the property
**		lvalue -- the binary value of the property (image)
*/
create procedure dbo.dt_setpropertybyid
	@id int,
	@property varchar(64),
	@value varchar(255),
	@lvalue image
as
	set nocount on
	declare @uvalue nvarchar(255) 
	set @uvalue = convert(nvarchar(255), @value) 
	if exists (select * from dbo.dtproperties 
			where objectid=@id and property=@property)
	begin
		--
		-- bump the version count for this row as we update it
		--
		update dbo.dtproperties set value=@value, uvalue=@uvalue, lvalue=@lvalue, version=version+1
			where objectid=@id and property=@property
	end
	else
	begin
		--
		-- version count is auto-set to 0 on initial insert
		--
		insert dbo.dtproperties (property, objectid, value, uvalue, lvalue)
			values (@property, @id, @value, @uvalue, @lvalue)
	end


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/*
**	If the property already exists, reset the value; otherwise add property
**		id -- the id in sysobjects of the object
**		property -- the name of the property
**		uvalue -- the text value of the property
**		lvalue -- the binary value of the property (image)
*/
create procedure dbo.dt_setpropertybyid_u
	@id int,
	@property varchar(64),
	@uvalue nvarchar(255),
	@lvalue image
as
	set nocount on
	-- 
	-- If we are writing the name property, find the ansi equivalent. 
	-- If there is no lossless translation, generate an ansi name. 
	-- 
	declare @avalue varchar(255) 
	set @avalue = null 
	if (@uvalue is not null) 
	begin 
		if (convert(nvarchar(255), convert(varchar(255), @uvalue)) = @uvalue) 
		begin 
			set @avalue = convert(varchar(255), @uvalue) 
		end 
		else 
		begin 
			if 'DtgSchemaNAME' = @property 
			begin 
				exec dbo.dt_generateansiname @avalue output 
			end 
		end 
	end 
	if exists (select * from dbo.dtproperties 
			where objectid=@id and property=@property)
	begin
		--
		-- bump the version count for this row as we update it
		--
		update dbo.dtproperties set value=@avalue, uvalue=@uvalue, lvalue=@lvalue, version=version+1
			where objectid=@id and property=@property
	end
	else
	begin
		--
		-- version count is auto-set to 0 on initial insert
		--
		insert dbo.dtproperties (property, objectid, value, uvalue, lvalue)
			values (@property, @id, @avalue, @uvalue, @lvalue)
	end


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


create proc dbo.dt_validateloginparams
    @vchLoginName  varchar(255),
    @vchPassword   varchar(255)
as
set nocount on
declare @iReturn int
declare @iObjectId int
select @iObjectId =0
declare @VSSGUID varchar(100)
select @VSSGUID = 'SQLVersionControl.VCS_SQL'
    declare @iPropertyObjectId int
    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')
    declare @vchSourceSafeINI varchar(255)
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSourceSafeINI', @vchSourceSafeINI OUT
    exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT
    if @iReturn <> 0 GOTO E_OAError
    exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
											'ValidateLoginParams',
											NULL,
											@sSourceSafeINI = @vchSourceSafeINI,
											@sLoginName = @vchLoginName,
											@sPassword = @vchPassword
    if @iReturn <> 0 GOTO E_OAError
CleanUp:
    return
E_OAError:
    exec dbo.dt_displayoaerror @iObjectId, @iReturn
    GOTO CleanUp


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


create proc dbo.dt_validateloginparams_u
    @vchLoginName  nvarchar(255),
    @vchPassword   nvarchar(255)
as
	-- This procedure should no longer be called;  dt_validateloginparams should be called instead.
	-- Calls are forwarded to dt_validateloginparams to maintain backward compatibility.
	set nocount on
	exec dbo.dt_validateloginparams
		@vchLoginName,
		@vchPassword 


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


create proc dbo.dt_vcsenabled
as
set nocount on
declare @iObjectId int
select @iObjectId = 0
declare @VSSGUID varchar(100)
select @VSSGUID = 'SQLVersionControl.VCS_SQL'
    declare @iReturn int
    exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT
    if @iReturn <> 0 raiserror('', 16, -1) /* Can't Load Helper DLLC */


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/*
**	This procedure returns the version number of the stored
**    procedures used by legacy versions of the Microsoft
**	Visual Database Tools.  Version is 7.0.00.
*/
create procedure dbo.dt_verstamp006
as
	select 7000


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/*
**	This procedure returns the version number of the stored
**    procedures used by the the Microsoft Visual Database Tools.
**	Version is 7.0.05.
*/
create procedure dbo.dt_verstamp007
as
	select 7005

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


create proc dbo.dt_whocheckedout
        @chObjectType  char(4),
        @vchObjectName varchar(255),
        @vchLoginName  varchar(255),
        @vchPassword   varchar(255)
as
set nocount on
declare @iReturn int
declare @iObjectId int
select @iObjectId =0
declare @VSSGUID varchar(100)
select @VSSGUID = 'SQLVersionControl.VCS_SQL'
    declare @iPropertyObjectId int
    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')
    declare @vchProjectName   varchar(255)
    declare @vchSourceSafeINI varchar(255)
    declare @vchServerName    varchar(255)
    declare @vchDatabaseName  varchar(255)
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSProject',       @vchProjectName   OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSourceSafeINI', @vchSourceSafeINI OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLServer',     @vchServerName    OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLDatabase',   @vchDatabaseName  OUT
    if @chObjectType = 'PROC'
    begin
        exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT
        if @iReturn <> 0 GOTO E_OAError
        declare @vchReturnValue varchar(255)
        select @vchReturnValue = ''
        exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
												'WhoCheckedOut',
												@vchReturnValue OUT,
												@sProjectName = @vchProjectName,
												@sSourceSafeINI = @vchSourceSafeINI,
												@sObjectName = @vchObjectName,
												@sServerName = @vchServerName,
												@sDatabaseName = @vchDatabaseName,
												@sLoginName = @vchLoginName,
												@sPassword = @vchPassword
        if @iReturn <> 0 GOTO E_OAError
        select @vchReturnValue
    end
CleanUp:
    return
E_OAError:
    exec dbo.dt_displayoaerror @iObjectId, @iReturn
    GOTO CleanUp


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


create proc dbo.dt_whocheckedout_u
        @chObjectType  char(4),
        @vchObjectName nvarchar(255),
        @vchLoginName  nvarchar(255),
        @vchPassword   nvarchar(255)
as
	-- This procedure should no longer be called;  dt_whocheckedout should be called instead.
	-- Calls are forwarded to dt_whocheckedout to maintain backward compatibility.
	set nocount on
	exec dbo.dt_whocheckedout
		@chObjectType, 
		@vchObjectName,
		@vchLoginName, 
		@vchPassword  


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

