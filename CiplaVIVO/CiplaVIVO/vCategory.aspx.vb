Imports CiplaVIVO.VivoClass

Public Class vCategory
    Inherits System.Web.UI.Page
    Dim Viv As New VivoClass
    Dim TableName As String = "Category"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindData()
        End If
    End Sub

    Private Sub BindData()
        GridView1.DataSource = Viv.BindData(TableName)
        GridView1.DataBind()
    End Sub

    Protected Sub AddRecord(ByVal sender As Object, ByVal e As EventArgs)
        Dim Field2 As String = DirectCast(GridView1.FooterRow.FindControl("txtField2"), TextBox).Text
        Dim Field3 As String = DirectCast(GridView1.FooterRow.FindControl("txtField3"), TextBox).Text
        GridView1.DataSource = Viv.Insert("", Field2, Field3, TableName)
        GridView1.DataBind()
    End Sub

    Protected Sub EditRecord(ByVal sender As Object, ByVal e As GridViewEditEventArgs)
        GridView1.EditIndex = e.NewEditIndex
        BindData()
    End Sub

    Protected Sub CancelEdit(ByVal sender As Object, ByVal e As GridViewCancelEditEventArgs)
        GridView1.EditIndex = -1
    End Sub

    Protected Sub UpdateRecord(ByVal sender As Object, ByVal e As GridViewUpdateEventArgs)
        Dim Field1 As String = DirectCast(GridView1.Rows(e.RowIndex).FindControl("txtField1"), Label).Text
        Dim Field2 As String = DirectCast(GridView1.Rows(e.RowIndex).FindControl("txtField2"), TextBox).Text
        Dim Field3 As String = DirectCast(GridView1.Rows(e.RowIndex).FindControl("txtField3"), TextBox).Text
        GridView1.EditIndex = -1
        GridView1.DataSource = Viv.Update(Field1, Field2, Field3, TableName)
        GridView1.DataBind()
    End Sub

    Protected Sub DeleteRecord(ByVal sender As Object, ByVal e As EventArgs)
        Dim lnkRemove As LinkButton = DirectCast(sender, LinkButton)
        GridView1.DataSource = Viv.Delete(lnkRemove.CommandArgument, "", "", TableName)
        GridView1.DataBind()
    End Sub

    Protected Sub OnPaging(ByVal sender As Object, ByVal e As GridViewPageEventArgs)
        BindData()
        GridView1.PageIndex = e.NewPageIndex
        GridView1.DataBind()
    End Sub

End Class
