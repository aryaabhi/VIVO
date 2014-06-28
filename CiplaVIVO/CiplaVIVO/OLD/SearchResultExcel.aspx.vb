Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Namespace SCLE.User
    Partial Class SearchResultExcel
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

        Dim DS As DataSet
        Dim MyConnection As SqlConnection
        Dim MyCommand As SqlDataAdapter
        Dim StatusExistance As Boolean
        Dim SelectedYear As String
        Dim connstring As String
        Dim RequestedString As String
        Dim RequestedField As String

        Sub Page_Load(ByVal Src As Object, ByVal E As EventArgs) Handles MyBase.Load
            Response.ContentType = "application/ms-excel"
            Response.AddHeader("Content-Disposition", "inline;filename=SearchResult.xls")
            RequestedString = Request.QueryString("SearchString")
            RequestedField = Request.QueryString("SearchField")
            connstring = ConfigurationManager.ConnectionStrings("SQLConnectionString").ToString
            MyConnection = New SqlConnection(connstring)
            If RequestedField = "ProjectName" And RequestedString <> "" Then
                SearchNameGrid()
            ElseIf RequestedField = "ProjectLeader" And RequestedString <> "" Then
                SearchLeaderGrid()
            ElseIf RequestedField = "Status" And RequestedString <> "" Then
                SearchStatusGrid()
            Else
                Response.Redirect("homecare.aspx")
            End If
        End Sub


        Sub SearchNameGrid()
            HeaderLabel.Text = "Search Result on Project Name for '" & RequestedString & "'"
            MyCommand = New SqlDataAdapter("SearchProjectName", MyConnection)
            MyCommand.SelectCommand.CommandType = CommandType.StoredProcedure

            MyCommand.SelectCommand.Parameters.Add(New SqlParameter("@QueryString", SqlDbType.NVarChar, 50))
            MyCommand.SelectCommand.Parameters("@QueryString").Value = RequestedString

            DS = New DataSet
            MyCommand.Fill(DS, "tblProjects")

            ProjectDataGrid.DataSource = DS.Tables("tblProjects").DefaultView
            ProjectDataGrid.DataBind()

        End Sub

        Sub SearchLeaderGrid()
            HeaderLabel.Text = "Search Result on Project Leader for '" & RequestedString & "'"
            MyCommand = New SqlDataAdapter("SearchProjectLeader", MyConnection)
            MyCommand.SelectCommand.CommandType = CommandType.StoredProcedure

            MyCommand.SelectCommand.Parameters.Add(New SqlParameter("@QueryString", SqlDbType.NVarChar, 50))
            MyCommand.SelectCommand.Parameters("@QueryString").Value = RequestedString

            DS = New DataSet
            MyCommand.Fill(DS, "tblProjects")

            ProjectDataGrid.DataSource = DS.Tables("tblProjects").DefaultView
            ProjectDataGrid.DataBind()

        End Sub

        Sub SearchStatusGrid()
            HeaderLabel.Text = "Search Result on Status for '" & RequestedString & "'"
            MyCommand = New SqlDataAdapter("SearchStatus", MyConnection)
            MyCommand.SelectCommand.CommandType = CommandType.StoredProcedure

            MyCommand.SelectCommand.Parameters.Add(New SqlParameter("@QueryString", SqlDbType.NVarChar, 50))
            MyCommand.SelectCommand.Parameters("@QueryString").Value = RequestedString

            DS = New DataSet
            MyCommand.Fill(DS, "tblProjects")

            ProjectDataGrid.DataSource = DS.Tables("tblProjects").DefaultView
            ProjectDataGrid.DataBind()

        End Sub

        Sub SubmitBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Response.Redirect("SearchResultExcel.aspx")
        End Sub

        Sub ProjectDataGrid_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataGridItemEventArgs)
            'Create a DataView Based on the DataSource of DataGrid
            'Dim dv As DataView = ProjectDataGrid.DataSource
            'Dim dc As DataColumnCollection = dv.Table.Columns
            'if (StatusExistance) then
            'Check for ItemType
            If e.Item.ItemType = ListItemType.Item Or _
                 e.Item.ItemType = ListItemType.AlternatingItem Then

                'Declare string variable
                'Assign the relevant data to a variable 
                Dim StatusValue As String
                Dim fieldcolor As String

                StatusValue = DataBinder.Eval(e.Item.DataItem, "Status")

                If (StatusValue = "Failed") Or (StatusValue = "Hold") Or (StatusValue = "Requires Strategic Choice") Or (StatusValue = "Cancelled") Then
                    fieldcolor = "#ff6600"
                ElseIf (StatusValue = "Planned") Then
                    fieldcolor = "#ffff33"
                ElseIf (StatusValue = "In Progress") Then
                    fieldcolor = "#ccff66"
                ElseIf (StatusValue = "Completed") Then
                    fieldcolor = "#00cc66"
                Else
                    fieldcolor = "#cc9999"
                End If


                'To convert the value of Type String to System.Drawing.Color
                e.Item.Cells(9).BackColor = System.Drawing.Color.FromName(fieldcolor)
            End If
            'end if
        End Sub


        Sub SortData(ByVal sender As Object, ByVal e As DataGridSortCommandEventArgs)
            '	GetSQL()
            '	BindData(e.SortExpression)
        End Sub

        Sub DBEditDataGrid_Edit(ByVal source As Object, ByVal E As DataGridCommandEventArgs)
            Response.Redirect("projectModification.aspx?ProjectID=" & System.Web.HttpUtility.UrlEncode(ProjectDataGrid.DataKeys(E.Item.ItemIndex)))
        End Sub

        Private Sub DataGrid1_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs)

        End Sub
    End Class
End Namespace
