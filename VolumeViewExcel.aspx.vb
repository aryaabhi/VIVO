Imports System.Data
Imports System.Data.SqlClient

Namespace SCLE.User
    Partial Class VolumeViewExcel
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

        Sub Page_Load(ByVal Sender As Object, ByVal E As EventArgs) Handles MyBase.Load

            Response.ContentType = "application/ms-excel"
            Response.AddHeader("Content-Disposition", "inline;filename=Volume.xls")

            Dim DS As DataSet
            Dim MyConnection As SqlConnection
            Dim MyCommand As SqlDataAdapter

            Dim connstring As String

            connstring = ConfigurationManager.ConnectionStrings("SQLConnectionString").ToString
            MyConnection = New SqlConnection(connstring)
            MyCommand = New SqlDataAdapter("SelectBusinessVolume", MyConnection)
            MyCommand.SelectCommand.CommandType = CommandType.StoredProcedure

            DS = New DataSet
            MyCommand.Fill(DS, "tblBusinessVolume")

            MyDataGrid.DataSource = DS.Tables("tblBusinessVolume").DefaultView
            MyDataGrid.DataBind()

            MyCommand = New SqlDataAdapter("SelectBusinessVolumeTotal", MyConnection)
            MyCommand.SelectCommand.CommandType = CommandType.StoredProcedure

            DS = New DataSet
            MyCommand.Fill(DS, "tblBusinessVolumeTotal")

            MyDataGrid1.DataSource = DS.Tables("tblBusinessVolumeTotal").DefaultView
            MyDataGrid1.DataBind()

        End Sub

        Private Sub DataGrid1_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs)

        End Sub
    End Class
End Namespace
