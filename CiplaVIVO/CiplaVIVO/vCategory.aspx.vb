Imports CiplaVIVO.VivoClass
Imports System.Data.SqlClient

Public Class vCategory
    Inherits System.Web.UI.Page
    Dim Viv As New VivoClass
    Public TableName As String = "Category"
    Dim SelectedSort As String
    Private strConnString As String = ConfigurationManager.ConnectionStrings("SQLConnectionString").ConnectionString
    Dim con As New SqlConnection(strConnString)


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            SelectedSort = Session("Sort")
            BindData()
        End If
    End Sub

    Private Sub BindData()
        If Session("Sort") = "" Then Session("Sort") = "CategoryID"
        GridView1.DataSource = Viv.BindData("Category", Session("Sort"))
        Session("Sort") = ""
        GridView1.DataBind()
    End Sub

    Protected Sub AddRecord(ByVal sender As Object, ByVal e As EventArgs)
        Dim Field2 As String = DirectCast(GridView1.FooterRow.FindControl("txtField2"), TextBox).Text
        Dim Field3 As String = DirectCast(GridView1.FooterRow.FindControl("txtField3"), TextBox).Text
        GridView1.DataSource = Viv.Insert("", Field2, Field3, "Category")
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
        GridView1.DataSource = Viv.Update(Field1, Field2, Field3, "Category")
        GridView1.DataBind()
    End Sub

    Protected Sub DeleteRecord(ByVal sender As Object, ByVal e As EventArgs)
        Dim lnkRemove As LinkButton = DirectCast(sender, LinkButton)
        GridView1.DataSource = Viv.Delete(lnkRemove.CommandArgument, "", "", "Category")
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

    'Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
    'Dim txtuserid As New DropDownList
    'Dim dl As New Data.DataSet
    'Dim strsql As String
    'Dim adpt As SqlDataAdapter
    '   strsql = "select  * from vDepartment"
    '   adpt = New SqlDataAdapter(strsql, con)
    '   adpt.Fill(dl)

    '    If e.Row.RowType = DataControlRowType.DataRow Then
    '    txtuserid = e.Row.FindControl("DropDownList1")
    'txtuserid.SelectedValue = DataBinder.Eval(e.Row.DataItem, "departmentID").ToString
    '   txtuserid.DataSource = dl.Tables(0)
    '  txtuserid.DataTextField = "department"
    ' txtuserid.DataValueField = "departmentID"
    'txtuserid.DataBind()

    '   End If
    'End Sub

End Class
