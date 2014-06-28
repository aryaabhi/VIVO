Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Namespace SCLE.User

    Partial Class ReportBySC
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

        Sub Page_Load(ByVal Src As Object, ByVal E As EventArgs) Handles MyBase.Load
            connstring = ConfigurationManager.ConnectionStrings("SQLConnectionString").ToString
            MyConnection = New SqlConnection(connstring)
            Year_Refresh_Display()
        End Sub

        Sub Year_Refresh(ByVal sender As Object, ByVal e As System.EventArgs)
            Year_Refresh_Display()
        End Sub

        Sub Year_Refresh_Display()
            If cboYear.SelectedItem.Value = "" Then
                If (DateTime.Now.Month > 6) Then
                    SelectedYear = DateTime.Now.Year
                Else
                    SelectedYear = DateTime.Now.Year - 1
                End If
                HeaderLabel.Text = "SC Project List for Financial Year " & SelectedYear & "-" & Right(SelectedYear + 1, 2)
            Else
                SelectedYear = cboYear.SelectedItem.Value
                HeaderLabel.Text = "SC Project List for Financial Year " & cboYear.SelectedItem.Text
            End If

            ShowDataGrid()
            ShowSumGrid()
        End Sub

        Sub ShowDataGrid()
            MyCommand = New SqlDataAdapter("ProjectsSelectSC", MyConnection)
            MyCommand.SelectCommand.CommandType = CommandType.StoredProcedure

            MyCommand.SelectCommand.Parameters.Add(New SqlParameter("@Year", SqlDbType.Char, 4))
            MyCommand.SelectCommand.Parameters("@Year").Value = SelectedYear

            MyCommand.SelectCommand.Parameters.Add(New SqlParameter("@Category", SqlDbType.NVarChar, 50))
            MyCommand.SelectCommand.Parameters("@Category").Value = "HomeCare"

            DS = New DataSet
            MyCommand.Fill(DS, "tblProjects")

            ProjectDataGrid.DataSource = DS.Tables("tblProjects").DefaultView
            ProjectDataGrid.DataBind()

        End Sub

        Sub ShowSumGrid()
            MyCommand = New SqlDataAdapter("ProjectSumSC", MyConnection)
            MyCommand.SelectCommand.CommandType = CommandType.StoredProcedure

            MyCommand.SelectCommand.Parameters.Add(New SqlParameter("@Year", SqlDbType.Char, 4))
            MyCommand.SelectCommand.Parameters("@Year").Value = SelectedYear

            MyCommand.SelectCommand.Parameters.Add(New SqlParameter("@Category", SqlDbType.NVarChar, 50))
            MyCommand.SelectCommand.Parameters("@Category").Value = "HomeCare"

            DS = New DataSet
            MyCommand.Fill(DS, "tblProjectsSum")

            SumDataGrid.DataSource = DS.Tables("tblProjectsSum").DefaultView
            SumDataGrid.DataBind()

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
                e.Item.Cells(11).BackColor = System.Drawing.Color.FromName(fieldcolor)
                Dim btn As LinkButton
                btn = CType(e.Item.FindControl("btnDelete"), LinkButton)
                btn.Attributes.Add("onclick", "return confirm_delete();")

            End If
            'end if
        End Sub


        Sub SortData(ByVal sender As Object, ByVal e As DataGridSortCommandEventArgs)
            '	GetSQL()
            '	BindData(e.SortExpression)
        End Sub

        Sub DBDelDataGrid_Delete(ByVal source As Object, ByVal E As DataGridCommandEventArgs)
            Dim objCommand As SqlCommand
            Dim SQLText As String
            SQLText = "DELETE FROM tblProjects WHERE ProjectID = " & ProjectDataGrid.DataKeys(E.Item.ItemIndex)

            'Label1.text = SQLText

            objCommand = New SqlCommand(SQLText, MyConnection)

            MyConnection.Open()
            objCommand.ExecuteNonQuery()
            MyConnection.Close()

            ' Refresh our Datagrid to show the record is gone
            ShowDataGrid()

        End Sub

        Sub DBEditDataGrid_Edit(ByVal source As Object, ByVal E As DataGridCommandEventArgs)

            Response.Redirect("projectModification.aspx?ProjectID=" & System.Web.HttpUtility.UrlEncode(ProjectDataGrid.DataKeys(E.Item.ItemIndex)))
        End Sub


        Private Sub ExcelExport_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ExcelExport.Click
            Response.Redirect("ReportbySCExcel.aspx?YearField=" & SelectedYear)
        End Sub
    End Class
End Namespace
