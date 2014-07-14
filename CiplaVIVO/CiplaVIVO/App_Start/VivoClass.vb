Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.OleDb
Imports System.Data.SqlClient
Imports System.Collections


Public Class VivoClass
    Private strConnString As String = ConfigurationManager.ConnectionStrings("SQLConnectionString").ConnectionString
    Dim con As New SqlConnection(strConnString)


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

    Public Function BindData(ByVal TableName As String, ByVal SortExpression As String) As DataTable
        Dim strQuery As String = "select PlantID, Plant, CategoryID from vPlant order by " + SortExpression
        Dim cmd As New SqlCommand(strQuery)
        Return GetData(cmd)
    End Function

    'Insert into database
    Public Function Insert(ByVal Field1 As String, ByVal Field2 As String, ByVal Field3 As String, ByVal TableName As String) As DataTable
        Try
            Dim cmd As New SqlCommand()
            cmd.CommandType = CommandType.Text
            Select Case TableName
                Case "Category"
                    cmd.CommandText = "insert into vPlant(Plant, CategoryID)" & _
                                        "values(@Field2, @Field3);" & _
                                        "Select PlantID,Plant,CategoryID from vPlant"
            End Select

            cmd.Parameters.Add("@Field1", SqlDbType.VarChar).Value = Field1
            cmd.Parameters.Add("@Field2", SqlDbType.VarChar).Value = Field2
            cmd.Parameters.Add("@Field3", SqlDbType.VarChar).Value = Field3
            Return GetData(cmd)
        Catch ex As Exception
            MsgBox("Error " & ex.Message)
            Return Nothing
        End Try
    End Function

    'Update to database
    Public Function Update(ByVal Field1 As String, ByVal Field2 As String, ByVal Field3 As String, ByVal TableName As String) As DataTable
        Try
            Dim cmd As New SqlCommand()
            cmd.CommandType = CommandType.Text

            Select Case TableName
                Case "Category"
                    cmd.CommandText = "update vPlant set Plant=@Field2," _
                            & "CategoryID=@Field3 where PlantID=@Field1;" _
                            & "select PlantID,Plant,CategoryID from vPlant"
            End Select

            cmd.Parameters.Add("@Field1", SqlDbType.VarChar).Value = Field1
            cmd.Parameters.Add("@Field2", SqlDbType.VarChar).Value = Field2
            cmd.Parameters.Add("@Field3", SqlDbType.VarChar).Value = Field3

            Return GetData(cmd)
        Catch ex As Exception
            MsgBox("Error " & ex.Message)
            Return Nothing
        End Try
    End Function

    'Delete a record in database
    Public Function Delete(ByVal Field1 As String, ByVal Field2 As String, ByVal Field3 As String, ByVal TableName As String) As DataTable
        Try
           Dim cmd As New SqlCommand()
            cmd.CommandType = CommandType.Text
            Select Case TableName
                Case "Category"
                    cmd.CommandText = "delete from vPlant where PlantID=@Field1;" & _
                                        "select PlantID,Plant,CategoryID from vPlant"
                    cmd.Parameters.Add("@PlantID", SqlDbType.VarChar).Value = Field1
            End Select

            cmd.Parameters.Add("@Field1", SqlDbType.VarChar).Value = Field1
            cmd.Parameters.Add("@Field2", SqlDbType.VarChar).Value = Field2
            cmd.Parameters.Add("@Field3", SqlDbType.VarChar).Value = Field3
            Return GetData(cmd)
        Catch ex As Exception
            MsgBox("Error " & ex.Message)
            Return Nothing
        End Try
    End Function

End Class
