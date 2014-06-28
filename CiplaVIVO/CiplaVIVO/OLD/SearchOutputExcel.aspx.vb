Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Namespace SCLE.User

    Partial Class outputexcel
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

        Dim RequestedTeamID As String
        Dim SQLText As String
        Dim SumText As String
        Dim StatusExistance As Boolean
        Dim connstring As String
        Dim reportId As String
        Dim DS As DataSet
        Dim MyConnection As SqlConnection
        Dim MyCommand1 As SqlDataAdapter
        Dim MyCommand As SqlCommand

        Sub Page_Load(ByVal Src As Object, ByVal E As EventArgs) Handles MyBase.Load
            Response.ContentType = "application/ms-excel"
            Response.AddHeader("Content-Disposition", "inline;filename=Report.xls")
            connstring = ConfigurationManager.ConnectionStrings("SQLConnectionString").ToString
            MyConnection = New SqlConnection(connstring)
            reportId = Request.QueryString("reportID")
            'ReportID = "18"
            GetSQL()
            ShowDataGrid()
        End Sub

        Sub GetSQL()
            MyCommand = New SqlCommand("SelectReport", MyConnection)
            MyCommand.CommandType = CommandType.StoredProcedure
            Dim IDIn As SqlParameter = MyCommand.Parameters.Add("@ReportID", SqlDbType.Int)
            IDIn.Direction = ParameterDirection.Input
            IDIn.Value = System.Convert.ToInt64(reportId)
            MyConnection.Open()
            SQLText = MyCommand.ExecuteScalar()

            'Now, read the entire file into a string
            If InStr(SQLText, "Status") = 0 Then
                StatusExistance = False
            Else
                StatusExistance = True
            End If

        End Sub

        Sub ShowDataGrid()


            MyCommand1 = New SqlDataAdapter(SQLText, MyConnection)

            DS = New DataSet
            MyCommand1.Fill(DS, "Projects")

            ProjectDataGrid.DataSource = DS.Tables("Projects").DefaultView
            ProjectDataGrid.DataBind()
        End Sub


        Sub ProjectDataGrid_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataGridItemEventArgs)
            'Create a DataView Based on the DataSource of DataGrid
            'Dim dv As DataView = ProjectDataGrid.DataSource
            'Dim dc As DataColumnCollection = dv.Table.Columns
            If (StatusExistance) Then
                'Check for ItemType
                If e.Item.ItemType = ListItemType.Item Or _
                  e.Item.ItemType = ListItemType.AlternatingItem Then

                    'Declare string variable
                    'Assign the relevant data to a variable
                    Dim StatusValue As String
                    Dim fieldcolor As String
                    StatusValue = DataBinder.Eval(e.Item.DataItem, "Status")
                    If (StatusValue = "Failed") Or (StatusValue = "Hold") Or (StatusValue = "Requires Strategic Choice") Or (StatusValue = "Cancelled") Then
                        fieldcolor = "orangered"
                    ElseIf (StatusValue = "Planned") Then
                        fieldcolor = "Yellow"
                    ElseIf (StatusValue = "In Progress") Or (StatusValue = "Completed") Then
                        fieldcolor = "LawnGreen"
                    Else
                        fieldcolor = "Blue"
                    End If


                    'To convert the value of Type String to System.Drawing.Color
                    e.Item.BackColor = System.Drawing.Color.FromName(fieldcolor)
                End If
            End If
        End Sub

    End Class
End Namespace

