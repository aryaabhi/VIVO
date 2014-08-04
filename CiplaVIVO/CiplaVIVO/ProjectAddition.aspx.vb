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
        cboProjectStartMonth.DataBind()
        cboProjectStartMonth.Items.FindByValue(DateTime.Now.Month).Selected = True

        cboProjectEndMonth.DataSource = myDataSet.Tables("tblMonths").DefaultView
        cboProjectEndMonth.DataBind()
        cboProjectEndMonth.Items.FindByValue(DateTime.Now.Month).Selected = True

        cboSavingsStartMonth.DataSource = myDataSet.Tables("tblMonths").DefaultView
        cboSavingsStartMonth.DataBind()
        cboSavingsStartMonth.Items.FindByValue(DateTime.Now.Month).Selected = True

        cboSavingsEndMonth.DataSource = myDataSet.Tables("tblMonths").DefaultView
        cboSavingsEndMonth.DataBind()
        cboSavingsEndMonth.Items.FindByValue(DateTime.Now.Month).Selected = True

        '---------cbo of Years -> cboProjectStartYear + cboSavingsStartYear + cboTenureEndYear
        myDataSet = New DataSet
        myDataSet.ReadXml(Server.MapPath("tblYears.xml"))
        cboProjectStartYear.DataSource = myDataSet.Tables("tblYears").DefaultView
        cboProjectStartYear.DataBind()
        cboProjectStartYear.Items.FindByValue(DateTime.Now.Year).Selected = True

        cboProjectEndYear.DataSource = myDataSet.Tables("tblYears").DefaultView
        cboProjectEndYear.DataBind()
        cboProjectEndYear.Items.FindByValue(DateTime.Now.Year).Selected = True

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
        Dim MyCommand As SqlCommand
        Dim strSQL As String
        Dim strIN As String
        Dim li As ListItem
        Dim checkBox As Integer

        PerformCalculation()

        strSQL = ""
        checkBox = (CType(chkCommitted, CheckBox).Checked) * -1

        If (txtAnnualSavings.Text = "") Then
            txtAnnualSavings.Text = "0"
        End If
        If (txtOneOffSaving.Text = "") Then
            txtOneOffSaving.Text = "0"
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

        MyCommand = New SqlCommand("InsertProject", con)
        MyCommand.CommandType = CommandType.StoredProcedure

        
        '-- data points for tProject
        MyCommand.Parameters.Add(New SqlParameter("@ProjectName", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@ProjectName").Value = txtProjectName.Text
        strSQL = strSQL + "*" + txtProjectName.Text
        MyCommand.Parameters.Add(New SqlParameter("@DepartmentID", SqlDbType.Int, 4))
        MyCommand.Parameters("@DepartmentID").Value = System.Convert.ToInt64(cboDepartment.SelectedItem.Value)
        strSQL = strSQL + "*" + cboDepartment.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@Direct_Indirect_Capex", SqlDbType.NChar, 10))
        MyCommand.Parameters("@Direct_Indirect_Capex").Value = cboDIC.SelectedItem.Value
        strSQL = strSQL + "*" + cboDIC.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@PL_Capex", SqlDbType.NChar, 10))
        MyCommand.Parameters("@PL_Capex").Value = plcapex.SelectedItem.Value
        strSQL = strSQL + "*" + plcapex.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@ProjectLeader", SqlDbType.Int, 4))
        MyCommand.Parameters("@ProjectLeader").Value = System.Convert.ToInt64(cboProjectLeader.SelectedItem.Value)
        strSQL = strSQL + "*" + cboProjectLeader.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@FinanceLeader", SqlDbType.Int, 4))
        MyCommand.Parameters("@FinanceLeader").Value = System.Convert.ToInt64(cboFinanceLeader.SelectedItem.Value)
        strSQL = strSQL + "*" + cboFinanceLeader.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@ExpenseHeadID", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@ExpenseHeadID").Value = cboExpenseHead.SelectedItem.Value
        strSQL = strSQL + "*" + cboExpenseHead.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@ProjectClassification", SqlDbType.NVarChar, 50))
        MyCommand.Parameters("@ProjectClassification").Value = cboProjectClassification.SelectedItem.Value
        strSQL = strSQL + "*" + cboProjectClassification.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@ProjectSummary", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@ProjectSummary").Value = txtProjectSummary.Text
        strSQL = strSQL + "*" + txtProjectSummary.Text
        '-- data points for tProjectSavings
        MyCommand.Parameters.Add(New SqlParameter("@ProjectBeginMonth", SqlDbType.Int, 4))
        MyCommand.Parameters("@ProjectBeginMonth").Value = System.Convert.ToInt64(cboProjectStartMonth.SelectedItem.Value)
        strSQL = strSQL + "*" + cboProjectStartMonth.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@ProjectBeginYear", SqlDbType.Int, 4))
        MyCommand.Parameters("@ProjectBeginYear").Value = System.Convert.ToInt64(cboProjectStartYear.SelectedItem.Value)
        strSQL = strSQL + "*" + cboProjectStartYear.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@SavingBeginMonth", SqlDbType.Int, 4))
        MyCommand.Parameters("@SavingBeginMonth").Value = System.Convert.ToInt64(cboSavingsStartMonth.SelectedItem.Value)
        strSQL = strSQL + "*" + cboSavingsStartMonth.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@SavingBeginYear", SqlDbType.Int, 4))
        MyCommand.Parameters("@SavingBeginYear").Value = System.Convert.ToInt64(cboSavingsStartYear.SelectedItem.Value)
        strSQL = strSQL + "*" + cboSavingsStartYear.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@SavingsEndMonth", SqlDbType.Int, 4))
        MyCommand.Parameters("@SavingsEndMonth").Value = System.Convert.ToInt64(cboSavingsEndMonth.SelectedItem.Value)
        strSQL = strSQL + "*" + cboSavingsEndMonth.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@SavingsEndYear", SqlDbType.Int, 4))
        MyCommand.Parameters("@SavingsEndYear").Value = System.Convert.ToInt64(cboSavingsEndYear.SelectedItem.Value)
        strSQL = strSQL + "*" + cboSavingsEndYear.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@TotalAnnualSavings", SqlDbType.Float, 8))
        MyCommand.Parameters("@TotalAnnualSavings").Value = System.Convert.ToDouble(txtAnnualSavings.Text)
        strSQL = strSQL + "*" + txtAnnualSavings.Text
        MyCommand.Parameters.Add(New SqlParameter("@OneOffSavings", SqlDbType.Float, 8))
        MyCommand.Parameters("@OneOffSavings").Value = System.Convert.ToDouble(txtOneOffSaving.Text)
        strSQL = strSQL + "*" + txtOneOffSaving.Text
        MyCommand.Parameters.Add(New SqlParameter("@Currency", SqlDbType.Int, 4))
        MyCommand.Parameters("@Currency").Value = System.Convert.ToInt64(cboCurrency.SelectedItem.Value)
        strSQL = strSQL + "*" + cboCurrency.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@Risk", SqlDbType.Int, 4))
        MyCommand.Parameters("@Risk").Value = System.Convert.ToInt64(cboProbability.SelectedItem.Value)
        strSQL = strSQL + "*" + cboProbability.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@Status", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@Status").Value = cboStatus.SelectedItem.Value
        strSQL = strSQL + "*" + cboStatus.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@CommittedToForecast", SqlDbType.Bit))
        MyCommand.Parameters("@CommittedToForecast").Value = checkBox
        strSQL = strSQL + "*" + checkBox.ToString
        MyCommand.Parameters.Add(New SqlParameter("@ProjectEndMonth", SqlDbType.Int, 4))
        MyCommand.Parameters("@ProjectEndMonth").Value = System.Convert.ToInt64(cboProjectEndMonth.SelectedItem.Value)
        strSQL = strSQL + "*" + cboProjectEndMonth.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@ProjectEndYear", SqlDbType.Int, 4))
        MyCommand.Parameters("@ProjectEndYear").Value = System.Convert.ToInt64(cboProjectEndYear.SelectedItem.Value)
        strSQL = strSQL + "*" + cboProjectEndYear.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@Stage", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@Stage").Value = txtStage.Text
        strSQL = strSQL + "*" + txtStage.Text
        '-- data points for tProjectSavingsCal
        MyCommand.Parameters.Add(New SqlParameter("@FiscalYear", SqlDbType.Int, 4))
        MyCommand.Parameters("@FiscalYear").Value = System.Convert.ToInt64(txtAccountingYear.Text)
        strSQL = strSQL + "*" + txtAccountingYear.Text
        MyCommand.Parameters.Add(New SqlParameter("@ProbabilityAdjAmt", SqlDbType.Float, 8))
        MyCommand.Parameters("@ProbabilityAdjAmt").Value = System.Convert.ToDouble(txtProbabilityAdjustedAmt.Text)
        strSQL = strSQL + "*" + txtProbabilityAdjustedAmt.Text
        MyCommand.Parameters.Add(New SqlParameter("@TimeAdjAmt", SqlDbType.Float, 8))
        MyCommand.Parameters("@TimeAdjAmt").Value = System.Convert.ToDouble(txtTimeAdjustedAmount.Text)
        strSQL = strSQL + "*" + txtTimeAdjustedAmount.Text
        MyCommand.Parameters.Add(New SqlParameter("@TotalAdjAmt", SqlDbType.Float, 8))
        MyCommand.Parameters("@TotalAdjAmt").Value = System.Convert.ToDouble(txtTotalAdjustedAmount.Text)
        strSQL = strSQL + "*" + txtTotalAdjustedAmount.Text
        '-- data points for tProjectsCost
        MyCommand.Parameters.Add(New SqlParameter("@Capex", SqlDbType.Float, 8))
        MyCommand.Parameters("@Capex").Value = System.Convert.ToDouble(txtCapexCost.Text)
        strSQL = strSQL + "*" + txtCapexCost.Text
        MyCommand.Parameters.Add(New SqlParameter("@WorkingCapital", SqlDbType.Float, 8))
        MyCommand.Parameters("@WorkingCapital").Value = System.Convert.ToDouble(txtWorkCapCost.Text)
        strSQL = strSQL + "*" + txtWorkCapCost.Text
        MyCommand.Parameters.Add(New SqlParameter("@RegulatoryCost", SqlDbType.Float, 8))
        MyCommand.Parameters("@RegulatoryCost").Value = System.Convert.ToDouble(txtRegulatoryCost.Text)
        strSQL = strSQL + "*" + txtRegulatoryCost.Text
        MyCommand.Parameters.Add(New SqlParameter("@SampleCost", SqlDbType.Float, 8))
        MyCommand.Parameters("@SampleCost").Value = System.Convert.ToDouble(txtSampleCost.Text)
        strSQL = strSQL + "*" + txtSampleCost.Text
        MyCommand.Parameters.Add(New SqlParameter("@RDcost", SqlDbType.Float, 8))
        MyCommand.Parameters("@RDcost").Value = System.Convert.ToDouble(txtRDCost.Text)
        strSQL = strSQL + "*" + txtRDCost.Text
        MyCommand.Parameters.Add(New SqlParameter("@QAQCCost", SqlDbType.Float, 8))
        MyCommand.Parameters("@QAQCCost").Value = System.Convert.ToDouble(txtQACost.Text)
        strSQL = strSQL + "*" + txtQACost.Text
        MyCommand.Parameters.Add(New SqlParameter("@AuditCost", SqlDbType.Float, 8))
        MyCommand.Parameters("@AuditCost").Value = System.Convert.ToDouble(txtAuditCost.Text)
        strSQL = strSQL + "*" + txtAuditCost.Text
        MyCommand.Parameters.Add(New SqlParameter("@OtherCost", SqlDbType.Float, 8))
        MyCommand.Parameters("@OtherCost").Value = System.Convert.ToDouble(txtOtherCost.Text)
        strSQL = strSQL + "*" + txtOtherCost.Text
        MyCommand.Parameters.Add(New SqlParameter("@TotalCost", SqlDbType.Float, 8))
        MyCommand.Parameters("@TotalCost").Value = System.Convert.ToDouble(txtTotalCost.Text)
        strSQL = strSQL + "*" + txtTotalCost.Text
        MyCommand.Parameters.Add(New SqlParameter("@CapexCurrency", SqlDbType.Int, 4))
        MyCommand.Parameters("@CapexCurrency").Value = System.Convert.ToInt64(cboCapexCurrency.SelectedItem.Value)
        strSQL = strSQL + "*" + cboCapexCurrency.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@WorkingCapitalCurrency", SqlDbType.Int, 4))
        MyCommand.Parameters("@WorkingCapitalCurrency").Value = System.Convert.ToInt64(cboWorkCapCurrency.SelectedItem.Value)
        strSQL = strSQL + "*" + cboWorkCapCurrency.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@RegulatoryCostCurrency", SqlDbType.Int, 4))
        MyCommand.Parameters("@RegulatoryCostCurrency").Value = System.Convert.ToInt64(cboRegulatoryCurrency.SelectedItem.Value)
        strSQL = strSQL + "*" + cboRegulatoryCurrency.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@SampleCostCurrency", SqlDbType.Int, 4))
        MyCommand.Parameters("@SampleCostCurrency").Value = System.Convert.ToInt64(cboSampleCurrency.SelectedItem.Value)
        strSQL = strSQL + "*" + cboSampleCurrency.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@RDcostCurrency", SqlDbType.Int, 4))
        MyCommand.Parameters("@RDcostCurrency").Value = System.Convert.ToInt64(cboRDCurrency.SelectedItem.Value)
        strSQL = strSQL + "*" + cboRDCurrency.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@QAQCCostCurrency", SqlDbType.Int, 4))
        MyCommand.Parameters("@QAQCCostCurrency").Value = System.Convert.ToInt64(cboQACurrency.SelectedItem.Value)
        strSQL = strSQL + "*" + cboQACurrency.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@AuditCostCurrency", SqlDbType.Int, 4))
        MyCommand.Parameters("@AuditCostCurrency").Value = System.Convert.ToInt64(cboAuditCurrency.SelectedItem.Value)
        strSQL = strSQL + "*" + cboAuditCurrency.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@OtherCostCurrency", SqlDbType.Int, 4))
        MyCommand.Parameters("@OtherCostCurrency").Value = System.Convert.ToInt64(cboOtherCurrency.SelectedItem.Value)
        strSQL = strSQL + "*" + cboOtherCurrency.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@TotalCostCurrency", SqlDbType.Int, 4))
        MyCommand.Parameters("@TotalCostCurrency").Value = System.Convert.ToInt64(cboTotalCurrency.SelectedItem.Value)
        strSQL = strSQL + "*" + cboTotalCurrency.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@CapexJustification", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@CapexJustification").Value = txtCapexJust.Text
        strSQL = strSQL + "*" + txtCapexJust.Text
        MyCommand.Parameters.Add(New SqlParameter("@WorkingCapitalJustification", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@WorkingCapitalJustification").Value = txtWorkCapJust.Text
        strSQL = strSQL + "*" + txtWorkCapJust.Text
        MyCommand.Parameters.Add(New SqlParameter("@RegulatoryCostJustification", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@RegulatoryCostJustification").Value = txtRegulatoryJust.Text
        strSQL = strSQL + "*" + txtRegulatoryJust.Text
        MyCommand.Parameters.Add(New SqlParameter("@SampleCostJustification", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@SampleCostJustification").Value = txtSampleJust.Text
        strSQL = strSQL + "*" + txtSampleJust.Text
        MyCommand.Parameters.Add(New SqlParameter("@RDcostJustification", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@RDcostJustification").Value = txtRDJust.Text
        strSQL = strSQL + "*" + txtRDJust.Text
        MyCommand.Parameters.Add(New SqlParameter("@QAQCCostJustification", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@QAQCCostJustification").Value = txtQAJust.Text
        strSQL = strSQL + "*" + txtQAJust.Text
        MyCommand.Parameters.Add(New SqlParameter("@AuditCostJustification", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@AuditCostJustification").Value = txtAuditJust.Text
        strSQL = strSQL + "*" + txtAuditJust.Text
        MyCommand.Parameters.Add(New SqlParameter("@OtherCostJustification", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@OtherCostJustification").Value = txtOtherJust.Text
        strSQL = strSQL + "*" + txtOtherJust.Text
        MyCommand.Parameters.Add(New SqlParameter("@TotalCostJustification", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@TotalCostJustification").Value = txtTotalJust.Text
        strSQL = strSQL + "*" + txtTotalJust.Text
        '-- data points for uProjectTherapy
        MyCommand.Parameters.Add(New SqlParameter("@TherapyID", SqlDbType.NVarChar, 200))
        strIN = ""
        For Each li In cboTherapy.Items
            If li.Selected = True Then
                strIN = strIN & li.Value & "|"
            End If
        Next
        MyCommand.Parameters("@TherapyID").Value = strIN
        strSQL = strSQL + "*" + strIN
        '-- data points for uProjectPersonnel
        MyCommand.Parameters.Add(New SqlParameter("@PersonnelID", SqlDbType.NVarChar, 200))
        strIN = ""
        For Each li In cboTeamMembers.Items
            If li.Selected = True Then
                strIN = strIN & li.Value & "|"
            End If
        Next
        MyCommand.Parameters("@PersonnelID").Value = strIN
        strSQL = strSQL + "*" + strIN
        '-- data points for uProjectPackCode
        MyCommand.Parameters.Add(New SqlParameter("@PackCodeID", SqlDbType.NVarChar, 200))
        strIN = ""
        For Each li In cboPackcode.Items
            If li.Selected = True Then
                strIN = strIN & li.Value & "|"
            End If
        Next
        MyCommand.Parameters("@PackCodeID").Value = strIN
        strSQL = strSQL + "*" + strIN
        '-- data points for uProjectMfgCode
        MyCommand.Parameters.Add(New SqlParameter("@MfgCodeID", SqlDbType.NVarChar, 200))
        strIN = ""
        For Each li In cboMfgCode.Items
            If li.Selected = True Then
                strIN = strIN & li.Value & "|"
            End If
        Next
        MyCommand.Parameters("@MfgCodeID").Value = strIN
        strSQL = strSQL + "*" + strIN
        '-- data points for uProjectBusinessunit
        MyCommand.Parameters.Add(New SqlParameter("@BusinessUnitID", SqlDbType.Int, 4))
        strIN = ""
        For Each li In cboBusinessUnit.Items
            If li.Selected = True Then
                strIN = strIN & li.Value & "|"
            End If
        Next
        MyCommand.Parameters("@BusinessUnitID").Value = strIN
        strSQL = strSQL + "*" + strIN
        '-- data points for uProjectDosage
        MyCommand.Parameters.Add(New SqlParameter("@DosageID", SqlDbType.NVarChar, 200))
        strIN = ""
        For Each li In cboDosage.Items
            If li.Selected = True Then
                strIN = strIN & li.Value & "|"
            End If
        Next
        MyCommand.Parameters("@DosageID").Value = strIN
        strSQL = strSQL + "*" + strIN
        '-- data points for uProjectCategory
        MyCommand.Parameters.Add(New SqlParameter("@CategoryID", SqlDbType.NVarChar, 200))
        strIN = ""
        For Each li In cboCategory.Items
            If li.Selected = True Then
                strIN = strIN & li.Value & "|"
            End If
        Next
        MyCommand.Parameters("@CategoryID").Value = strIN
        strSQL = strSQL + "*" + strIN
        '-- data points for uProjectBulkCode
        MyCommand.Parameters.Add(New SqlParameter("@BulkCodeID", SqlDbType.NVarChar, 200))
        strIN = ""
        For Each li In cboBulkCode.Items
            If li.Selected = True Then
                strIN = strIN & li.Value & "|"
            End If
        Next
        MyCommand.Parameters("@BulkCodeID").Value = strIN
        strSQL = strSQL + "*" + strIN

        TestOut.Text = strSQL
        '---here cut paste the code from text file
        'Response.Redirect("default.aspx")
        
    End Sub


    Private Sub Cancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Cancel.Click
        Response.Redirect("default.aspx")
    End Sub

End Class