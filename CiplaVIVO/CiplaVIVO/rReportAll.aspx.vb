Imports CiplaVIVO.VivoClass

Public Class rReportAll
    Inherits System.Web.UI.Page
    Dim Viv As New VivoClass
    Public TableName As String = "ReportAll"
    Dim SelectedSort As String
    Dim SelectedYear As String
    Protected search_Word As String = [String].Empty
    Protected SQLSelect As String = [String].Empty
    Dim StatusFlag As Boolean = False

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            SelectedSort = Session("Sort")
            BindDateDropDown()
            SequenceOfCommands()
        End If
    End Sub

    Private Sub BindData()
        'Project Gridview
        If Session("Sort") = "" Then Session("Sort") = "ProjectID"
        If SQLSelect.Length > 0 Then
            ProjectGrid.DataSource = Viv.ShowDataGrid_View("cReportCustom", System.Convert.ToInt32(SelectedYear), Session("Sort"), search_Word, SQLSelect)
        Else
            ProjectGrid.DataSource = Viv.ShowDataGrid_View("cReportAll", System.Convert.ToInt32(SelectedYear), Session("Sort"), search_Word, SQLSelect)
        End If
        ProjectGrid.DataBind()
        
        'Sum Gridview - using Capex as just a sort option
        SumGrid.DataSource = Viv.ShowDataGrid("cReportAllSum", System.Convert.ToInt32(SelectedYear), "Capex")
        SumGrid.DataBind()

    End Sub
    
    Protected Sub OnPaging(ByVal sender As Object, ByVal e As GridViewPageEventArgs)
        SequenceOfCommands()
        ProjectGrid.PageIndex = e.NewPageIndex
        ProjectGrid.DataBind()
    End Sub

    Sub SortData(sender As Object, e As System.Web.UI.WebControls.GridViewSortEventArgs)
        SelectedSort = e.SortExpression
        Session("Sort") = SelectedSort
        SequenceOfCommands()
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
        Response.Redirect("ProjectAddition.aspx?ProjectID=" & ProjectGrid.SelectedRow.Cells(2).Text)
    End Sub

    Protected Sub DeleteRecord(ByVal sender As Object, ByVal e As GridViewDeleteEventArgs)
        Dim ProjectID As Integer = ProjectGrid.DataKeys(e.RowIndex).Value
        HeaderLabel.Text = "Reached in the right DELETE box " & ProjectID
        Dim RecordUpdate As Integer = Viv.DeleteProject(ProjectID)
        SequenceOfCommands()
    End Sub

    Sub Year_Refresh(ByVal sender As Object, ByVal e As System.EventArgs)
        SequenceOfCommands()
    End Sub

    Sub SubmitBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("ReportAllbyYearExcel.aspx?YearField=" & SelectedYear)
    End Sub

    Sub ProjectGrid_RowDataBound(ByVal sender As Object, ByVal e As GridViewRowEventArgs)
        Dim StatusValue As String

        If e.Row.RowType = DataControlRowType.DataRow Then
            StatusValue = Trim(e.Row.DataItem("Status"))
            If (StatusValue = "Failed") Or (StatusValue = "Hold") Or (StatusValue = "Requires Strategic Choice") Or (StatusValue = "Cancelled") Then
                e.Row.Cells(2).BackColor = Drawing.Color.Red
            ElseIf (StatusValue = "Planned") Then
                e.Row.Cells(2).BackColor = Drawing.Color.Yellow
            ElseIf (StatusValue = "In Progress") Then
                e.Row.Cells(2).BackColor = Drawing.Color.Green
            ElseIf (StatusValue = "Completed") Then
                e.Row.Cells(2).BackColor = Drawing.Color.Blue
            Else
                e.Row.Cells(2).BackColor = Drawing.Color.White
            End If
        End If

        ' Hide the Status Field if the user has not selected it
        If StatusFlag = False Then
            If e.Row.RowType = DataControlRowType.DataRow Then
                For Each c As DataControlFieldCell In e.Row.Cells
                    Dim h As String = c.ContainingField.HeaderText
                    If (h = "Status") Then
                        c.ContainingField.Visible = False
                    End If
                Next
            End If
        End If
        
    End Sub

    Sub OnFilterChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        ' Assign search_Word
        search_Word = Filters.Text
        SequenceOfCommands()
    End Sub

    Private Sub BindDateDropDown()
        Dim myDataSet As DataSet = New DataSet
        myDataSet.ReadXml(Server.MapPath("tblYears.xml"))
        cboYear.DataSource = myDataSet.Tables("tblYears").DefaultView
        cboYear.DataBind()
        cboYear.Items.FindByValue(DateTime.Now.Year).Selected = True
        SelectedYear = DateTime.Now.Year

        '---------cboBusinessUnit
        lstReportTags.DataSource = Viv.BindData("vTagNames", "")
        lstReportTags.DataValueField = "tagfield"
        lstReportTags.DataTextField = "tag"
        lstReportTags.DataBind()

        lstFiltersTags.DataSource = Viv.BindData("VTagFilter", "")
        lstFiltersTags.DataValueField = "tagfield"
        lstFiltersTags.DataTextField = "tag"
        lstFiltersTags.DataBind()
       
        
    End Sub

    Sub cmdChangeListReport(ByVal sender As Object, ByVal e As System.EventArgs)
        lstFilters.DataSource = Viv.BindData(lstFiltersTags.SelectedItem.Text, lstFiltersTags.SelectedValue)
        lstFilters.DataValueField = lstFiltersTags.SelectedValue
        lstFilters.DataTextField = lstFiltersTags.SelectedItem.Text
        lstFilters.DataBind()
    End Sub

    Sub cmdAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim li As ListItem
        For Each li In lstReportTags.Items
            If li.Selected = True Then
                If lstReport.Items.FindByText(li.Text) Is Nothing Then
                    lstReport.Items.Insert(lstReport.Items.Count, New ListItem(li.Text, li.Value))
                End If
            End If
        Next
        lstReportTags.ClearSelection()
    End Sub

    Sub cmdRemove_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If lstReport.SelectedIndex > -1 Then
            lstReport.Items.Remove(lstReport.SelectedItem)
        End If
    End Sub

    Sub cmdBack_Click(ByVal sender As Object, ByVal e As System.EventArgs)
    End Sub

    Sub SequenceOfCommands()
        SaveReportParameters()
        Year_Refresh_Display()
    End Sub


    Sub cmdSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        SequenceOfCommands()
    End Sub

    Sub SaveReportParameters()
        Dim strIN As String = "TProjects.ProjectID , tProjectSavings.Status,"
        Dim li As ListItem
        Dim SelectionCheck As Boolean = False

        ' Build the IN string for Report Tags by looping through the listbox

        For Each li In lstReport.Items
            SelectionCheck = True
            If (li.Value = "tProjectSavings.Status") Then
                StatusFlag = True
            End If

            If Not (li.Value = "TProjects.ProjectID" Or li.Value = "tProjectSavings.Status") Then
                strIN += li.Value & ","
            End If
        Next

        If SelectionCheck = True Then
            SQLSelect = Left(strIN, Len(strIN) - 1)
        Else
            SQLSelect = ""
        End If
    End Sub

End Class