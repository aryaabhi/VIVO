Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Namespace SCLE.User
    Partial Class ReportCDSNExcel
        Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

        'This call is required by the Web Form Designer.
        <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

        End Sub
        Protected WithEvents Go As System.Web.UI.WebControls.Button


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
            Response.ContentType = "application/ms-excel"
            Response.AddHeader("Content-Disposition", "inline;filename=ReportCSDN.xls")
            connstring = ConfigurationManager.ConnectionStrings("SQLConnectionString").ToString
            MyConnection = New SqlConnection(connstring)
            SelectedYear = DateTime.Now.Year
            HeaderLabel.Text = "Project List for Financial Year " & DateTime.Now.Year & "-" & Right(DateTime.Now.Year + 1, 2)
            ShowDataGrid()
        End Sub

        Sub ShowDataGrid()
            MyCommand = New SqlDataAdapter("ProjectsSelectYearCDSN", MyConnection)
            MyCommand.SelectCommand.CommandType = CommandType.StoredProcedure

            MyCommand.SelectCommand.Parameters.Add(New SqlParameter("@Year", SqlDbType.Char, 4))
            MyCommand.SelectCommand.Parameters("@Year").Value = SelectedYear

            DS = New DataSet
            MyCommand.Fill(DS, "tblProjects")

            ProjectDataGrid.DataSource = DS.Tables("tblProjects").DefaultView
            ProjectDataGrid.DataBind()

        End Sub


        Sub ProjectDataGrid_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataGridItemEventArgs)
            If e.Item.ItemType = ListItemType.Item Or _
                 e.Item.ItemType = ListItemType.AlternatingItem Then

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


                e.Item.Cells(8).BackColor = System.Drawing.Color.FromName(fieldcolor)
                e.Item.Cells(2).Text = "01-" + e.Item.Cells(2).Text
            End If
        End Sub

    End Class
End Namespace
