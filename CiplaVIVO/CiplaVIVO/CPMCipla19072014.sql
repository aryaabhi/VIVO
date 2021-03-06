USE [master]
GO
/****** Object:  Database [CPMCipla]    Script Date: 19/07/2014 17:03:53 ******/
CREATE DATABASE [CPMCipla]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CPMCipla', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\CPMCipla.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CPMCipla_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\CPMCipla_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CPMCipla] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CPMCipla].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CPMCipla] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CPMCipla] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CPMCipla] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CPMCipla] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CPMCipla] SET ARITHABORT OFF 
GO
ALTER DATABASE [CPMCipla] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CPMCipla] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [CPMCipla] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CPMCipla] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CPMCipla] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CPMCipla] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CPMCipla] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CPMCipla] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CPMCipla] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CPMCipla] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CPMCipla] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CPMCipla] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CPMCipla] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CPMCipla] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CPMCipla] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CPMCipla] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CPMCipla] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CPMCipla] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CPMCipla] SET RECOVERY FULL 
GO
ALTER DATABASE [CPMCipla] SET  MULTI_USER 
GO
ALTER DATABASE [CPMCipla] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CPMCipla] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CPMCipla] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CPMCipla] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [CPMCipla]
GO
/****** Object:  DatabaseRole [aspnet_WebEvent_FullAccess]    Script Date: 19/07/2014 17:03:53 ******/
CREATE ROLE [aspnet_WebEvent_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_ReportingAccess]    Script Date: 19/07/2014 17:03:53 ******/
CREATE ROLE [aspnet_Roles_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_FullAccess]    Script Date: 19/07/2014 17:03:53 ******/
CREATE ROLE [aspnet_Roles_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_BasicAccess]    Script Date: 19/07/2014 17:03:53 ******/
CREATE ROLE [aspnet_Roles_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_ReportingAccess]    Script Date: 19/07/2014 17:03:53 ******/
CREATE ROLE [aspnet_Profile_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_FullAccess]    Script Date: 19/07/2014 17:03:53 ******/
CREATE ROLE [aspnet_Profile_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_BasicAccess]    Script Date: 19/07/2014 17:03:53 ******/
CREATE ROLE [aspnet_Profile_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_ReportingAccess]    Script Date: 19/07/2014 17:03:53 ******/
CREATE ROLE [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_FullAccess]    Script Date: 19/07/2014 17:03:53 ******/
CREATE ROLE [aspnet_Personalization_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_BasicAccess]    Script Date: 19/07/2014 17:03:53 ******/
CREATE ROLE [aspnet_Personalization_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_ReportingAccess]    Script Date: 19/07/2014 17:03:53 ******/
CREATE ROLE [aspnet_Membership_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_FullAccess]    Script Date: 19/07/2014 17:03:53 ******/
CREATE ROLE [aspnet_Membership_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_BasicAccess]    Script Date: 19/07/2014 17:03:53 ******/
CREATE ROLE [aspnet_Membership_BasicAccess]
GO
/****** Object:  Schema [aspnet_Membership_BasicAccess]    Script Date: 19/07/2014 17:03:53 ******/
CREATE SCHEMA [aspnet_Membership_BasicAccess]
GO
/****** Object:  Schema [aspnet_Membership_FullAccess]    Script Date: 19/07/2014 17:03:53 ******/
CREATE SCHEMA [aspnet_Membership_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_ReportingAccess]    Script Date: 19/07/2014 17:03:53 ******/
CREATE SCHEMA [aspnet_Membership_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Personalization_BasicAccess]    Script Date: 19/07/2014 17:03:53 ******/
CREATE SCHEMA [aspnet_Personalization_BasicAccess]
GO
/****** Object:  Schema [aspnet_Personalization_FullAccess]    Script Date: 19/07/2014 17:03:53 ******/
CREATE SCHEMA [aspnet_Personalization_FullAccess]
GO
/****** Object:  Schema [aspnet_Personalization_ReportingAccess]    Script Date: 19/07/2014 17:03:53 ******/
CREATE SCHEMA [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Profile_BasicAccess]    Script Date: 19/07/2014 17:03:53 ******/
CREATE SCHEMA [aspnet_Profile_BasicAccess]
GO
/****** Object:  Schema [aspnet_Profile_FullAccess]    Script Date: 19/07/2014 17:03:53 ******/
CREATE SCHEMA [aspnet_Profile_FullAccess]
GO
/****** Object:  Schema [aspnet_Profile_ReportingAccess]    Script Date: 19/07/2014 17:03:53 ******/
CREATE SCHEMA [aspnet_Profile_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Roles_BasicAccess]    Script Date: 19/07/2014 17:03:53 ******/
CREATE SCHEMA [aspnet_Roles_BasicAccess]
GO
/****** Object:  Schema [aspnet_Roles_FullAccess]    Script Date: 19/07/2014 17:03:53 ******/
CREATE SCHEMA [aspnet_Roles_FullAccess]
GO
/****** Object:  Schema [aspnet_Roles_ReportingAccess]    Script Date: 19/07/2014 17:03:53 ******/
CREATE SCHEMA [aspnet_Roles_ReportingAccess]
GO
/****** Object:  Schema [aspnet_WebEvent_FullAccess]    Script Date: 19/07/2014 17:03:53 ******/
CREATE SCHEMA [aspnet_WebEvent_FullAccess]
GO
/****** Object:  StoredProcedure [dbo].[InsertProject]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Batch submitted through debugger: SQLQuery1.sql|304|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql


CREATE Procedure [dbo].[InsertProject] 	
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
/****** Object:  StoredProcedure [dbo].[InsertReport]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Batch submitted through debugger: SQLQuery1.sql|419|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql


CREATE Procedure [dbo].[InsertReport] 	
	(@ReportName nvarchar(50),
	@ReportText nvarchar(4000)
 ) AS 
declare @identity_val int
INSERT INTO tblCustomReport (ReportName, ReportText) values( @ReportName, @ReportText)
select @identity_val = @@Identity
return @identity_val




GO
/****** Object:  StoredProcedure [dbo].[ProjectCopy]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Batch submitted through debugger: SQLQuery1.sql|447|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql


CREATE PROCEDURE [dbo].[ProjectCopy] @ProjectID int AS

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
/****** Object:  StoredProcedure [dbo].[ProjectsSelectAll]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery1.sql|1145|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql


CREATE  PROCEDURE [dbo].[ProjectsSelectAll] AS
SELECT     tblProjects.ProjectID, tblProjects.Business, tblProjects.BusinessForm, tblProjects.CostBucket, tblProjects.TDCSubElement, tblProjects.ProjectName, 
                      tblPersonnel.ProjectLeader, tblProjects.RecoverableLosses,tblProjects.SavingsStartMonthYearLiteral, 
                      tblProjects.Probability, tblTDC.TotalAdjustedAmt, tblProjects.Status
FROM   tblPersonnel RIGHT OUTER JOIN
       		tblProjects ON tblPersonnel.PersonnelID = tblProjects.ProjectLeaderID
		RIGHT OUTER JOIN tblTDC on tblProjects.ProjectID = tblTDC.ProjectID




GO
/****** Object:  StoredProcedure [dbo].[ProjectsSelectAllWithStat]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery1.sql|1172|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql


CREATE   PROCEDURE [dbo].[ProjectsSelectAllWithStat] AS
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
/****** Object:  StoredProcedure [dbo].[ProjectsSelectBusiness]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Batch submitted through debugger: SQLQuery1.sql|1203|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql



CREATE          PROCEDURE [dbo].[ProjectsSelectBusiness]  @Year char(4) ='2004', @Business char(20)='All', @ProjectStage nvarchar(50) =NULL AS
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
/****** Object:  StoredProcedure [dbo].[ProjectsSelectCash]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Batch submitted through debugger: SQLQuery1.sql|1304|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql




CREATE   PROCEDURE [dbo].[ProjectsSelectCash] @Year char(4) ='2004', @Category nvarchar(50) =NULL AS

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
/****** Object:  StoredProcedure [dbo].[ProjectsSelectCVC]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Batch submitted through debugger: SQLQuery1.sql|1273|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql



CREATE  PROCEDURE [dbo].[ProjectsSelectCVC] @Year char(4) ='2004', @Category nvarchar(50) =NULL AS

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
/****** Object:  StoredProcedure [dbo].[ProjectsSelectPillars]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Batch submitted through debugger: SQLQuery1.sql|1336|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql


CREATE     PROCEDURE [dbo].[ProjectsSelectPillars]  @Year char(4) ='2004', @ProjectStage nvarchar(50)=NULL, @Pillars char(20), @sortColumn char(20) = NULL AS

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
/****** Object:  StoredProcedure [dbo].[ProjectsSelectPlant]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery1.sql|1402|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql


CREATE      PROCEDURE [dbo].[ProjectsSelectPlant]  @Year char(4) ='2004', @Plant char(20)='All', @ProjectStage nvarchar(50) =NULL, @sortColumn char(20) = NULL  AS

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
/****** Object:  StoredProcedure [dbo].[ProjectsSelectSC]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Batch submitted through debugger: SQLQuery1.sql|1466|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql




CREATE   PROCEDURE [dbo].[ProjectsSelectSC] @Year char(4) ='2004', @Category nvarchar(50) =NULL AS

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
/****** Object:  StoredProcedure [dbo].[ProjectsSelectTDCElement]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery1.sql|1499|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql


CREATE     PROCEDURE [dbo].[ProjectsSelectTDCElement]  @Year char(4) ='2004', @TDCElement char(20)='All', @ProjectStage nvarchar(50) =NULL, @sortColumn char(20) = NULL  AS
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
/****** Object:  StoredProcedure [dbo].[ProjectsSelectTDCSubElement]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery1.sql|1563|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql


CREATE      PROCEDURE [dbo].[ProjectsSelectTDCSubElement]  @Year char(4) ='2004', @TDCSubElement char(20)='All',@ProjectStage nvarchar(50) =NULL, @sortColumn char(20) = NULL  AS
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
/****** Object:  StoredProcedure [dbo].[ProjectsSelectYear]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery1.sql|1654|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql


CREATE PROCEDURE [dbo].[ProjectsSelectYear] @Year char(4) ='2004', @ProjectStage nvarchar(50) =NULL AS
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
/****** Object:  StoredProcedure [dbo].[ProjectsSelectYearCDSN]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Batch submitted through debugger: SQLQuery1.sql|1694|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql




CREATE  PROCEDURE [dbo].[ProjectsSelectYearCDSN] @Year char(4) ='2004', @ProjectStage nvarchar(50) =NULL AS
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
/****** Object:  StoredProcedure [dbo].[ProjectsSelectYearWithStat]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery1.sql|1750|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql


CREATE    PROCEDURE [dbo].[ProjectsSelectYearWithStat] @Year char(4) ='2004', @ProjectStage nvarchar(50) =NULL AS
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
/****** Object:  StoredProcedure [dbo].[ProjectSumAll]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Batch submitted through debugger: SQLQuery1.sql|504|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql


CREATE  PROCEDURE [dbo].[ProjectSumAll] AS
SELECT     COUNT(tblProjects.ProjectName) AS [No of Projects], SUM(tblTDC.TotalAdjustedAmt) AS [Total Adjusted Amount], 
                      SUM(tblProjects.RecoverableLosses) AS [Total Recoverable Losses], SUM(tblTDC.ProbAdjustedAmt) AS [Probability Adjusted Amount], 
                      SUM(tblTDC.TimeAdjustedAmt) AS [Time Adjusted Amount]
FROM   tblProjects RIGHT OUTER JOIN tblTDC on tblProjects.ProjectID = tblTDC.ProjectID




GO
/****** Object:  StoredProcedure [dbo].[ProjectSumBusiness]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Batch submitted through debugger: SQLQuery1.sql|529|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql


CREATE PROCEDURE [dbo].[ProjectSumBusiness] @Year char(4), @Business char(20)='All',@ProjectStage nvarchar(50) =NULL AS

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
/****** Object:  StoredProcedure [dbo].[ProjectSumCash]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Batch submitted through debugger: SQLQuery1.sql|680|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql


CREATE    PROCEDURE [dbo].[ProjectSumCash] @Year char(4), @Category nvarchar(50) =NULL  AS
SELECT     COUNT(tblProjects.ProjectName) AS [No of Projects], SUM( tblCash.CashSavings) AS [Total Cash Savings], 
                      SUM( tblCash.CashProbAdjAmt) AS [Total Prob Adjusted Cash Savings]
FROM   tblProjects RIGHT OUTER JOIN tblCash on tblProjects.ProjectID = tblCash.ProjectID
WHERE ((tblProjects.SavingsStartYear = @Year and tblProjects.SavingsStartMonth>6) 
	or (tblProjects.SavingsStartYear = @Year+1 and tblProjects.SavingsStartMonth<=6)) 
AND tblProjects.Category = COALESCE(@Category,  tblProjects.Category)
AND tblCash.CashElement<> NULL



GO
/****** Object:  StoredProcedure [dbo].[ProjectSumCVC]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Batch submitted through debugger: SQLQuery1.sql|650|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql


CREATE    PROCEDURE [dbo].[ProjectSumCVC] @Year char(4), @Category nvarchar(50) =NULL  AS
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
/****** Object:  StoredProcedure [dbo].[ProjectSumPillars]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Batch submitted through debugger: SQLQuery1.sql|707|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql

CREATE         PROCEDURE [dbo].[ProjectSumPillars] @Year char(4) ='2004', @ProjectStage nvarchar(50)=NULL, @Pillars char(20) AS

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
/****** Object:  StoredProcedure [dbo].[ProjectSumPlant]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Batch submitted through debugger: SQLQuery1.sql|788|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql


CREATE     PROCEDURE [dbo].[ProjectSumPlant] @Year char(4), @Plant char(20)='All',@ProjectStage nvarchar(50) =NULL AS
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
/****** Object:  StoredProcedure [dbo].[ProjectSumSC]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Batch submitted through debugger: SQLQuery1.sql|872|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql


CREATE    PROCEDURE [dbo].[ProjectSumSC] @Year char(4), @Category nvarchar(50) =NULL  AS
SELECT     COUNT(tblProjects.ProjectName) AS [No of Projects], SUM(tblSC.SCTimeEffect) AS [Total Supply Chain Effect]
FROM   tblProjects RIGHT OUTER JOIN tblSC on tblProjects.ProjectID = tblSC.ProjectID
WHERE ((tblProjects.SavingsStartYear = @Year and tblProjects.SavingsStartMonth>6) 
	or (tblProjects.SavingsStartYear = @Year+1 and tblProjects.SavingsStartMonth<=6)) 
AND tblProjects.Category = COALESCE(@Category,  tblProjects.Category)
AND (tblSC.SupplyChain<> NULL or tblSC.SCElement<> NULL)



GO
/****** Object:  StoredProcedure [dbo].[ProjectSumTDCElement]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Batch submitted through debugger: SQLQuery1.sql|898|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql


CREATE     PROCEDURE [dbo].[ProjectSumTDCElement] @Year char(4), @TDCElement char(20)='All',@ProjectStage nvarchar(50) =NULL AS
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
/****** Object:  StoredProcedure [dbo].[ProjectSumTDCSubElement]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Batch submitted through debugger: SQLQuery1.sql|982|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql


CREATE      PROCEDURE [dbo].[ProjectSumTDCSubElement] @Year char(4), @TDCSubElement char(20)='All',@ProjectStage nvarchar(50) =NULL AS
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
/****** Object:  StoredProcedure [dbo].[ProjectSumYearAll]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Batch submitted through debugger: SQLQuery1.sql|1107|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql


CREATE    PROCEDURE [dbo].[ProjectSumYearAll] @Year char(4), @ProjectStage nvarchar(50) =NULL  AS
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
/****** Object:  StoredProcedure [dbo].[Report_Ageing]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Report_Ageing]
(
@ProcessID int = NULL,
@LocationID int = NULL
)

AS
BEGIN

if @ProcessID = 0  Select @ProcessID = NULL
if @LocationID = 0  Select @LocationID = NULL

create table #grouping
(age char(25),
open_Issues int,
close_Issues int,
total int)

create table #days
(age int,
open_Issue char,
close_Issue char,
)

truncate table #grouping

insert #days
select age = datediff(day, initiationdate, getdate()),
open_Issue = replicate('Y',(1-(isdate(actualresolutiondate)*2))),
close_Issue = replicate('Y',(isdate(actualresolutiondate)*2)-1)
from issues
WHERE ProcessID = COALESCE(@ProcessID, ProcessID) AND
LocationID = COALESCE(@LocationID,LocationID)


insert #grouping
select age = '0-15 Days',
open_Issues = count(open_Issue),
close_Issues = count(close_Issue),
total = count(1)
from #days
where age < 16

insert #grouping
select age = '15-30 Days',
open_Issues = count(open_Issue),
close_Issues = count(close_Issue),
total = count(1)
from #days
where age > 16 and age <31

insert #grouping
select age = '30+ Days',
open_Issues = count(open_Issue),
close_Issues = count(close_Issue),
total = count(1)
from #days
where age > 30

Select * from  #grouping

END


GO
/****** Object:  StoredProcedure [dbo].[Report_Ageing_all_Issues]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Report_Ageing_all_Issues]
AS
BEGIN

create table #grouping
(age char(25),
open_Issues int,
close_Issues int,
total int)

create table #days
(age int,
open_Issue char,
close_Issue char,
)

truncate table #grouping

insert #days
select age = datediff(day, initiationdate, getdate()),
open_Issue = replicate('Y',(1-(isdate(actualresolutiondate)*2))),
close_Issue = replicate('Y',(isdate(actualresolutiondate)*2)-1)
from issues

insert #grouping
select age = '0-15 Days',
open_Issues = count(open_Issue),
close_Issues = count(close_Issue),
total = count(1)
from #days
where age < 16

insert #grouping
select age = '15-30 Days',
open_Issues = count(open_Issue),
close_Issues = count(close_Issue),
total = count(1)
from #days
where age > 16 and age <31

insert #grouping
select age = '30+ Days',
open_Issues = count(open_Issue),
close_Issues = count(close_Issue),
total = count(1)
from #days
where age > 30

Select * from  #grouping

END


GO
/****** Object:  StoredProcedure [dbo].[Report_Ageing_by_me]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Report_Ageing_by_me]
(
@Username nvarchar(256)
)

AS
BEGIN

declare @IssueInitiatorID uniqueidentifier
Select @IssueInitiatorID=NULL
SELECT  @IssueInitiatorID = UserId FROM dbo.Users WHERE LOWER(@Username) = username


create table #grouping
(age char(25),
open_Issues int,
close_Issues int,
total int)

create table #days
(age int,
open_Issue char,
close_Issue char,
)

truncate table #grouping

insert #days
select age = datediff(day, initiationdate, getdate()),
open_Issue = replicate('Y',(1-(isdate(actualresolutiondate)*2))),
close_Issue = replicate('Y',(isdate(actualresolutiondate)*2)-1)
from issues
WHERE IssueInitiatorID = @IssueInitiatorID


insert #grouping
select age = '0-15 Days',
open_Issues = count(open_Issue),
close_Issues = count(close_Issue),
total = count(1)
from #days
where age < 16

insert #grouping
select age = '15-30 Days',
open_Issues = count(open_Issue),
close_Issues = count(close_Issue),
total = count(1)
from #days
where age > 16 and age <31

insert #grouping
select age = '30+ Days',
open_Issues = count(open_Issue),
close_Issues = count(close_Issue),
total = count(1)
from #days
where age > 30

Select * from  #grouping

END


GO
/****** Object:  StoredProcedure [dbo].[Report_Ageing_to_me]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Report_Ageing_to_me]
(
@Username nvarchar(256)
)

AS
BEGIN

declare @IssueAssignedID uniqueidentifier
SELECT @IssueAssignedID=NULL
SELECT  @IssueAssignedID = UserId FROM dbo.Users WHERE LOWER(@Username) = username


create table #grouping
(age char(25),
open_Issues int,
close_Issues int,
total int)

create table #days
(age int,
open_Issue char,
close_Issue char,
)

truncate table #grouping

insert #days
select age = datediff(day, initiationdate, getdate()),
open_Issue = replicate('Y',(1-(isdate(actualresolutiondate)*2))),
close_Issue = replicate('Y',(isdate(actualresolutiondate)*2)-1)
from issues
WHERE IssueAssignedID = @IssueAssignedID


insert #grouping
select age = '0-15 Days',
open_Issues = count(open_Issue),
close_Issues = count(close_Issue),
total = count(1)
from #days
where age < 16

insert #grouping
select age = '15-30 Days',
open_Issues = count(open_Issue),
close_Issues = count(close_Issue),
total = count(1)
from #days
where age > 16 and age <31

insert #grouping
select age = '30+ Days',
open_Issues = count(open_Issue),
close_Issues = count(close_Issue),
total = count(1)
from #days
where age > 30

Select * from  #grouping

END


GO
/****** Object:  StoredProcedure [dbo].[Report_Severity]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Report_Severity]
(
@ProcessID int = NULL,
@LocationID int = NULL
)
AS
BEGIN

if @ProcessID = 0  Select @ProcessID = NULL
if @LocationID = 0  Select @LocationID = NULL

create table #grouping
(age char(25),
low_Issues int,
medium_Issues int,
high_Issues int,
total int)

create table #days
(age int,
low_Issue char,
medium_Issue char,
high_Issue char
)

truncate table #grouping

insert #days
select age = datediff(day, initiationdate, getdate()),
low_Issue = replicate('Y',(charindex('Low',SeverityLevel)*2)-1),
medium_Issue = replicate('Y',(charindex('Medium',SeverityLevel)*2)-1),
high_Issue = replicate('Y',(charindex('High',SeverityLevel)*2)-1)
from issues
WHERE ProcessID = COALESCE(@ProcessID, ProcessID) AND
LocationID = COALESCE(@LocationID,LocationID)

insert #grouping
select age = '0-15 Days',
low_Issues = count(low_Issue),
medium_Issues = count(medium_Issue),
high_Issues = count(high_Issue),
total = count(1)
from #days
where age < 16

insert #grouping
select age = '15-30 Days',
low_Issues = count(low_Issue),
medium_Issues = count(medium_Issue),
high_Issues = count(high_Issue),
total = count(1)
from #days
where age > 16 and age<31

insert #grouping
select age = '30+ Days',
low_Issues = count(low_Issue),
medium_Issues = count(medium_Issue),
high_Issues = count(high_Issue),
total = count(1)
from #days
where age > 30
--Select * from #days
Select * from  #grouping

END


GO
/****** Object:  StoredProcedure [dbo].[SearchProjectLeader]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery1.sql|1794|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql


CREATE   PROCEDURE [dbo].[SearchProjectLeader] @QueryString NVarChar(50) AS
SELECT     tblProjects.ProjectID, tblProjects.Business, tblProjects.BusinessForm, tblProjects.CostBucket, tblProjects.TDCSubElement, tblProjects.ProjectName, 
                      tblPersonnel.ProjectLeader, tblProjects.RecoverableLosses, tblProjects.SavingsStartMonthYearLiteral, 
                      tblProjects.Probability,  
                      tblProjects.Status
FROM         tblPersonnel RIGHT OUTER JOIN
                      tblProjects
		ON tblPersonnel.PersonnelID = tblProjects.ProjectLeaderID
WHERE (tblPersonnel.ProjectLeader LIKE '%' + @QueryString + '%')




GO
/****** Object:  StoredProcedure [dbo].[SearchProjectName]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery1.sql|1823|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql


CREATE   PROCEDURE [dbo].[SearchProjectName] @QueryString NVarChar(50) AS
SELECT     tblProjects.ProjectID, tblProjects.Business, tblProjects.BusinessForm, tblProjects.CostBucket, tblProjects.TDCSubElement, tblProjects.ProjectName, 
                      tblPersonnel.ProjectLeader, tblProjects.RecoverableLosses, tblProjects.SavingsStartMonthYearLiteral, 
                      tblProjects.Probability,  
                      tblProjects.Status
FROM         tblPersonnel RIGHT OUTER JOIN
                      tblProjects
		ON tblPersonnel.PersonnelID = tblProjects.ProjectLeaderID
Where (tblProjects.ProjectName LIKE '%' + @QueryString + '%')




GO
/****** Object:  StoredProcedure [dbo].[SearchStatus]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery1.sql|1852|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql


CREATE   PROCEDURE [dbo].[SearchStatus] @QueryString NVarChar(50) AS
SELECT     tblProjects.ProjectID, tblProjects.Business, tblProjects.BusinessForm, tblProjects.CostBucket, tblProjects.TDCSubElement, tblProjects.ProjectName, 
                      tblPersonnel.ProjectLeader, tblProjects.RecoverableLosses, tblProjects.SavingsStartMonthYearLiteral, 
                      tblProjects.Probability,  
                      tblProjects.Status
FROM         tblPersonnel RIGHT OUTER JOIN
                      tblProjects
		ON tblPersonnel.PersonnelID = tblProjects.ProjectLeaderID
WHERE (tblProjects.Status LIKE '%' + @QueryString + '%')




GO
/****** Object:  StoredProcedure [dbo].[SelectBusinessVolume]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Batch submitted through debugger: SQLQuery1.sql|1881|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql


CREATE  PROCEDURE [dbo].[SelectBusinessVolume] AS
SELECT Business, BusinessForm, CashSavings as Volume FROM tblBusinessVolume




GO
/****** Object:  StoredProcedure [dbo].[SelectBusinessVolumeTotal]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Batch submitted through debugger: SQLQuery1.sql|1903|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql


CREATE PROCEDURE [dbo].[SelectBusinessVolumeTotal] AS
SELECT Business, TotalVolume FROM tblBusinessVolumeTotal




GO
/****** Object:  StoredProcedure [dbo].[SelectReport]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Batch submitted through debugger: SQLQuery1.sql|1925|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql


CREATE  PROCEDURE [dbo].[SelectReport] @ReportID int  AS
SELECT ReportText From tblCustomReport where ReportID = @ReportID




GO
/****** Object:  StoredProcedure [dbo].[SelectReportList]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Batch submitted through debugger: SQLQuery1.sql|1947|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql


CREATE  PROCEDURE [dbo].[SelectReportList] AS
SELECT ReportID, ReportName 
From tblCustomReport
Where ReportName <> ""




GO
/****** Object:  StoredProcedure [dbo].[SummaryBusiness]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Batch submitted through debugger: SQLQuery1.sql|1971|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql


CREATE       PROCEDURE [dbo].[SummaryBusiness] @Probability int=50, @Year char(4) AS
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
/****** Object:  StoredProcedure [dbo].[SummaryMonthlyBusiness]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Batch submitted through debugger: SQLQuery1.sql|2101|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql


CREATE     PROCEDURE [dbo].[SummaryMonthlyBusiness] @Probability int=50, @Year char(4)  AS
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
/****** Object:  StoredProcedure [dbo].[SummaryMonthlyPlant]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Batch submitted through debugger: SQLQuery1.sql|2260|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql


CREATE         PROCEDURE [dbo].[SummaryMonthlyPlant] @Probability int=50,  @Year char(4)  AS
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
/****** Object:  StoredProcedure [dbo].[SummaryPlant]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Batch submitted through debugger: SQLQuery1.sql|2340|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql


CREATE     PROCEDURE  [dbo].[SummaryPlant] @Probability int=50, @Year char(4) AS
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
/****** Object:  StoredProcedure [dbo].[TestProjectsSelectBusiness]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Batch submitted through debugger: SQLQuery1.sql|2416|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql


CREATE        PROCEDURE [dbo].[TestProjectsSelectBusiness]  @Year char(4) ='2004', @Business char(20)='All', @ProjectStage nvarchar(50) =NULL AS
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
/****** Object:  StoredProcedure [dbo].[TestSum]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Batch submitted through debugger: SQLQuery1.sql|2466|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql


CREATE  PROCEDURE [dbo].[TestSum] @ReportID int  AS
SELECT ReportText From tblCustomReport where ReportID = @ReportID




GO
/****** Object:  StoredProcedure [dbo].[UpdateBusinessVolume]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Batch submitted through debugger: SQLQuery1.sql|2616|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql


CREATE PROCEDURE [dbo].[UpdateBusinessVolume]
	(@Business nvarchar(50),
	@BusinessForm nvarchar(50),
	@CashSavings float)
AS
UPDATE tblBusinessVolume
SET Business=@Business,BusinessForm=@BusinessForm,CashSavings=@CashSavings
WHERE BusinessForm=@BusinessForm




GO
/****** Object:  StoredProcedure [dbo].[UpdateProject]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Batch submitted through debugger: SQLQuery1.sql|2644|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql


CREATE Procedure [dbo].[UpdateProject] 	
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
/****** Object:  StoredProcedure [dbo].[UpdatetblTDC]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Batch submitted through debugger: SQLQuery1.sql|2820|0|C:\Users\abhiarya\AppData\Local\Temp\~vs94DE.sql



CREATE     PROCEDURE [dbo].[UpdatetblTDC] AS
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
/****** Object:  Table [dbo].[tblBusinessSummary]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBusinessSummary](
	[tdcelement] [nvarchar](50) NULL,
	[t1] [int] NULL,
	[t2] [int] NULL,
	[t3] [int] NULL,
	[t4] [int] NULL,
	[t5] [int] NULL,
	[t6] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCustomReport]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustomReport](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[ReportName] [nvarchar](50) NULL,
	[ReportText] [nvarchar](4000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDeletedProjects]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDeletedProjects](
	[ProjectID] [int] NULL,
	[ProjectName] [nvarchar](200) NULL,
	[ProjectLeaderID] [int] NULL,
	[CommittedForecast] [bit] NULL,
	[Status] [nvarchar](50) NULL,
	[ProjectStartYear] [smallint] NULL,
	[ProjectStartMonth] [smallint] NULL,
	[ProjectStartMonthYearLiteral] [nvarchar](10) NULL,
	[SavingsStartYear] [smallint] NULL,
	[SavingsStartMonth] [smallint] NULL,
	[SavingsStartMonthYearLiteral] [nvarchar](10) NULL,
	[RecoverableLosses] [float] NULL,
	[CostBucket] [nvarchar](50) NULL,
	[CostAmt] [float] NULL,
	[Probability] [float] NULL,
	[RowCreatedDateTime] [smalldatetime] NULL,
	[Category] [nvarchar](50) NULL,
	[Plant] [nvarchar](50) NULL,
	[Business] [nvarchar](50) NULL,
	[LossType] [nvarchar](50) NULL,
	[Description] [nvarchar](255) NULL,
	[ReasonForChange] [nvarchar](255) NULL,
	[BusinessForm] [nvarchar](50) NULL,
	[TDCSubElement] [nvarchar](50) NULL,
	[ImpliedSavStartMonth] [smallint] NULL,
	[ImpliedSavStartYear] [smallint] NULL,
	[ProjectStage] [nvarchar](50) NULL,
	[Department] [nvarchar](50) NULL,
	[OtherBusiness] [nvarchar](20) NULL,
	[Standards] [bit] NULL,
	[IsTDC] [bit] NULL,
	[IsCash] [bit] NULL,
	[IsCVC] [bit] NULL,
	[IsSC] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblFinancialMonth]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFinancialMonth](
	[FinancialMonth] [int] NOT NULL,
	[NoMonths] [float] NULL,
	[M1] [int] NOT NULL,
	[M2] [int] NULL,
	[M3] [int] NULL,
	[M4] [int] NULL,
	[M5] [int] NULL,
	[M6] [int] NULL,
	[M7] [int] NULL,
	[M8] [int] NULL,
	[M9] [int] NULL,
	[M10] [int] NULL,
	[M11] [int] NULL,
	[M12] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblFinancialMonthReverse]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFinancialMonthReverse](
	[FinancialMonth] [int] NULL,
	[NoMonths] [float] NULL,
	[M1] [int] NULL,
	[M2] [int] NULL,
	[M3] [int] NULL,
	[M4] [int] NULL,
	[M5] [int] NULL,
	[M6] [int] NULL,
	[M7] [int] NULL,
	[M8] [int] NULL,
	[M9] [int] NULL,
	[M10] [int] NULL,
	[M11] [int] NULL,
	[M12] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPersonnel]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPersonnel](
	[PersonnelID] [int] NULL,
	[ProjectLeader] [nvarchar](75) NULL,
	[TeamGroupID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProjectPersonnel]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProjectPersonnel](
	[ProjectID] [int] NULL,
	[PersonnelID] [int] NULL,
	[RowCreatedDateTime] [smalldatetime] NULL,
	[RowCreatedBy] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProjects]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProjects](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [nvarchar](200) NULL,
	[ProjectLeaderID] [int] NULL,
	[CommittedForecast] [bit] NULL,
	[Status] [nvarchar](50) NULL,
	[ProjectStartYear] [smallint] NULL,
	[ProjectStartMonth] [smallint] NULL,
	[ProjectStartMonthYearLiteral] [nvarchar](10) NULL,
	[SavingsStartYear] [smallint] NULL,
	[SavingsStartMonth] [smallint] NULL,
	[SavingsStartMonthYearLiteral] [nvarchar](10) NULL,
	[RecoverableLosses] [float] NULL,
	[CostBucket] [nvarchar](50) NULL,
	[CostAmt] [float] NULL,
	[Probability] [float] NULL,
	[RowCreatedDateTime] [smalldatetime] NULL,
	[Category] [nvarchar](50) NULL,
	[Plant] [nvarchar](50) NULL,
	[Business] [nvarchar](50) NULL,
	[LossType] [nvarchar](50) NULL,
	[Description] [nvarchar](255) NULL,
	[ReasonForChange] [nvarchar](255) NULL,
	[BusinessForm] [nvarchar](50) NULL,
	[TDCSubElement] [nvarchar](50) NULL,
	[ImpliedSavStartMonth] [smallint] NULL,
	[ImpliedSavStartYear] [smallint] NULL,
	[ProjectStage] [nvarchar](50) NULL,
	[Department] [nvarchar](50) NULL,
	[OtherBusiness] [nvarchar](20) NULL,
	[Standards] [bit] NULL,
	[IsTDC] [bit] NULL,
	[IsCash] [bit] NULL,
	[IsCVC] [bit] NULL,
	[isSC] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblReportTags]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReportTags](
	[EMPS] [nvarchar](50) NULL,
	[EMPSTag] [nvarchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTDC]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTDC](
	[TDCId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[FiscalYear] [int] NULL,
	[ProbAdjustedAmt] [int] NULL,
	[TimeAdjustedAmt] [int] NULL,
	[TotalAdjustedAmt] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTeamGroups]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTeamGroups](
	[TeamGroupID] [int] NOT NULL,
	[TeamGroupName] [nvarchar](50) NULL,
	[GroupGoalAmt] [float] NULL,
	[ActiveYN] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTeamMonthlySpending]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTeamMonthlySpending](
	[TeamID] [int] NULL,
	[SpendingYear] [smallint] NULL,
	[SpendingMonth] [smallint] NULL,
	[SpendingMonthYearLiteral] [nvarchar](10) NULL,
	[SpendingAmt] [float] NULL,
	[RowCreatedDateTime] [smalldatetime] NULL,
	[RowCreatedBy] [nvarchar](50) NULL,
	[RowModifiedDateTime] [smalldatetime] NULL,
	[RowModifiedBy] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTeams]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTeams](
	[TeamID] [int] NOT NULL,
	[TeamGroupID] [int] NULL,
	[TeamName] [nvarchar](50) NULL,
	[TeamLeaderID] [int] NULL,
	[TeamSponsorID] [int] NULL,
	[TeamFinanceRepID] [int] NULL,
	[TeamBaseCaseAmt] [float] NULL,
	[TeamIdealStateAmt] [float] NULL,
	[TeamCBNGoalAmt] [float] NULL,
	[ActiveYN] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tProjectAttachments]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tProjectAttachments](
	[AttachmentId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[FileName] [nvarchar](250) NOT NULL,
	[ContentType] [nvarchar](50) NOT NULL,
	[Attachment] [image] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tProjects]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tProjects](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [nvarchar](max) NOT NULL,
	[BusinessUnitID] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[Direct_Indirect_Capex] [nchar](10) NOT NULL,
	[PL_Capex] [nchar](10) NOT NULL,
	[ProjectLeader] [int] NOT NULL,
	[FinanceLeader] [int] NOT NULL,
 CONSTRAINT [PK_vProjects] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tProjectSavings]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tProjectSavings](
	[ProjectSavingsID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[ProjectSavings] [int] NOT NULL,
	[ProjectBeginMonth] [int] NOT NULL,
	[ProjectBeginYear] [int] NOT NULL,
	[SavingBeginMonth] [int] NOT NULL,
	[SavingBeginYear] [int] NOT NULL,
	[SavingsEndMonth] [int] NOT NULL,
	[SavingsEndYear] [int] NOT NULL,
	[TotalAnnualSavings] [float] NOT NULL,
	[OneOffSavings] [float] NOT NULL,
	[Currency] [int] NOT NULL,
	[Risk] [int] NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
	[CommittedToForecast] [bit] NULL,
 CONSTRAINT [PK_tProjectSavings] PRIMARY KEY CLUSTERED 
(
	[ProjectSavingsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tProjectSavingsCal]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tProjectSavingsCal](
	[ProjectSavingCalcID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[FiscalYear] [int] NOT NULL,
	[ProbabilityAdjAmt] [float] NOT NULL,
	[TimeAdjAmt] [float] NOT NULL,
	[TotalAdjAmt] [float] NOT NULL,
 CONSTRAINT [PK_tProjectSavingsCal] PRIMARY KEY CLUSTERED 
(
	[ProjectSavingCalcID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tProjectsCost]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tProjectsCost](
	[ProjectCostID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[Capex] [float] NOT NULL,
	[WorkingCapital] [float] NOT NULL,
	[RegulatoryCost] [float] NOT NULL,
	[SampleCost] [float] NOT NULL,
	[RDcost] [float] NOT NULL,
	[QAQCCost] [float] NOT NULL,
	[AuditCost] [float] NOT NULL,
	[OtherCost] [float] NOT NULL,
	[TotalCost] [float] NOT NULL,
	[CapexCurrency] [int] NOT NULL,
	[WorkingCapitalCurrency] [int] NOT NULL,
	[RegulatoryCostCurrency] [int] NOT NULL,
	[SampleCostCurrency] [int] NOT NULL,
	[RDcostCurrency] [int] NOT NULL,
	[QAQCCostCurrency] [int] NOT NULL,
	[AuditCostCurrency] [int] NOT NULL,
	[OtherCostCurrency] [int] NOT NULL,
	[TotalCostCurrency] [int] NOT NULL,
	[CapexJustification] [nvarchar](max) NOT NULL,
	[WorkingCapitalJustification] [nvarchar](max) NOT NULL,
	[RegulatoryCostJustification] [nvarchar](max) NOT NULL,
	[SampleCostJustification] [nvarchar](max) NOT NULL,
	[RDcostJustification] [nvarchar](max) NOT NULL,
	[QAQCCostJustification] [nvarchar](max) NOT NULL,
	[AuditCostJustification] [nvarchar](max) NOT NULL,
	[OtherCostJustification] [nvarchar](max) NOT NULL,
	[TotalCostJustification] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tProjectCosts] PRIMARY KEY CLUSTERED 
(
	[ProjectCostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[uProjectCategory]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uProjectCategory](
	[ProjectCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_uProjectCategory] PRIMARY KEY CLUSTERED 
(
	[ProjectCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[uProjectDosage]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uProjectDosage](
	[ProjectDosageID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[DosageID] [int] NOT NULL,
 CONSTRAINT [PK_uProjectDosage] PRIMARY KEY CLUSTERED 
(
	[ProjectDosageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[uProjectExpenseHead]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uProjectExpenseHead](
	[ProjectExpenseHeadID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[ExpenseHeadID] [int] NOT NULL,
 CONSTRAINT [PK_uProjectExpenseHead] PRIMARY KEY CLUSTERED 
(
	[ProjectExpenseHeadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[uProjectMfgCode]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uProjectMfgCode](
	[ProjectMfgCodeID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[MfgCodeID] [int] NOT NULL,
 CONSTRAINT [PK_uProjectMfgCode] PRIMARY KEY CLUSTERED 
(
	[ProjectMfgCodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[uProjectPackCode]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uProjectPackCode](
	[ProjectPackCodeID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[PackCodeID] [int] NOT NULL,
 CONSTRAINT [PK_uProjectPackCode] PRIMARY KEY CLUSTERED 
(
	[ProjectPackCodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[uProjectPersonnel]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uProjectPersonnel](
	[ProjectPersonnelID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[PersonnelID] [int] NOT NULL,
 CONSTRAINT [PK_uProjectPersonnel] PRIMARY KEY CLUSTERED 
(
	[ProjectPersonnelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[uProjectTherapy]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uProjectTherapy](
	[ProjectTherapyID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[TherapyID] [int] NOT NULL,
 CONSTRAINT [PK_uProjectTherapy] PRIMARY KEY CLUSTERED 
(
	[ProjectTherapyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[vBusinessUnit]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vBusinessUnit](
	[BusinessUnitID] [int] IDENTITY(1,1) NOT NULL,
	[BusinessUnit] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_vBusinessUnit] PRIMARY KEY CLUSTERED 
(
	[BusinessUnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[vCategory]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vCategory](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Category] [nvarchar](max) NOT NULL,
	[DepartmentID] [int] NULL,
 CONSTRAINT [PK_vCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[vCurrency]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vCurrency](
	[CurrencyID] [int] IDENTITY(1,1) NOT NULL,
	[Currency] [nvarchar](max) NOT NULL,
	[CurrencyExchange] [float] NOT NULL,
 CONSTRAINT [PK_vCurrency] PRIMARY KEY CLUSTERED 
(
	[CurrencyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[vDepartment]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vDepartment](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[Department] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_vDepartment] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[vDosage]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vDosage](
	[DosageID] [int] IDENTITY(1,1) NOT NULL,
	[Dosage] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_vDosage] PRIMARY KEY CLUSTERED 
(
	[DosageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[vExpenseHead]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vExpenseHead](
	[ExpenseHeadID] [int] IDENTITY(1,1) NOT NULL,
	[ExpenseHead] [nvarchar](max) NOT NULL,
	[DirectIndirect] [nvarchar](50) NULL,
 CONSTRAINT [PK_vExpenseHead] PRIMARY KEY CLUSTERED 
(
	[ExpenseHeadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[vMfgCode]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vMfgCode](
	[MfgCodeID] [int] IDENTITY(1,1) NOT NULL,
	[MfgCode] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_vMfgCode] PRIMARY KEY CLUSTERED 
(
	[MfgCodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[vPackCode]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vPackCode](
	[PackCodeID] [int] IDENTITY(1,1) NOT NULL,
	[PackCode] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_vPackCode] PRIMARY KEY CLUSTERED 
(
	[PackCodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[vPersonnel]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vPersonnel](
	[PersonnelID] [int] IDENTITY(1,1) NOT NULL,
	[Personnel] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_vPersonnel] PRIMARY KEY CLUSTERED 
(
	[PersonnelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[vTherapy]    Script Date: 19/07/2014 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vTherapy](
	[TherapyID] [int] IDENTITY(1,1) NOT NULL,
	[Therapy] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_vTherapy] PRIMARY KEY CLUSTERED 
(
	[TherapyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [CPMCipla] SET  READ_WRITE 
GO
