Imports System.Data
Imports System.Data.OleDb
Imports System.Data.SqlClient
Imports System.Collections

Public Class vCategory
    Inherits System.Web.UI.Page

    Private strConnString As String = ConfigurationManager.ConnectionStrings("SQLConnectionString").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindData()
        End If
    End Sub

    Private Sub BindData()
        Dim strQuery As String = "select PlantID, Plant, CategoryID from vPlant"
        Dim cmd As New SqlCommand(strQuery)
        GridView1.DataSource = GetData(cmd)
        GridView1.DataBind()
    End Sub

    Private Function GetData(ByVal cmd As SqlCommand) As DataTable
        Dim dt As New DataTable()
        Dim con As New SqlConnection(strConnString)
        Dim sda As New SqlDataAdapter()
        cmd.CommandType = CommandType.Text
        cmd.Connection = con
        con.Open()
        sda.SelectCommand = cmd
        sda.Fill(dt)
        Return dt
    End Function

    Protected Sub AddRecord(ByVal sender As Object, ByVal e As EventArgs)
        Dim Field2 As String = DirectCast(GridView1.FooterRow.FindControl("txtField2"), TextBox).Text
        Dim Field3 As String = DirectCast(GridView1.FooterRow.FindControl("txtField3"), TextBox).Text
        Dim con As New SqlConnection(strConnString)
        Dim cmd As New SqlCommand()
        cmd.CommandType = CommandType.Text
        cmd.CommandText = "insert into vPlant(Plant, CategoryID)" & _
            "values(@Plant, @CategoryID);" & _
             "Select PlantID,Plant,CategoryID from vPlant"
        cmd.Parameters.Add("@Plant", SqlDbType.VarChar).Value = Field2
        cmd.Parameters.Add("@CategoryID", SqlDbType.VarChar).Value = Field3
        GridView1.DataSource = GetData(cmd)
        GridView1.DataBind()
    End Sub

    Protected Sub EditRecord(ByVal sender As Object, ByVal e As GridViewEditEventArgs)
        GridView1.EditIndex = e.NewEditIndex
        BindData()
    End Sub

    Protected Sub CancelEdit(ByVal sender As Object, ByVal e As GridViewCancelEditEventArgs)
        GridView1.EditIndex = -1
        BindData()
    End Sub

    Protected Sub UpdateRecord(ByVal sender As Object, ByVal e As GridViewUpdateEventArgs)
        Dim Field1 As String = DirectCast(GridView1.Rows(e.RowIndex).FindControl("txtField1"), Label).Text
        Dim Field2 As String = DirectCast(GridView1.Rows(e.RowIndex).FindControl("txtField2"), TextBox).Text
        Dim Field3 As String = DirectCast(GridView1.Rows(e.RowIndex).FindControl("txtField3"), TextBox).Text
        Dim con As New SqlConnection(strConnString)
        Dim cmd As New SqlCommand()
        cmd.CommandType = CommandType.Text
        cmd.CommandText = "update vPlant set Plant=@Plant," _
        & "CategoryID=@CategoryID where PlantID=@PlantID;" _
        & "select PlantID,Plant,CategoryID from vPlant"
        cmd.Parameters.Add("@PlantID", SqlDbType.VarChar).Value = Field1
        cmd.Parameters.Add("@Plant", SqlDbType.VarChar).Value = Field2
        cmd.Parameters.Add("@CategoryID", SqlDbType.VarChar).Value = Field3
        GridView1.EditIndex = -1
        GridView1.DataSource = GetData(cmd)
        GridView1.DataBind()
    End Sub

    Protected Sub DeleteRecord(ByVal sender As Object, ByVal e As EventArgs)
        Dim lnkRemove As LinkButton = DirectCast(sender, LinkButton)
        Dim con As New SqlConnection(strConnString)
        Dim cmd As New SqlCommand()
        cmd.CommandType = CommandType.Text
        cmd.CommandText = "delete from vPlant where PlantID=@PlantID;" & _
        "select PlantID,Plant,CategoryID from vPlant"
        cmd.Parameters.Add("@PlantID", SqlDbType.VarChar).Value = lnkRemove.CommandArgument
        GridView1.DataSource = GetData(cmd)
        GridView1.DataBind()
    End Sub

    Protected Sub OnPaging(ByVal sender As Object, ByVal e As GridViewPageEventArgs)
        BindData()
        GridView1.PageIndex = e.NewPageIndex
        GridView1.DataBind()
    End Sub

End Class





