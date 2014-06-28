Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Namespace SCLE.User
    Partial Class ProjectCopy
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
        Dim MYCommand1 As SqlCommand
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
                SelectedYear = DateTime.Now.Year
                HeaderLabel.Text = "Project List for Financial Year " & DateTime.Now.Year & "-" & Right(DateTime.Now.Year + 1, 2)
            Else
                SelectedYear = cboYear.SelectedItem.Value
                HeaderLabel.Text = "Project List for Financial Year " & cboYear.SelectedItem.Text
            End If

            ShowDataGrid()
        End Sub

        Sub ShowDataGrid()
            MyCommand = New SqlDataAdapter("ProjectsSelectYear", MyConnection)
            MyCommand.SelectCommand.CommandType = CommandType.StoredProcedure

            MyCommand.SelectCommand.Parameters.Add(New SqlParameter("@Year", SqlDbType.Char, 4))
            MyCommand.SelectCommand.Parameters("@Year").Value = SelectedYear


            DS = New DataSet
            MyCommand.Fill(DS, "tblProjects")

            ProjectDataGrid.DataSource = DS.Tables("tblProjects").DefaultView
            ProjectDataGrid.DataBind()

        End Sub

        Sub DBEditDataGrid_Edit(ByVal source As Object, ByVal E As DataGridCommandEventArgs)
            MYCommand1 = New SqlCommand("ProjectCopy", MyConnection)
            MYCommand1.CommandType = CommandType.StoredProcedure
            ' If allocating a numberical value to nvarchar, then add Server.HtmlEncode around

            MYCommand1.Parameters.Add(New SqlParameter("@ProjectID", SqlDbType.Int, 4))
            MYCommand1.Parameters("@ProjectID").Value = System.Convert.ToInt64(ProjectDataGrid.DataKeys(E.Item.ItemIndex))

            MYCommand1.Connection.Open()
            MYCommand1.ExecuteNonQuery()
            MYCommand1.Connection.Close()

            ShowDataGrid()
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
    End Class
End Namespace

