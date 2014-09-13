Imports CiplaVIVO.VivoClass

Public Class rReportAllDT
    Inherits System.Web.UI.Page
    Dim Viv As New VivoClass
    Public TableName As String = "ReportAll"
    Dim SelectedSort As String
    Dim SelectedYear As String


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            SelectedSort = Session("Sort")
            BindDateDropDown()
            Year_Refresh_Display()
        End If
    End Sub

    Private Sub BindData()
        If Session("Sort") = "" Then Session("Sort") = "ProjectID"
        GridView1.DataSource = Viv.ShowDataGrid("cReportAll", System.Convert.ToInt32(SelectedYear), Session("Sort"))
        GridView1.DataBind()
    End Sub

    Protected Sub OnPaging(ByVal sender As Object, ByVal e As GridViewPageEventArgs)
        Year_Refresh_Display()
        GridView1.PageIndex = e.NewPageIndex
        GridView1.DataBind()
    End Sub

    Sub SortData(sender As Object, e As System.Web.UI.WebControls.GridViewSortEventArgs)
        SelectedSort = e.SortExpression
        Session("Sort") = SelectedSort
        Year_Refresh_Display()
    End Sub

    Sub Year_Refresh_Display()
        If cboYear.SelectedItem.Value = "" Then
            If (DateTime.Now.Month > 6) Then
                SelectedYear = DateTime.Now.Year
            Else
                SelectedYear = DateTime.Now.Year - 1
            End If
            HeaderLabel.Text = "Project List for Financial Year " & SelectedYear & "-" & Right(SelectedYear + 1, 2)
        Else
            SelectedYear = cboYear.SelectedItem.Value
            HeaderLabel.Text = "Project List for Financial Year " & cboYear.SelectedItem.Text
        End If
        BindData()
    End Sub

    Protected Sub EditRow(ByVal sender As Object, ByVal e As EventArgs)
        Response.Redirect("ProjectAddition.aspx?ProjectID=" & GridView1.SelectedRow.Cells(2).Text)
    End Sub

    Protected Sub DeleteRecord(ByVal sender As Object, ByVal e As GridViewDeleteEventArgs)
        Dim ProjectID As Integer = GridView1.DataKeys(e.RowIndex).Value
        HeaderLabel.Text = "Reached in the right DELETE box " & ProjectID
        Dim RecordUpdate As Integer = Viv.DeleteProject(ProjectID)
        Year_Refresh_Display()
    End Sub

    Sub Year_Refresh(ByVal sender As Object, ByVal e As System.EventArgs)
        Year_Refresh_Display()
    End Sub

    Sub SubmitBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("ReportAllbyYearExcel.aspx?YearField=" & SelectedYear)
    End Sub

    Sub ProjectDataGrid_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        '.
        'Create a DataView Based on the DataSource of DataGrid
        'Dim dv As DataView = ProjectDataGrid.DataSource
        'Dim dc As DataColumnCollection = dv.Table.Columns
        'if (StatusExistance) then
        'Check for ItemType

        If e.Row.DataItem.GetType = ListItemType.Item Or _
             e.Item.ItemType = ListItemType.AlternatingItem Then

            'Declare string variable
            'Assign the relevant data to a variable 
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

        End If
        'end if
    End Sub

    Private Sub BindDateDropDown()
        Dim myDataSet As DataSet = New DataSet
        myDataSet.ReadXml(Server.MapPath("tblYears.xml"))
        cboYear.DataSource = myDataSet.Tables("tblYears").DefaultView
        cboYear.DataBind()
        cboYear.Items.FindByValue(DateTime.Now.Year).Selected = True
        SelectedYear = DateTime.Now.Year
    End Sub

End Class
