Imports System.Data
Imports System.Data.SqlClient

Namespace SCLE.Admin
    Partial Class tblPersonnel
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

        Dim MyConnection As SqlConnection
        Dim connstring As String


        Sub Page_Load(ByVal sender As Object, ByVal E As EventArgs) Handles MyBase.Load
            connstring = ConfigurationManager.ConnectionStrings("SQLConnectionString").ToString
            MyConnection = New SqlConnection(connstring)
            If Not IsPostBack Then
                LoadXML()
            End If
        End Sub

        Sub LoadXML()
            Dim objdata As New DataSet
            objdata.ReadXml(Server.MapPath("tblPersonnel.xml"))
            datagrid1.DataSource = objdata
            datagrid1.DataBind()
        End Sub

        Sub setEditMode(ByVal Sender As Object, ByVal E As DataGridCommandEventArgs)
            Dim objdata As New DataSet
            Dim x1 As String
            objdata.ReadXml(Server.MapPath("tblPersonnel.xml"))
            x1 = datagrid1.DataKeys.Item(E.Item.ItemIndex)
            objdata.Tables("tblPersonnel").DefaultView.RowFilter = "PersonnelID='" & x1 & "'"
            If objdata.Tables("tblPersonnel").DefaultView.Count > 0 Then
                error4.Visible = "False"
                datagrid1.EditItemIndex = E.Item.ItemIndex
                datagrid1.ShowFooter = "false"
                LoadXML()
            Else
                error4.Visible = "True"
            End If
        End Sub

        Sub cancelEdit(ByVal sender As Object, ByVal E As DataGridCommandEventArgs)
            datagrid1.EditItemIndex = -1
            datagrid1.ShowFooter = "true"
            error1.Visible = "False"
            error3.Visible = "False"
            error4.Visible = "False"
            error5.Visible = "False"
            LoadXML()
        End Sub

        Sub DelXML(ByVal S As Object, ByVal E As DataGridCommandEventArgs)
            If E.CommandName = "Delete" Then
                If datagrid1.EditItemIndex = -1 Then
                    error5.Visible = "False"
                    Dim x1 As String
                    x1 = datagrid1.DataKeys.Item(E.Item.ItemIndex)
                    Dim objdata As New DataSet
                    '----------------ABY
                    objdata.ReadXml(Server.MapPath("tblPersonnel.xml"))
                    objdata.Tables("tblPersonnel").DefaultView.RowFilter = "PersonnelID='" & x1 & "'"
                    If objdata.Tables("tblPersonnel").DefaultView.Count > 0 Then
                        objdata.Tables("tblPersonnel").DefaultView.Delete(0)
                        Dim objCommand As SqlCommand
                        Dim SQLText As String
                        SQLText = "DELETE FROM tblPersonnel WHERE PersonnelID=" & x1
                        objCommand = New SqlCommand(SQLText, MyConnection)
                        MyConnection.Open()
                        objCommand.ExecuteNonQuery()
                        MyConnection.Close()
                    End If
                    objdata.Tables("tblPersonnel").DefaultView.RowFilter = ""

                    objdata.WriteXml(Server.MapPath("tblPersonnel.xml"))
                    LoadXML()
                Else
                    error5.Visible = "True"
                End If
            End If
        End Sub


        Sub UpdateXML(ByVal s As Object, ByVal e As DataGridCommandEventArgs)
            If e.CommandName = "Update" Then
                Dim str1, str2, str3, v1 As String
                Dim txt1, txt2, txt3 As TextBox
                Dim objdata As New DataSet
                Dim x1 As String

                '-----------ABY
                objdata.ReadXml(Server.MapPath("tblPersonnel.xml"))
                v1 = e.Item.ItemIndex
                x1 = datagrid1.DataKeys.Item(e.Item.ItemIndex)
                objdata.Tables("tblPersonnel").DefaultView.RowFilter = "PersonnelID='" & x1 & "'"
                If objdata.Tables("tblPersonnel").DefaultView.Count > 0 Then
                    error3.Visible = "False"
                    txt1 = e.Item.FindControl("PersonnelID_Edit")
                    txt2 = e.Item.FindControl("Name_edit")

                    Dim objCommand As SqlCommand
                    Dim SQLText As String
                    SQLText = "UPDATE tblPersonnel SET ProjectLeader='" & txt2.Text & "' WHERE PersonnelID=" & CInt(txt1.Text)
                    objCommand = New SqlCommand(SQLText, MyConnection)
                    MyConnection.Open()
                    objCommand.ExecuteNonQuery()
                    MyConnection.Close()

                    objdata.Tables("tblPersonnel").Rows(v1).Item("PersonnelID") = txt1.Text
                    objdata.Tables("tblPersonnel").Rows(v1).Item("name") = txt2.Text
                    datagrid1.DataSource = objdata
                    datagrid1.DataBind()

                    objdata.WriteXml(Server.MapPath("tblPersonnel.xml"))

                    datagrid1.EditItemIndex = -1
                    LoadXML()
                    datagrid1.ShowFooter = "true"
                Else
                    error3.Visible = "True"
                End If
            End If
        End Sub

        Sub doInsert(ByVal s As Object, ByVal E As DataGridCommandEventArgs)

            If E.CommandName = "doAdd" Then
                Dim v1 As String
                Dim tadd1, tadd2 As TextBox
                Dim objdata As New DataSet
                Dim dr As DataRow

                '-------ABY
                objdata.ReadXml(Server.MapPath("tblPersonnel.xml"))

                tadd1 = E.Item.FindControl("PersonnelID_Add")
                tadd2 = E.Item.FindControl("Name_add")

                If tadd1.Text <> "" And tadd2.Text <> "" Then
                    objdata.Tables("tblPersonnel").DefaultView.RowFilter = ""
                    dr = objdata.Tables("tblPersonnel").NewRow()
                    dr(0) = tadd1.Text
                    dr(1) = 1
                    dr(2) = tadd2.Text
                    Dim objCommand As SqlCommand
                    Dim SQLText As String
                    SQLText = "INSERT INTO tblPersonnel (PersonnelID, ProjectLeader, TeamGroupID) VALUES (" & tadd1.Text & ",'" & tadd2.Text & "',1)"
                    objCommand = New SqlCommand(SQLText, MyConnection)
                    MyConnection.Open()
                    objCommand.ExecuteNonQuery()
                    MyConnection.Close()

                    objdata.Tables("tblPersonnel").Rows.Add(dr)
                    objdata.WriteXml(Server.MapPath("tblPersonnel.xml"))
                    LoadXML()
                End If
            End If
        End Sub
    End Class
        End Namespace


