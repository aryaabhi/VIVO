Imports System.Data
Imports System.Data.SqlClient

Namespace SCLE.User
    Partial Class VolumeAdd
        Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

        'This call is required by the Web Form Designer.
        <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

        End Sub
        Protected WithEvents VolumeUpdate As System.Web.UI.WebControls.Button
        Protected WithEvents Label1 As System.Web.UI.WebControls.Label


        Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

#End Region

        Dim MyConnection As SqlConnection
        Dim connstring As String

        Sub Page_Load(ByVal Sender As Object, ByVal E As EventArgs) Handles MyBase.Load
            connstring = ConfigurationManager.ConnectionStrings("SQLConnectionString").ToString
            MyConnection = New SqlConnection(connstring)
            If Not (IsPostBack) Then
                BindGrid()
            End If
        End Sub

        Sub MyDataGrid_Edit(ByVal Sender As Object, ByVal E As DataGridCommandEventArgs)

            MyDataGrid.EditItemIndex = CInt(E.Item.ItemIndex)
            BindGrid()
        End Sub

        Sub MyDataGrid_Cancel(ByVal Sender As Object, ByVal E As DataGridCommandEventArgs)

            MyDataGrid.EditItemIndex = -1
            BindGrid()
        End Sub


        Sub MyDataGrid_Update(ByVal Sender As Object, ByVal E As DataGridCommandEventArgs)

            Dim MyCommand As SqlCommand

            Dim UpdateCmd As String = "UPDATE tblBusinessVolume SET CashSavings=@CashSavings WHERE BusinessForm='" & MyDataGrid.DataKeys(CInt(E.Item.ItemIndex)) & "'"

            MyCommand = New SqlCommand(UpdateCmd, MyConnection)
            MyCommand.Parameters.Add(New SqlParameter("@CashSavings", SqlDbType.Float, 8))

            'MyCommand.Parameters("@BusinessForm").Value = MyDataGrid.DataKeys(CInt(E.Item.ItemIndex))
            'MyCommand.Parameters("@Business").Value = MyDataGrid.DataKeys(E.Item.ItemIndex)

            Dim CurrentTextBox As TextBox
            CurrentTextBox = E.Item.Cells(2).Controls(0)
            Dim ColValue As Double = System.Convert.ToDouble(CurrentTextBox.Text)
            MyCommand.Parameters("@CashSavings").Value = ColValue

            MyCommand.Connection.Open()

            Try
                MyCommand.ExecuteNonQuery()
                Message.InnerHtml = "<b>Record Updated</b><br>"
                MyDataGrid.EditItemIndex = -1
            Catch Exp As SqlException
                If Exp.Number = 2627 Then
                    Message.InnerHtml = "ERROR: A record already exists with the same primary key"
                Else
                    Message.InnerHtml = "ERROR: Could not update record, please ensure the fields are correctly filled out"
                End If
                Message.Style("color") = "red"
            End Try

            MyCommand.Connection.Close()

            BindGrid()
        End Sub

        Sub MyDataGrid_ItemDataBound(ByVal Sender As Object, ByVal E As DataGridItemEventArgs)
            If (E.Item.ItemType = ListItemType.EditItem) Then
                Dim i As Integer
                For i = 0 To E.Item.Controls.Count - 1
                    Try
                        If (E.Item.Controls(i).Controls(0).GetType().ToString() = "System.Web.UI.WebControls.TextBox") Then
                            Dim tb As TextBox
                            tb = E.Item.Controls(i).Controls(0)
                            tb.Text = Server.HtmlDecode(tb.Text)
                        End If
                    Catch

                    End Try
                Next
            End If
        End Sub

        Sub BindGrid()
            Dim MyDataSet As DataSet
            Dim mySqlDataAdapter As SqlDataAdapter

            mySqlDataAdapter = New SqlDataAdapter("SelectBusinessVolume", MyConnection)
            mySqlDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure

            MyDataSet = New DataSet

            mySqlDataAdapter.Fill(MyDataSet, "tblBusinessVolume")
            MyDataGrid.DataSource = MyDataSet.Tables("tblBusinessVolume").DefaultView
            MyDataGrid.DataBind()
        End Sub

    End Class
End Namespace
