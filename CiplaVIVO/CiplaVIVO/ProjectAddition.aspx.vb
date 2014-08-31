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
    Dim RequestedProjectID As String
    Dim Viv As New VivoClass
    Private strConnString As String = ConfigurationManager.ConnectionStrings("SQLConnectionString").ConnectionString
    Dim con As New SqlConnection(strConnString)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        RequestedProjectID = Request.QueryString("ProjectID")
        
        If Not IsPostBack Then
            PopulateDropDown()
            If (RequestedProjectID <> "") Then
                PopulateInitialValues()
            End If
        End If
    End Sub


    Sub PopulateInitialValues()
        Dim DS As DataSet
        Dim objCommand As SqlCommand
        Dim rsSelectProject As SqlDataReader
        Dim SQLText As String
        Dim ProjectSavingsID As Integer
        Dim ProjectCostID As Integer

        '----------------------------FOR tProjects

        SQLText = "Select * from tProjects where tProjects.ProjectID = " & RequestedProjectID

        objCommand = New SqlCommand(SQLText, con)
        con.Open()

        rsSelectProject = objCommand.ExecuteReader(CommandBehavior.CloseConnection)
        rsSelectProject.Read()

        txtProjectName.Text = rsSelectProject("ProjectName")

        If Not cboDepartment.Items.FindByValue(rsSelectProject("DepartmentID")) Is Nothing Then
            cboDepartment.Items.FindByValue(rsSelectProject("DepartmentID")).Selected = True
            '--------------------Update category
            Department_Update()
        End If

        If Not cboDIC.Items.FindByText(rsSelectProject("Direct_Indirect_Capex")) Is Nothing Then
            cboDIC.Items.FindByText(rsSelectProject("Direct_Indirect_Capex")).Selected = True
            DIC_Update()
        End If

        If Not plcapex.Items.FindByText(rsSelectProject("PL_Capex")) Is Nothing Then
            plcapex.Items.FindByText(rsSelectProject("PL_Capex")).Selected = True
        End If

        If Not cboProjectLeader.Items.FindByValue(rsSelectProject("ProjectLeader")) Is Nothing Then
            cboProjectLeader.Items.FindByValue(rsSelectProject("ProjectLeader")).Selected = True
        End If

        If Not cboFinanceLeader.Items.FindByValue(rsSelectProject("FinanceLeader")) Is Nothing Then
            cboFinanceLeader.Items.FindByValue(rsSelectProject("FinanceLeader")).Selected = True
        End If
        
        If Not IsDBNull(rsSelectProject("ExpenseHeadID")) Then
            If Not cboExpenseHead.Items.FindByValue(rsSelectProject("ExpenseHeadID")) Is Nothing Then
                cboExpenseHead.Items.FindByValue(rsSelectProject("ExpenseHeadID")).Selected = True
            End If
        End If

        If Not IsDBNull(rsSelectProject("ProjectClassification")) Then
            If Not cboProjectClassification.Items.FindByText(rsSelectProject("ProjectClassification")) Is Nothing Then
                cboProjectClassification.Items.FindByText(rsSelectProject("ProjectClassification")).Selected = True
            End If
        End If

        If Not IsDBNull(rsSelectProject("ProjectSummary")) Then
            txtProjectSummary.Text = rsSelectProject("ProjectSummary")
        End If

        If Not IsDBNull(rsSelectProject("BusinessUnitID")) Then
            If Not cboBusinessUnit.Items.FindByValue(rsSelectProject("BusinessUnitID")) Is Nothing Then
                cboBusinessUnit.Items.FindByValue(rsSelectProject("BusinessUnitID")).Selected = True
            End If
        End If

        rsSelectProject.Close()
        con.Close()
        '----------------------------FOR tProjectSavings

        SQLText = "Select * from tProjectSavings where tProjectSavings.ProjectID = " & RequestedProjectID

        objCommand = New SqlCommand(SQLText, con)
        con.Open()

        rsSelectProject = objCommand.ExecuteReader(CommandBehavior.CloseConnection)
        rsSelectProject.Read()

        ProjectSavingsID = rsSelectProject("ProjectSavingsID")

        If Not cboProjectStartMonth.Items.FindByValue(rsSelectProject("ProjectBeginMonth")) Is Nothing Then
            cboProjectStartMonth.Items.FindByValue(rsSelectProject("ProjectBeginMonth")).Selected = True
        End If

        If Not cboProjectStartYear.Items.FindByValue(rsSelectProject("ProjectBeginYear")) Is Nothing Then
            cboProjectStartYear.Items.FindByValue(rsSelectProject("ProjectBeginYear")).Selected = True
        End If

        If Not cboSavingsStartMonth.Items.FindByValue(rsSelectProject("SavingBeginMonth")) Is Nothing Then
            cboSavingsStartMonth.Items.FindByValue(rsSelectProject("SavingBeginMonth")).Selected = True
        End If

        If Not cboSavingsStartYear.Items.FindByValue(rsSelectProject("SavingBeginYear")) Is Nothing Then
            cboSavingsStartYear.Items.FindByValue(rsSelectProject("SavingBeginYear")).Selected = True
        End If

        If Not cboSavingsEndMonth.Items.FindByValue(rsSelectProject("SavingsEndMonth")) Is Nothing Then
            cboSavingsEndMonth.Items.FindByValue(rsSelectProject("SavingsEndMonth")).Selected = True
        End If

        If Not cboSavingsEndYear.Items.FindByValue(rsSelectProject("SavingsEndYear")) Is Nothing Then
            cboSavingsEndYear.Items.FindByValue(rsSelectProject("SavingsEndYear")).Selected = True
        End If

        txtAnnualSavings.Text = rsSelectProject("TotalAnnualSavings")

        txtOneOffSaving.Text = rsSelectProject("OneOffSavings")

        If Not cboCurrency.Items.FindByValue(rsSelectProject("Currency")) Is Nothing Then
            cboCurrency.Items.FindByValue(rsSelectProject("Currency")).Selected = True
        End If

        If Not cboProbability.Items.FindByValue(rsSelectProject("Risk")) Is Nothing Then
            cboProbability.Items.FindByValue(rsSelectProject("Risk")).Selected = True
        End If

        If Not cboStatus.Items.FindByValue(rsSelectProject("Status")) Is Nothing Then
            cboStatus.Items.FindByValue(rsSelectProject("Status")).Selected = True
        End If

        If Not IsDBNull(rsSelectProject("CommittedToForecast")) Then
            chkCommitted.Checked = rsSelectProject("CommittedToForecast")
        End If

        If Not IsDBNull(rsSelectProject("ProjectEndMonth")) Then
            If Not cboProjectEndMonth.Items.FindByValue(rsSelectProject("ProjectEndMonth")) Is Nothing Then
                cboProjectEndMonth.Items.FindByValue(rsSelectProject("ProjectEndMonth")).Selected = True
            End If
        End If

        If Not IsDBNull(rsSelectProject("ProjectEndYear")) Then
            If Not cboProjectEndYear.Items.FindByValue(rsSelectProject("ProjectEndYear")) Is Nothing Then
                cboProjectEndYear.Items.FindByValue(rsSelectProject("ProjectEndYear")).Selected = True
            End If
        End If

        If Not IsDBNull(rsSelectProject("Stage")) Then
            txtStage.Text = rsSelectProject("Stage")
        End If

        rsSelectProject.Close()
        con.Close()
        '----------------------------FOR tProjectsCost
        SQLText = "Select * from tProjectsCost where tProjectsCost.ProjectID = " & RequestedProjectID

        objCommand = New SqlCommand(SQLText, con)
        con.Open()

        rsSelectProject = objCommand.ExecuteReader(CommandBehavior.CloseConnection)
        rsSelectProject.Read()

        ProjectCostID = rsSelectProject("ProjectCostID")

        txtCapexCost.Text = rsSelectProject("Capex")
        txtWorkCapCost.Text = rsSelectProject("WorkingCapital")
        txtRegulatoryCost.Text = rsSelectProject("RegulatoryCost")
        txtSampleCost.Text = rsSelectProject("SampleCost")
        txtRDCost.Text = rsSelectProject("RDCost")
        txtQACost.Text = rsSelectProject("QAQCCost")
        txtAuditCost.Text = rsSelectProject("AuditCost")
        txtOtherCost.Text = rsSelectProject("OtherCost")
        txtTotalCost.Text = rsSelectProject("TotalCost")

        If Not cboCapexCurrency.Items.FindByValue(rsSelectProject("CapexCurrency")) Is Nothing Then
            cboCapexCurrency.Items.FindByValue(rsSelectProject("CapexCurrency")).Selected = True
        End If


        If Not cboWorkCapCurrency.Items.FindByValue(rsSelectProject("WorkingCapitalCurrency")) Is Nothing Then
            cboWorkCapCurrency.Items.FindByValue(rsSelectProject("WorkingCapitalCurrency")).Selected = True
        End If


        If Not cboRegulatoryCurrency.Items.FindByValue(rsSelectProject("RegulatoryCostCurrency")) Is Nothing Then
            cboRegulatoryCurrency.Items.FindByValue(rsSelectProject("RegulatoryCostCurrency")).Selected = True
        End If


        If Not cboSampleCurrency.Items.FindByValue(rsSelectProject("SampleCostCurrency")) Is Nothing Then
            cboSampleCurrency.Items.FindByValue(rsSelectProject("SampleCostCurrency")).Selected = True
        End If


        If Not cboRDCurrency.Items.FindByValue(rsSelectProject("RDCostCurrency")) Is Nothing Then
            cboRDCurrency.Items.FindByValue(rsSelectProject("RDCostCurrency")).Selected = True
        End If


        If Not cboQACurrency.Items.FindByValue(rsSelectProject("QAQCCostCurrency")) Is Nothing Then
            cboQACurrency.Items.FindByValue(rsSelectProject("QAQCCostCurrency")).Selected = True
        End If


        If Not cboAuditCurrency.Items.FindByValue(rsSelectProject("AuditCostCurrency")) Is Nothing Then
            cboAuditCurrency.Items.FindByValue(rsSelectProject("AuditCostCurrency")).Selected = True
        End If


        If Not cboOtherCurrency.Items.FindByValue(rsSelectProject("OtherCostCurrency")) Is Nothing Then
            cboOtherCurrency.Items.FindByValue(rsSelectProject("OtherCostCurrency")).Selected = True
        End If


        If Not cboTotalCurrency.Items.FindByValue(rsSelectProject("TotalCostCurrency")) Is Nothing Then
            cboTotalCurrency.Items.FindByValue(rsSelectProject("TotalCostCurrency")).Selected = True
        End If

        txtCapexJust.Text = rsSelectProject("CapexJustification")
        txtWorkCapJust.Text = rsSelectProject("WorkingCapitalJustification")
        txtRegulatoryJust.Text = rsSelectProject("RegulatoryCostJustification")
        txtSampleJust.Text = rsSelectProject("SampleCostJustification")
        txtRDJust.Text = rsSelectProject("RDCostJustification")
        txtQAJust.Text = rsSelectProject("QAQCCostJustification")
        txtAuditJust.Text = rsSelectProject("AuditCostJustification")
        txtOtherJust.Text = rsSelectProject("OtherCostJustification")
        txtTotalJust.Text = rsSelectProject("TotalCostJustification")

        rsSelectProject.Close()
        con.Close()
        '----------------------------FOR uProjectBulkCode
        dt = Viv.BindData("uProjectBulkCode", RequestedProjectID)
        FillListBox(dt, cboBulkCode, "BulkCodeID")
        
        '----------------------------FOR uProjectDosage
        dt = Viv.BindData("uProjectDosage", RequestedProjectID)
        FillListBox(dt, cboDosage, "DosageID")

        '----------------------------FOR uProjectMfgCode
        dt = Viv.BindData("uProjectMfgCode", RequestedProjectID)
        FillListBox(dt, cboMfgCode, "MfgCodeID")

        '----------------------------FOR uProjectPackCode
        dt = Viv.BindData("uProjectPackCode", RequestedProjectID)
        FillListBox(dt, cboPackcode, "PackCodeID")

        '----------------------------FOR uProjectPersonnel
        dt = Viv.BindData("uProjectPersonnel", RequestedProjectID)
        FillListBox(dt, cboTeamMembers, "PersonnelID")

        '----------------------------FOR uProjectTherapy
        dt = Viv.BindData("uProjectTherapy", RequestedProjectID)
        FillListBox(dt, cboTherapy, "TherapyID")

        '----------------------------FOR uProjectCategory
        dt = Viv.BindData("uProjectCategory", RequestedProjectID)
        FillListBox(dt, cboCategory, "CategoryID")



        ' Calculations of time, probability and total adjusted is done on run time again.
        PerformCalculation()

        'If chkCommitted.Checked = True Then
        'ReadOnlyIfChecked()
        'End If

    End Sub

    Sub FillListBox(ByVal dt As DataTable, ByVal cbo As ListBox, ByVal ColumnName As String)
        If (dt.Rows.Count > 0) Then
            For index As Integer = 0 To dt.Rows.Count - 1
                cbo.Items.FindByValue(dt.Rows(index).Item(ColumnName)).Selected = True
            Next
        End If
    End Sub

    Sub CmtForecast_Changed(ByVal sender As Object, ByVal e As System.EventArgs)
        If chkCommitted.Checked = False Then
            ReadOnlyIfNotChecked()
        ElseIf chkCommitted.Checked = True Then
            ReadOnlyIfChecked()
        End If
    End Sub

    Sub ReadOnlyIfNotChecked()
        txtProjectName.ReadOnly = False
        cboProjectStartMonth.Enabled = True
        cboCategory.Enabled = True
        txtProjectName.ReadOnly = False
        cboProjectLeader.Enabled = True
        cboStatus.Enabled = True
        cboProjectStartYear.Enabled = True
        cboProjectStartMonth.Enabled = True
        cboSavingsStartYear.Enabled = True
        cboSavingsStartMonth.Enabled = True
    End Sub

    Sub ReadOnlyIfChecked()
        txtProjectName.ReadOnly = True
        cboProjectStartMonth.Enabled = False
        cboCategory.Enabled = False
        txtProjectName.ReadOnly = True
        cboProjectLeader.Enabled = False
        cboStatus.Enabled = False
        cboProjectStartYear.Enabled = False
        cboProjectStartMonth.Enabled = False
        cboSavingsStartYear.Enabled = False
        cboSavingsStartMonth.Enabled = False
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

        cboProjectEndMonth.DataSource = myDataSet.Tables("tblMonths").DefaultView
        cboProjectEndMonth.DataBind()

        cboSavingsStartMonth.DataSource = myDataSet.Tables("tblMonths").DefaultView
        cboSavingsStartMonth.DataBind()

        cboSavingsEndMonth.DataSource = myDataSet.Tables("tblMonths").DefaultView
        cboSavingsEndMonth.DataBind()

        '---------cbo of Years -> cboProjectStartYear + cboSavingsStartYear + cboTenureEndYear
        myDataSet = New DataSet
        myDataSet.ReadXml(Server.MapPath("tblYears.xml"))
        cboProjectStartYear.DataSource = myDataSet.Tables("tblYears").DefaultView
        cboProjectStartYear.DataBind()

        cboProjectEndYear.DataSource = myDataSet.Tables("tblYears").DefaultView
        cboProjectEndYear.DataBind()

        cboSavingsStartYear.DataSource = myDataSet.Tables("tblYears").DefaultView
        cboSavingsStartYear.DataBind()

        cboSavingsEndYear.DataSource = myDataSet.Tables("tblYears").DefaultView
        cboSavingsEndYear.DataBind()

        '-----------------Set default value only if this is Project Addition (not Modification)
        If (RequestedProjectID = "") Then
            cboDosage.Items.FindByText("All").Selected = True
            cboMfgCode.Items.FindByText("All").Selected = True
            cboTherapy.Items.FindByText("All").Selected = True
            cboPackcode.Items.FindByText("All").Selected = True
            cboBulkCode.Items.FindByText("All").Selected = True
            cboProjectStartMonth.Items.FindByValue(DateTime.Now.Month).Selected = True
            cboProjectEndMonth.Items.FindByValue(DateTime.Now.Month).Selected = True
            cboSavingsStartMonth.Items.FindByValue(DateTime.Now.Month).Selected = True
            cboSavingsEndMonth.Items.FindByValue(DateTime.Now.Month).Selected = True
            cboProjectStartYear.Items.FindByValue(DateTime.Now.Year).Selected = True
            cboProjectEndYear.Items.FindByValue(DateTime.Now.Year).Selected = True
            cboSavingsStartYear.Items.FindByValue(DateTime.Now.Year).Selected = True
            cboSavingsEndYear.Items.FindByValue(DateTime.Now.Year).Selected = True
        End If
        '------------------------Update Direct/Indirect linked box
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

    Sub SaveAProject()
        Dim MyCommand As SqlCommand
        Dim strSQL As String
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

        If (RequestedProjectID <> "") Then
            MyCommand = New SqlCommand("cUpdateProject", con)
        Else
            MyCommand = New SqlCommand("cInsertProject", con)
            RequestedProjectID = 0
        End If

        MyCommand.CommandType = CommandType.StoredProcedure


        '-- data points for tProject
        MyCommand.Parameters.Add(New SqlParameter("@ProjectID", SqlDbType.Int, 2))
        MyCommand.Parameters("@ProjectID").Value = RequestedProjectID

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
        MyCommand.Parameters.Add(New SqlParameter("@Active", SqlDbType.Bit))
        MyCommand.Parameters("@Active").Value = 1

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
        MyCommand.Parameters.Add(New SqlParameter("@CommittedToForecast", SqlDbType.Bit))
        MyCommand.Parameters("@CommittedToForecast").Value = checkBox
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
        MyCommand.Parameters("@TherapyID").Value = GetListItems(cboTherapy, 1)
        strSQL += "*" + MyCommand.Parameters("@TherapyID").Value

        '-- data points for uProjectPersonnel
        MyCommand.Parameters.Add(New SqlParameter("@PersonnelID", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@PersonnelID").Value = GetListItems(cboTeamMembers, 0)
        strSQL += "*" + MyCommand.Parameters("@PersonnelID").Value

        '-- data points for uProjectPackCode
        MyCommand.Parameters.Add(New SqlParameter("@PackCodeID", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@PackCodeID").Value = GetListItems(cboPackcode, 1)
        strSQL += "*" + MyCommand.Parameters("@PackCodeID").Value

        '-- data points for uProjectMfgCode
        MyCommand.Parameters.Add(New SqlParameter("@MfgCodeID", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@MfgCodeID").Value = GetListItems(cboMfgCode, 1)
        strSQL += "*" + MyCommand.Parameters("@MfgCodeID").Value

        '-- data points for uProjectDosage
        MyCommand.Parameters.Add(New SqlParameter("@DosageID", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@DosageID").Value = GetListItems(cboDosage, 1)
        strSQL += "*" + MyCommand.Parameters("@DosageID").Value

        '-- data points for uProjectCategory
        MyCommand.Parameters.Add(New SqlParameter("@CategoryID", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@CategoryID").Value = GetListItems(cboCategory, 0)
        strSQL += "*" + MyCommand.Parameters("@CategoryID").Value

        '-- data points for uProjectBulkCode
        MyCommand.Parameters.Add(New SqlParameter("@BulkCodeID", SqlDbType.NVarChar, 200))
        MyCommand.Parameters("@BulkCodeID").Value = GetListItems(cboBulkCode, 1)
        strSQL += "*" + MyCommand.Parameters("@BulkCodeID").Value

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

    Sub SaveNewProject(ByVal sender As Object, ByVal e As System.EventArgs)
        If Page.IsValid Then
            SaveAProject()
        End If
    End Sub

    Private Function GetListItems(ByVal listItem As ListBox, ByVal OptionCode As Integer) As String
        Dim strIN As String = ""
        Dim checkAll As Integer = 0
        
        If (listItem.SelectedIndex = -1 And OptionCode = 1) Then
            listItem.Items.FindByText("All").Selected = True
            checkAll = 1
        End If

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