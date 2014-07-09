Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Xml
Imports System.Xml.XPath

Public Class ProjectAddition
    Inherits System.Web.UI.Page

    Dim myDataSet As DataSet
    Dim dv As DataView
    Dim strFilePath As String
    Dim RequestedSubGBU As String
    Dim RequestedBusiness As String
    Dim connstring As String
    Dim MyConnection As SqlConnection

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        connstring = ConfigurationManager.ConnectionStrings("SQLConnectionString").ToString
        MyConnection = New SqlConnection(connstring)
        RequestedSubGBU = Request.QueryString("subGBU")
        RequestedBusiness = Request.QueryString("Business")

        If Not IsPostBack Then
            PopulateDropDown()
            'SetInitialFields()
        End If
    End Sub

    Sub PopulateDropDown()
        '---------cboBusinessUnit
        myDataSet = New DataSet
        myDataSet.ReadXml(Server.MapPath("tblBusinessUnit.xml"))
        cboBusinessUnit.DataSource = myDataSet.Tables("BU").DefaultView
        cboBusinessUnit.DataBind()
        '---------cboDepartment
        myDataSet = New DataSet
        myDataSet.ReadXml(Server.MapPath("tblDepartment.xml"))
        cboDepartment.DataSource = myDataSet.Tables("Department").DefaultView
        cboDepartment.DataBind()
        cboDepartment.Items.Insert(0, "All")
        '---------cboPersonnel + cboFinanceLeader + cboTeamMembers
        myDataSet = New DataSet
        myDataSet.ReadXml(Server.MapPath("tblPersonnel.xml"))
        cboProjectLeader.DataSource = myDataSet.Tables("tblPersonnel").DefaultView
        cboProjectLeader.DataBind()
        cboProjectLeader.Items.Insert(0, "")

        cboFinanceLeader.DataSource = myDataSet.Tables("tblPersonnel").DefaultView
        cboFinanceLeader.DataBind()
        cboFinanceLeader.Items.Insert(0, "")

        cboTeamMembers.DataSource = myDataSet.Tables("tblPersonnel").DefaultView
        cboTeamMembers.DataBind()
        cboTeamMembers.Items.Insert(0, "")

        '---------cboStatus
        myDataSet = New DataSet
        myDataSet.ReadXml(Server.MapPath("tblStatus.xml"))
        cboStatus.DataSource = myDataSet.Tables("tblStatus").DefaultView
        cboStatus.DataBind()
        cboStatus.Items.Insert(0, "")

        '---------cboCurrency
        myDataSet = New DataSet
        myDataSet.ReadXml(Server.MapPath("tblCurrency.xml"))
        cboCurrency.DataSource = myDataSet.Tables("tblCurrency").DefaultView
        cboCurrency.DataBind()
      
        '---------cbo of Months
        myDataSet = New DataSet
        myDataSet.ReadXml(Server.MapPath("tblMonths.xml"))
        cboProjectStartMonth.DataSource = myDataSet.Tables("tblMonths").DefaultView
        cboProjectStartMonth.DataBind()
        cboProjectStartMonth.Items.Insert(0, "")
        cboSavingsStartMonth.DataSource = myDataSet.Tables("tblMonths").DefaultView
        cboSavingsStartMonth.DataBind()
        cboSavingsStartMonth.Items.Insert(0, "")
        cboTenureEndMonth.DataSource = myDataSet.Tables("tblMonths").DefaultView
        cboTenureEndMonth.DataBind()
        cboTenureEndMonth.Items.Insert(0, "")
        '---------cbo of Years
        myDataSet = New DataSet
        myDataSet.ReadXml(Server.MapPath("tblYears.xml"))
        cboProjectStartYear.DataSource = myDataSet.Tables("tblYears").DefaultView
        cboProjectStartYear.DataBind()
        cboProjectStartYear.Items.FindByValue(DateTime.Now.Year).Selected = True
        'cboProjectStartYear.Items.Insert(0,"")
        cboSavingsStartYear.DataSource = myDataSet.Tables("tblYears").DefaultView
        cboSavingsStartYear.DataBind()
        cboSavingsStartYear.Items.FindByValue(DateTime.Now.Year).Selected = True
        'cboSavingsStartYear.Items.Insert(0,"")
        cboTenureEndYear.DataSource = myDataSet.Tables("tblYears").DefaultView
        cboTenureEndYear.DataBind()
        cboTenureEndYear.Items.FindByValue(DateTime.Now.Year).Selected = True

    End Sub

    Sub Department_AfterUpdate(ByVal sender As Object, ByVal e As System.EventArgs)
        Department_Update()
    End Sub

    Sub Department_Update()
        '---------cboCategory
        cboCategory.Items.Clear()
        myDataSet = New DataSet
        myDataSet.ReadXml(Server.MapPath("tblCategory.xml"))
        dv = New DataView(myDataSet.Tables("tblCategory"))
        dv.RowFilter = "Department='" & cboDepartment.SelectedItem.Value & "'"
        cboCategory.DataSource = dv
        cboCategory.DataBind()
    End Sub

    Sub DIC_AfterUpdate(ByVal sender As Object, ByVal e As System.EventArgs)
        DIC_Update()
    End Sub

    Sub DIC_Update()
        '---------cboCategory
        cboExpenseHead.Items.Clear()
        myDataSet = New DataSet
        myDataSet.ReadXml(Server.MapPath("tblDIC.xml"))
        dv = New DataView(myDataSet.Tables("tblDIC"))
        dv.RowFilter = "DIC='" & cboDIC.SelectedItem.Value & "'"
        cboExpenseHead.DataSource = dv
        cboExpenseHead.DataBind()
    End Sub

    Sub ProjectMonth_AfterUpdate(ByVal sender As Object, ByVal e As System.EventArgs)
        cboSavingsStartMonth.SelectedIndex = cboProjectStartMonth.SelectedIndex
        cboSavingsStartYear.SelectedIndex = cboProjectStartYear.SelectedIndex
        subCalculateImpliedAccountingTime()
    End Sub

    Sub ProjectYear_AfterUpdate(ByVal sender As Object, ByVal e As System.EventArgs)
        cboSavingsStartYear.SelectedIndex = cboProjectStartYear.SelectedIndex
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

    Sub subRecalculateProbAdjAmt()
        Dim Recoverable As Double
        Dim Cost As Double
        Dim Probability As Double
        Recoverable = System.Convert.ToDouble(txtRecoverableLosses.Text)
        Cost = System.Convert.ToDouble(txtCostAmt.Text)
        Probability = System.Convert.ToDouble(txtProbability.SelectedItem.Value)
        txtProbabilityAdjustedAmt.Text = (Recoverable - Cost) * Probability / 100
    End Sub

    Sub subCalculateImpliedAccountingTime()
        Dim AccMonth As Double
        Dim AccYear As Double
        If (cboSavingsStartMonth.SelectedItem.Value <> "" And cboSavingsStartYear.SelectedItem.Value <> "") Then
            If (cboExpenseHead.SelectedItem.Value = "RM" Or cboExpenseHead.SelectedItem.Value = "PM") Then
                AccMonth = System.Convert.ToDouble(cboSavingsStartMonth.SelectedItem.Value) + 2
                AccYear = System.Convert.ToDouble(cboSavingsStartYear.SelectedItem.Value)
            ElseIf (cboExpenseHead.SelectedItem.Value = "MOE") Then
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
            AccountingMonth.Text = AccMonth
            AccountingYear.Text = AccYear
        End If
    End Sub

    Sub subRecalculateTimeAdjAmt()
        Dim tempTime As Integer
        Dim Recoverable As Double
        Dim Cost As Double
        Dim SavingStartMonth As Double
        Dim SavingStartYear As Double

        If (AccountingMonth.Text <> "") Then
            SavingStartMonth = System.Convert.ToDouble(AccountingMonth.Text)
        Else
            SavingStartMonth = -1
        End If

        If (AccountingYear.Text <> "") Then
            SavingStartYear = System.Convert.ToDouble(AccountingYear.Text)
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

        Recoverable = System.Convert.ToDouble(txtRecoverableLosses.Text)
        Cost = System.Convert.ToDouble(txtCostAmt.Text)
        txtTimeAdjustedAmount.Text = Math.Round((Recoverable - Cost) * tempTime / 12)

    End Sub

    Sub subRecalculateTotalAdjAmt()
        txtTotalAdjustedAmount.Text = CStr(Math.Round(System.Convert.ToDouble(txtTimeAdjustedAmount.Text) * System.Convert.ToDouble(txtProbability.SelectedItem.Value) / 100))
    End Sub

    

    Sub SaveNewProject(ByVal sender As Object, ByVal e As System.EventArgs)

        
    End Sub


    Private Sub Cancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Cancel.Click
        Response.Redirect(cboBusinessUnit.SelectedItem.Value & ".aspx")
    End Sub



End Class