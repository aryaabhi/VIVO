Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Xml
Imports System.Xml.XPath

Namespace SCLE.User

    Partial Class CustomSearch
        Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

        'This call is required by the Web Form Designer.
        <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

        End Sub


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
        Dim RequestedBusiness As String
        Dim connstring As String
        Dim MyConnection As SqlConnection
        Dim MyCommand1 As SqlDataAdapter
        Dim DS As DataSet
        Dim NewReportID As Integer

        Sub Page_Load(ByVal Src As Object, ByVal E As EventArgs) Handles MyBase.Load
            connstring = ConfigurationManager.ConnectionStrings("SQLConnectionString").ToString
            MyConnection = New SqlConnection(connstring)
            If Not IsPostBack Then
                PopulateReportName()
                PopulateDropDown()
            End If
        End Sub

        Sub PopulateReportName()
            MyCommand1 = New SqlDataAdapter("SelectReportList", MyConnection)
            MyCommand1.SelectCommand.CommandType = CommandType.StoredProcedure

            DS = New DataSet
            MyCommand1.Fill(DS, "tblReportList")

            cboCustomReportList.DataSource = DS.Tables("tblReportList").DefaultView
            cboCustomReportList.DataBind()
        End Sub

        Sub PopulateDropDown()
            '---------cboLossType
            myDataSet = New DataSet
            myDataSet.ReadXml(Server.MapPath("tblLossType.xml"))
            cboLossType.DataSource = myDataSet.Tables("tblLossType").DefaultView
            cboLossType.DataBind()
            '---------cboStatus
            myDataSet = New DataSet
            myDataSet.ReadXml(Server.MapPath("tblStatus.xml"))
            cboStatus.DataSource = myDataSet.Tables("tblStatus").DefaultView
            cboStatus.DataBind()
            '---------cboSubGBU
            myDataSet = New DataSet
            myDataSet.ReadXml(Server.MapPath("tblSubGBU.xml"))
            cboCategory.DataSource = myDataSet.Tables("SubGBU").DefaultView
            cboCategory.DataBind()
            '---------cboPersonnel
            myDataSet = New DataSet
            myDataSet.ReadXml(Server.MapPath("tblPersonnel.xml"))
            cboProjectLeader.DataSource = myDataSet.Tables("tblPersonnel").DefaultView
            cboProjectLeader.DataBind()

            '---------cboBusiness
            myDataSet = New DataSet
            myDataSet.ReadXml(Server.MapPath("tblBusiness.xml"))
            cboBusiness.DataSource = myDataSet.Tables("BusinessDesc").DefaultView
            cboBusiness.DataBind()

            '---------cboPlant
            myDataSet = New DataSet
            myDataSet.ReadXml(Server.MapPath("tblPlant.xml"))
            cboPlant.DataSource = myDataSet.Tables("tblPlant").DefaultView
            cboPlant.DataBind()

            '---------ReportTags
            myDataSet = New DataSet
            myDataSet.ReadXml(Server.MapPath("tblReportTags.xml"))
            lstReportTags.DataSource = myDataSet.Tables("tblReportTags").DefaultView
            lstReportTags.DataBind()

            '---------cboCategory
            myDataSet = New DataSet
            myDataSet.ReadXml(Server.MapPath("tblSubGBU.xml"))
            cboCategory.DataSource = myDataSet.Tables("SubGBU").DefaultView
            cboCategory.DataBind()

            '---------cboTDCElement
            myDataSet = New DataSet
            myDataSet.ReadXml(Server.MapPath("tblTDCElements.xml"))
            cboTDCElement.DataSource = myDataSet.Tables("TDCElement").DefaultView
            cboTDCElement.DataBind()

            '---------cbo of Months
            myDataSet = New DataSet
            myDataSet.ReadXml(Server.MapPath("tblMonths.xml"))
            cboProjectStartMonthFrom.DataSource = myDataSet.Tables("tblMonths").DefaultView
            cboProjectStartMonthFrom.DataBind()
            cboProjectStartMonthFrom.Items.Insert(0, "")
            cboProjectStartMonthTill.DataSource = myDataSet.Tables("tblMonths").DefaultView
            cboProjectStartMonthTill.DataBind()
            cboProjectStartMonthTill.Items.Insert(0, "")
            cboSavingStartMonthFrom.DataSource = myDataSet.Tables("tblMonths").DefaultView
            cboSavingStartMonthFrom.DataBind()
            cboSavingStartMonthFrom.Items.Insert(0, "")
            cboSavingStartMonthTill.DataSource = myDataSet.Tables("tblMonths").DefaultView
            cboSavingStartMonthTill.DataBind()
            cboSavingStartMonthTill.Items.Insert(0, "")
            '---------cbo of Years
            myDataSet = New DataSet
            myDataSet.ReadXml(Server.MapPath("tblYears.xml"))
            cboProjectStartYearFrom.DataSource = myDataSet.Tables("tblYears").DefaultView
            cboProjectStartYearFrom.DataBind()
            cboProjectStartYearFrom.Items.Insert(0, "")
            cboProjectStartYearTill.DataSource = myDataSet.Tables("tblYears").DefaultView
            cboProjectStartYearTill.DataBind()
            cboProjectStartYearTill.Items.Insert(0, "")
            cboSavingStartYearFrom.DataSource = myDataSet.Tables("tblYears").DefaultView
            cboSavingStartYearFrom.DataBind()
            cboSavingStartYearFrom.Items.Insert(0, "")
            cboSavingStartYearTill.DataSource = myDataSet.Tables("tblYears").DefaultView
            cboSavingStartYearTill.DataBind()
            cboSavingStartYearTill.Items.Insert(0, "")
            '---------cboBusinessForms
            myDataSet = New DataSet
            myDataSet.ReadXml(Server.MapPath("tblBusinessForms.xml"))
            dv = New DataView(myDataSet.Tables("BusinessForm"))
            cboBusinessForm.DataSource = dv
            cboBusinessForm.DataBind()
            '---------cboTDCSubElements
            myDataSet = New DataSet
            myDataSet.ReadXml(Server.MapPath("tblTDCSubElements.xml"))
            dv = New DataView(myDataSet.Tables("TDCSubElement"))
            cboTDCSubElement.DataSource = dv
            cboTDCSubElement.DataBind()
            '---------cboOtherBusiness
            myDataSet = New DataSet
            myDataSet.ReadXml(Server.MapPath("tblOtherBusiness.xml"))
            cboOtherBusiness.DataSource = myDataSet.Tables("OtherBusiness").DefaultView
            cboOtherBusiness.DataBind()
            '---------cboDepartment
            myDataSet = New DataSet
            myDataSet.ReadXml(Server.MapPath("tblDepartment.xml"))
            cboDepartment.DataSource = myDataSet.Tables("Department").DefaultView
            cboDepartment.DataBind()

        End Sub

        Sub ProjectMonth_AfterUpdate(ByVal sender As Object, ByVal e As System.EventArgs)
            'cboProjectStartMonthTill.SelectedIndex = cboProjectStartMonthFrom.SelectedIndex		
            Dim TempNextMonth As Integer
            If IsNumeric(CInt(cboProjectStartMonthFrom.SelectedItem.Value)) Then
                TempNextMonth = CInt(cboProjectStartMonthFrom.SelectedItem.Value) + 1
                If TempNextMonth > 12 Then
                    TempNextMonth = 1
                End If
                cboProjectStartMonthTill.SelectedIndex = TempNextMonth
            End If
        End Sub

        Sub ProjectYear_AfterUpdate(ByVal sender As Object, ByVal e As System.EventArgs)
            cboProjectStartYearTill.SelectedIndex = cboProjectStartYearFrom.SelectedIndex
        End Sub

        Sub SavingMonth_AfterUpdate(ByVal sender As Object, ByVal e As System.EventArgs)
            'cboSavingStartMonthTill.SelectedIndex = cboSavingStartMonthFrom.SelectedIndex	
            Dim TempNextMonth As Integer
            If IsNumeric(CInt(cboSavingStartMonthFrom.SelectedItem.Value)) Then
                TempNextMonth = CInt(cboSavingStartMonthFrom.SelectedItem.Value) + 1
                If TempNextMonth > 12 Then
                    TempNextMonth = 1
                End If
                cboSavingStartMonthTill.SelectedIndex = TempNextMonth
            End If
        End Sub

        Sub SavingYear_AfterUpdate(ByVal sender As Object, ByVal e As System.EventArgs)
            cboSavingStartYearTill.SelectedIndex = cboSavingStartYearFrom.SelectedIndex
        End Sub

        Sub cboDollarChoice_AfterUpdate()
            If (cboDollarChoice.SelectedItem.Text = "Between") Then
                lblAnd.Visible = True
                cboDollarUpperLimit.Visible = True
            Else
                lblAnd.Visible = False
                cboDollarUpperLimit.Visible = False
            End If
        End Sub

        Sub cboCustomReportList_AfterUpdate()
            strFields = cboCustomReportList.SelectedItem.Value
        End Sub

        Dim strFields As String
        Dim strFrom As String
        Dim strOrder As String
        Dim strTop1 As String
        Dim strWhere As String
        Dim chkBoxChecked As Integer
        ' (These variables correspond to the selection criteria
        '  which are enterable on the Select/List screens.)
        Dim gSrchParmTeamLeader As String
        Dim gSrchParmCategory As String
        Dim gSrchParmPlant As String
        Dim gSrchParmBusiness As String
        Dim gSrchParmCommitted As String
        Dim gStandards As String
        Dim gSrchParmProjectCriteria As String
        Dim gSrchParmSavingCriteria As String

        Dim gSrchParmProjectStartMonthFrom As Integer
        Dim gSrchParmProjectStartYearFrom As Integer
        Dim gSrchParmProjectStartMonthTill As Integer
        Dim gSrchParmProjectStartYearTill As Integer

        Dim gSrchParmSavingsStartMonthFrom As Integer
        Dim gSrchParmSavingsStartYearFrom As Integer
        Dim gSrchParmSavingsStartMonthTill As Integer
        Dim gSrchParmSavingsStartYearTill As Integer

        Dim gSrchParmStatus As String
        Dim gSrchParmTDCElement As String
        Dim gSrchAmount As String

        Dim gSrchParmBusinessForm As String
        Dim gSrchParmOtherBusiness As String
        Dim gSrchParmTDCSubElement As String
        Dim gSrchParmProjectStage As String
        Dim gSrchParmDepartment As String
        Dim gSrchParmLossType As String
        Dim gSrchParmCash As String
        Dim gSrchParmNOS As String
        Dim gSrchParmCustomer As String
        Dim gSrchParmSCT As String

        Sub CreateWhereParameters()

            If (Len(gSrchParmTeamLeader) > 0) Then
                strWhere = strWhere & gSrchParmTeamLeader
                strWhere = strWhere & " AND "
            End If

            If (Len(gSrchParmCategory) > 0) Then
                strWhere = strWhere & gSrchParmCategory
                strWhere = strWhere & " AND "
            End If

            If (Len(gSrchParmPlant) > 0) Then
                strWhere = strWhere & gSrchParmPlant
                strWhere = strWhere & " AND "
            End If

            If (Len(gSrchParmBusiness) > 0) Then
                strWhere = strWhere & gSrchParmBusiness
                strWhere = strWhere & " AND "
            End If

            If (Len(gSrchParmTDCElement) > 0) Then
                strWhere = strWhere & gSrchParmTDCElement
                strWhere = strWhere & " AND "
            End If

            If (Len(gSrchParmCommitted) > 0) Then
                strWhere = strWhere & gSrchParmCommitted
                strWhere = strWhere & " AND "
            End If

            If (Len(gStandards) > 0) Then
                strWhere = strWhere & gStandards
                strWhere = strWhere & " AND "
            End If

            If (Len(gSrchParmProjectCriteria) > 0) Then
                strWhere = strWhere & gSrchParmProjectCriteria
                strWhere = strWhere & " AND "
            End If

            If (Len(gSrchParmSavingCriteria) > 0) Then
                strWhere = strWhere & gSrchParmSavingCriteria
                strWhere = strWhere & " AND "
            End If

            If (Len(gSrchParmStatus) > 0) Then
                strWhere = strWhere & gSrchParmStatus
                strWhere = strWhere & " AND "
            End If

            If (Len(gSrchAmount) > 0) Then
                strWhere = strWhere & gSrchAmount
                strWhere = strWhere & " AND "
            End If

            If (Len(gSrchParmBusinessForm) > 0) Then
                strWhere = strWhere & gSrchParmBusinessForm
                strWhere = strWhere & " AND "
            End If

            If (Len(gSrchParmOtherBusiness) > 0) Then
                strWhere = strWhere & gSrchParmOtherBusiness
                strWhere = strWhere & " AND "
            End If

            If (Len(gSrchParmTDCSubElement) > 0) Then
                strWhere = strWhere & gSrchParmTDCSubElement
                strWhere = strWhere & " AND "
            End If

            If (Len(gSrchParmProjectStage) > 0) Then
                strWhere = strWhere & gSrchParmProjectStage
                strWhere = strWhere & " AND "
            End If

            If (Len(gSrchParmDepartment) > 0) Then
                strWhere = strWhere & gSrchParmDepartment
                strWhere = strWhere & " AND "
            End If

            If (Len(gSrchParmLossType) > 0) Then
                strWhere = strWhere & gSrchParmLossType
                strWhere = strWhere & " AND "
            End If

            If (Len(gSrchParmCash) > 0) Then
                strWhere = strWhere & gSrchParmCash
                strWhere = strWhere & " AND "
            End If

            If (Len(gSrchParmNOS) > 0) Then
                strWhere = strWhere & gSrchParmNOS
                strWhere = strWhere & " AND "
            End If

            If (Len(gSrchParmCustomer) > 0) Then
                strWhere = strWhere & gSrchParmCustomer
                strWhere = strWhere & " AND "
            End If

            If (Len(gSrchParmSCT) > 0) Then
                strWhere = strWhere & gSrchParmSCT
                strWhere = strWhere & " AND "
            End If

            strWhere = strWhere & "tblTDC.FiscalYear = " & Year(Date.Now)

            'If (Len(strWhere) > 5) Then
            'strWhere = Left(strWhere, Len(strWhere) - 5)
            'utlDisplayUserMsg (strWhere)
            'End If
        End Sub

        Sub SaveReportParameters()
            Dim i As Integer
            Dim strIN As String
            Dim flgSelectAll As Boolean
            Dim strCustomSQL As String
            Dim li As ListItem

            flgSelectAll = False

            ' Build the IN string for Report Tags by looping through the listbox

            For Each li In lstReport.Items
                'If li.Selected = True Then
                flgSelectAll = True
                strIN = strIN & li.Value & ","
                'End If
            Next

            If flgSelectAll Then
                strFields = Left(strIN, Len(strIN) - 1)
            Else
                strFields = ""
            End If

        End Sub

        Sub cmdAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Dim li As ListItem

            For Each li In lstReportTags.Items
                If li.Selected = True Then
                    If lstReport.Items.FindByText(li.Text) Is Nothing Then
                        lstReport.Items.Insert(lstReport.Items.Count, New ListItem(li.Text, li.Value))
                    End If
                End If
            Next
            lstReportTags.ClearSelection()
        End Sub

        Sub cmdRemove_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            If lstReport.SelectedIndex > -1 Then
                lstReport.Items.Remove(lstReport.SelectedItem)
            End If
        End Sub

        Sub cmdExtend_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            searchParam.Visible = False
            ReportParam.Visible = True
        End Sub


        Sub cmdBack_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            searchParam.Visible = True
            ReportParam.Visible = False
        End Sub


        Sub cmdSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Call SaveSearchParameters()

            If (Len(strFields) < 1) Then
                Call SaveReportParameters()
            End If

            If (Len(strFields) > 1) Then
                Call CreateCustomReport()
            Else
                msgText.Text = "Please select atleast one field to form the part of the report."
                Exit Sub
            End If
        End Sub

        Sub CreateCustomReport()
            Dim strSQL As String
            Dim strQueryName As String

            strFrom = strFrom & " FROM tblPersonnel RIGHT OUTER JOIN tblProjects INNER JOIN tblTDC ON tblProjects.ProjectID = tblTDC.ProjectID ON tblPersonnel.PersonnelID = tblProjects.ProjectLeaderID"

            strOrder = " ORDER BY "

            If cboTopNumber.SelectedItem.Value <> "" And cboTopCriteria.SelectedItem.Value <> "" Then
                strOrder = strOrder & cboTopCriteria.SelectedItem.Value & " Desc, "
            End If

            strOrder = strOrder & " tblProjects.ProjectName"

            strWhere = ""
            Call CreateWhereParameters()

            If (Len(strWhere) > 1) Then
                strWhere = " WHERE " & strWhere
            End If

            strTop1 = ""

            If cboTopNumber.SelectedItem.Value <> "" And cboTopCriteria.SelectedItem.Value <> "" Then
                strTop1 = " TOP " & cboTopNumber.SelectedItem.Value & " "
            End If

            strSQL = "Select " & strTop1 & strFields & strFrom & strWhere & strOrder
            strFields = ""

            'MsgText.Text = strSQL


            Dim myDataSet As DataSet
            Dim dv As DataView
            Dim strReportName As String
            Dim connstring As String
            Dim MyCommand As SqlCommand

            If (Len(txtCustomReport.Text) > 0) Then
                strReportName = txtCustomReport.Text
            Else
                strReportName = ""
            End If

            MyCommand = New SqlCommand("InsertReport", MyConnection)
            MyCommand.CommandType = CommandType.StoredProcedure

            MyCommand.Parameters.Add(New SqlParameter("@ReportName", SqlDbType.NVarChar, 50))
            MyCommand.Parameters("@ReportName").Value = strReportName
            MyCommand.Parameters.Add(New SqlParameter("@ReportText", SqlDbType.NVarChar, 4000))
            MyCommand.Parameters("@ReportText").Value = strSQL
            Dim RetValue As SqlParameter = MyCommand.Parameters.Add("Identity_Val", SqlDbType.Int)
            RetValue.Direction = ParameterDirection.ReturnValue

            MyConnection.Open()



            Try
                MyCommand.ExecuteScalar()
                NewReportID = RetValue.Value
                'MsgText.Text = NewReportID
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
                msgText.Text = errorMessages
            End Try

            MyConnection.Close()
            Response.Redirect("searchoutput.aspx?ReportID=" & System.Web.HttpUtility.UrlEncode(NewReportID))
        End Sub

        '---------------------------------------------------------------------------------------------
        '---------------------------------------------------------------------------------------------
        Sub show_onclick(ByVal sender As Object, ByVal e As System.EventArgs)
            Response.Redirect("searchoutput.aspx?ReportID=" & System.Web.HttpUtility.UrlEncode(cboCustomReportList.SelectedItem.Value))
        End Sub

        Sub SaveSearchParameters()
            Dim MsgText As String
            Dim i As Integer
            Dim strSQL As String
            Dim strIN As String
            Dim flgSelectAll As Boolean
            Dim temp As Integer
            Dim li As ListItem

            ' Build the IN string for Report Tags by looping through the listbox

            strIN = ""
            flgSelectAll = False

            ' Build the IN string for Team Leader by looping through the listbox
            For Each li In cboProjectLeader.Items
                If li.Selected = True Then
                    flgSelectAll = True
                    strIN = strIN & li.Value & ","
                End If
            Next

            If flgSelectAll Then
                gSrchParmTeamLeader = " tblProjects.ProjectLeaderID in (" & Left(strIN, Len(strIN) - 1) & ")"
                strIN = ""
            Else
                gSrchParmTeamLeader = ""
            End If

            flgSelectAll = False

            'Build the IN string for Category by looping through the listbox
            For Each li In cboCategory.Items
                If li.Selected = True Then
                    flgSelectAll = True
                    strIN = strIN & li.Value & "','"
                End If
            Next

            If flgSelectAll Then
                gSrchParmCategory = " tblProjects.Category in ('" & Left(strIN, Len(strIN) - 2) & ")"
                strIN = ""
            Else
                gSrchParmCategory = ""
            End If

            flgSelectAll = False

            'Build the IN string for Plant by looping through the listbox
            For Each li In cboPlant.Items
                If li.Selected = True Then
                    flgSelectAll = True
                    strIN = strIN & li.Value & "','"
                End If
            Next

            If flgSelectAll Then
                gSrchParmPlant = " tblProjects.Plant in ('" & Left(strIN, Len(strIN) - 2) & ")"
                strIN = ""
            Else
                gSrchParmPlant = ""
            End If

            flgSelectAll = False

            ' Build the IN string for Business by looping through the listbox
            For Each li In cboBusiness.Items
                If li.Selected = True Then
                    flgSelectAll = True
                    strIN = strIN & li.Value & "','"
                End If
            Next

            If flgSelectAll Then
                gSrchParmBusiness = " tblProjects.Business in ('" & Left(strIN, Len(strIN) - 2) & ")"
                strIN = ""
            Else
                gSrchParmBusiness = ""
            End If

            flgSelectAll = False

            ' Build the IN string for Business by looping through the listbox
            For Each li In cboBusinessForm.Items
                If li.Selected = True Then
                    flgSelectAll = True
                    strIN = strIN & li.Value & "','"
                End If
            Next

            If flgSelectAll Then
                gSrchParmBusinessForm = " tblProjects.BusinessForm in ('" & Left(strIN, Len(strIN) - 2) & ")"
                strIN = ""
            Else
                gSrchParmBusinessForm = ""
            End If

            flgSelectAll = False

            ' Build the IN string for Business by looping through the listbox
            For Each li In cboOtherBusiness.Items
                If li.Selected = True Then
                    flgSelectAll = True
                    strIN = strIN & li.Value & "','"
                End If
            Next

            If flgSelectAll Then
                gSrchParmOtherBusiness = " tblProjects.OtherBusiness in ('" & Left(strIN, Len(strIN) - 2) & ")"
                strIN = ""
            Else
                gSrchParmOtherBusiness = ""
            End If

            flgSelectAll = False

            ' Build the IN string for Business by looping through the listbox
            For Each li In cboTDCSubElement.Items
                If li.Selected = True Then
                    flgSelectAll = True
                    strIN = strIN & li.Value & "','"
                End If
            Next

            If flgSelectAll Then
                gSrchParmTDCSubElement = " tblProjects.TDCSubElement in ('" & Left(strIN, Len(strIN) - 2) & ")"
                strIN = ""
            Else
                gSrchParmTDCSubElement = ""
            End If

            flgSelectAll = False

            ' Build the IN string for Business by looping through the listbox
            For Each li In ProjectStage.Items
                If li.Selected = True Then
                    flgSelectAll = True
                    strIN = strIN & li.Value & "','"
                End If
            Next

            If flgSelectAll Then
                gSrchParmProjectStage = " tblProjects.ProjectStage in ('" & Left(strIN, Len(strIN) - 2) & ")"
                strIN = ""
            Else
                gSrchParmProjectStage = ""
            End If

            flgSelectAll = False


            ' Build the IN string for Business by looping through the listbox
            For Each li In cboDepartment.Items
                If li.Selected = True Then
                    flgSelectAll = True
                    strIN = strIN & li.Value & "','"
                End If
            Next

            If flgSelectAll Then
                gSrchParmDepartment = " tblProjects.Department in ('" & Left(strIN, Len(strIN) - 2) & ")"
                strIN = ""
            Else
                gSrchParmDepartment = ""
            End If

            flgSelectAll = False

            ' Build the IN string for Business by looping through the listbox
            For Each li In cboLossType.Items
                If li.Selected = True Then
                    flgSelectAll = True
                    strIN = strIN & li.Value & "','"
                End If
            Next

            If flgSelectAll Then
                gSrchParmLossType = " tblProjects.LossType in ('" & Left(strIN, Len(strIN) - 2) & ")"
                strIN = ""
            Else
                gSrchParmLossType = ""
            End If

            chkBoxChecked = (CType(chkCommitted, CheckBox).Checked) * -1

            If (chkBoxChecked = 1) Then
                gSrchParmCommitted = " tblProjects.CommittedForeCast = 1 "
            Else
                gSrchParmCommitted = ""
            End If

            chkBoxChecked = (CType(chkStandards, CheckBox).Checked) * -1

            If (chkBoxChecked = 1) Then
                gStandards = " tblProjects.Standards = 1 "
            Else
                gStandards = ""
            End If

            If (cboProjectStartMonthFrom.SelectedItem.Value <> "") Then
                gSrchParmProjectStartMonthFrom = CInt(cboProjectStartMonthFrom.SelectedItem.Value)
            Else
                gSrchParmProjectStartMonthFrom = 0
            End If

            If (cboProjectStartYearFrom.SelectedItem.Value <> "") Then
                gSrchParmProjectStartYearFrom = CInt(cboProjectStartYearFrom.SelectedItem.Value)
            Else
                gSrchParmProjectStartYearFrom = 0
            End If

            If (cboProjectStartMonthTill.SelectedItem.Value <> "") Then
                gSrchParmProjectStartMonthTill = CInt(cboProjectStartMonthTill.SelectedItem.Value)
            Else
                gSrchParmProjectStartMonthTill = 0
            End If

            If (cboProjectStartYearTill.SelectedItem.Value <> "") Then
                gSrchParmProjectStartYearTill = CInt(cboProjectStartYearTill.SelectedItem.Value)
            Else
                gSrchParmProjectStartYearTill = 0
            End If

            If (gSrchParmProjectStartMonthFrom > 0) And (gSrchParmProjectStartYearFrom > 0) And (gSrchParmProjectStartMonthTill > 0) And (gSrchParmProjectStartYearTill > 0) Then
                If (gSrchParmProjectStartYearFrom < gSrchParmProjectStartYearTill) Then
                    gSrchParmProjectCriteria = " ((tblProjects.ProjectStartMonth >= " & gSrchParmProjectStartMonthFrom & " AND tblProjects.ProjectStartMonth <= 12 AND tblProjects.ProjectStartYear =" & gSrchParmProjectStartYearFrom & ")"
                    For i = gSrchParmProjectStartYearFrom + 1 To gSrchParmProjectStartYearTill - 1
                        gSrchParmProjectCriteria = gSrchParmProjectCriteria & " OR (tblProjects.ProjectStartYear =" & i & ")"
                    Next i
                    gSrchParmProjectCriteria = gSrchParmProjectCriteria & " OR (tblProjects.ProjectStartMonth >= 1 AND tblProjects.ProjectStartMonth <=" & gSrchParmProjectStartMonthTill & " AND tblProjects.ProjectStartYear =" & gSrchParmProjectStartYearTill & ")) "
                Else
                    gSrchParmProjectCriteria = " tblProjects.ProjectStartMonth >= " & gSrchParmProjectStartMonthFrom & " AND tblProjects.ProjectStartYear >=" & gSrchParmProjectStartYearFrom & " AND tblProjects.ProjectStartMonth <=" & gSrchParmProjectStartMonthTill & " AND tblProjects.ProjectStartYear <=" & gSrchParmProjectStartYearTill
                End If

            ElseIf (gSrchParmProjectStartMonthFrom > 0) And (gSrchParmProjectStartYearFrom > 0) Then
                gSrchParmProjectCriteria = " tblProjects.ProjectStartMonth = " & gSrchParmProjectStartMonthFrom & " AND tblProjects.ProjectStartYear =" & gSrchParmProjectStartYearFrom
            ElseIf (gSrchParmProjectStartMonthFrom > 0) And (gSrchParmProjectStartMonthTill > 0) Then
                gSrchParmProjectCriteria = " tblProjects.ProjectStartMonth >= " & gSrchParmProjectStartMonthFrom & " AND tblProjects.ProjectStartMonth <=" & gSrchParmProjectStartMonthTill
            ElseIf (gSrchParmProjectStartYearFrom > 0) And (gSrchParmProjectStartYearTill > 0) Then
                gSrchParmProjectCriteria = " tblProjects.ProjectStartYear >=" & gSrchParmProjectStartYearFrom & " AND tblProjects.ProjectStartYear <=" & gSrchParmProjectStartYearTill
            Else
                gSrchParmProjectCriteria = ""
            End If

            If (cboSavingStartMonthFrom.SelectedItem.Value <> "") Then
                gSrchParmSavingsStartMonthFrom = CInt(cboSavingStartMonthFrom.SelectedItem.Value)
            Else
                gSrchParmSavingsStartMonthFrom = 0
            End If

            If (cboSavingStartYearFrom.SelectedItem.Value <> "") Then
                gSrchParmSavingsStartYearFrom = CInt(cboSavingStartYearFrom.SelectedItem.Value)
            Else
                gSrchParmSavingsStartYearFrom = 0
            End If

            If (cboSavingStartMonthTill.SelectedItem.Value <> "") Then
                gSrchParmSavingsStartMonthTill = CInt(cboSavingStartMonthTill.SelectedItem.Value)
            Else
                gSrchParmSavingsStartMonthTill = 0
            End If

            If (cboSavingStartYearTill.SelectedItem.Value <> "") Then
                gSrchParmSavingsStartYearTill = CInt(cboSavingStartYearTill.SelectedItem.Value)
            Else
                gSrchParmSavingsStartYearTill = 0
            End If

            ' Build the string for Savings Date Search Criteria
            If (gSrchParmSavingsStartMonthFrom > 0) And (gSrchParmSavingsStartYearFrom > 0) And (gSrchParmSavingsStartMonthTill > 0) And (gSrchParmSavingsStartYearTill > 0) Then
                If (gSrchParmSavingsStartYearFrom < gSrchParmSavingsStartYearTill) Then
                    gSrchParmSavingCriteria = " ((tblProjects.SavingsStartMonth >= " & gSrchParmSavingsStartMonthFrom & " AND tblProjects.SavingsStartMonth <= 12 AND tblProjects.SavingsStartYear =" & gSrchParmSavingsStartYearFrom & ")"
                    For i = gSrchParmSavingsStartYearFrom + 1 To gSrchParmSavingsStartYearTill - 1
                        gSrchParmSavingCriteria = gSrchParmSavingCriteria & " OR (tblProjects.SavingsStartYear =" & i & ")"
                    Next i
                    gSrchParmSavingCriteria = gSrchParmSavingCriteria & " OR (tblProjects.SavingsStartMonth >= 1 AND tblProjects.SavingsStartMonth <=" & gSrchParmSavingsStartMonthTill & " AND tblProjects.SavingsStartYear =" & gSrchParmSavingsStartYearTill & ")) "
                Else
                    gSrchParmSavingCriteria = " tblProjects.SavingsStartMonth >= " & gSrchParmSavingsStartMonthFrom & " AND tblProjects.SavingsStartYear >=" & gSrchParmSavingsStartYearFrom & " AND tblProjects.SavingsStartMonth <=" & gSrchParmSavingsStartMonthTill & " AND tblProjects.SavingsStartYear <=" & gSrchParmSavingsStartYearTill
                End If
            ElseIf (gSrchParmSavingsStartMonthFrom > 0) And (gSrchParmSavingsStartYearFrom > 0) Then
                gSrchParmSavingCriteria = " tblProjects.SavingsStartMonth = " & gSrchParmSavingsStartMonthFrom & " AND tblProjects.SavingsStartYear =" & gSrchParmSavingsStartYearFrom
            ElseIf (gSrchParmSavingsStartMonthFrom > 0) And (gSrchParmSavingsStartMonthTill > 0) Then
                gSrchParmSavingCriteria = " tblProjects.SavingsStartMonth >= " & gSrchParmSavingsStartMonthFrom & " AND tblProjects.SavingsStartMonth <=" & gSrchParmSavingsStartMonthTill
            ElseIf (gSrchParmSavingsStartYearFrom > 0) And (gSrchParmSavingsStartYearTill > 0) Then
                gSrchParmSavingCriteria = " tblProjects.SavingsStartYear >=" & gSrchParmSavingsStartYearFrom & " AND tblProjects.SavingsStartYear <=" & gSrchParmSavingsStartYearTill
            Else
                gSrchParmSavingCriteria = ""
            End If

            flgSelectAll = False
            ' Build the IN string for Stats by looping through the listbox
            For Each li In cboStatus.Items
                If li.Selected = True Then
                    flgSelectAll = True
                    strIN = strIN & li.Value & "','"
                End If
            Next

            If flgSelectAll Then
                gSrchParmStatus = " tblProjects.Status in ('" & Left(strIN, Len(strIN) - 2) & ")"
                strIN = ""
            Else
                gSrchParmStatus = ""
            End If

            flgSelectAll = False

            ' Build the IN string for Cost Bucket by looping through the listbox
            For Each li In cboTDCElement.Items
                If li.Selected = True Then
                    flgSelectAll = True
                    strIN = strIN & li.Value & "','"
                End If
            Next

            If flgSelectAll Then
                gSrchParmTDCElement = " tblProjects.CostBucket in ('" & Left(strIN, Len(strIN) - 2) & ")"
                strIN = ""
            Else
                gSrchParmTDCElement = ""
            End If

            flgSelectAll = False

            If (Len(cboAmountList.SelectedItem.Value) > 1) Then
                gSrchAmount = cboAmountList.SelectedItem.Value
                If (cboDollarChoice.SelectedItem.Value = "Less than") Then
                    gSrchAmount = gSrchAmount & " < " & cboDollarLowerLimit.Text
                ElseIf (cboDollarChoice.SelectedItem.Value = "Greater than") Then
                    gSrchAmount = gSrchAmount & " > " & cboDollarLowerLimit.Text
                ElseIf (cboDollarChoice.SelectedItem.Value = "Between") Then
                    gSrchAmount = gSrchAmount & " BETWEEN " & cboDollarLowerLimit.Text & " AND " & cboDollarUpperLimit.Text
                Else
                    gSrchAmount = ""
                End If
            End If
        End Sub

    End Class
End Namespace
