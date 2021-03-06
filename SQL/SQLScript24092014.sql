USE [master]
GO
/****** Object:  Database [CPMCipla]    Script Date: 24/09/2014 10:12:48 ******/
CREATE DATABASE [CPMCipla]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CPMCipla', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\CPMCipla.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
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
ALTER DATABASE [CPMCipla] SET AUTO_CLOSE ON 
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
/****** Object:  User [CPM_Admin]    Script Date: 24/09/2014 10:12:48 ******/
CREATE USER [CPM_Admin] FOR LOGIN [CPM_Admin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [aspnet_WebEvent_FullAccess]    Script Date: 24/09/2014 10:12:48 ******/
CREATE ROLE [aspnet_WebEvent_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_ReportingAccess]    Script Date: 24/09/2014 10:12:48 ******/
CREATE ROLE [aspnet_Roles_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_FullAccess]    Script Date: 24/09/2014 10:12:48 ******/
CREATE ROLE [aspnet_Roles_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_BasicAccess]    Script Date: 24/09/2014 10:12:48 ******/
CREATE ROLE [aspnet_Roles_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_ReportingAccess]    Script Date: 24/09/2014 10:12:48 ******/
CREATE ROLE [aspnet_Profile_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_FullAccess]    Script Date: 24/09/2014 10:12:48 ******/
CREATE ROLE [aspnet_Profile_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_BasicAccess]    Script Date: 24/09/2014 10:12:48 ******/
CREATE ROLE [aspnet_Profile_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_ReportingAccess]    Script Date: 24/09/2014 10:12:48 ******/
CREATE ROLE [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_FullAccess]    Script Date: 24/09/2014 10:12:48 ******/
CREATE ROLE [aspnet_Personalization_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_BasicAccess]    Script Date: 24/09/2014 10:12:48 ******/
CREATE ROLE [aspnet_Personalization_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_ReportingAccess]    Script Date: 24/09/2014 10:12:48 ******/
CREATE ROLE [aspnet_Membership_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_FullAccess]    Script Date: 24/09/2014 10:12:48 ******/
CREATE ROLE [aspnet_Membership_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_BasicAccess]    Script Date: 24/09/2014 10:12:48 ******/
CREATE ROLE [aspnet_Membership_BasicAccess]
GO
ALTER ROLE [db_owner] ADD MEMBER [CPM_Admin]
GO
/****** Object:  Schema [aspnet_Membership_BasicAccess]    Script Date: 24/09/2014 10:12:49 ******/
CREATE SCHEMA [aspnet_Membership_BasicAccess]
GO
/****** Object:  Schema [aspnet_Membership_FullAccess]    Script Date: 24/09/2014 10:12:49 ******/
CREATE SCHEMA [aspnet_Membership_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_ReportingAccess]    Script Date: 24/09/2014 10:12:49 ******/
CREATE SCHEMA [aspnet_Membership_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Personalization_BasicAccess]    Script Date: 24/09/2014 10:12:49 ******/
CREATE SCHEMA [aspnet_Personalization_BasicAccess]
GO
/****** Object:  Schema [aspnet_Personalization_FullAccess]    Script Date: 24/09/2014 10:12:49 ******/
CREATE SCHEMA [aspnet_Personalization_FullAccess]
GO
/****** Object:  Schema [aspnet_Personalization_ReportingAccess]    Script Date: 24/09/2014 10:12:49 ******/
CREATE SCHEMA [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Profile_BasicAccess]    Script Date: 24/09/2014 10:12:49 ******/
CREATE SCHEMA [aspnet_Profile_BasicAccess]
GO
/****** Object:  Schema [aspnet_Profile_FullAccess]    Script Date: 24/09/2014 10:12:49 ******/
CREATE SCHEMA [aspnet_Profile_FullAccess]
GO
/****** Object:  Schema [aspnet_Profile_ReportingAccess]    Script Date: 24/09/2014 10:12:49 ******/
CREATE SCHEMA [aspnet_Profile_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Roles_BasicAccess]    Script Date: 24/09/2014 10:12:49 ******/
CREATE SCHEMA [aspnet_Roles_BasicAccess]
GO
/****** Object:  Schema [aspnet_Roles_FullAccess]    Script Date: 24/09/2014 10:12:49 ******/
CREATE SCHEMA [aspnet_Roles_FullAccess]
GO
/****** Object:  Schema [aspnet_Roles_ReportingAccess]    Script Date: 24/09/2014 10:12:49 ******/
CREATE SCHEMA [aspnet_Roles_ReportingAccess]
GO
/****** Object:  Schema [aspnet_WebEvent_FullAccess]    Script Date: 24/09/2014 10:12:49 ******/
CREATE SCHEMA [aspnet_WebEvent_FullAccess]
GO
/****** Object:  StoredProcedure [dbo].[cCopyProject]    Script Date: 24/09/2014 10:12:49 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[cCopyProject] 
@ProjectID int 
AS
Declare @ProjectIdentity int
BEGIN TRAN
-- Insert record in tblProjects
INSERT INTO tProjects 
SELECT ProjectName, DepartmentID , Direct_Indirect_Capex , PL_Capex , ProjectLeader , FinanceLeader, ExpenseHeadID, ProjectClassification, ProjectSummary, BusinessUnit, BusinessUnitID, Active
FROM tProjects 
WHERE ProjectID = @ProjectID

SELECT @ProjectIdentity = @@Identity

-- data points for tProjectSavings
INSERT INTO tProjectSavings
SELECT @ProjectIdentity ,ProjectBeginMonth ,	ProjectBeginYear ,	SavingBeginMonth ,SavingBeginYear ,	SavingsEndMonth ,	SavingsEndYear , TotalAnnualSavings , OneOffSavings , Currency , Risk , Status , CommittedToForecast, ProjectEndMonth, ProjectEndYear, Stage
FROM tProjectSavings
WHERE ProjectID = @ProjectID

-- data points for tProjectSavingsCal
INSERT INTO tProjectSavingsCal
SELECT	@ProjectIdentity , FiscalYear , ProbabilityAdjAmt , TimeAdjAmt , TotalAdjAmt 
FROM tProjectSavingsCal
WHERE ProjectID = @ProjectID

-- data points for tProjectsCost
INSERT INTO tProjectsCost
SELECT @ProjectIdentity , Capex ,WorkingCapital ,RegulatoryCost ,SampleCost ,RDcost ,QAQCCost ,AuditCost ,OtherCost ,TotalCost ,CapexCurrency ,WorkingCapitalCurrency ,RegulatoryCostCurrency ,SampleCostCurrency ,RDcostCurrency ,QAQCCostCurrency ,AuditCostCurrency ,OtherCostCurrency ,TotalCostCurrency ,CapexJustification ,WorkingCapitalJustification ,RegulatoryCostJustification ,SampleCostJustification ,RDcostJustification ,QAQCCostJustification ,AuditCostJustification ,OtherCostJustification ,TotalCostJustification
FROM tProjectsCost
WHERE ProjectID = @ProjectID

INSERT INTO uProjectTherapy
SELECT @ProjectIdentity , TherapyID
FROM uProjectTherapy
WHERE ProjectID = @ProjectID

INSERT INTO uProjectPersonnel
SELECT @ProjectIdentity ,	PersonnelID
FROM uProjectPersonnel
WHERE ProjectID = @ProjectID

INSERT INTO uProjectPackCode
SELECT @ProjectIdentity ,PackCodeID
FROM uProjectPackCode
WHERE ProjectID = @ProjectID

INSERT INTO uProjectMfgCode
SELECT @ProjectIdentity ,MfgCodeID
FROM uProjectMfgCode
WHERE ProjectID = @ProjectID

INSERT INTO uProjectDosage
SELECT @ProjectIdentity , DosageID 
FROM uProjectDosage
WHERE ProjectID = @ProjectID

INSERT INTO uProjectCategory
SELECT @ProjectIdentity , CategoryID 
FROM uProjectCategory
WHERE ProjectID = @ProjectID

INSERT INTO uProjectBulkCode
SELECT @ProjectIdentity ,BulkCodeID
FROM uProjectBulkCode
WHERE ProjectID = @ProjectID

COMMIT TRAN


GO
/****** Object:  StoredProcedure [dbo].[cDeleteProject]    Script Date: 24/09/2014 10:12:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Abhi Arya
-- Create date: Aug 2014
-- =============================================

CREATE PROCEDURE [dbo].[cDeleteProject]
@ProjectID int
AS
BEGIN TRAN

UPDATE tProjects
SET 
	Active = 0
WHERE ProjectID=@ProjectID

--DELETE FROM uProjectTherapy WHERE ProjectID=@ProjectID
--DELETE FROM uProjectPersonnel WHERE ProjectID=@ProjectID
--DELETE FROM uProjectPackCode WHERE ProjectID=@ProjectID
--DELETE FROM uProjectMfgCode WHERE ProjectID=@ProjectID
--DELETE FROM uProjectDosage WHERE ProjectID=@ProjectID
--DELETE FROM uProjectCategory WHERE ProjectID=@ProjectID
--DELETE FROM uProjectBulkCode WHERE ProjectID=@ProjectID
--DELETE FROM tProjectsCost WHERE ProjectID=@ProjectID
--DELETE FROM tProjectSavingsCal WHERE ProjectID=@ProjectID
--DELETE FROM tProjectSavings WHERE ProjectID=@ProjectID
--DELETE FROM tProjectAttachments WHERE ProjectID=@ProjectID
--DELETE FROM tProjects WHERE ProjectID=@ProjectID

COMMIT TRAN

GO
/****** Object:  StoredProcedure [dbo].[cInsertProject]    Script Date: 24/09/2014 10:12:49 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE Procedure [dbo].[cInsertProject] 	
(
-- data points for tProjects
@ProjectID as int,
@ProjectName nvarchar(max) ,
@DepartmentID int,
@Direct_Indirect_Capex nchar(10) ,
@PL_Capex nchar(10) ,
@ProjectLeader int,
@FinanceLeader int,
@ExpenseHeadID int,
@ProjectClassification nvarchar(50),
@ProjectSummary nvarchar(max),
@BusinessUnit nvarchar(MAX), 
@BusinessUnitID int,
@Active bit=1,
-- data points for tProjectSavings
@ProjectBeginMonth int,
@ProjectBeginYear int,
@SavingBeginMonth int,
@SavingBeginYear int,
@SavingsEndMonth int,
@SavingsEndYear int,
@TotalAnnualSavings float,
@OneOffSavings float,
@Currency int,
@Risk int,
@Status nvarchar(max)=N'Direct' ,
@CommittedToForecast bit=0,
@ProjectEndMonth int,
@ProjectEndYear int,
@Stage nvarchar(max),
-- data points for tProjectSavingsCal
@FiscalYear int,
@ProbabilityAdjAmt float,
@TimeAdjAmt float,
@TotalAdjAmt float,
-- data points for tProjectsCost
@Capex float,
@WorkingCapital float,
@RegulatoryCost float,
@SampleCost float,
@RDcost float,
@QAQCCost float,
@AuditCost float,
@OtherCost float,
@TotalCost float,
@CapexCurrency int,
@WorkingCapitalCurrency int,
@RegulatoryCostCurrency int,
@SampleCostCurrency int,
@RDcostCurrency int,
@QAQCCostCurrency int,
@AuditCostCurrency int,
@OtherCostCurrency int,
@TotalCostCurrency int,
@CapexJustification nvarchar(max) ,
@WorkingCapitalJustification nvarchar(max) ,
@RegulatoryCostJustification nvarchar(max) ,
@SampleCostJustification nvarchar(max) ,
@RDcostJustification nvarchar(max) ,
@QAQCCostJustification nvarchar(max) ,
@AuditCostJustification nvarchar(max) ,
@OtherCostJustification nvarchar(max) ,
@TotalCostJustification nvarchar(max),
-- data points for uProjectTherapy
@TherapyID nvarchar(max),
-- data points for uProjectPersonnel
@PersonnelID nvarchar(max),
-- data points for uProjectPackCode
@PackCodeID nvarchar(max),
-- data points for uProjectMfgCode
@MfgCodeID nvarchar(max),
-- data points for uProjectDosage
@DosageID nvarchar(max),
-- data points for uProjectCategory
@CategoryID nvarchar(max),
-- data points for uProjectBulkCode
@BulkCodeID nvarchar(max)


) 
AS 

BEGIN TRAN
Declare @Value varchar(max)
Declare @ProjectIdentity int

-- data points for tProjects
	INSERT INTO tProjects
	(ProjectName, DepartmentID , Direct_Indirect_Capex , PL_Capex , ProjectLeader , FinanceLeader, ExpenseHeadID, ProjectClassification, ProjectSummary, BusinessUnit, BusinessUnitID, Active ) values
	(@ProjectName, @DepartmentID , @Direct_Indirect_Capex , @PL_Capex , @ProjectLeader , @FinanceLeader, @ExpenseHeadID,@ProjectClassification, @ProjectSummary, @BusinessUnit, @BusinessUnitID, @Active)
	
	select @ProjectIdentity = @@Identity
	
	-- data points for tProjectSavings
	INSERT INTO tProjectSavings
	(ProjectID ,ProjectBeginMonth ,	ProjectBeginYear ,	SavingBeginMonth ,SavingBeginYear ,	SavingsEndMonth ,	SavingsEndYear , TotalAnnualSavings , OneOffSavings , Currency , Risk , Status , CommittedToForecast, ProjectEndMonth, ProjectEndYear, Stage) values
	(@ProjectIdentity , @ProjectBeginMonth ,	@ProjectBeginYear ,	@SavingBeginMonth ,@SavingBeginYear ,	@SavingsEndMonth ,	@SavingsEndYear , @TotalAnnualSavings , @OneOffSavings , @Currency , @Risk , @Status , @CommittedToForecast, @ProjectEndMonth, @ProjectEndYear, @Stage)
	-- data points for tProjectSavingsCal
	INSERT INTO tProjectSavingsCal
	(ProjectID , FiscalYear , ProbabilityAdjAmt , TimeAdjAmt , TotalAdjAmt ) values
	(@ProjectIdentity , @FiscalYear , @ProbabilityAdjAmt , @TimeAdjAmt , @TotalAdjAmt )

	INSERT INTO tProjectSavingsCal
	(ProjectID , FiscalYear , ProbabilityAdjAmt , TimeAdjAmt , TotalAdjAmt ) values
	(@ProjectIdentity , @FiscalYear+1 , @ProbabilityAdjAmt , @TotalAnnualSavings - @TimeAdjAmt , @ProbabilityAdjAmt - @TotalAdjAmt )

	-- data points for tProjectsCost
	INSERT INTO tProjectsCost
	(ProjectID , Capex ,WorkingCapital ,RegulatoryCost ,SampleCost ,RDcost ,QAQCCost ,AuditCost ,OtherCost ,TotalCost ,CapexCurrency ,WorkingCapitalCurrency ,RegulatoryCostCurrency ,SampleCostCurrency ,RDcostCurrency ,QAQCCostCurrency ,AuditCostCurrency ,OtherCostCurrency ,TotalCostCurrency ,CapexJustification ,WorkingCapitalJustification ,RegulatoryCostJustification ,SampleCostJustification ,RDcostJustification ,QAQCCostJustification ,AuditCostJustification ,OtherCostJustification ,TotalCostJustification) values
	(@ProjectIdentity , @Capex ,@WorkingCapital ,@RegulatoryCost ,@SampleCost ,@RDcost ,@QAQCCost ,@AuditCost ,@OtherCost ,@TotalCost ,@CapexCurrency ,@WorkingCapitalCurrency ,@RegulatoryCostCurrency ,@SampleCostCurrency ,@RDcostCurrency ,@QAQCCostCurrency ,@AuditCostCurrency ,@OtherCostCurrency ,@TotalCostCurrency ,@CapexJustification ,@WorkingCapitalJustification ,@RegulatoryCostJustification ,@SampleCostJustification ,@RDcostJustification ,@QAQCCostJustification ,@AuditCostJustification ,@OtherCostJustification ,@TotalCostJustification)
	
	-- data points for uProjectTherapy
	SET @Value = ''
	IF LEN(RTRIM(@TherapyID)) > 0
	BEGIN
		IF RIGHT(@TherapyID,1) <> '|'
		SET @TherapyID = @TherapyID + '|'
		WHILE LEN(@TherapyID) > 1
		BEGIN
			SELECT @Value = LEFT(@TherapyID,CHARINDEX('|', @TherapyID) - 1)
			SET @TherapyID = SUBSTRING(@TherapyID, CHARINDEX('|', @TherapyID) + 1, LEN(@TherapyID) - CHARINDEX('|', @TherapyID))
			IF (ISNUMERIC(@Value)=1) AND (CAST(@Value AS INT) > 0)
				-- Save @Value as a server function for this server
				INSERT INTO uProjectTherapy
				(ProjectID , TherapyID) values
				(@ProjectIdentity, CAST(@Value AS INT) )
		END
	END

	-- data points for uProjectPersonnel
	SET @Value = ''
	IF LEN(RTRIM(@PersonnelID)) > 0
	BEGIN
		IF RIGHT(@PersonnelID,1) <> '|'
		SET @PersonnelID = @PersonnelID + '|'
		WHILE LEN(@PersonnelID) > 1
		BEGIN
			SELECT @Value = LEFT(@PersonnelID,CHARINDEX('|', @PersonnelID) - 1)
			SET @PersonnelID = SUBSTRING(@PersonnelID, CHARINDEX('|', @PersonnelID) + 1, LEN(@PersonnelID) - CHARINDEX('|', @PersonnelID))
			IF (ISNUMERIC(@Value)=1) AND (CAST(@Value AS INT) > 0)
				-- Save @Value as a server function for this server
				INSERT INTO uProjectPersonnel
				(ProjectID ,	PersonnelID) values
				(@ProjectIdentity, CAST(@Value AS INT) )
		END
	END
	
	-- data points for uProjectPackCode
	SET @Value = ''
	IF LEN(RTRIM(@PackCodeID)) > 0
	BEGIN
		IF RIGHT(@PackCodeID,1) <> '|'
		SET @PackCodeID = @PackCodeID + '|'
		WHILE LEN(@PackCodeID) > 1
		BEGIN
			SELECT @Value = LEFT(@PackCodeID,CHARINDEX('|', @PackCodeID) - 1)
			SET @PackCodeID = SUBSTRING(@PackCodeID, CHARINDEX('|', @PackCodeID) + 1, LEN(@PackCodeID) - CHARINDEX('|', @PackCodeID))
			IF (ISNUMERIC(@Value)=1) AND (CAST(@Value AS INT) > 0)
				-- Save @Value as a server function for this server
				INSERT INTO uProjectPackCode
				(ProjectID ,PackCodeID) values
				(@ProjectIdentity, CAST(@Value AS INT) )
		END
	END

	-- data points for uProjectMfgCode
	SET @Value = ''
	IF LEN(RTRIM(@MfgCodeID)) > 0
	BEGIN
		IF RIGHT(@MfgCodeID,1) <> '|'
		SET @MfgCodeID = @MfgCodeID + '|'
		WHILE LEN(@MfgCodeID) > 1
		BEGIN
			SELECT @Value = LEFT(@MfgCodeID,CHARINDEX('|', @MfgCodeID) - 1)
			SET @MfgCodeID = SUBSTRING(@MfgCodeID, CHARINDEX('|', @MfgCodeID) + 1, LEN(@MfgCodeID) - CHARINDEX('|', @MfgCodeID))
			IF (ISNUMERIC(@Value)=1) AND (CAST(@Value AS INT) > 0)
				-- Save @Value as a server function for this server
				INSERT INTO uProjectMfgCode
				(ProjectID ,MfgCodeID) values
				(@ProjectIdentity, CAST(@Value AS INT) )
		END
	END
	
-- data points for uProjectDosage
	SET @Value = ''
	IF LEN(RTRIM(@DosageID)) > 0
	BEGIN
		IF RIGHT(@DosageID,1) <> '|'
		SET @DosageID = @DosageID + '|'
		WHILE LEN(@DosageID) > 1
		BEGIN
			SELECT @Value = LEFT(@DosageID,CHARINDEX('|', @DosageID) - 1)
			SET @DosageID = SUBSTRING(@DosageID, CHARINDEX('|', @DosageID) + 1, LEN(@DosageID) - CHARINDEX('|', @DosageID))
			IF (ISNUMERIC(@Value)=1) AND (CAST(@Value AS INT) > 0)
				-- Save @Value as a server function for this server
				INSERT INTO uProjectDosage
				(ProjectID , DosageID ) values
				(@ProjectIdentity, CAST(@Value AS INT) )
		END
	END

	
	-- data points for uProjectCategory
	SET @Value = ''
	IF LEN(RTRIM(@CategoryID)) > 0
	BEGIN
		IF RIGHT(@CategoryID,1) <> '|'
		SET @CategoryID = @CategoryID + '|'
		WHILE LEN(@CategoryID) > 1
		BEGIN
			SELECT @Value = LEFT(@CategoryID,CHARINDEX('|', @CategoryID) - 1)
			SET @CategoryID = SUBSTRING(@CategoryID, CHARINDEX('|', @CategoryID) + 1, LEN(@CategoryID) - CHARINDEX('|', @CategoryID))
			IF (ISNUMERIC(@Value)=1) AND (CAST(@Value AS INT) > 0)
				-- Save @Value as a server function for this server
				INSERT INTO uProjectCategory
				(ProjectID , CategoryID ) values
				(@ProjectIdentity, CAST(@Value AS INT) )
		END
	END

	
	-- data points for uProjectBulkCode
	SET @Value = ''
	IF LEN(RTRIM(@BulkCodeID)) > 0
	BEGIN
		IF RIGHT(@BulkCodeID,1) <> '|'
		SET @BulkCodeID = @BulkCodeID + '|'
		
		WHILE LEN(@BulkCodeID) > 1
		BEGIN
			SELECT @Value = LEFT(@BulkCodeID,CHARINDEX('|', @BulkCodeID) - 1)
			SET @BulkCodeID = SUBSTRING(@BulkCodeID, CHARINDEX('|', @BulkCodeID) + 1, LEN(@BulkCodeID) - CHARINDEX('|', @BulkCodeID))
			IF (ISNUMERIC(@Value)=1) AND (CAST(@Value AS INT) > 0)
				-- Save @Value as a server function for this server
				INSERT INTO uProjectBulkCode
				(ProjectID ,BulkCodeID) values
				(@ProjectIdentity, CAST(@Value AS INT))
		END
	END

	SELECT @ProjectIdentity

COMMIT TRAN


GO
/****** Object:  StoredProcedure [dbo].[cInsertProjectAttachment]    Script Date: 24/09/2014 10:12:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[cInsertProjectAttachment]
@ProjectId int,
@FileNames nvarchar(250),
@ContentType nvarchar(50),
@Attachment varbinary(max)
AS
BEGIN

Insert into tProjectAttachment
(ProjectId, FileNames, ContentType, Attachment) VALUES
(@ProjectId, @FileNames, @ContentType, @Attachment)


END

GO
/****** Object:  StoredProcedure [dbo].[cReportAll]    Script Date: 24/09/2014 10:12:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
CREATE PROCEDURE [dbo].[cReportAll] 
@Year int

AS
BEGIN
	SELECT 
	tProjects.ProjectID, 
	tProjects.ProjectName, 
	vDepartment.Department, 
	tProjects.Direct_Indirect_Capex, 
	tProjects.PL_Capex, 
	vPersonnel.Personnel as ProjectLeader, 
	fin.Personnel, 
	vExpenseHead.ExpenseHead ,
	tProjects.ProjectClassification,
	tProjects.ProjectSummary, 
	vBusinessUnit.BusinessUnit,
	CONCAT(tProjectSavings.ProjectBeginMonth, '/', tProjectSavings.ProjectBeginYear) as ProjectBegin,
    CONCAT(tProjectSavings.ProjectEndMonth, '/',tProjectSavings.ProjectEndYear) as ProjectEnd,
	CONCAT(tProjectSavings.SavingBeginMonth, '/',tProjectSavings.SavingBeginYear) as SavingsBegin,
    CONCAT(tProjectSavings.SavingsEndMonth, '/',tProjectSavings.SavingsEndYear) as SavingsEnd,
	tProjectSavings.TotalAnnualSavings,
    tProjectSavings.OneOffSavings,
	vCurrency.Currency,
	Concat(tProjectSavings.Risk,'%') as Risk,
	tProjectSavings.Status,
	tProjectSavings.CommittedToForecast,
    tProjectSavings.Stage,
	tProjectSavingsCal.FiscalYear,
    tProjectSavingsCal.ProbabilityAdjAmt,
    tProjectSavingsCal.TimeAdjAmt,
    tProjectSavingsCal.TotalAdjAmt,
	tProjectsCost.Capex,
    tProjectsCost.WorkingCapital,
    tProjectsCost.TotalCost
  FROM vDepartment, vPersonnel, vPersonnel as fin, vExpenseHead, vBusinessUnit, vCurrency, tProjects, tProjectSavings, tProjectSavingsCal, tProjectsCost
	WHERE tProjects.DepartmentID=vDepartment.DepartmentID
	AND tProjects.ProjectLeader = vPersonnel.PersonnelID
	AND tProjects.FinanceLeader = fin.PersonnelID
	AND tProjects.ExpenseHeadID = vExpenseHead.ExpenseHeadID
	AND tProjects.BusinessUnitID = vBusinessUnit.BusinessUnitID
	AND vCurrency.CurrencyID = tProjectSavings.Currency  
	AND tProjects.ProjectID = tProjectSavings.ProjectID
	AND tProjects.ProjectID = tProjectSavingsCal.ProjectID
	AND tProjects.ProjectID = tProjectsCost.ProjectID 
	AND tProjectSavingsCal.FiscalYear= @Year
	AND tProjects.Active = 1
END


GO
/****** Object:  StoredProcedure [dbo].[cReportAll_Test]    Script Date: 24/09/2014 10:12:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
CREATE PROCEDURE [dbo].[cReportAll_Test] 
@Year int,
@SqlSelect nvarchar(max)
AS
BEGIN
	SET NOCOUNT ON ;
	DECLARE @SQL NVARCHAR(MAX)
	DECLARE @SQLFROM NVARCHAR(MAX)
	DECLARE @SQLWHERE NVARCHAR(MAX)
    
	SET @SQLFROM = ' FROM vDepartment, vPersonnel, vPersonnel as fin, 
	vExpenseHead, vBusinessUnit, vCurrency, tProjects, 
	tProjectSavings, tProjectSavingsCal, tProjectsCost'

	SET @SQLWHERE = ' WHERE tProjects.DepartmentID=vDepartment.DepartmentID
	AND tProjects.ProjectLeader = vPersonnel.PersonnelID
	AND tProjects.FinanceLeader = fin.PersonnelID
	AND tProjects.ExpenseHeadID = vExpenseHead.ExpenseHeadID
	AND tProjects.BusinessUnitID = vBusinessUnit.BusinessUnitID
	AND vCurrency.CurrencyID = tProjectSavings.Currency  
	AND tProjects.ProjectID = tProjectSavings.ProjectID
	AND tProjects.ProjectID = tProjectSavingsCal.ProjectID
	AND tProjects.ProjectID = tProjectsCost.ProjectID 
	AND tProjectSavingsCal.FiscalYear=@Year 
	AND tProjects.Active = 1'
	
	SET @SQL = ' SELECT ' + @SqlSelect + @SQLFROM + @SQLWHERE 
    PRINT @SQL
	
	EXEC sp_executesql @SQL,
	N'@Year int',
	@Year = @Year
	
END
    
GO
/****** Object:  StoredProcedure [dbo].[cReportAllSum]    Script Date: 24/09/2014 10:12:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE    PROCEDURE [dbo].[cReportAllSum] 
@Year char(4), 
@ProjectStage nvarchar(50) =NULL  
AS
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
	COUNT(tProjects.ProjectName) AS [No of Projects], 
	SUM(tProjectSavingsCal.ProbabilityAdjAmt) AS [Probability Adjusted Amount],
    SUM(tProjectSavingsCal.TimeAdjAmt) AS [Time Adjusted Amount],
    SUM(tProjectSavingsCal.TotalAdjAmt) AS [Total Adjusted Amount],
	SUM(tProjectsCost.Capex) AS [Capex],
    SUM(tProjectsCost.WorkingCapital) AS [Working Capital],
    SUM(tProjectsCost.TotalCost) AS [Total Operating Cost]
    FROM tProjects, tProjectSavingsCal, tProjectsCost
	WHERE 
	tProjects.ProjectID = tProjectSavingsCal.ProjectID
	AND tProjects.ProjectID = tProjectsCost.ProjectID 
	AND tProjectSavingsCal.FiscalYear= @Year
	AND tProjects.Active = 1

GO
/****** Object:  StoredProcedure [dbo].[cReportCustom]    Script Date: 24/09/2014 10:12:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
CREATE PROCEDURE [dbo].[cReportCustom] 
@Year int,
@SqlSelect nvarchar(max),
@SqlWhere_User nvarchar(max)
AS
BEGIN
	SET NOCOUNT ON ;
	DECLARE @SQL NVARCHAR(MAX)
	DECLARE @SQLFROM NVARCHAR(MAX)
	DECLARE @SQLWHERE NVARCHAR(MAX)
    
	SET @SQLFROM = ' FROM vDepartment, vPersonnel, vPersonnel as fin, 
	vExpenseHead, vBusinessUnit, vCurrency, tProjects, 
	tProjectSavings, tProjectSavingsCal, tProjectsCost'

	SET @SQLWHERE = ' WHERE tProjects.DepartmentID=vDepartment.DepartmentID
	AND tProjects.ProjectLeader = vPersonnel.PersonnelID
	AND tProjects.FinanceLeader = fin.PersonnelID
	AND tProjects.ExpenseHeadID = vExpenseHead.ExpenseHeadID
	AND tProjects.BusinessUnitID = vBusinessUnit.BusinessUnitID
	AND vCurrency.CurrencyID = tProjectSavings.Currency  
	AND tProjects.ProjectID = tProjectSavings.ProjectID
	AND tProjects.ProjectID = tProjectSavingsCal.ProjectID
	AND tProjects.ProjectID = tProjectsCost.ProjectID 
	AND tProjectSavingsCal.FiscalYear=@Year 
	AND tProjects.Active = 1'
	
	SET @SQL = ' SELECT ' + @SqlSelect + @SQLFROM + @SQLWHERE + @SqlWhere_User
    PRINT @SQL
	
	EXEC sp_executesql @SQL,
	N'@Year int',
	@Year = @Year
	
END
    
GO
/****** Object:  StoredProcedure [dbo].[cUpdateProject]    Script Date: 24/09/2014 10:12:49 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE Procedure [dbo].[cUpdateProject] 	
(
-- data points for tProjects
@ProjectID as int,
@ProjectName nvarchar(max) ,
@DepartmentID int,
@Direct_Indirect_Capex nchar(10) ,
@PL_Capex nchar(10) ,
@ProjectLeader int,
@FinanceLeader int,
@ExpenseHeadID int,
@ProjectClassification nvarchar(50),
@ProjectSummary nvarchar(max),
@BusinessUnit nvarchar(MAX), 
@BusinessUnitID int,
@Active bit,
-- data points for tProjectSavings
@ProjectBeginMonth int,
@ProjectBeginYear int,
@SavingBeginMonth int,
@SavingBeginYear int,
@SavingsEndMonth int,
@SavingsEndYear int,
@TotalAnnualSavings float,
@OneOffSavings float,
@Currency int,
@Risk int,
@Status nvarchar(max),
@CommittedToForecast bit=0,
@ProjectEndMonth int,
@ProjectEndYear int,
@Stage nvarchar(max),
-- data points for tProjectSavingsCal
@FiscalYear int,
@ProbabilityAdjAmt float,
@TimeAdjAmt float,
@TotalAdjAmt float,
-- data points for tProjectsCost
@Capex float,
@WorkingCapital float,
@RegulatoryCost float,
@SampleCost float,
@RDcost float,
@QAQCCost float,
@AuditCost float,
@OtherCost float,
@TotalCost float,
@CapexCurrency int,
@WorkingCapitalCurrency int,
@RegulatoryCostCurrency int,
@SampleCostCurrency int,
@RDcostCurrency int,
@QAQCCostCurrency int,
@AuditCostCurrency int,
@OtherCostCurrency int,
@TotalCostCurrency int,
@CapexJustification nvarchar(max) ,
@WorkingCapitalJustification nvarchar(max) ,
@RegulatoryCostJustification nvarchar(max) ,
@SampleCostJustification nvarchar(max) ,
@RDcostJustification nvarchar(max) ,
@QAQCCostJustification nvarchar(max) ,
@AuditCostJustification nvarchar(max) ,
@OtherCostJustification nvarchar(max) ,
@TotalCostJustification nvarchar(max),
-- data points for uProjectTherapy
@TherapyID nvarchar(max),
-- data points for uProjectPersonnel
@PersonnelID nvarchar(max),
-- data points for uProjectPackCode
@PackCodeID nvarchar(max),
-- data points for uProjectMfgCode
@MfgCodeID nvarchar(max),
-- data points for uProjectDosage
@DosageID nvarchar(max),
-- data points for uProjectCategory
@CategoryID nvarchar(max),
-- data points for uProjectBulkCode
@BulkCodeID nvarchar(max)

) 
AS 
BEGIN TRAN
Declare @Value varchar(max)

-- data points for tProjects
UPDATE tProjects
SET 
	ProjectName = @ProjectName, 
	DepartmentID = @DepartmentID, 
	Direct_Indirect_Capex = @Direct_Indirect_Capex, 
	PL_Capex = @PL_Capex , 
	ProjectLeader = @ProjectLeader , 
	FinanceLeader = @FinanceLeader, 
	ExpenseHeadID = @ExpenseHeadID, 
	ProjectClassification = @ProjectClassification, 
	ProjectSummary = @ProjectSummary, 
	BusinessUnit = @BusinessUnit, 
	BusinessUnitID = @BusinessUnitID,
	Active= @Active 
WHERE ProjectID=@ProjectID

-- data points for tProjectSavings
UPDATE tProjectSavings
SET 
	ProjectBeginMonth = @ProjectBeginMonth,	
	ProjectBeginYear = @ProjectBeginYear ,	
	SavingBeginMonth = @SavingBeginMonth,
	SavingBeginYear = @SavingBeginYear,	
	SavingsEndMonth = @SavingsEndMonth ,	
	SavingsEndYear = @SavingsEndYear , 
	TotalAnnualSavings = @TotalAnnualSavings, 
	OneOffSavings = @OneOffSavings , 
	Currency = @Currency , 
	Risk = @Risk , 
	Status = @Status , 
	CommittedToForecast = @CommittedToForecast, 
	ProjectEndMonth = @ProjectEndMonth, 
	ProjectEndYear = @ProjectEndYear, 
	Stage = @Stage
WHERE ProjectID=@ProjectID

-- data points for tProjectSavingsCal
	DELETE FROM tProjectSavingsCal WHERE ProjectID=@ProjectID
	
	INSERT INTO tProjectSavingsCal
	(ProjectID , FiscalYear , ProbabilityAdjAmt , TimeAdjAmt , TotalAdjAmt ) values
	(@ProjectID , @FiscalYear , @ProbabilityAdjAmt , @TimeAdjAmt , @TotalAdjAmt )

	INSERT INTO tProjectSavingsCal
	(ProjectID , FiscalYear , ProbabilityAdjAmt , TimeAdjAmt , TotalAdjAmt ) values
	(@ProjectID , @FiscalYear+1 , @ProbabilityAdjAmt , @TotalAnnualSavings - @TimeAdjAmt , @ProbabilityAdjAmt - @TotalAdjAmt )

-- data points for tProjectsCost
UPDATE tProjectsCost
SET
	Capex = @Capex ,
	WorkingCapital = @WorkingCapital,
	RegulatoryCost = @RegulatoryCost ,
	SampleCost = @SampleCost ,
	RDcost = @RDcost ,
	QAQCCost = @QAQCCost,
	AuditCost = @AuditCost ,
	OtherCost = @OtherCost ,
	TotalCost = @TotalCost,
	CapexCurrency = @CapexCurrency,
	WorkingCapitalCurrency = @WorkingCapitalCurrency ,
	RegulatoryCostCurrency = @RegulatoryCostCurrency,
	SampleCostCurrency = @SampleCostCurrency ,
	RDcostCurrency = @RDcostCurrency ,
	QAQCCostCurrency = @QAQCCostCurrency ,
	AuditCostCurrency = @AuditCostCurrency,
	OtherCostCurrency = @OtherCostCurrency ,
	TotalCostCurrency = @TotalCostCurrency ,
	CapexJustification = @CapexJustification ,
	WorkingCapitalJustification = @WorkingCapitalJustification ,
	RegulatoryCostJustification = @RegulatoryCostJustification ,
	SampleCostJustification = @SampleCostJustification ,
	RDcostJustification = @RDcostJustification,
	QAQCCostJustification = @QAQCCostJustification ,
	AuditCostJustification = @AuditCostJustification ,
	OtherCostJustification = @OtherCostJustification,
	TotalCostJustification = @TotalCostJustification
WHERE ProjectID=@ProjectID

-- delete all existing unions
	DELETE FROM uProjectTherapy WHERE ProjectID=@ProjectID
	DELETE FROM uProjectPersonnel WHERE ProjectID=@ProjectID
	DELETE FROM uProjectPackCode WHERE ProjectID=@ProjectID
	DELETE FROM uProjectMfgCode WHERE ProjectID=@ProjectID
	DELETE FROM uProjectDosage WHERE ProjectID=@ProjectID
	DELETE FROM uProjectCategory WHERE ProjectID=@ProjectID
	DELETE FROM uProjectBulkCode WHERE ProjectID=@ProjectID
	
-- data points for uProjectTherapy
	SET @Value = ''
	IF LEN(RTRIM(@TherapyID)) > 0
	BEGIN
		IF RIGHT(@TherapyID,1) <> '|'
		SET @TherapyID = @TherapyID + '|'
		WHILE LEN(@TherapyID) > 1
		BEGIN
			SELECT @Value = LEFT(@TherapyID,CHARINDEX('|', @TherapyID) - 1)
			SET @TherapyID = SUBSTRING(@TherapyID, CHARINDEX('|', @TherapyID) + 1, LEN(@TherapyID) - CHARINDEX('|', @TherapyID))
			IF (ISNUMERIC(@Value)=1) AND (CAST(@Value AS INT) > 0)
				-- Save @Value as a server function for this server
				INSERT INTO uProjectTherapy
				(ProjectID , TherapyID) values
				(@ProjectID, CAST(@Value AS INT) )
		END
	END

-- data points for uProjectPersonnel
	SET @Value = ''
	IF LEN(RTRIM(@PersonnelID)) > 0
	BEGIN
		IF RIGHT(@PersonnelID,1) <> '|'
		SET @PersonnelID = @PersonnelID + '|'
		WHILE LEN(@PersonnelID) > 1
		BEGIN
			SELECT @Value = LEFT(@PersonnelID,CHARINDEX('|', @PersonnelID) - 1)
			SET @PersonnelID = SUBSTRING(@PersonnelID, CHARINDEX('|', @PersonnelID) + 1, LEN(@PersonnelID) - CHARINDEX('|', @PersonnelID))
			IF (ISNUMERIC(@Value)=1) AND (CAST(@Value AS INT) > 0)
				-- Save @Value as a server function for this server
				INSERT INTO uProjectPersonnel
				(ProjectID ,	PersonnelID) values
				(@ProjectID, CAST(@Value AS INT) )
		END
	END
	
-- data points for uProjectPackCode
	SET @Value = ''
	IF LEN(RTRIM(@PackCodeID)) > 0
	BEGIN
		IF RIGHT(@PackCodeID,1) <> '|'
		SET @PackCodeID = @PackCodeID + '|'
		WHILE LEN(@PackCodeID) > 1
		BEGIN
			SELECT @Value = LEFT(@PackCodeID,CHARINDEX('|', @PackCodeID) - 1)
			SET @PackCodeID = SUBSTRING(@PackCodeID, CHARINDEX('|', @PackCodeID) + 1, LEN(@PackCodeID) - CHARINDEX('|', @PackCodeID))
			IF (ISNUMERIC(@Value)=1) AND (CAST(@Value AS INT) > 0)
				-- Save @Value as a server function for this server
				INSERT INTO uProjectPackCode
				(ProjectID ,PackCodeID) values
				(@ProjectID, CAST(@Value AS INT) )
		END
	END

-- data points for uProjectMfgCode
	SET @Value = ''
	IF LEN(RTRIM(@MfgCodeID)) > 0
	BEGIN
		IF RIGHT(@MfgCodeID,1) <> '|'
		SET @MfgCodeID = @MfgCodeID + '|'
		WHILE LEN(@MfgCodeID) > 1
		BEGIN
			SELECT @Value = LEFT(@MfgCodeID,CHARINDEX('|', @MfgCodeID) - 1)
			SET @MfgCodeID = SUBSTRING(@MfgCodeID, CHARINDEX('|', @MfgCodeID) + 1, LEN(@MfgCodeID) - CHARINDEX('|', @MfgCodeID))
			IF (ISNUMERIC(@Value)=1) AND (CAST(@Value AS INT) > 0)
				-- Save @Value as a server function for this server
				INSERT INTO uProjectMfgCode
				(ProjectID ,MfgCodeID) values
				(@ProjectID, CAST(@Value AS INT) )
		END
	END
	
-- data points for uProjectDosage
	SET @Value = ''
	IF LEN(RTRIM(@DosageID)) > 0
	BEGIN
		IF RIGHT(@DosageID,1) <> '|'
		SET @DosageID = @DosageID + '|'
		WHILE LEN(@DosageID) > 1
		BEGIN
			SELECT @Value = LEFT(@DosageID,CHARINDEX('|', @DosageID) - 1)
			SET @DosageID = SUBSTRING(@DosageID, CHARINDEX('|', @DosageID) + 1, LEN(@DosageID) - CHARINDEX('|', @DosageID))
			IF (ISNUMERIC(@Value)=1) AND (CAST(@Value AS INT) > 0)
				-- Save @Value as a server function for this server
				INSERT INTO uProjectDosage
				(ProjectID , DosageID ) values
				(@ProjectID, CAST(@Value AS INT) )
		END
	END

	
-- data points for uProjectCategory
	SET @Value = ''
	IF LEN(RTRIM(@CategoryID)) > 0
	BEGIN
		IF RIGHT(@CategoryID,1) <> '|'
		SET @CategoryID = @CategoryID + '|'
		WHILE LEN(@CategoryID) > 1
		BEGIN
			SELECT @Value = LEFT(@CategoryID,CHARINDEX('|', @CategoryID) - 1)
			SET @CategoryID = SUBSTRING(@CategoryID, CHARINDEX('|', @CategoryID) + 1, LEN(@CategoryID) - CHARINDEX('|', @CategoryID))
			IF (ISNUMERIC(@Value)=1) AND (CAST(@Value AS INT) > 0)
				-- Save @Value as a server function for this server
				INSERT INTO uProjectCategory
				(ProjectID , CategoryID ) values
				(@ProjectID, CAST(@Value AS INT) )
		END
	END

	
-- data points for uProjectBulkCode
	SET @Value = ''
	IF LEN(RTRIM(@BulkCodeID)) > 0
	BEGIN
		IF RIGHT(@BulkCodeID,1) <> '|'
		SET @BulkCodeID = @BulkCodeID + '|'
		
		WHILE LEN(@BulkCodeID) > 1
		BEGIN
			SELECT @Value = LEFT(@BulkCodeID,CHARINDEX('|', @BulkCodeID) - 1)
			SET @BulkCodeID = SUBSTRING(@BulkCodeID, CHARINDEX('|', @BulkCodeID) + 1, LEN(@BulkCodeID) - CHARINDEX('|', @BulkCodeID))
			IF (ISNUMERIC(@Value)=1) AND (CAST(@Value AS INT) > 0)
				-- Save @Value as a server function for this server
				INSERT INTO uProjectBulkCode
				(ProjectID ,BulkCodeID) values
				(@ProjectID, CAST(@Value AS INT))
		END
	END	
COMMIT TRAN

GO
/****** Object:  StoredProcedure [dbo].[InsertReport]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  StoredProcedure [dbo].[ProjectCopy]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  StoredProcedure [dbo].[ProjectsSelectAll]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  StoredProcedure [dbo].[ProjectsSelectBusiness]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  StoredProcedure [dbo].[ProjectsSelectYear]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  StoredProcedure [dbo].[ProjectsSelectYearWithStat]    Script Date: 24/09/2014 10:12:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROCEDURE [dbo].[ProjectsSelectYearWithStat] 
@Year char(4) ='2004', 
@ProjectStage nvarchar(50) =NULL 
AS
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
/****** Object:  StoredProcedure [dbo].[ProjectSumAll]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  StoredProcedure [dbo].[ProjectSumBusiness]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  StoredProcedure [dbo].[ProjectSumCVC]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  StoredProcedure [dbo].[ProjectSumTDCElement]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  StoredProcedure [dbo].[ProjectSumYearAll]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  StoredProcedure [dbo].[Report_Ageing]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  StoredProcedure [dbo].[Report_Ageing_all_Issues]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  StoredProcedure [dbo].[Report_Ageing_by_me]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  StoredProcedure [dbo].[Report_Ageing_to_me]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  StoredProcedure [dbo].[SearchProjectLeader]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  StoredProcedure [dbo].[SearchProjectName]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  StoredProcedure [dbo].[SearchStatus]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  StoredProcedure [dbo].[SummaryBusiness]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  StoredProcedure [dbo].[SummaryMonthlyBusiness]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  StoredProcedure [dbo].[SummaryMonthlyPlant]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  StoredProcedure [dbo].[SummaryPlant]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  Table [dbo].[tblBusinessSummary]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  Table [dbo].[tblCustomReport]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  Table [dbo].[tblDeletedProjects]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  Table [dbo].[tblFinancialMonth]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  Table [dbo].[tblFinancialMonthReverse]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  Table [dbo].[tblPersonnel]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  Table [dbo].[tblProjectPersonnel]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  Table [dbo].[tblProjects]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  Table [dbo].[tblReportTags]    Script Date: 24/09/2014 10:12:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReportTags](
	[EMPS] [nvarchar](50) NULL,
	[EMPSTag] [nvarchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTDC]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  Table [dbo].[tblTeamGroups]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  Table [dbo].[tblTeamMonthlySpending]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  Table [dbo].[tblTeams]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  Table [dbo].[tProjectAttachment]    Script Date: 24/09/2014 10:12:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tProjectAttachment](
	[AttachmentId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[FileNames] [nvarchar](250) NOT NULL,
	[ContentType] [nvarchar](50) NOT NULL,
	[Attachment] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_tProjectAttachment] PRIMARY KEY CLUSTERED 
(
	[AttachmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tProjects]    Script Date: 24/09/2014 10:12:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tProjects](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [nvarchar](max) NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[Direct_Indirect_Capex] [nchar](10) NOT NULL,
	[PL_Capex] [nchar](10) NOT NULL,
	[ProjectLeader] [int] NOT NULL,
	[FinanceLeader] [int] NOT NULL,
	[ExpenseHeadID] [int] NULL,
	[ProjectClassification] [nvarchar](50) NULL,
	[ProjectSummary] [nvarchar](max) NULL,
	[BusinessUnit] [nvarchar](max) NULL,
	[BusinessUnitID] [int] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_vProjects] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tProjectSavings]    Script Date: 24/09/2014 10:12:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tProjectSavings](
	[ProjectSavingsID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
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
	[ProjectEndMonth] [int] NULL,
	[ProjectEndYear] [int] NULL,
	[Stage] [nvarchar](max) NULL,
 CONSTRAINT [PK_tProjectSavings] PRIMARY KEY CLUSTERED 
(
	[ProjectSavingsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tProjectSavingsCal]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  Table [dbo].[tProjectsCost]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  Table [dbo].[uProjectBulkCode]    Script Date: 24/09/2014 10:12:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uProjectBulkCode](
	[ProjectBulkCodeID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[BulkCodeID] [int] NOT NULL,
 CONSTRAINT [PK_uProjectBulkCode] PRIMARY KEY CLUSTERED 
(
	[ProjectBulkCodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[uProjectCategory]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  Table [dbo].[uProjectDosage]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  Table [dbo].[uProjectMfgCode]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  Table [dbo].[uProjectPackCode]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  Table [dbo].[uProjectPersonnel]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  Table [dbo].[uProjectTherapy]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  Table [dbo].[vBulkCode]    Script Date: 24/09/2014 10:12:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vBulkCode](
	[BulkCodeID] [int] IDENTITY(1,1) NOT NULL,
	[BulkCode] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_vBulkCode] PRIMARY KEY CLUSTERED 
(
	[BulkCodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[vBusinessUnit]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  Table [dbo].[vCategory]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  Table [dbo].[vCurrency]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  Table [dbo].[vDepartment]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  Table [dbo].[vDosage]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  Table [dbo].[vExpenseHead]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  Table [dbo].[vMfgCode]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  Table [dbo].[vPackCode]    Script Date: 24/09/2014 10:12:49 ******/
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
/****** Object:  Table [dbo].[vPersonnel]    Script Date: 24/09/2014 10:12:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vPersonnel](
	[PersonnelID] [int] IDENTITY(1,1) NOT NULL,
	[Personnel] [nvarchar](max) NOT NULL,
	[PersonnelEmail] [nvarchar](max) NULL,
 CONSTRAINT [PK_vPersonnel] PRIMARY KEY CLUSTERED 
(
	[PersonnelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[vTagFilter]    Script Date: 24/09/2014 10:12:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vTagFilter](
	[tag] [nvarchar](50) NULL,
	[tagfield] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[vTagNames]    Script Date: 24/09/2014 10:12:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vTagNames](
	[tag] [nvarchar](50) NULL,
	[tagfield] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[vTherapy]    Script Date: 24/09/2014 10:12:49 ******/
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
ALTER TABLE [dbo].[tProjects] ADD  CONSTRAINT [DF_tProjects_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[tProjectSavings]  WITH CHECK ADD  CONSTRAINT [FK_tProjectSavings_tProjects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[tProjects] ([ProjectID])
GO
ALTER TABLE [dbo].[tProjectSavings] CHECK CONSTRAINT [FK_tProjectSavings_tProjects]
GO
ALTER TABLE [dbo].[tProjectsCost]  WITH CHECK ADD  CONSTRAINT [FK_tProjectsCost_tProjects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[tProjects] ([ProjectID])
GO
ALTER TABLE [dbo].[tProjectsCost] CHECK CONSTRAINT [FK_tProjectsCost_tProjects]
GO
ALTER TABLE [dbo].[uProjectBulkCode]  WITH CHECK ADD  CONSTRAINT [FK_uProjectBulkCode_tProjects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[tProjects] ([ProjectID])
GO
ALTER TABLE [dbo].[uProjectBulkCode] CHECK CONSTRAINT [FK_uProjectBulkCode_tProjects]
GO
ALTER TABLE [dbo].[uProjectBulkCode]  WITH CHECK ADD  CONSTRAINT [FK_uProjectBulkCode_vBulkCode] FOREIGN KEY([BulkCodeID])
REFERENCES [dbo].[vBulkCode] ([BulkCodeID])
GO
ALTER TABLE [dbo].[uProjectBulkCode] CHECK CONSTRAINT [FK_uProjectBulkCode_vBulkCode]
GO
ALTER TABLE [dbo].[uProjectCategory]  WITH CHECK ADD  CONSTRAINT [FK_uProjectCategory_tProjects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[tProjects] ([ProjectID])
GO
ALTER TABLE [dbo].[uProjectCategory] CHECK CONSTRAINT [FK_uProjectCategory_tProjects]
GO
ALTER TABLE [dbo].[uProjectDosage]  WITH CHECK ADD  CONSTRAINT [FK_uProjectDosage_tProjects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[tProjects] ([ProjectID])
GO
ALTER TABLE [dbo].[uProjectDosage] CHECK CONSTRAINT [FK_uProjectDosage_tProjects]
GO
ALTER TABLE [dbo].[uProjectDosage]  WITH CHECK ADD  CONSTRAINT [FK_uProjectDosage_vDosage] FOREIGN KEY([DosageID])
REFERENCES [dbo].[vDosage] ([DosageID])
GO
ALTER TABLE [dbo].[uProjectDosage] CHECK CONSTRAINT [FK_uProjectDosage_vDosage]
GO
ALTER TABLE [dbo].[uProjectMfgCode]  WITH CHECK ADD  CONSTRAINT [FK_uProjectMfgCode_tProjects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[tProjects] ([ProjectID])
GO
ALTER TABLE [dbo].[uProjectMfgCode] CHECK CONSTRAINT [FK_uProjectMfgCode_tProjects]
GO
ALTER TABLE [dbo].[uProjectMfgCode]  WITH CHECK ADD  CONSTRAINT [FK_uProjectMfgCode_vMfgCode] FOREIGN KEY([MfgCodeID])
REFERENCES [dbo].[vMfgCode] ([MfgCodeID])
GO
ALTER TABLE [dbo].[uProjectMfgCode] CHECK CONSTRAINT [FK_uProjectMfgCode_vMfgCode]
GO
ALTER TABLE [dbo].[uProjectPackCode]  WITH CHECK ADD  CONSTRAINT [FK_uProjectPackCode_tProjects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[tProjects] ([ProjectID])
GO
ALTER TABLE [dbo].[uProjectPackCode] CHECK CONSTRAINT [FK_uProjectPackCode_tProjects]
GO
ALTER TABLE [dbo].[uProjectPackCode]  WITH CHECK ADD  CONSTRAINT [FK_uProjectPackCode_vPackCode] FOREIGN KEY([PackCodeID])
REFERENCES [dbo].[vPackCode] ([PackCodeID])
GO
ALTER TABLE [dbo].[uProjectPackCode] CHECK CONSTRAINT [FK_uProjectPackCode_vPackCode]
GO
ALTER TABLE [dbo].[uProjectPersonnel]  WITH CHECK ADD  CONSTRAINT [FK_uProjectPersonnel_tProjects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[tProjects] ([ProjectID])
GO
ALTER TABLE [dbo].[uProjectPersonnel] CHECK CONSTRAINT [FK_uProjectPersonnel_tProjects]
GO
ALTER TABLE [dbo].[uProjectPersonnel]  WITH CHECK ADD  CONSTRAINT [FK_uProjectPersonnel_vPersonnel] FOREIGN KEY([PersonnelID])
REFERENCES [dbo].[vPersonnel] ([PersonnelID])
GO
ALTER TABLE [dbo].[uProjectPersonnel] CHECK CONSTRAINT [FK_uProjectPersonnel_vPersonnel]
GO
ALTER TABLE [dbo].[uProjectTherapy]  WITH CHECK ADD  CONSTRAINT [FK_uProjectTherapy_tProjects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[tProjects] ([ProjectID])
GO
ALTER TABLE [dbo].[uProjectTherapy] CHECK CONSTRAINT [FK_uProjectTherapy_tProjects]
GO
ALTER TABLE [dbo].[uProjectTherapy]  WITH CHECK ADD  CONSTRAINT [FK_uProjectTherapy_vTherapy] FOREIGN KEY([TherapyID])
REFERENCES [dbo].[vTherapy] ([TherapyID])
GO
ALTER TABLE [dbo].[uProjectTherapy] CHECK CONSTRAINT [FK_uProjectTherapy_vTherapy]
GO
ALTER TABLE [dbo].[vCategory]  WITH CHECK ADD  CONSTRAINT [FK_vCategory_vDepartment] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[vDepartment] ([DepartmentID])
GO
ALTER TABLE [dbo].[vCategory] CHECK CONSTRAINT [FK_vCategory_vDepartment]
GO
USE [master]
GO
ALTER DATABASE [CPMCipla] SET  READ_WRITE 
GO
