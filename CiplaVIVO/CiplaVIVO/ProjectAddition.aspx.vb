Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Xml
Imports System.Xml.XPath
Imports CiplaVIVO.VivoClass


Public Class ProjectAddition
    Inherits System.Web.UI.Page
    Dim myDataSet As DataSet
    Dim dt As New DataTable()
    Dim dv As DataView
    Dim strFilePath As String
    'Dim RequestedSubGBU As String
    'Dim RequestedBusiness As String
    Dim Viv As New VivoClass
    Private strConnString As String = ConfigurationManager.ConnectionStrings("SQLConnectionString").ConnectionString
    Dim con As New SqlConnection(strConnString)
   

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'RequestedSubGBU = Request.QueryString("subGBU")
        'RequestedBusiness = Request.QueryString("Business")

        If Not IsPostBack Then
            PopulateDropDown()
            'SetInitialFields()
        End If
    End Sub

    Sub PopulateDropDown()
        '---------cboBusinessUnit
        cboBusinessUnit.DataSource = Viv.BindData("BusinessUnit", "BusinessUnitID")
        cboBusinessUnit.DataValueField = "BusinessUnitID"
        cboBusinessUnit.DataTextField = "BusinessUnit"
        cboBusinessUnit.DataBind()

        '---------cboProjectLeader + cboTeamMembers + cboFinanceLeader

        dt = Viv.BindData("Personnel", "PersonnelID")

        cboProjectLeader.DataSource = dt
        cboProjectLeader.DataValueField = "PersonnelID"
        cboProjectLeader.DataTextField = "Personnel"
        cboProjectLeader.DataBind()

        cboFinanceLeader.DataSource = dt
        cboFinanceLeader.DataValueField = "PersonnelID"
        cboFinanceLeader.DataTextField = "Personnel"
        cboFinanceLeader.DataBind()

        cboTeamMembers.DataSource = dt
        cboTeamMembers.DataValueField = "PersonnelID"
        cboTeamMembers.DataTextField = "Personnel"
        cboTeamMembers.DataBind()

        '---------cboDepartment
        cboDepartment.DataSource = Viv.BindData("Department", "DepartmentID")
        cboDepartment.DataValueField = "DepartmentID"
        cboDepartment.DataTextField = "Department"
        cboDepartment.DataBind()

        '---------cboDosage
        cboDosage.DataSource = Viv.BindData("Dosage", "DosageID")
        cboDosage.DataValueField = "DosageID"
        cboDosage.DataTextField = "Dosage"
        cboDosage.DataBind()

        '---------cboMfgCode
        cboMfgCode.DataSource = Viv.BindData("MfgCode", "MfgCodeID")
        cboMfgCode.DataValueField = "MfgCodeID"
        cboMfgCode.DataTextField = "MfgCode"
        cboMfgCode.DataBind()

        '---------cboTherapy
        cboTherapy.DataSource = Viv.BindData("Therapy", "TherapyID")
        cboTherapy.DataValueField = "TherapyID"
        cboTherapy.DataTextField = "Therapy"
        cboTherapy.DataBind()

        '---------cboPackcode
        cboPackcode.DataSource = Viv.BindData("PackCode", "PackCodeID")
        cboPackcode.DataValueField = "PackCodeID"
        cboPackcode.DataTextField = "PackCode"
        cboPackcode.DataBind()

        '---------cboBulkCode
        cboBulkCode.DataSource = Viv.BindData("BulkCode", "BulkCodeID")
        cboBulkCode.DataValueField = "BulkCodeID"
        cboBulkCode.DataTextField = "BulkCode"
        cboBulkCode.DataBind()

        '---------cboCurrency + cboCapexCurrency + cboWorkCapCurrency + cboRegulatoryCurrency + cboSampleCurrency + cboRDCurrency
        '---------cboQACurrency + cboAuditCurrency+ cboOtherCurrency + cboTotalCurrency

        dt = Viv.BindData("Currency", "CurrencyID")

        cboCurrency.DataSource = dt
        cboCurrency.DataValueField = "CurrencyID"
        cboCurrency.DataTextField = "Currency"
        cboCurrency.DataBind()

        cboCapexCurrency.DataSource = dt
        cboCapexCurrency.DataValueField = "CurrencyID"
        cboCapexCurrency.DataTextField = "Currency"
        cboCapexCurrency.DataBind()

        cboWorkCapCurrency.DataSource = dt
        cboWorkCapCurrency.DataValueField = "CurrencyID"
        cboWorkCapCurrency.DataTextField = "Currency"
        cboWorkCapCurrency.DataBind()

        cboRegulatoryCurrency.DataSource = dt
        cboRegulatoryCurrency.DataValueField = "CurrencyID"
        cboRegulatoryCurrency.DataTextField = "Currency"
        cboRegulatoryCurrency.DataBind()

        cboSampleCurrency.DataSource = dt
        cboSampleCurrency.DataValueField = "CurrencyID"
        cboSampleCurrency.DataTextField = "Currency"
        cboSampleCurrency.DataBind()

        cboRDCurrency.DataSource = dt
        cboRDCurrency.DataValueField = "CurrencyID"
        cboRDCurrency.DataTextField = "Currency"
        cboRDCurrency.DataBind()

        cboQACurrency.DataSource = dt
        cboQACurrency.DataValueField = "CurrencyID"
        cboQACurrency.DataTextField = "Currency"
        cboQACurrency.DataBind()

        cboAuditCurrency.DataSource = dt
        cboAuditCurrency.DataValueField = "CurrencyID"
        cboAuditCurrency.DataTextField = "Currency"
        cboAuditCurrency.DataBind()

        cboOtherCurrency.DataSource = dt
        cboOtherCurrency.DataValueField = "CurrencyID"
        cboOtherCurrency.DataTextField = "Currency"
        cboOtherCurrency.DataBind()

        cboTotalCurrency.DataSource = dt
        cboTotalCurrency.DataValueField = "CurrencyID"
        cboTotalCurrency.DataTextField = "Currency"
        cboTotalCurrency.DataBind()

        '---------cboStatus
        myDataSet = New DataSet
        myDataSet.ReadXml(Server.MapPath("tblStatus.xml"))
        cboStatus.DataSource = myDataSet.Tables("tblStatus").DefaultView
        cboStatus.DataBind()
        cboStatus.Items.Insert(0, "")

        '---------cbo of Months -> cboProjectStartMonth + cboSavingsStartMonth + cboTenureEndMonth
        myDataSet = New DataSet
        myDataSet.ReadXml(Server.MapPath("tblMonths.xml"))
        cboProjectStartMonth.DataSource = myDataSet.Tables("tblMonths").DefaultView
        cboProjectStartMonth.DataValueField = "MonthInteger"
        cboProjectStartMonth.DataTextField = "MonthLiteral"
        cboProjectStartMonth.DataBind()
        cboProjectStartMonth.Items.FindByValue(DateTime.Now.Month).Selected = True

        cboSavingsStartMonth.DataSource = myDataSet.Tables("tblMonths").DefaultView
        cboSavingsStartMonth.DataValueField = "MonthInteger"
        cboSavingsStartMonth.DataTextField = "MonthLiteral"
        cboSavingsStartMonth.DataBind()
        cboSavingsStartMonth.Items.FindByValue(DateTime.Now.Month).Selected = True

        cboSavingsEndMonth.DataSource = myDataSet.Tables("tblMonths").DefaultView
        cboSavingsEndMonth.DataValueField = "MonthInteger"
        cboSavingsEndMonth.DataTextField = "MonthLiteral"
        cboSavingsEndMonth.DataBind()
        cboSavingsEndMonth.Items.FindByValue(DateTime.Now.Month).Selected = True

        '---------cbo of Years -> cboProjectStartYear + cboSavingsStartYear + cboTenureEndYear
        myDataSet = New DataSet
        myDataSet.ReadXml(Server.MapPath("tblYears.xml"))
        cboProjectStartYear.DataSource = myDataSet.Tables("tblYears").DefaultView
        cboProjectStartYear.DataBind()
        cboProjectStartYear.Items.FindByValue(DateTime.Now.Year).Selected = True

        cboSavingsStartYear.DataSource = myDataSet.Tables("tblYears").DefaultView
        cboSavingsStartYear.DataBind()
        cboSavingsStartYear.Items.FindByValue(DateTime.Now.Year).Selected = True

        cboSavingsEndYear.DataSource = myDataSet.Tables("tblYears").DefaultView
        cboSavingsEndYear.DataBind()
        cboSavingsEndYear.Items.FindByValue(DateTime.Now.Year).Selected = True

    End Sub

    Sub Department_AfterUpdate(ByVal sender As Object, ByVal e As System.EventArgs)
        Department_Update()
    End Sub

    Sub Department_Update()
        '---------cboCategory <-cboDepartment
        cboCategory.Items.Clear()
        cboCategory.DataSource = Viv.BindData("CategoryDrop", cboDepartment.SelectedItem.Value)
        cboCategory.DataValueField = "CategoryID"
        cboCategory.DataTextField = "Category"
        cboCategory.DataBind()
    End Sub

    Sub DIC_AfterUpdate(ByVal sender As Object, ByVal e As System.EventArgs)
        DIC_Update()
    End Sub

    Sub DIC_Update()
        '---------cboExpenseHead <-cboDIC
        cboExpenseHead.Items.Clear()
        cboExpenseHead.DataSource = Viv.BindData("ExpenseHeadDrop", cboDIC.SelectedItem.Value)
        cboExpenseHead.DataValueField = "ExpenseHeadID"
        cboExpenseHead.DataTextField = "ExpenseHead"
        cboExpenseHead.DataBind()
    End Sub

    Sub ProjectMonth_AfterUpdate(ByVal sender As Object, ByVal e As System.EventArgs)
        cboSavingsStartMonth.SelectedIndex = cboProjectStartMonth.SelectedIndex
        cboSavingsStartYear.SelectedIndex = cboProjectStartYear.SelectedIndex
        cboSavingsEndMonth.SelectedIndex = cboProjectStartMonth.SelectedIndex
        cboSavingsEndYear.SelectedIndex = cboProjectStartYear.SelectedIndex
        subCalculateImpliedAccountingTime()
    End Sub

    Sub ProjectYear_AfterUpdate(ByVal sender As Object, ByVal e As System.EventArgs)
        cboSavingsStartYear.SelectedIndex = cboProjectStartYear.SelectedIndex
        cboSavingsEndYear.SelectedIndex = cboProjectStartYear.SelectedIndex
        subCalculateImpliedAccountingTime()
    End Sub

    Sub PerformCalculation(ByVal sender As Object, ByVal e As System.EventArgs)
        PerformCalculation()
    End Sub

    Sub PerformCalculation()
        subCalculateImpliedAccountingTime()
        subRecalculateProbAdjAmt()
        subRecalculateTimeAdjAmt()
        subRecalculateTotalAdjAmt()
    End Sub

    Sub subCalculateImpliedAccountingTime()
        Dim AccMonth As Double
        Dim AccYear As Double
        If (cboSavingsStartMonth.SelectedItem.Value <> "" And cboSavingsStartYear.SelectedItem.Value <> "") Then
            If (cboExpenseHead.SelectedItem.Text.Contains("RM")) Then
                AccMonth = System.Convert.ToDouble(cboSavingsStartMonth.SelectedItem.Value) + 2
                AccYear = System.Convert.ToDouble(cboSavingsStartYear.SelectedItem.Value)
            ElseIf (cboExpenseHead.SelectedItem.Text.Contains("PM")) Then
                AccMonth = System.Convert.ToDouble(cboSavingsStartMonth.SelectedItem.Value) + 1
                AccYear = System.Convert.ToDouble(cboSavingsStartYear.SelectedItem.Value)
            Else
                AccMonth = System.Convert.ToDouble(cboSavingsStartMonth.SelectedItem.Value)
                AccYear = System.Convert.ToDouble(cboSavingsStartYear.SelectedItem.Value)
            End If
            If (AccMonth > 12) Then
                AccMonth = AccMonth - 12
                AccYear = AccYear + 1
            End If
            txtAccountingMonth.Text = AccMonth
            txtAccountingYear.Text = AccYear
        End If
    End Sub

    Sub subRecalculateProbAdjAmt()
        Dim Savings As Double
        Dim Cost As Double
        Dim Probability As Double
        If (txtAnnualSavings.Text = "") Then
            txtAnnualSavings.Text = 0
        End If
        If (txtOneOffSaving.Text = "") Then
            txtOneOffSaving.Text = 0
        End If
        Savings = System.Convert.ToDouble(txtAnnualSavings.Text) + System.Convert.ToDouble(txtOneOffSaving.Text)
        Cost = 0 ' System.Convert.ToDouble(txtTotalCost.Text)
        Probability = System.Convert.ToDouble(cboProbability.SelectedItem.Value)
        txtProbabilityAdjustedAmt.Text = (Savings - Cost) * Probability / 100
    End Sub

    Sub subRecalculateTimeAdjAmt()
        Dim tempTime As Integer
        Dim Savings As Double
        Dim Cost As Double
        Dim SavingStartMonth As Double
        Dim SavingStartYear As Double

        If (txtAccountingMonth.Text <> "") Then
            SavingStartMonth = System.Convert.ToDouble(txtAccountingMonth.Text)
        Else
            SavingStartMonth = -1
        End If

        If (txtAccountingYear.Text <> "") Then
            SavingStartYear = System.Convert.ToDouble(txtAccountingYear.Text)
        Else
            SavingStartYear = -1
        End If

        If (SavingStartMonth > 0 And SavingStartYear > 0) Then
            If (SavingStartMonth <= 6) Then
                tempTime = 7 - SavingStartMonth
            Else
                tempTime = 19 - SavingStartMonth
            End If
        Else
            tempTime = 0
        End If

        Savings = System.Convert.ToDouble(txtAnnualSavings.Text)
        Cost = 0 'System.Convert.ToDouble(txtTotalCost.Text)
        txtTimeAdjustedAmount.Text = Math.Round(((Savings - Cost) * tempTime / 12) + System.Convert.ToDouble(txtOneOffSaving.Text))

    End Sub

    Sub subRecalculateTotalAdjAmt()
        txtTotalAdjustedAmount.Text = CStr(Math.Round(System.Convert.ToDouble(txtTimeAdjustedAmount.Text) * System.Convert.ToDouble(cboProbability.SelectedItem.Value) / 100))
    End Sub


    Sub SaveNewProject(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim DS As DataSet
        Dim MyCommand As SqlCommand
        Dim SavingBeginLiteral As String
        Dim ProjectBeginLiteral As String
        Dim StatusDatePlanned As Date
        Dim StatusDateInProgress As Date
        Dim StatusDateCompleted As Date
        Dim StatusDateFailed As Date
        Dim TempDate As Date
        Dim TempDate1 As Date
        Dim TempDate2 As Date
        Dim TempDate3 As Date
        Dim TempDate4 As Date
        Dim txtReasonChange As String
        Dim chkBoxChecked As Integer
        Dim chkBoxChecked1 As Integer
        Dim chkBoxChecked2 As Integer
        Dim chkBoxChecked3 As Integer
        Dim chkBoxChecked4 As Integer
        Dim chkBoxChecked5 As Integer
        Dim MsgText As String
        Dim i As Integer
        Dim strSQL As String
        Dim strIN As String
        Dim flgSelectAll As Boolean
        Dim temp As Integer
        Dim li As ListItem

        PerformCalculation()

        strSQL = ""

        
        MyCommand = New SqlCommand("InsertProject", con)
        MyCommand.CommandType = CommandType.StoredProcedure

        MyCommand.Parameters.Add(New SqlParameter("@ProjectName", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@ProjectName").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@BusinessUnitID", SqlDbType.Int, 4))
        MyCommand.Parameters("@BusinessUnitID").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@DepartmentID", SqlDbType.Int, 4))
        MyCommand.Parameters("@DepartmentID").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@Direct_Indirect_Capex", SqlDbType.NChar, 10))
        MyCommand.Parameters("@Direct_Indirect_Capex").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@PL_Capex", SqlDbType.NChar, 10))
        MyCommand.Parameters("@PL_Capex").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@ProjectLeader", SqlDbType.Int, 4))
        MyCommand.Parameters("@ProjectLeader").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@FinanceLeader", SqlDbType.Int, 4))
        MyCommand.Parameters("@FinanceLeader").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        -- data points for tProjectSavings
        MyCommand.Parameters.Add(New SqlParameter("@ProjectSavings", SqlDbType.Int, 4))
        MyCommand.Parameters("@ProjectSavings").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@ProjectBeginMonth", SqlDbType.Int, 4))
        MyCommand.Parameters("@ProjectBeginMonth").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@ProjectBeginYear", SqlDbType.Int, 4))
        MyCommand.Parameters("@ProjectBeginYear").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@SavingBeginMonth", SqlDbType.Int, 4))
        MyCommand.Parameters("@SavingBeginMonth").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@SavingBeginYear", SqlDbType.Int, 4))
        MyCommand.Parameters("@SavingBeginYear").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@SavingsEndMonth", SqlDbType.Int, 4))
        MyCommand.Parameters("@SavingsEndMonth").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@SavingsEndYear", SqlDbType.Int, 4))
        MyCommand.Parameters("@SavingsEndYear").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@TotalAnnualSavings", SqlDbType.Float, 8))
        MyCommand.Parameters("@TotalAnnualSavings").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@OneOffSavings", SqlDbType.Float, 8))
        MyCommand.Parameters("@OneOffSavings").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@Currency", SqlDbType.Int, 4))
        MyCommand.Parameters("@Currency").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@Risk", SqlDbType.Int, 4))
        MyCommand.Parameters("@Risk").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@Status", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@Status").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@CommittedToForecast", SqlDbType.Bit))
        MyCommand.Parameters("@CommittedToForecast").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        -- data points for tProjectSavingsCal
        MyCommand.Parameters.Add(New SqlParameter("@FiscalYear", SqlDbType.Int, 4))
        MyCommand.Parameters("@FiscalYear").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@ProbabilityAdjAmt", SqlDbType.Float, 8))
        MyCommand.Parameters("@ProbabilityAdjAmt").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@TimeAdjAmt", SqlDbType.Float, 8))
        MyCommand.Parameters("@TimeAdjAmt").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@TotalAdjAmt", SqlDbType.Float, 8))
        MyCommand.Parameters("@TotalAdjAmt").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        -- data points for tProjectsCost
        MyCommand.Parameters.Add(New SqlParameter("@Capex", SqlDbType.Float, 8))
        MyCommand.Parameters("@Capex").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@WorkingCapital", SqlDbType.Float, 8))
        MyCommand.Parameters("@WorkingCapital").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@RegulatoryCost", SqlDbType.Float, 8))
        MyCommand.Parameters("@RegulatoryCost").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@SampleCost", SqlDbType.Float, 8))
        MyCommand.Parameters("@SampleCost").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@RDcost", SqlDbType.Float, 8))
        MyCommand.Parameters("@RDcost").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@QAQCCost", SqlDbType.Float, 8))
        MyCommand.Parameters("@QAQCCost").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@AuditCost", SqlDbType.Float, 8))
        MyCommand.Parameters("@AuditCost").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@OtherCost", SqlDbType.Float, 8))
        MyCommand.Parameters("@OtherCost").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@TotalCost", SqlDbType.Float, 8))
        MyCommand.Parameters("@TotalCost").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@CapexCurrency", SqlDbType.Int, 4))
        MyCommand.Parameters("@CapexCurrency").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@WorkingCapitalCurrency", SqlDbType.Int, 4))
        MyCommand.Parameters("@WorkingCapitalCurrency").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@RegulatoryCostCurrency", SqlDbType.Int, 4))
        MyCommand.Parameters("@RegulatoryCostCurrency").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@SampleCostCurrency", SqlDbType.Int, 4))
        MyCommand.Parameters("@SampleCostCurrency").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@RDcostCurrency", SqlDbType.Int, 4))
        MyCommand.Parameters("@RDcostCurrency").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@QAQCCostCurrency", SqlDbType.Int, 4))
        MyCommand.Parameters("@QAQCCostCurrency").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@AuditCostCurrency", SqlDbType.Int, 4))
        MyCommand.Parameters("@AuditCostCurrency").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@OtherCostCurrency", SqlDbType.Int, 4))
        MyCommand.Parameters("@OtherCostCurrency").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@TotalCostCurrency", SqlDbType.Int, 4))
        MyCommand.Parameters("@TotalCostCurrency").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@CapexJustification", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@CapexJustification").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@WorkingCapitalJustification", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@WorkingCapitalJustification").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@RegulatoryCostJustification", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@RegulatoryCostJustification").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@SampleCostJustification", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@SampleCostJustification").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@RDcostJustification", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@RDcostJustification").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@QAQCCostJustification", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@QAQCCostJustification").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@AuditCostJustification", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@AuditCostJustification").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@OtherCostJustification", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@OtherCostJustification").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@TotalCostJustification", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@TotalCostJustification").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        -- data points for uProjectTherapy
        MyCommand.Parameters.Add(New SqlParameter("@TherapyID", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@TherapyID").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        -- data points for uProjectPersonnel
        MyCommand.Parameters.Add(New SqlParameter("@PersonnelID", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@PersonnelID").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        -- data points for uProjectPackCode
        MyCommand.Parameters.Add(New SqlParameter("@PackCodeID", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@PackCodeID").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        -- data points for uProjectMfgCode
        MyCommand.Parameters.Add(New SqlParameter("@MfgCodeID", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@MfgCodeID").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        -- data points for uProjectExpenseHead
        MyCommand.Parameters.Add(New SqlParameter("@ExpenseHeadID", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@ExpenseHeadID").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        -- data points for uProjectDosage
        MyCommand.Parameters.Add(New SqlParameter("@DosageID", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@DosageID").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        -- data points for uProjectCategory
        MyCommand.Parameters.Add(New SqlParameter("@CategoryID", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@CategoryID").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value
        -- data points for uProjectBulkCode
        MyCommand.Parameters.Add(New SqlParameter("@BulkCodeID", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@BulkCodeID").Value = cboCategory.SelectedItem.Value
        strSQL = +cboCategory.SelectedItem.Value




        '---------------------------------- Common fields
        If (cboProjectStartMonth.SelectedItem.Value = "" Or cboProjectStartYear.SelectedItem.Value = "") Then
            ProjectBeginLiteral = Nothing
        Else
            TempDate3 = CStr(cboProjectStartMonth.SelectedItem.Value) & "/1/" & CStr(cboProjectStartYear.SelectedItem.Value)
            ProjectBeginLiteral = TempDate3.ToString("MMM-yy")
        End If

        If (cboProjectStartMonth.SelectedItem.Value = "" Or cboProjectStartYear.SelectedItem.Value = "") Then
            SavingBeginLiteral = Nothing
        Else
            TempDate4 = CStr(cboSavingsStartMonth.SelectedItem.Value) & "/1/" & CStr(cboSavingsStartYear.SelectedItem.Value)
            SavingBeginLiteral = TempDate4.ToString("MMM-yy")
        End If

        chkBoxChecked = (CType(chkCommitted, CheckBox).Checked) * -1
        

        If (txtRecoverableLosses.Text = "") Then
            txtRecoverableLosses.Text = "0"
        End If
        If (txtCostAmt.Text = "") Then
            txtCostAmt.Text = "0"
        End If
        If (txtProbability.SelectedItem.Value = "") Then
            txtProbability.SelectedItem.Value = "0"
        End If
        If (txtProbabilityAdjustedAmt.Text = "") Then
            txtProbabilityAdjustedAmt.Text = "0"
        End If
        If (txtTimeAdjustedAmount.Text = "") Then
            txtTimeAdjustedAmount.Text = "0"
        End If
        If (txtTotalAdjustedAmount.Text = "") Then
            txtTotalAdjustedAmount.Text = "0"
        End If

        '-----------------this is to read the ListBox 
        strIN = ""
        ' Build the IN string for Team Leader by looping through the listbox
        For Each li In cboProjectLeader.Items
            If li.Selected = True Then
                strIN = strIN & li.Value & ","
            End If
        Next
        '-----------------this is end of to read the ListBox

        

        MyCommand.Parameters("@ProjectLeaderID").Value = System.Convert.ToInt64(cboProjectLeader.SelectedItem.Value)
        MyCommand.Parameters("@IsTDC").Value = chkBoxChecked2
        
        '---------------------------------- TDC Part
        If (chkBoxChecked2 = 1) Then

            Dim FiscalYear As Integer
            If (System.Convert.ToInt32(AccountingMonth.Text) > 6) Then
                FiscalYear = System.Convert.ToInt32(AccountingYear.Text)
            Else
                FiscalYear = System.Convert.ToInt32(AccountingYear.Text) - 1
            End If

            MyCommand.Parameters.Add(New SqlParameter("@CostAmt", SqlDbType.Float, 8))
            MyCommand.Parameters("@CostAmt").Value = System.Convert.ToDouble(txtCostAmt.Text)
            MyCommand.Parameters.Add(New SqlParameter("@TDCSubElement", SqlDbType.NVarChar, 50))
            MyCommand.Parameters("@TDCSubElement").Value = cboTDCSubElement.SelectedItem.Value
            MyCommand.Parameters.Add(New SqlParameter("@ImpliedSavStartMonth", SqlDbType.SmallInt, 2))
            MyCommand.Parameters("@ImpliedSavStartMonth").Value = System.Convert.ToInt32(AccountingMonth.Text)
            MyCommand.Parameters.Add(New SqlParameter("@ImpliedSavStartYear", SqlDbType.SmallInt, 2))
            MyCommand.Parameters("@ImpliedSavStartYear").Value = System.Convert.ToInt32(AccountingYear.Text)
            MyCommand.Parameters.Add(New SqlParameter("@FiscalYear", SqlDbType.SmallInt, 2))
            MyCommand.Parameters("@FiscalYear").Value = FiscalYear
            MyCommand.Parameters.Add(New SqlParameter("@RecoverableLosses", SqlDbType.Float, 8))
            MyCommand.Parameters("@RecoverableLosses").Value = System.Convert.ToDouble(txtRecoverableLosses.Text)
            MyCommand.Parameters.Add(New SqlParameter("@CostBucket", SqlDbType.NVarChar, 50))
            MyCommand.Parameters("@CostBucket").Value = cboCostBucket.SelectedItem.Value
            MyCommand.Parameters.Add(New SqlParameter("@Probability", SqlDbType.Float, 8))
            MyCommand.Parameters("@Probability").Value = txtProbability.SelectedItem.Value
            MyCommand.Parameters.Add(New SqlParameter("@ProbabilityAdjustedAmt", SqlDbType.Float, 8))
            MyCommand.Parameters("@ProbabilityAdjustedAmt").Value = System.Convert.ToDouble(txtProbabilityAdjustedAmt.Text)
            MyCommand.Parameters.Add(New SqlParameter("@TimeAdjustedAmt", SqlDbType.Int, 4))
            MyCommand.Parameters("@TimeAdjustedAmt").Value = System.Convert.ToInt64(txtTimeAdjustedAmount.Text)
            MyCommand.Parameters.Add(New SqlParameter("@TotalAdjustedAmt", SqlDbType.Int, 4))
            MyCommand.Parameters("@TotalAdjustedAmt").Value = System.Convert.ToInt64(txtTotalAdjustedAmount.Text)
            MyCommand.Parameters.Add(New SqlParameter("@Description", SqlDbType.NVarChar, 255))
            MyCommand.Parameters("@Description").Value = txtDescription.Text
            MyCommand.Parameters.Add(New SqlParameter("@ReasonForChange", SqlDbType.NVarChar, 255))
            MyCommand.Parameters("@ReasonForChange").Value = "do not know"
            MyCommand.Parameters.Add(New SqlParameter("@Status", SqlDbType.NVarChar, 50))
            MyCommand.Parameters("@Status").Value = cboStatus.SelectedItem.Value
            MyCommand.Parameters.Add(New SqlParameter("@ProjectStage", SqlDbType.NVarChar, 50))
            MyCommand.Parameters("@ProjectStage").Value = ProjectStage.SelectedItem.Value
            MyCommand.Parameters.Add(New SqlParameter("@CommittedForecast", SqlDbType.Bit, 1))
            MyCommand.Parameters("@CommittedForecast").Value = chkBoxChecked
        End If
        
        MyCommand.Parameters.Add(New SqlParameter("@Standards", SqlDbType.Bit))
        MyCommand.Parameters("@Standards").Value = chkBoxChecked1

        MyCommand.Connection.Open()
        Try
            MyCommand.ExecuteNonQuery()
        Catch Exp As SqlException
            Dim errorMessages As String
            Dim i As Integer

            For i = 0 To Exp.Errors.Count - 1
                errorMessages += "Index #" & i.ToString() & ControlChars.NewLine _
                               & "Message: " & Exp.Errors(i).Message & ControlChars.NewLine _
                               & "LineNumber: " & Exp.Errors(i).LineNumber & ControlChars.NewLine _
                               & "Source: " & Exp.Errors(i).Source & ControlChars.NewLine _
                               & "Procedure: " & Exp.Errors(i).Procedure & ControlChars.NewLine
            Next i
            TestOut.Text = errorMessages
        End Try
        MyCommand.Connection.Close()
        'Response.Redirect("default.aspx")
        
    End Sub


    Private Sub Cancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Cancel.Click
        Response.Redirect("default.aspx")
    End Sub

End Class