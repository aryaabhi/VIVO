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

        '--------------------Update category
        DIC_Update()

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
        strSQL += "*" + txtProjectName.Text
        MyCommand.Parameters.Add(New SqlParameter("@DepartmentID", SqlDbType.Int, 2))
        MyCommand.Parameters("@DepartmentID").Value = System.Convert.ToInt32(cboDepartment.SelectedItem.Value)
        strSQL += "*" + cboDepartment.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@Direct_Indirect_Capex", SqlDbType.NChar, 10))
        MyCommand.Parameters("@Direct_Indirect_Capex").Value = cboDIC.SelectedItem.Value
        strSQL += "*" + cboDIC.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@PL_Capex", SqlDbType.NChar, 10))
        MyCommand.Parameters("@PL_Capex").Value = plcapex.SelectedItem.Value
        strSQL += "*" + plcapex.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@ProjectLeader", SqlDbType.Int, 2))
        MyCommand.Parameters("@ProjectLeader").Value = System.Convert.ToInt32(cboProjectLeader.SelectedItem.Value)
        strSQL += "*" + cboProjectLeader.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@FinanceLeader", SqlDbType.Int, 2))
        MyCommand.Parameters("@FinanceLeader").Value = System.Convert.ToInt32(cboFinanceLeader.SelectedItem.Value)
        strSQL += "*" + cboFinanceLeader.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@ExpenseHeadID", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@ExpenseHeadID").Value = cboExpenseHead.SelectedItem.Value
        strSQL += "*" + cboExpenseHead.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@ProjectClassification", SqlDbType.NVarChar, 50))
        MyCommand.Parameters("@ProjectClassification").Value = cboProjectClassification.SelectedItem.Value
        strSQL += "*" + cboProjectClassification.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@ProjectSummary", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@ProjectSummary").Value = txtProjectSummary.Text
        strSQL += "*" + txtProjectSummary.Text
        MyCommand.Parameters.Add(New SqlParameter("@BusinessUnit", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@BusinessUnit").Value = cboBusinessUnit.SelectedItem.Text
        strSQL += "*" + cboBusinessUnit.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@BusinessUnitID", SqlDbType.Int, 2))
        MyCommand.Parameters("@BusinessUnitID").Value = System.Convert.ToInt32(cboBusinessUnit.SelectedItem.Value)
        strSQL += "*" + txtProjectSummary.Text


        '-- data points for tProjectSavings
        MyCommand.Parameters.Add(New SqlParameter("@ProjectBeginMonth", SqlDbType.Int, 2))
        MyCommand.Parameters("@ProjectBeginMonth").Value = System.Convert.ToInt32(cboProjectStartMonth.SelectedItem.Value)
        strSQL += "*" + cboProjectStartMonth.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@ProjectBeginYear", SqlDbType.Int, 2))
        MyCommand.Parameters("@ProjectBeginYear").Value = System.Convert.ToInt32(cboProjectStartYear.SelectedItem.Value)
        strSQL += "*" + cboProjectStartYear.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@SavingBeginMonth", SqlDbType.Int, 2))
        MyCommand.Parameters("@SavingBeginMonth").Value = System.Convert.ToInt32(cboSavingsStartMonth.SelectedItem.Value)
        strSQL += "*" + cboSavingsStartMonth.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@SavingBeginYear", SqlDbType.Int, 2))
        MyCommand.Parameters("@SavingBeginYear").Value = System.Convert.ToInt32(cboSavingsStartYear.SelectedItem.Value)
        strSQL += "*" + cboSavingsStartYear.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@SavingsEndMonth", SqlDbType.Int, 2))
        MyCommand.Parameters("@SavingsEndMonth").Value = System.Convert.ToInt32(cboSavingsEndMonth.SelectedItem.Value)
        strSQL += "*" + cboSavingsEndMonth.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@SavingsEndYear", SqlDbType.Int, 2))
        MyCommand.Parameters("@SavingsEndYear").Value = System.Convert.ToInt32(cboSavingsEndYear.SelectedItem.Value)
        strSQL += "*" + cboSavingsEndYear.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@TotalAnnualSavings", SqlDbType.Float, 8))
        MyCommand.Parameters("@TotalAnnualSavings").Value = System.Convert.ToDouble(txtAnnualSavings.Text)
        strSQL += "*" + txtAnnualSavings.Text
        MyCommand.Parameters.Add(New SqlParameter("@OneOffSavings", SqlDbType.Float, 8))
        MyCommand.Parameters("@OneOffSavings").Value = System.Convert.ToDouble(txtOneOffSaving.Text)
        strSQL += "*" + txtOneOffSaving.Text
        MyCommand.Parameters.Add(New SqlParameter("@Currency", SqlDbType.Int, 2))
        MyCommand.Parameters("@Currency").Value = System.Convert.ToInt32(cboCurrency.SelectedItem.Value)
        strSQL += "*" + cboCurrency.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@Risk", SqlDbType.Int, 2))
        MyCommand.Parameters("@Risk").Value = System.Convert.ToInt32(cboProbability.SelectedItem.Value)
        strSQL += "*" + cboProbability.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@Status", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@Status").Value = cboStatus.SelectedItem.Value
        strSQL += "*" + cboStatus.SelectedItem.Value
        'MyCommand.Parameters.Add(New SqlParameter("@CommittedToForecast", SqlDbType.Bit))
        'MyCommand.Parameters("@CommittedToForecast").Value = checkBox
        'strSQL += "*" + checkBox.ToString
        MyCommand.Parameters.Add(New SqlParameter("@ProjectEndMonth", SqlDbType.Int, 2))
        MyCommand.Parameters("@ProjectEndMonth").Value = System.Convert.ToInt32(cboProjectEndMonth.SelectedItem.Value)
        strSQL += "*" + cboProjectEndMonth.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@ProjectEndYear", SqlDbType.Int, 2))
        MyCommand.Parameters("@ProjectEndYear").Value = System.Convert.ToInt32(cboProjectEndYear.SelectedItem.Value)
        strSQL += "*" + cboProjectEndYear.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@Stage", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@Stage").Value = txtStage.Text
        strSQL += "*" + txtStage.Text
        '-- data points for tProjectSavingsCal
        MyCommand.Parameters.Add(New SqlParameter("@FiscalYear", SqlDbType.Int, 2))
        MyCommand.Parameters("@FiscalYear").Value = System.Convert.ToInt32(txtAccountingYear.Text)
        strSQL += "*" + txtAccountingYear.Text
        MyCommand.Parameters.Add(New SqlParameter("@ProbabilityAdjAmt", SqlDbType.Float, 8))
        MyCommand.Parameters("@ProbabilityAdjAmt").Value = System.Convert.ToDouble(txtProbabilityAdjustedAmt.Text)
        strSQL += "*" + txtProbabilityAdjustedAmt.Text
        MyCommand.Parameters.Add(New SqlParameter("@TimeAdjAmt", SqlDbType.Float, 8))
        MyCommand.Parameters("@TimeAdjAmt").Value = System.Convert.ToDouble(txtTimeAdjustedAmount.Text)
        strSQL += "*" + txtTimeAdjustedAmount.Text
        MyCommand.Parameters.Add(New SqlParameter("@TotalAdjAmt", SqlDbType.Float, 8))
        MyCommand.Parameters("@TotalAdjAmt").Value = System.Convert.ToDouble(txtTotalAdjustedAmount.Text)
        strSQL += "*" + txtTotalAdjustedAmount.Text
        '-- data points for tProjectsCost
        MyCommand.Parameters.Add(New SqlParameter("@Capex", SqlDbType.Float, 8))
        MyCommand.Parameters("@Capex").Value = System.Convert.ToDouble(txtCapexCost.Text)
        strSQL += "*" + txtCapexCost.Text
        MyCommand.Parameters.Add(New SqlParameter("@WorkingCapital", SqlDbType.Float, 8))
        MyCommand.Parameters("@WorkingCapital").Value = System.Convert.ToDouble(txtWorkCapCost.Text)
        strSQL += "*" + txtWorkCapCost.Text
        MyCommand.Parameters.Add(New SqlParameter("@RegulatoryCost", SqlDbType.Float, 8))
        MyCommand.Parameters("@RegulatoryCost").Value = System.Convert.ToDouble(txtRegulatoryCost.Text)
        strSQL += "*" + txtRegulatoryCost.Text
        MyCommand.Parameters.Add(New SqlParameter("@SampleCost", SqlDbType.Float, 8))
        MyCommand.Parameters("@SampleCost").Value = System.Convert.ToDouble(txtSampleCost.Text)
        strSQL += "*" + txtSampleCost.Text
        MyCommand.Parameters.Add(New SqlParameter("@RDcost", SqlDbType.Float, 8))
        MyCommand.Parameters("@RDcost").Value = System.Convert.ToDouble(txtRDCost.Text)
        strSQL += "*" + txtRDCost.Text
        MyCommand.Parameters.Add(New SqlParameter("@QAQCCost", SqlDbType.Float, 8))
        MyCommand.Parameters("@QAQCCost").Value = System.Convert.ToDouble(txtQACost.Text)
        strSQL += "*" + txtQACost.Text
        MyCommand.Parameters.Add(New SqlParameter("@AuditCost", SqlDbType.Float, 8))
        MyCommand.Parameters("@AuditCost").Value = System.Convert.ToDouble(txtAuditCost.Text)
        strSQL += "*" + txtAuditCost.Text
        MyCommand.Parameters.Add(New SqlParameter("@OtherCost", SqlDbType.Float, 8))
        MyCommand.Parameters("@OtherCost").Value = System.Convert.ToDouble(txtOtherCost.Text)
        strSQL += "*" + txtOtherCost.Text
        MyCommand.Parameters.Add(New SqlParameter("@TotalCost", SqlDbType.Float, 8))
        MyCommand.Parameters("@TotalCost").Value = System.Convert.ToDouble(txtTotalCost.Text)
        strSQL += "*" + txtTotalCost.Text
        MyCommand.Parameters.Add(New SqlParameter("@CapexCurrency", SqlDbType.Int, 2))
        MyCommand.Parameters("@CapexCurrency").Value = System.Convert.ToInt32(cboCapexCurrency.SelectedItem.Value)
        strSQL += "*" + cboCapexCurrency.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@WorkingCapitalCurrency", SqlDbType.Int, 2))
        MyCommand.Parameters("@WorkingCapitalCurrency").Value = System.Convert.ToInt32(cboWorkCapCurrency.SelectedItem.Value)
        strSQL += "*" + cboWorkCapCurrency.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@RegulatoryCostCurrency", SqlDbType.Int, 2))
        MyCommand.Parameters("@RegulatoryCostCurrency").Value = System.Convert.ToInt32(cboRegulatoryCurrency.SelectedItem.Value)
        strSQL += "*" + cboRegulatoryCurrency.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@SampleCostCurrency", SqlDbType.Int, 2))
        MyCommand.Parameters("@SampleCostCurrency").Value = System.Convert.ToInt32(cboSampleCurrency.SelectedItem.Value)
        strSQL += "*" + cboSampleCurrency.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@RDcostCurrency", SqlDbType.Int, 2))
        MyCommand.Parameters("@RDcostCurrency").Value = System.Convert.ToInt32(cboRDCurrency.SelectedItem.Value)
        strSQL += "*" + cboRDCurrency.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@QAQCCostCurrency", SqlDbType.Int, 2))
        MyCommand.Parameters("@QAQCCostCurrency").Value = System.Convert.ToInt32(cboQACurrency.SelectedItem.Value)
        strSQL += "*" + cboQACurrency.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@AuditCostCurrency", SqlDbType.Int, 2))
        MyCommand.Parameters("@AuditCostCurrency").Value = System.Convert.ToInt32(cboAuditCurrency.SelectedItem.Value)
        strSQL += "*" + cboAuditCurrency.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@OtherCostCurrency", SqlDbType.Int, 2))
        MyCommand.Parameters("@OtherCostCurrency").Value = System.Convert.ToInt32(cboOtherCurrency.SelectedItem.Value)
        strSQL += "*" + cboOtherCurrency.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@TotalCostCurrency", SqlDbType.Int, 2))
        MyCommand.Parameters("@TotalCostCurrency").Value = System.Convert.ToInt32(cboTotalCurrency.SelectedItem.Value)
        strSQL += "*" + cboTotalCurrency.SelectedItem.Value
        MyCommand.Parameters.Add(New SqlParameter("@CapexJustification", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@CapexJustification").Value = txtCapexJust.Text
        strSQL += "*" + txtCapexJust.Text
        MyCommand.Parameters.Add(New SqlParameter("@WorkingCapitalJustification", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@WorkingCapitalJustification").Value = txtWorkCapJust.Text
        strSQL += "*" + txtWorkCapJust.Text
        MyCommand.Parameters.Add(New SqlParameter("@RegulatoryCostJustification", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@RegulatoryCostJustification").Value = txtRegulatoryJust.Text
        strSQL += "*" + txtRegulatoryJust.Text
        MyCommand.Parameters.Add(New SqlParameter("@SampleCostJustification", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@SampleCostJustification").Value = txtSampleJust.Text
        strSQL += "*" + txtSampleJust.Text
        MyCommand.Parameters.Add(New SqlParameter("@RDcostJustification", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@RDcostJustification").Value = txtRDJust.Text
        strSQL += "*" + txtRDJust.Text
        MyCommand.Parameters.Add(New SqlParameter("@QAQCCostJustification", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@QAQCCostJustification").Value = txtQAJust.Text
        strSQL += "*" + txtQAJust.Text
        MyCommand.Parameters.Add(New SqlParameter("@AuditCostJustification", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@AuditCostJustification").Value = txtAuditJust.Text
        strSQL += "*" + txtAuditJust.Text
        MyCommand.Parameters.Add(New SqlParameter("@OtherCostJustification", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@OtherCostJustification").Value = txtOtherJust.Text
        strSQL += "*" + txtOtherJust.Text
        MyCommand.Parameters.Add(New SqlParameter("@TotalCostJustification", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@TotalCostJustification").Value = txtTotalJust.Text
        strSQL += "*" + txtTotalJust.Text

        '-- data points for uProjectTherapy
        MyCommand.Parameters.Add(New SqlParameter("@TherapyID", SqlDbType.NVarChar, 200))
        strIN = ""
        For Each li In cboTherapy.Items
            If li.Selected = True Then
                strIN = strIN & li.Value & "|"
            End If
        Next
        MyCommand.Parameters("@TherapyID").Value = strIN
        strSQL += "*" + strIN
        '-- data points for uProjectPersonnel
        MyCommand.Parameters.Add(New SqlParameter("@PersonnelID", SqlDbType.NVarChar, 200))
        strIN = ""
        For Each li In cboTeamMembers.Items
            If li.Selected = True Then
                strIN = strIN & li.Value & "|"
            End If
        Next
        MyCommand.Parameters("@PersonnelID").Value = strIN
        strSQL += "*" + strIN

        '-- data points for uProjectPackCode
        MyCommand.Parameters.Add(New SqlParameter("@PackCodeID", SqlDbType.NVarChar, 200))
        strIN = ""
        For Each li In cboPackcode.Items
            If li.Selected = True Then
                strIN = strIN & li.Value & "|"
            End If
        Next
        MyCommand.Parameters("@PackCodeID").Value = strIN
        strSQL += "*" + strIN

        '-- data points for uProjectMfgCode
        MyCommand.Parameters.Add(New SqlParameter("@MfgCodeID", SqlDbType.NVarChar, 200))
        strIN = ""
        For Each li In cboMfgCode.Items
            If li.Selected = True Then
                strIN = strIN & li.Value & "|"
            End If
        Next
        MyCommand.Parameters("@MfgCodeID").Value = strIN
        strSQL += "*" + strIN

        '-- data points for uProjectDosage
        MyCommand.Parameters.Add(New SqlParameter("@DosageID", SqlDbType.NVarChar, 200))
        strIN = ""
        For Each li In cboDosage.Items
            If li.Selected = True Then
                strIN = strIN & li.Value & "|"
            End If
        Next
        MyCommand.Parameters("@DosageID").Value = strIN
        strSQL += "*" + strIN

        '-- data points for uProjectCategory
        MyCommand.Parameters.Add(New SqlParameter("@CategoryID", SqlDbType.NVarChar, 200))
        strIN = ""
        For Each li In cboCategory.Items
            If li.Selected = True Then
                strIN = strIN & li.Value & "|"
            End If
        Next
        MyCommand.Parameters("@CategoryID").Value = strIN
        strSQL += "*" + strIN

        '-- data points for uProjectBulkCode
        MyCommand.Parameters.Add(New SqlParameter("@BulkCodeID", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@BulkCodeID").Value = GetListItems(cboBulkCode)
        strSQL += "*" + strIN

        TestOut.Text = strSQL
        MyCommand.Connection.Open()
        Try
            MyCommand.ExecuteNonQuery()
        Catch Exp As SqlException
            Dim errorMessages As String = ""
            Dim i As Integer
            For i = 0 To Exp.Errors.Count - 1
                errorMessages += "Index #" & i.ToString() & ControlChars.NewLine _
                               & "Message: " & Exp.Errors(i).Message & ControlChars.NewLine _
                               & "LineNumber: " & Exp.Errors(i).LineNumber & ControlChars.NewLine _
                               & "Source: " & Exp.Errors(i).Source & ControlChars.NewLine _
                               & "Procedure: " & Exp.Errors(i).Procedure & ControlChars.NewLine
            Next i
            TestOut.Text = TestOut.Text + errorMessages
        End Try
        MyCommand.Connection.Close()

        'Response.Redirect("default.aspx")

    End Sub

    Private Function GetListItems(ByVal listItem As ListBox) As String
        Dim strIN As String
        strIN = ""
        For Each li In listItem.Items
            If li.Selected = True Then
                strIN = strIN & li.Value & "|"
            End If
        Next
        Return strIN
    End Function


    Private Sub Cancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Cancel.Click
        Response.Redirect("default.aspx")
    End Sub

End Class