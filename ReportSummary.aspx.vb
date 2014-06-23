Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Namespace SCLE.User
    Partial Class ReportSummary
        Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

        'This call is required by the Web Form Designer.
        <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

        End Sub
        Protected WithEvents ReportBPEGrid As System.Web.UI.WebControls.DataGrid


        Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

#End Region

        Dim DS As DataSet
        Dim MyConnection As SqlConnection
        Dim MyCommand As SqlDataAdapter
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
                HeaderLabel.Text = "TOTAL HOMECARE SUMMARY " & SelectedYear & "-" & Right(SelectedYear + 1, 2)
            Else
                SelectedYear = cboYear.SelectedItem.Value
                HeaderLabel.Text = "TOTAL HOMECARE SUMMARY " & cboYear.SelectedItem.Text
            End If

            ShowBPEGrid()
            ShowStretchGrid()
        End Sub


        Sub ShowBPEGrid()
            MyCommand = New SqlDataAdapter("SummaryBusiness", MyConnection)
            MyCommand.SelectCommand.CommandType = CommandType.StoredProcedure

            MyCommand.SelectCommand.Parameters.Add(New SqlParameter("@Probability", SqlDbType.Int))
            MyCommand.SelectCommand.Parameters("@Probability").Value = 75

            MyCommand.SelectCommand.Parameters.Add(New SqlParameter("@Year", SqlDbType.Char, 4))
            MyCommand.SelectCommand.Parameters("@Year").Value = SelectedYear

            DS = New DataSet
            MyCommand.Fill(DS, "testSum")

            BPEDataGrid.DataSource = DS.Tables("testSum").DefaultView
            BPEDataGrid.DataBind()
        End Sub

        Sub ShowStretchGrid()
            MyCommand = New SqlDataAdapter("SummaryBusiness", MyConnection)
            MyCommand.SelectCommand.CommandType = CommandType.StoredProcedure

            MyCommand.SelectCommand.Parameters.Add(New SqlParameter("@Probability", SqlDbType.Int))
            MyCommand.SelectCommand.Parameters("@Probability").Value = 50

            MyCommand.SelectCommand.Parameters.Add(New SqlParameter("@Year", SqlDbType.Char, 4))
            MyCommand.SelectCommand.Parameters("@Year").Value = SelectedYear

            DS = New DataSet
            MyCommand.Fill(DS, "testSum1")

            StretchDataGrid.DataSource = DS.Tables("testSum1").DefaultView
            StretchDataGrid.DataBind()
        End Sub

        Sub SubmitBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Response.Redirect("ReportSummaryExcel.aspx?YearField=" & SelectedYear)
        End Sub

    End Class
End Namespace
