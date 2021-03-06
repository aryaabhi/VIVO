Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Xml
Imports System.Xml.XPath

Namespace SCLE.User
    Partial Class ProjectModification
        Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

        'This call is required by the Web Form Designer.
        <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

        End Sub
        Protected WithEvents cboCashSaving As System.Web.UI.WebControls.DropDownList
        Protected WithEvents cboNOS As System.Web.UI.WebControls.DropDownList
        Protected WithEvents Requiredfieldvalidator10 As System.Web.UI.WebControls.RequiredFieldValidator


        Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

#End Region

        Dim myDataSet As DataSet
        Dim dv As DataView
        Dim strFilePath As String
        Dim RequestedSubGBU As String
        Dim RequestedProjectID As String
        Dim connstring As String
        Dim MyConnection As SqlConnection

        Sub Page_Load(ByVal Src As Object, ByVal E As EventArgs)
            connstring = ConfigurationManager.ConnectionStrings("SQLConnectionString").ToString
            MyConnection = New SqlConnection(connstring)

            ' Abhi - Replace this later as per need
            RequestedProjectID = Request.QueryString("ProjectID")

            If Not IsPostBack Then
                '---------cboSubGBU
                myDataSet = New DataSet
                myDataSet.ReadXml(Server.MapPath("tblSubGBU.xml"))
                cboCategory.DataSource = myDataSet.Tables("SubGBU").DefaultView
                cboCategory.DataBind()
                cboCategory.Items.Insert(0, "")
                PopulateInitialValues()
            End If
        End Sub

        Sub PopulateInitialValues()
            'cboCategory.Items.FindByValue(RequestedSubGBU).Selected = True
            Dim DS As DataSet
            Dim objCommand As SqlCommand
            Dim rsSelectProject As SqlDataReader
            Dim objDataReader As SqlDataReader
            Dim SQLText As String
            Dim ProjectLeaderID As String

            'SQLText ="Select * from tblProjects,tblCash,tblCVC,tblSC where tblProjects.ProjectID = " & RequestedProjectID & " AND tblCash.ProjectID = " & RequestedProjectID & " AND tblCVC.ProjectID = " & RequestedProjectID  & " AND tblSC.ProjectID = " & RequestedProjectID	

            '----------------------------FOR tblProjects

            SQLText = "Select * from tblProjects where tblProjects.ProjectID = " & RequestedProjectID

            objCommand = New SqlCommand(SQLText, MyConnection)
            MyConnection.Open()

            rsSelectProject = objCommand.ExecuteReader(CommandBehavior.CloseConnection)
            rsSelectProject.Read()

            If Not IsDBNull(rsSelectProject("IsTDC")) Then
                TDCCheck.Checked = rsSelectProject("IsTDC")
                TDCPanel.Visible = rsSelectProject("IsTDC")
            End If

            If Not IsDBNull(rsSelectProject("IsCash")) Then
                CashCheck.Checked = rsSelectProject("IsCash")
                CashPanel.Visible = rsSelectProject("IsCash")
            End If

            If Not IsDBNull(rsSelectProject("IsCVC")) Then
                CustomerCheck.Checked = rsSelectProject("IsCVC")
                CustomerPanel.Visible = rsSelectProject("IsCVC")
            End If

            If Not IsDBNull(rsSelectProject("isSC")) Then
                SCTCheck.Checked = rsSelectProject("isSC")
                SupplyChainTimePanel.Visible = rsSelectProject("isSC")
            End If

            If Not IsDBNull(rsSelectProject("Category")) Then
                If Not cboCategory.Items.FindByValue(rsSelectProject("Category")) Is Nothing Then
                    cboCategory.Items.FindByValue(rsSelectProject("Category")).Selected = True
                    RequestedSubGBU = rsSelectProject("Category")
                    PopulateDropDown()
                Else
                    RequestedSubGBU = "HomeCare"
                    PopulateDropDown()
                End If
            End If

            If Not IsDBNull(rsSelectProject("ProjectName")) Then
                txtProjectName.Text = rsSelectProject("ProjectName")
            End If

            If Not IsDBNull(rsSelectProject("ProjectLeaderID")) Then
                If Not cboProjectLeader.Items.FindByValue(rsSelectProject("ProjectLeaderID")) Is Nothing Then
                    cboProjectLeader.Items.FindByValue(rsSelectProject("ProjectLeaderID")).Selected = True
                End If
            End If

            If Not IsDBNull(rsSelectProject("CommittedForecast")) Then
                chkCommitted.Checked = rsSelectProject("CommittedForecast")
            End If

            If Not IsDBNull(rsSelectProject("Status")) Then
                If Not cboStatus.Items.FindByValue(rsSelectProject("Status")) Is Nothing Then
                    cboStatus.Items.FindByValue(rsSelectProject("Status")).Selected = True
                End If
            End If

            If Not IsDBNull(rsSelectProject("ProjectStartYear")) Then
                If Not cboProjectStartYear.Items.FindByValue(rsSelectProject("ProjectStartYear")) Is Nothing Then
                    cboProjectStartYear.Items.FindByValue(rsSelectProject("ProjectStartYear")).Selected = True
                End If
            End If

            If Not IsDBNull(rsSelectProject("ProjectStartMonth")) Then
                If Not cboProjectStartMonth.Items.FindByValue(rsSelectProject("ProjectStartMonth")) Is Nothing Then
                    cboProjectStartMonth.Items.FindByValue(rsSelectProject("ProjectStartMonth")).Selected = True
                End If
            End If

            If Not IsDBNull(rsSelectProject("SavingsStartYear")) Then
                If Not cboSavingsStartYear.Items.FindByValue(rsSelectProject("SavingsStartYear")) Is Nothing Then
                    cboSavingsStartYear.Items.FindByValue(rsSelectProject("SavingsStartYear")).Selected = True
                End If
            End If

            If Not IsDBNull(rsSelectProject("SavingsStartMonth")) Then
                If Not cboSavingsStartMonth.Items.FindByValue(rsSelectProject("SavingsStartMonth")) Is Nothing Then
                    cboSavingsStartMonth.Items.FindByValue(rsSelectProject("SavingsStartMonth")).Selected = True
                End If
            End If

            If Not IsDBNull(rsSelectProject("RecoverableLosses")) Then
                txtRecoverableLosses.Text = rsSelectProject("RecoverableLosses")
            End If

            If Not IsDBNull(rsSelectProject("CostBucket")) Then
                If Not cboCostBucket.Items.FindByValue(rsSelectProject("CostBucket")) Is Nothing Then
                    cboCostBucket.Items.FindByValue(rsSelectProject("CostBucket")).Selected = True
                    TDCElementUpdate()
                End If
            End If

            If Not IsDBNull(rsSelectProject("CostAmt")) Then
                txtCostAmt.Text = rsSelectProject("CostAmt")
            End If

            If Not IsDBNull(rsSelectProject("Probability")) Then
                If Not txtProbability.Items.FindByValue(rsSelectProject("Probability")) Is Nothing Then
                    txtProbability.Items.FindByValue(rsSelectProject("Probability")).Selected = True
                End If
            End If

            If Not IsDBNull(rsSelectProject("Plant")) Then
                If Not cboPlant.Items.FindByValue(rsSelectProject("Plant")) Is Nothing Then
                    cboPlant.Items.FindByValue(rsSelectProject("Plant")).Selected = True
                End If
            End If

            If Not IsDBNull(rsSelectProject("Business")) Then
                If Not cboBusiness.Items.FindByValue(rsSelectProject("Business")) Is Nothing Then
                    cboBusiness.Items.FindByValue(rsSelectProject("Business")).Selected = True
                    Business_Update()
                End If
            End If

            If Not IsDBNull(rsSelectProject("LossType")) Then
                If Not cboLossType.Items.FindByValue(rsSelectProject("LossType")) Is Nothing Then
                    cboLossType.Items.FindByValue(rsSelectProject("LossType")).Selected = True
                End If
            End If

            If Not IsDBNull(rsSelectProject("Description")) Then
                txtDescription.Text = rsSelectProject("Description")
            End If

            If Not IsDBNull(rsSelectProject("BusinessForm")) Then
                If Not cboBusinessForm.Items.FindByValue(rsSelectProject("BusinessForm")) Is Nothing Then
                    cboBusinessForm.Items.FindByValue(rsSelectProject("BusinessForm")).Selected = True
                End If
            End If

            If Not IsDBNull(rsSelectProject("TDCSubElement")) Then
                If Not cboTDCSubElement.Items.FindByValue(rsSelectProject("TDCSubElement")) Is Nothing Then
                    cboTDCSubElement.Items.FindByValue(rsSelectProject("TDCSubElement")).Selected = True
                End If
            End If

            If Not IsDBNull(rsSelectProject("ImpliedSavStartMonth")) Then
                AccountingMonth.Text = rsSelectProject("ImpliedSavStartMonth")
            End If

            If Not IsDBNull(rsSelectProject("ImpliedSavStartYear")) Then
                AccountingYear.Text = rsSelectProject("ImpliedSavStartYear")
            End If

            If Not IsDBNull(rsSelectProject("ProjectStage")) Then
                ProjectStage.Items.FindByValue(rsSelectProject("ProjectStage")).Selected = True
            End If

            If Not IsDBNull(rsSelectProject("Department")) Then
                cboDepartment.Items.FindByValue(rsSelectProject("Department")).Selected = True
            End If

            If Not IsDBNull(rsSelectProject("OtherBusiness")) Then
                cboOtherBusiness.Items.FindByValue(rsSelectProject("OtherBusiness")).Selected = True
            End If

            If Not IsDBNull(rsSelectProject("Standards")) Then
                chkStandards.Checked = rsSelectProject("Standards")
            End If

            rsSelectProject.Close()

            '----------------------------FOR tblCash

            SQLText = "Select * from tblCash where tblCash.ProjectID = " & RequestedProjectID

            objCommand = New SqlCommand(SQLText, MyConnection)
            MyConnection.Open()

            rsSelectProject = objCommand.ExecuteReader(CommandBehavior.CloseConnection)
            rsSelectProject.Read()

            ' ADD ALL PROCESSING HERE
            If rsSelectProject.HasRows() Then

                If Not IsDBNull(rsSelectProject("CashElement")) Then
                    cboCashElement.Items.FindByValue(rsSelectProject("CashElement")).Selected = True
                    CashElement_Update()
                End If

                If Not IsDBNull(rsSelectProject("CashSubElement")) Then
                    cboCashSubElement.Items.FindByValue(rsSelectProject("CashSubElement")).Selected = True
                End If

                If Not IsDBNull(rsSelectProject("CashAccMethod")) Then
                    cboTotalCashSaving.Items.FindByValue(rsSelectProject("CashAccMethod")).Selected = True
                End If

                If Not IsDBNull(rsSelectProject("CashSavings")) Then
                    txtCash.Text = rsSelectProject("CashSavings")
                End If

                If Not IsDBNull(rsSelectProject("CashProbability")) Then
                    cboCashProbability.Items.FindByValue(rsSelectProject("CashProbability")).Selected = True
                End If

                If Not IsDBNull(rsSelectProject("CashProbAdjAmt")) Then
                    txtCashAdjAmt.Text = rsSelectProject("CashProbAdjAmt")
                End If

                If Not IsDBNull(rsSelectProject("CashDescription")) Then
                    txtCashDescription.Text = rsSelectProject("CashDescription")
                End If

            End If
            rsSelectProject.Close()

            '----------------------------FOR tblCVC
            SQLText = "Select * from tblCVC where tblCVC.ProjectID = " & RequestedProjectID

            objCommand = New SqlCommand(SQLText, MyConnection)
            MyConnection.Open()

            rsSelectProject = objCommand.ExecuteReader(CommandBehavior.CloseConnection)
            rsSelectProject.Read()

            ' ADD ALL PROCESSING HERE
            If rsSelectProject.HasRows() Then

                If Not IsDBNull(rsSelectProject("CVCElement")) Then
                    cboCVCElement.Items.FindByValue(rsSelectProject("CVCElement")).Selected = True
                End If

                If Not IsDBNull(rsSelectProject("CustomerName")) Then
                    cboCVCCustomer.Items.FindByValue(rsSelectProject("CustomerName")).Selected = True
                End If

                If Not IsDBNull(rsSelectProject("SupplierName")) Then
                    cboCVCSupplier.Items.FindByValue(rsSelectProject("SupplierName")).Selected = True
                End If

                If Not IsDBNull(rsSelectProject("PGPartnerOrg")) Then
                    Dim MyVar() As String
                    Dim lngLoop As Long
                    MyVar = Split(rsSelectProject("PGPartnerOrg"), ",")
                    For lngLoop = LBound(MyVar) To UBound(MyVar)
                        lstCVCPartner.Items.FindByValue(MyVar(lngLoop)).Selected = True
                    Next
                End If


                If Not IsDBNull(rsSelectProject("NOSAddition")) Then
                    txtNOS.Text = rsSelectProject("NOSAddition")
                End If

                If Not IsDBNull(rsSelectProject("CustomerAmt")) Then
                    txtCustomerSaving.Text = rsSelectProject("CustomerAmt")
                End If

                If Not IsDBNull(rsSelectProject("PGAmt")) Then
                    txtCVCPGSavings.Text = rsSelectProject("PGAmt")
                End If

                If Not IsDBNull(rsSelectProject("CVCProb")) Then
                    cboCVCProb.Items.FindByValue(rsSelectProject("CVCProb")).Selected = True
                End If

                If Not IsDBNull(rsSelectProject("ProbAdjAmt")) Then
                    txtCVCProbAdjAmt.Text = rsSelectProject("ProbAdjAmt")
                End If

                If Not IsDBNull(rsSelectProject("CVCDescription")) Then
                    txtCVCDescription.Text = rsSelectProject("CVCDescription")
                End If

            End If
            rsSelectProject.Close()

            '----------------------------FOR tblSC

            SQLText = "Select * from tblSC where tblSC.ProjectID = " & RequestedProjectID

            objCommand = New SqlCommand(SQLText, MyConnection)
            MyConnection.Open()

            rsSelectProject = objCommand.ExecuteReader(CommandBehavior.CloseConnection)
            rsSelectProject.Read()

            ' ADD ALL PROCESSING HERE
            If rsSelectProject.HasRows() Then

                If Not IsDBNull(rsSelectProject("SupplyChain")) Then
                    cboSCsupplyChain.Items.FindByValue(rsSelectProject("SupplyChain")).Selected = True
                End If

                If Not IsDBNull(rsSelectProject("SCElement")) Then
                    cboSCElement.Items.FindByValue(rsSelectProject("SCElement")).Selected = True
                End If

                If Not IsDBNull(rsSelectProject("SCSubElement")) Then
                    cboSCSubElement.Items.FindByValue(rsSelectProject("SCSubElement")).Selected = True
                End If

                If Not IsDBNull(rsSelectProject("SCTimeCurrent")) Then
                    SCTCurrent.Text = rsSelectProject("SCTimeCurrent")
                End If

                If Not IsDBNull(rsSelectProject("SCTimeExpected")) Then
                    SCTExpected.Text = rsSelectProject("SCTimeExpected")
                End If

                If Not IsDBNull(rsSelectProject("SCTimeEffect")) Then
                    txtSCImpact.Text = rsSelectProject("SCTimeEffect")
                End If

                If Not IsDBNull(rsSelectProject("SCProbability")) Then
                    cboSCProbability.Items.FindByValue(rsSelectProject("SCProbability")).Selected = True
                End If

                If Not IsDBNull(rsSelectProject("SCDescription")) Then
                    txtSCDescription.Text = rsSelectProject("SCDescription")
                End If

            End If

            rsSelectProject.Close()
            MyConnection.Close()

            ' Calculations of time, probability and total adjusted is done on run time again.
            PerformCalculation()
            subCashProbAdjAmt()
            subNOSCVCProbAdjAmt()
            subSCTProbAdjAmt()

            If chkCommitted.Checked = True Then
                ReadOnlyIfChecked()
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
            txtRecoverableLosses.ReadOnly = False
            cboCostBucket.Enabled = True
            txtCostAmt.ReadOnly = False
            txtProbability.Enabled = True
            cboPlant.Enabled = True
            cboBusiness.Enabled = True
            cboLossType.Enabled = True
            txtDescription.ReadOnly = False
            cboBusinessForm.Enabled = True
            cboTDCSubElement.Enabled = True
            AccountingMonth.ReadOnly = False
            AccountingYear.ReadOnly = False
            ProjectStage.Enabled = True
            cboOtherBusiness.Enabled = True
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
            txtRecoverableLosses.ReadOnly = True
            cboCostBucket.Enabled = False
            txtCostAmt.ReadOnly = True
            txtProbability.Enabled = False
            cboPlant.Enabled = False
            cboBusiness.Enabled = False
            cboLossType.Enabled = False
            txtDescription.ReadOnly = True
            cboBusinessForm.Enabled = False
            cboTDCSubElement.Enabled = False
            AccountingMonth.ReadOnly = True
            AccountingYear.ReadOnly = True
            ProjectStage.Enabled = False
            cboOtherBusiness.Enabled = False
        End Sub

        Sub PopulateDropDown()
            Dim nav As XPathNavigator
            Dim docNav As XPathDocument
            Dim NodeIter As XPathNodeIterator
            Dim strExpression As String
            '---------cboPersonnel
            myDataSet = New DataSet
            myDataSet.ReadXml(Server.MapPath("tblPersonnel.xml"))
            cboProjectLeader.DataSource = myDataSet.Tables("tblPersonnel").DefaultView
            cboProjectLeader.DataBind()
            cboProjectLeader.Items.Insert(0, "")
            '---------cboLossType
            myDataSet = New DataSet
            myDataSet.ReadXml(Server.MapPath("tblLossType.xml"))
            cboLossType.DataSource = myDataSet.Tables("tblLossType").DefaultView
            cboLossType.DataBind()
            cboLossType.Items.Insert(0, "")
            '---------cboStatus
            myDataSet = New DataSet
            myDataSet.ReadXml(Server.MapPath("tblStatus.xml"))
            cboStatus.DataSource = myDataSet.Tables("tblStatus").DefaultView
            cboStatus.DataBind()
            cboStatus.Items.Insert(0, "")
            '---------cboCostBucket
            myDataSet = New DataSet
            myDataSet.ReadXml(Server.MapPath("tblTDCElements.xml"))
            cboCostBucket.DataSource = myDataSet.Tables("TDCElement").DefaultView
            cboCostBucket.DataBind()
            cboCostBucket.Items.Insert(0, "")
            '---------cboBusiness
            myDataSet = New DataSet
            myDataSet.ReadXml(Server.MapPath("tblBusiness.xml"))
            dv = New DataView(myDataSet.Tables("BusinessDesc"))
            dv.RowFilter = "subGBU='" & RequestedSubGBU & "'"
            cboBusiness.DataSource = dv
            cboBusiness.DataBind()
            cboBusiness.Items.Insert(0, "")
            '---------cboOtherBusiness
            myDataSet = New DataSet
            myDataSet.ReadXml(Server.MapPath("tblOtherBusiness.xml"))
            cboOtherBusiness.DataSource = myDataSet.Tables("OtherBusiness").DefaultView
            cboOtherBusiness.DataBind()
            cboOtherBusiness.Items.Insert(0, "")
            '---------cboDepartment
            myDataSet = New DataSet
            myDataSet.ReadXml(Server.MapPath("tblDepartment.xml"))
            cboDepartment.DataSource = myDataSet.Tables("Department").DefaultView
            cboDepartment.DataBind()
            cboDepartment.Items.Insert(0, "")
            '---------cboPlant
            myDataSet = New DataSet
            myDataSet.ReadXml(Server.MapPath("tblPlant.xml"))
            dv = New DataView(myDataSet.Tables("tblPlant"))
            dv.RowFilter = "subGBU='" & RequestedSubGBU & "'"
            cboPlant.DataSource = dv
            cboPlant.DataBind()
            cboPlant.Items.Insert(0, "")
            '---------cboCashElement
            myDataSet = New DataSet
            myDataSet.ReadXml(Server.MapPath("tblCashElement.xml"))
            cboCashElement.DataSource = myDataSet.Tables("CASHElement").DefaultView
            cboCashElement.DataBind()
            cboCashElement.Items.Insert(0, "")
            '---------cboCVCElement
            myDataSet = New DataSet
            myDataSet.ReadXml(Server.MapPath("tblCVCElement.xml"))
            cboCVCElement.DataSource = myDataSet.Tables("CVCElement").DefaultView
            cboCVCElement.DataBind()
            cboCVCElement.Items.Insert(0, "")
            '---------cboCVCCustomer
            myDataSet = New DataSet
            myDataSet.ReadXml(Server.MapPath("tblCVCCustomer.xml"))
            cboCVCCustomer.DataSource = myDataSet.Tables("CVCCustomer").DefaultView
            cboCVCCustomer.DataBind()
            cboCVCCustomer.Items.Insert(0, "")
            '---------cboCVCSupplier
            myDataSet = New DataSet
            myDataSet.ReadXml(Server.MapPath("tblCVCSupplier.xml"))
            cboCVCSupplier.DataSource = myDataSet.Tables("CVCSupplier").DefaultView
            cboCVCSupplier.DataBind()
            cboCVCSupplier.Items.Insert(0, "")
            '---------cboSCSupplyChain
            myDataSet = New DataSet
            myDataSet.ReadXml(Server.MapPath("tblSCSupplyChain.xml"))
            cboSCsupplyChain.DataSource = myDataSet.Tables("SupplyChain").DefaultView
            cboSCsupplyChain.DataBind()
            cboSCsupplyChain.Items.Insert(0, "")
            '---------cbo of Months
            myDataSet = New DataSet
            myDataSet.ReadXml(Server.MapPath("tblMonths.xml"))
            cboProjectStartMonth.DataSource = myDataSet.Tables("tblMonths").DefaultView
            cboProjectStartMonth.DataBind()
            cboProjectStartMonth.Items.Insert(0, "")
            cboSavingsStartMonth.DataSource = myDataSet.Tables("tblMonths").DefaultView
            cboSavingsStartMonth.DataBind()
            cboSavingsStartMonth.Items.Insert(0, "")
            '---------cbo of Years
            myDataSet = New DataSet
            myDataSet.ReadXml(Server.MapPath("tblYears.xml"))
            cboProjectStartYear.DataSource = myDataSet.Tables("tblYears").DefaultView
            cboProjectStartYear.DataBind()
            cboSavingsStartYear.DataSource = myDataSet.Tables("tblYears").DefaultView
            cboSavingsStartYear.DataBind()
        End Sub

        Sub CashElement_AfterUpdate(ByVal sender As Object, ByVal e As System.EventArgs)
            CashElement_Update()
        End Sub

        Sub CashElement_Update()
            myDataSet = New DataSet
            myDataSet.ReadXml(Server.MapPath("tblCashSubElement.xml"))
            dv = New DataView(myDataSet.Tables("CASHSubElement"))
            dv.RowFilter = "CASHElement='" & cboCashElement.SelectedItem.Value & "'"
            cboCashSubElement.DataSource = dv
            cboCashSubElement.DataBind()
            cboCashSubElement.Items.Insert(0, "")
        End Sub

        Sub Business_AfterUpdate(ByVal sender As Object, ByVal e As System.EventArgs)
            Business_Update()
        End Sub

        Sub Business_Update()
            '---------cboBusinessForms
            myDataSet = New DataSet
            myDataSet.ReadXml(Server.MapPath("tblBusinessForms.xml"))
            dv = New DataView(myDataSet.Tables("BusinessForm"))
            dv.RowFilter = "Business='" & cboBusiness.SelectedItem.Value & "'"
            cboBusinessForm.DataSource = dv
            cboBusinessForm.DataBind()
            cboBusinessForm.Items.Insert(0, "")
        End Sub

        Sub TDCElement_AfterUpdate(ByVal sender As Object, ByVal e As System.EventArgs)
            TDCElementUpdate()
        End Sub

        Sub TDCElementUpdate()
            subCalculateImpliedAccountingTime()
            '---------cboTDCSubElement
            myDataSet = New DataSet
            myDataSet.ReadXml(Server.MapPath("tblTDCSubElements.xml"))
            dv = New DataView(myDataSet.Tables("TDCSubElement"))
            dv.RowFilter = "TDCElement='" & cboCostBucket.SelectedItem.Value & "'"
            cboTDCSubElement.DataSource = dv
            cboTDCSubElement.DataBind()
            cboTDCSubElement.Items.Insert(0, "")
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
                If (cboCostBucket.SelectedItem.Value = "RM" Or cboCostBucket.SelectedItem.Value = "PM") Then
                    AccMonth = System.Convert.ToDouble(cboSavingsStartMonth.SelectedItem.Value) + 2
                    AccYear = System.Convert.ToDouble(cboSavingsStartYear.SelectedItem.Value)
                ElseIf (cboCostBucket.SelectedItem.Value = "MOE") Then
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
            Dim Probability As Double
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

        Sub subCashProbAdjAmt(ByVal sender As Object, ByVal e As System.EventArgs)
            subCashProbAdjAmt()
        End Sub

        Sub subCashProbAdjAmt()
            txtCashAdjAmt.Text = System.Convert.ToDouble(cboCashProbability.SelectedItem.Value) * System.Convert.ToDouble(txtCash.Text) / 100
        End Sub

        Sub subNOSCVCProbAdjAmt(ByVal sender As Object, ByVal e As System.EventArgs)
            subNOSCVCProbAdjAmt()
        End Sub

        Sub subNOSCVCProbAdjAmt()
            txtCVCProbAdjAmt.Text = (System.Convert.ToDouble(txtNOS.Text) + System.Convert.ToDouble(txtCustomerSaving.Text) + System.Convert.ToDouble(txtCVCPGSavings.Text)) * System.Convert.ToDouble(cboCVCProb.SelectedItem.Value) / 100
        End Sub

        Sub subSCTProbAdjAmt(ByVal sender As Object, ByVal e As System.EventArgs)
            subSCTProbAdjAmt()
        End Sub

        Sub subSCTProbAdjAmt()
            txtSCImpact.Text = (System.Convert.ToDouble(SCTCurrent.Text) - System.Convert.ToDouble(SCTExpected.Text)) * System.Convert.ToDouble(cboSCProbability.SelectedItem.Value) / 100
        End Sub

        Sub TDC_CheckChanged(ByVal sender As Object, ByVal e As System.EventArgs)
            If TDCCheck.Checked = True Then
                TDCPanel.Visible = True
            Else
                TDCPanel.Visible = False
            End If
        End Sub

        Sub Cash_CheckChanged(ByVal sender As Object, ByVal e As System.EventArgs)
            If CashCheck.Checked = True Then
                CashPanel.Visible = True
            Else
                CashPanel.Visible = False
            End If
        End Sub

        Sub Customer_CheckChanged(ByVal sender As Object, ByVal e As System.EventArgs)
            If CustomerCheck.Checked = True Then
                CustomerPanel.Visible = True
            Else
                CustomerPanel.Visible = False
            End If
        End Sub

        Sub SCT_CheckChanged(ByVal sender As Object, ByVal e As System.EventArgs)
            If SCTCheck.Checked = True Then
                SupplyChainTimePanel.Visible = True
            Else
                SupplyChainTimePanel.Visible = False
            End If
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

            PerformCalculation()
            subCashProbAdjAmt()
            subNOSCVCProbAdjAmt()
            subSCTProbAdjAmt()

            MyCommand = New SqlCommand("UpdateProject", MyConnection)
            MyCommand.CommandType = CommandType.StoredProcedure

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
            chkBoxChecked1 = (CType(chkStandards, CheckBox).Checked) * -1
            chkBoxChecked2 = (CType(TDCCheck, CheckBox).Checked) * -1
            chkBoxChecked3 = (CType(CashCheck, CheckBox).Checked) * -1
            chkBoxChecked4 = (CType(CustomerCheck, CheckBox).Checked) * -1
            chkBoxChecked5 = (CType(SCTCheck, CheckBox).Checked) * -1

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

            MyCommand.Parameters.Add(New SqlParameter("@ProjectID", SqlDbType.Int, 4))
            MyCommand.Parameters("@ProjectID").Value = System.Convert.ToInt64(RequestedProjectID)
            MyCommand.Parameters.Add(New SqlParameter("@Category", SqlDbType.NVarChar, 50))
            MyCommand.Parameters("@Category").Value = cboCategory.SelectedItem.Value
            MyCommand.Parameters.Add(New SqlParameter("@Plant", SqlDbType.NVarChar, 50))
            MyCommand.Parameters("@Plant").Value = cboPlant.SelectedItem.Value
            MyCommand.Parameters.Add(New SqlParameter("@Business", SqlDbType.NVarChar, 50))
            MyCommand.Parameters("@Business").Value = cboBusiness.SelectedItem.Value
            MyCommand.Parameters.Add(New SqlParameter("@BusinessForm", SqlDbType.NVarChar, 50))
            MyCommand.Parameters("@BusinessForm").Value = cboBusinessForm.SelectedItem.Value
            MyCommand.Parameters.Add(New SqlParameter("@OtherBusiness", SqlDbType.NVarChar, 20))
            MyCommand.Parameters("@OtherBusiness").Value = cboOtherBusiness.SelectedItem.Value
            MyCommand.Parameters.Add(New SqlParameter("@ProjectName", SqlDbType.NVarChar, 200))
            MyCommand.Parameters("@ProjectName").Value = txtProjectName.Text
            MyCommand.Parameters.Add(New SqlParameter("@ProjectLeaderID", SqlDbType.Int, 4))
            MyCommand.Parameters("@ProjectLeaderID").Value = System.Convert.ToInt64(cboProjectLeader.SelectedItem.Value)
            MyCommand.Parameters.Add(New SqlParameter("@ProjectStartYear", SqlDbType.SmallInt, 2))
            MyCommand.Parameters("@ProjectStartYear").Value = System.Convert.ToInt32(cboProjectStartYear.SelectedItem.Value)
            MyCommand.Parameters.Add(New SqlParameter("@ProjectStartMonth", SqlDbType.SmallInt, 2))
            MyCommand.Parameters("@ProjectStartMonth").Value = System.Convert.ToInt32(cboProjectStartMonth.SelectedItem.Value)
            MyCommand.Parameters.Add(New SqlParameter("@ProjectStartMonthYearLiteral", SqlDbType.NVarChar, 10))
            MyCommand.Parameters("@ProjectStartMonthYearLiteral").Value = ProjectBeginLiteral
            MyCommand.Parameters.Add(New SqlParameter("@SavingsStartYear", SqlDbType.SmallInt, 2))
            MyCommand.Parameters("@SavingsStartYear").Value = System.Convert.ToInt32(cboSavingsStartYear.SelectedItem.Value)
            MyCommand.Parameters.Add(New SqlParameter("@SavingsStartMonth", SqlDbType.SmallInt, 2))
            MyCommand.Parameters("@SavingsStartMonth").Value = System.Convert.ToInt32(cboSavingsStartMonth.SelectedItem.Value)
            MyCommand.Parameters.Add(New SqlParameter("@SavingsStartMonthYearLiteral", SqlDbType.NVarChar, 10))
            MyCommand.Parameters("@SavingsStartMonthYearLiteral").Value = SavingBeginLiteral
            MyCommand.Parameters.Add(New SqlParameter("@IsTDC", SqlDbType.Bit))
            MyCommand.Parameters("@IsTDC").Value = chkBoxChecked2
            MyCommand.Parameters.Add(New SqlParameter("@IsCash", SqlDbType.Bit))
            MyCommand.Parameters("@IsCash").Value = chkBoxChecked3
            MyCommand.Parameters.Add(New SqlParameter("@IsCVC", SqlDbType.Bit))
            MyCommand.Parameters("@IsCVC").Value = chkBoxChecked4
            MyCommand.Parameters.Add(New SqlParameter("@IsSC", SqlDbType.Bit))
            MyCommand.Parameters("@IsSC").Value = chkBoxChecked5

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
            '---------------------------------- Cash Part
            If (chkBoxChecked3 = 1) Then

                MyCommand.Parameters.Add(New SqlParameter("@CashElement", SqlDbType.NVarChar, 50))
                MyCommand.Parameters("@CashElement").Value = cboCashElement.SelectedItem.Text
                MyCommand.Parameters.Add(New SqlParameter("@CashSubElement", SqlDbType.NVarChar, 50))
                MyCommand.Parameters("@CashSubElement").Value = cboCashSubElement.SelectedItem.Text
                MyCommand.Parameters.Add(New SqlParameter("@CashAccMethod", SqlDbType.NVarChar, 50))
                MyCommand.Parameters("@CashAccMethod").Value = cboTotalCashSaving.SelectedItem.Text
                MyCommand.Parameters.Add(New SqlParameter("@CashSavings", SqlDbType.Int, 4))
                MyCommand.Parameters("@CashSavings").Value = System.Convert.ToInt32(txtCash.Text)
                MyCommand.Parameters.Add(New SqlParameter("@CashProbability", SqlDbType.Int, 4))
                MyCommand.Parameters("@CashProbability").Value = cboCashProbability.SelectedItem.Value
                MyCommand.Parameters.Add(New SqlParameter("@CashProbAdjAmt", SqlDbType.Int, 4))
                MyCommand.Parameters("@CashProbAdjAmt").Value = System.Convert.ToInt32(txtCashAdjAmt.Text)
                MyCommand.Parameters.Add(New SqlParameter("@CashDescription", SqlDbType.NVarChar, 250))
                MyCommand.Parameters("@CashDescription").Value = txtCashDescription.Text
            End If

            '---------------------------------- NOSAddition Part
            If (chkBoxChecked4 = 1) Then
                Dim strIN As String
                Dim flgSelectAll As Boolean
                Dim li As ListItem

                flgSelectAll = False

                For Each li In lstCVCPartner.Items
                    If li.Selected = True Then
                        flgSelectAll = True
                        strIN = strIN & li.Value & ","
                    End If
                Next

                If flgSelectAll Then
                    strIN = Left(strIN, Len(strIN) - 1)
                Else
                    strIN = ""
                End If

                MyCommand.Parameters.Add(New SqlParameter("@CVCElement", SqlDbType.NVarChar, 50))
                MyCommand.Parameters("@CVCElement").Value = cboCVCElement.SelectedItem.Value
                MyCommand.Parameters.Add(New SqlParameter("@CustomerName", SqlDbType.NVarChar, 50))
                MyCommand.Parameters("@CustomerName").Value = cboCVCCustomer.SelectedItem.Value
                MyCommand.Parameters.Add(New SqlParameter("@SupplierName", SqlDbType.NVarChar, 50))
                MyCommand.Parameters("@SupplierName").Value = cboCVCSupplier.SelectedItem.Value
                MyCommand.Parameters.Add(New SqlParameter("@PGPartnerOrg", SqlDbType.NVarChar, 50))
                MyCommand.Parameters("@PGPartnerOrg").Value = strIN
                MyCommand.Parameters.Add(New SqlParameter("@NOSAddition", SqlDbType.Int, 4))
                MyCommand.Parameters("@NOSAddition").Value = System.Convert.ToInt32(txtNOS.Text)
                MyCommand.Parameters.Add(New SqlParameter("@CustomerAmt", SqlDbType.Int, 4))
                MyCommand.Parameters("@CustomerAmt").Value = System.Convert.ToInt32(txtCustomerSaving.Text)
                MyCommand.Parameters.Add(New SqlParameter("@PGAmt", SqlDbType.Int, 4))
                MyCommand.Parameters("@PGAmt").Value = System.Convert.ToInt32(txtCVCPGSavings.Text)
                MyCommand.Parameters.Add(New SqlParameter("@CVCProb", SqlDbType.Int, 4))
                MyCommand.Parameters("@CVCProb").Value = cboCVCProb.SelectedItem.Value
                MyCommand.Parameters.Add(New SqlParameter("@ProbAdjAmt", SqlDbType.Int, 4))
                MyCommand.Parameters("@ProbAdjAmt").Value = System.Convert.ToInt32(txtCVCProbAdjAmt.Text)
                MyCommand.Parameters.Add(New SqlParameter("@CVCDescription", SqlDbType.NVarChar, 250))
                MyCommand.Parameters("@CVCDescription").Value = txtCVCDescription.Text
            End If
            '--------------------------------- Supply Chain Fields
            If (chkBoxChecked5 = 1) Then
                MyCommand.Parameters.Add(New SqlParameter("@SupplyChain", SqlDbType.NVarChar, 50))
                MyCommand.Parameters("@SupplyChain").Value = cboSCsupplyChain.SelectedItem.Value
                MyCommand.Parameters.Add(New SqlParameter("@SCElement", SqlDbType.NVarChar, 50))
                MyCommand.Parameters("@SCElement").Value = cboSCElement.SelectedItem.Value
                MyCommand.Parameters.Add(New SqlParameter("@SCSubElement", SqlDbType.NVarChar, 50))
                MyCommand.Parameters("@SCSubElement").Value = cboSCSubElement.SelectedItem.Value
                MyCommand.Parameters.Add(New SqlParameter("@SCTimeCurrent", SqlDbType.SmallInt, 2))
                MyCommand.Parameters("@SCTimeCurrent").Value = System.Convert.ToInt32(SCTCurrent.Text)
                MyCommand.Parameters.Add(New SqlParameter("@SCTimeExpected", SqlDbType.SmallInt, 2))
                MyCommand.Parameters("@SCTimeExpected").Value = System.Convert.ToInt32(SCTExpected.Text)
                MyCommand.Parameters.Add(New SqlParameter("@SCTimeEffect", SqlDbType.SmallInt, 2))
                MyCommand.Parameters("@SCTimeEffect").Value = System.Convert.ToInt32(txtSCImpact.Text)
                MyCommand.Parameters.Add(New SqlParameter("@SCProbability", SqlDbType.SmallInt, 2))
                MyCommand.Parameters("@SCProbability").Value = cboSCProbability.SelectedItem.Value
                MyCommand.Parameters.Add(New SqlParameter("@SCDescription", SqlDbType.NVarChar, 250))
                MyCommand.Parameters("@SCDescription").Value = txtSCDescription.Text
            End If
            '--------------------------------- Optional Field
            MyCommand.Parameters.Add(New SqlParameter("@LossType", SqlDbType.NVarChar, 50))
            MyCommand.Parameters("@LossType").Value = cboLossType.SelectedItem.Value
            MyCommand.Parameters.Add(New SqlParameter("@Department", SqlDbType.NVarChar, 50))
            MyCommand.Parameters("@Department").Value = cboDepartment.SelectedItem.Value
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
            Response.Redirect("ProjectModificationConfirm.aspx")
        End Sub

        Private Sub Cancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Cancel.Click
            Response.Redirect("ProjectModificationConfirm.aspx")
        End Sub
    End Class
End Namespace

