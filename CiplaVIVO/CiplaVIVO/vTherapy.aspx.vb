Imports CiplaVIVO.VivoClass

Public Class vTherapy
    Inherits System.Web.UI.Page
    Dim Viv As New VivoClass
    Public TableName As String = "Therapy"
    Dim SelectedSort As String


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            SelectedSort = Session("Sort")
            BindData()
        End If
    End Sub

    Private Sub BindData()
        If Session("Sort") = "" Then Session("Sort") = "TherapyID"
        GridView1.DataSource = Viv.BindData(TableName, Session("Sort"))
        Session("Sort") = ""
        GridView1.DataBind()
    End Sub

    Protected Sub AddRecord(ByVal sender As Object, ByVal e As EventArgs)
        Dim Field2 As String = DirectCast(GridView1.FooterRow.FindControl("txtField2"), TextBox).Text
        GridView1.DataSource = Viv.Insert("", Field2, "", TableName)
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
        GridView1.EditIndex = -1
        GridView1.DataSource = Viv.Update(Field1, Field2, "", TableName)
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

    Sub SortData(sender As Object, e As System.Web.UI.WebControls.GridViewSortEventArgs)
        SelectedSort = e.SortExpression
        Session("Sort") = SelectedSort
        BindData()
    End Sub
End Class
