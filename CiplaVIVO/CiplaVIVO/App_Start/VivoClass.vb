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
        Using con As New SqlConnection(strConnString)
            Dim sda As New SqlDataAdapter()
            cmd.CommandType = CommandType.Text
            cmd.Connection = con
            sda.SelectCommand = cmd
            sda.Fill(dt)
        End Using
        Return dt
    End Function

    ' Fill datagrid based on reporting needs
    Public Function ShowDataGrid_View(ByVal StoreProcName As String, ByVal SelectedYear As Integer, ByVal SortExpression As String, ByVal SearchString As String, ByVal SQLSelect As String) As DataView
        Dim dt As New DataTable()
        Dim dv As New DataView()
        Dim search As String = ""

        Using con As New SqlConnection(strConnString)
            Dim sda As SqlDataAdapter
            sda = New SqlDataAdapter(StoreProcName, con)
            sda.SelectCommand.CommandType = CommandType.StoredProcedure
            Select Case StoreProcName
                Case "cReportAll"
                    sda.SelectCommand.Parameters.Add(New SqlParameter("@Year", SqlDbType.Int, 2))
                    sda.SelectCommand.Parameters("@Year").Value = SelectedYear
                Case "cReportCustom"
                    sda.SelectCommand.Parameters.Add(New SqlParameter("@Year", SqlDbType.Int, 2))
                    sda.SelectCommand.Parameters("@Year").Value = SelectedYear
                    sda.SelectCommand.Parameters.Add(New SqlParameter("@SqlSelect", SqlDbType.NVarChar))
                    sda.SelectCommand.Parameters("@SqlSelect").Value = SQLSelect
                Case "cReportAllSum"
                    sda.SelectCommand.Parameters.Add(New SqlParameter("@Year", SqlDbType.Int, 2))
                    sda.SelectCommand.Parameters("@Year").Value = SelectedYear
            End Select
            sda.Fill(dt)
        End Using
        dv = dt.DefaultView
        If (SearchString.Length > 0) Then
            Dim dc As New DataColumn
            For Each dc In dv.Table.Columns
                If dc.DataType.Name = "String" Then
                    search += dc.ColumnName + " LIKE '%" + SearchString + "%' OR "
                End If
            Next
            search = Left(search, search.Length - 3)
            dv.RowFilter = search
        End If
        dv.Sort = SortExpression
        Return dv

    End Function

    ' Fill datagrid based on reporting needs
    Public Function ShowDataGrid(ByVal StoreProcName As String, ByVal SelectedYear As Integer, ByVal SortExpression As String) As DataTable
        Dim dt As New DataTable()
       
        Using con As New SqlConnection(strConnString)
            Dim sda As SqlDataAdapter
            sda = New SqlDataAdapter(StoreProcName, con)
            sda.SelectCommand.CommandType = CommandType.StoredProcedure
            Select Case StoreProcName
                Case "cReportAllSum"
                    sda.SelectCommand.Parameters.Add(New SqlParameter("@Year", SqlDbType.Int, 2))
                    sda.SelectCommand.Parameters("@Year").Value = SelectedYear
            End Select
            sda.Fill(dt)
        End Using
        dt.DefaultView.Sort = SortExpression
        Return dt

    End Function

    ' Get data into datagrid for all single and dual columns
    Public Function BindData(ByVal TableName As String, ByVal SortExpression As String) As DataTable
        Dim strQuery As String = ""

        Select Case TableName
            Case "BusinessUnit"
                strQuery = "select BusinessUnitID, BusinessUnit from vBusinessUnit order by " + SortExpression

            Case "Department"
                strQuery = "select DepartmentID, Department from vDepartment order by " + SortExpression

            Case "Category"
                strQuery = "SELECT CategoryID, Category , vCategory.DepartmentID, Department FROM vCategory " _
                    & "Inner Join vDepartment ON vCategory.DepartmentID=vDepartment.DepartmentID order by " + SortExpression

            Case "CategoryDrop"
                strQuery = "SELECT CategoryID, Category , vCategory.DepartmentID, Department FROM vCategory " _
                    & "Inner Join vDepartment ON vCategory.DepartmentID=vDepartment.DepartmentID where vCategory.DepartmentID=" + SortExpression

            Case "ExpenseHead"
                strQuery = "select ExpenseHeadID, ExpenseHead, DirectIndirect from vExpenseHead order by " + SortExpression

            Case "ExpenseHeadDrop"
                strQuery = "select ExpenseHeadID, ExpenseHead from vExpenseHead where DirectIndirect='" + SortExpression + "'"

            Case "Personnel"
                strQuery = "select PersonnelID, Personnel, PersonnelEmail from vPersonnel order by " + SortExpression

            Case "Currency"
                strQuery = "select CurrencyID, Currency, CurrencyExchange from vCurrency order by " + SortExpression

            Case "Therapy"
                strQuery = "select TherapyID, Therapy from vTherapy order by " + SortExpression

            Case "PackCode"
                strQuery = "select PackCodeID, PackCode from vPackCode order by " + SortExpression

            Case "MfgCode"
                strQuery = "select MfgCodeID, MfgCode from vMfgCode order by " + SortExpression

            Case "BulkCode"
                strQuery = "select BulkCodeID, BulkCode from vBulkCode order by " + SortExpression

            Case "Dosage"
                strQuery = "select DosageID, Dosage from vDosage order by " + SortExpression

            Case "uProjectBulkCode"
                strQuery = "select * from uProjectBulkCode where ProjectID= " + SortExpression

            Case "uProjectCategory"
                strQuery = "select * from uProjectCategory where ProjectID= " + SortExpression

            Case "uProjectDosage"
                strQuery = "select * from uProjectDosage where ProjectID= " + SortExpression

            Case "uProjectMfgCode"
                strQuery = "select * from uProjectMfgCode where ProjectID= " + SortExpression

            Case "uProjectPackCode"
                strQuery = "select * from uProjectPackCode where ProjectID= " + SortExpression

            Case "uProjectPersonnel"
                strQuery = "select * from uProjectPersonnel where ProjectID= " + SortExpression

            Case "uProjectTherapy"
                strQuery = "select * from uProjectTherapy where ProjectID= " + SortExpression

            Case "tProjects"
                strQuery = "select * from tProjects order by " + SortExpression

            Case "vTagNames"
                strQuery = "select * from vTagNames"

            Case "VTagFilter"
                strQuery = "select * from VTagFilter"

        End Select

        Dim cmd As New SqlCommand(strQuery)
        Return GetData(cmd)
    End Function

    'Insert into database
    Public Function Insert(ByVal Field1 As String, ByVal Field2 As String, ByVal Field3 As String, ByVal TableName As String) As DataTable
        Try
            Dim cmd As New SqlCommand()
            cmd.CommandType = CommandType.Text
            Select Case TableName
                Case "BusinessUnit"
                    cmd.CommandText = "insert into vBusinessUnit(BusinessUnit) values(@Field2);" & _
                                        "Select BusinessUnitID,BusinessUnit from vBusinessUnit"

                Case "Department"
                    cmd.CommandText = "insert into vDepartment(Department) values(@Field2);" & _
                                        "Select DepartmentID,Department from vDepartment"

                Case "Category"
                    cmd.CommandText = "insert into vCategory(Category, DepartmentID)" & _
                                        "values(@Field2, @Field3);" & _
                                        "SELECT CategoryID, Category , vCategory.DepartmentID, Department FROM vCategory Inner Join vDepartment ON vCategory.DepartmentID=vDepartment.DepartmentID"

                Case "ExpenseHead"
                    cmd.CommandText = "insert into vExpenseHead(ExpenseHead,DirectIndirect) values(@Field2, @Field3);" & _
                                        "Select ExpenseHeadID,ExpenseHead,DirectIndirect from vExpenseHead"

                Case "Personnel"
                    cmd.CommandText = "insert into vPersonnel(Personnel,PersonnelEmail) values(@Field2, @Field3);" & _
                                        "Select PersonnelID,Personnel,PersonnelEmail from vPersonnel"

                Case "Currency"
                    cmd.CommandText = "insert into vCurrency(Currency,CurrencyExchange) values(@Field2, @Field3);" & _
                                        "Select CurrencyID,Currency,CurrencyExchange from vCurrency"

                Case "Therapy"
                    cmd.CommandText = "insert into vTherapy(Therapy) values(@Field2);" & _
                                        "Select TherapyID,Therapy from vTherapy"

                Case "PackCode"
                    cmd.CommandText = "insert into vPackCode(PackCode) values(@Field2);" & _
                                        "Select PackCodeID,PackCode from vPackCode"

                Case "MfgCode"
                    cmd.CommandText = "insert into vMfgCode(MfgCode) values(@Field2);" & _
                                        "Select MfgCodeID,MfgCode from vMfgCode"

                Case "BulkCode"
                    cmd.CommandText = "insert into vBulkCode(BulkCode) values(@Field2);" & _
                                        "Select BulkCodeID,BulkCode from vBulkCode"

                Case "Dosage"
                    cmd.CommandText = "insert into vDosage(Dosage) values(@Field2);" & _
                                        "Select DosageID,Dosage from vDosage"

            End Select

            cmd.Parameters.Add("@Field1", SqlDbType.VarChar).Value = Field1
            cmd.Parameters.Add("@Field2", SqlDbType.VarChar).Value = Field2
            cmd.Parameters.Add("@Field3", SqlDbType.VarChar).Value = Field3
            Return GetData(cmd)
        Catch ex As Exception
            Return Nothing
        End Try
    End Function

    'Update to database
    Public Function Update(ByVal Field1 As String, ByVal Field2 As String, ByVal Field3 As String, ByVal TableName As String) As DataTable
        Try
            Dim cmd As New SqlCommand()
            cmd.CommandType = CommandType.Text

            Select Case TableName
                Case "BusinessUnit"
                    cmd.CommandText = "update vBusinessUnit set BusinessUnit=@Field2 where BusinessUnitID= @Field1;" _
                            & "Select BusinessUnitID,BusinessUnit from vBusinessUnit"

                Case "Department"
                    cmd.CommandText = "update vDepartment set Department=@Field2 where DepartmentID= @Field1;" _
                            & "Select DepartmentID,Department from vDepartment"

                Case "Category"
                    cmd.CommandText = "update vCategory set Category=@Field2, DepartmentID=@Field3 where CategoryID=@Field1;" _
                            & "SELECT CategoryID, Category , vCategory.DepartmentID, Department FROM vCategory Inner Join vDepartment ON vCategory.DepartmentID=vDepartment.DepartmentID"

                Case "ExpenseHead"
                    cmd.CommandText = "update vExpenseHead set ExpenseHead=@Field2, DirectIndirect=@Field3 where ExpenseHeadID= @Field1;" _
                            & "Select ExpenseHeadID,ExpenseHead,DirectIndirect from vExpenseHead"

                Case "Personnel"
                    cmd.CommandText = "update vPersonnel set Personnel=@Field2, PersonnelEmail=@Field3 where PersonnelID= @Field1;" _
                            & "Select PersonnelID,Personnel,PersonnelEmail from vPersonnel"

                Case "Currency"
                    cmd.CommandText = "update vCurrency set Currency=@Field2, CurrencyExchange=@Field3 where CurrencyID= @Field1;" _
                            & "Select CurrencyID,Currency,CurrencyExchange from vCurrency"

                Case "Therapy"
                    cmd.CommandText = "update vTherapy set Therapy=@Field2 where TherapyID= @Field1;" _
                            & "Select TherapyID,Therapy from vTherapy"

                Case "PackCode"
                    cmd.CommandText = "update vPackCode set PackCode=@Field2 where PackCodeID= @Field1;" _
                            & "Select PackCodeID,PackCode from vPackCode"

                Case "MfgCode"
                    cmd.CommandText = "update vMfgCode set MfgCode=@Field2 where MfgCodeID= @Field1;" _
                            & "Select MfgCodeID,MfgCode from vMfgCode"

                Case "BulkCode"
                    cmd.CommandText = "update vBulkCode set BulkCode=@Field2 where BulkCodeID= @Field1;" _
                            & "Select BulkCodeID,BulkCode from vBulkCode"

                Case "Dosage"
                    cmd.CommandText = "update vDosage set Dosage=@Field2 where DosageID= @Field1;" _
                            & "Select DosageID,Dosage from vDosage"

            End Select

            cmd.Parameters.Add("@Field1", SqlDbType.VarChar).Value = Field1
            cmd.Parameters.Add("@Field2", SqlDbType.VarChar).Value = Field2
            cmd.Parameters.Add("@Field3", SqlDbType.VarChar).Value = Field3

            Return GetData(cmd)
        Catch ex As Exception
            Return Nothing
        End Try
    End Function

    'Delete a record in database
    Public Function Delete(ByVal Field1 As String, ByVal Field2 As String, ByVal Field3 As String, ByVal TableName As String) As DataTable
        Try
            Dim cmd As New SqlCommand()
            cmd.CommandType = CommandType.Text
            Select Case TableName
                Case "BusinessUnit"
                    cmd.CommandText = "delete from vBusinessUnit where BusinessUnitID= @Field1;" _
                            & "Select BusinessUnitID,BusinessUnit from vBusinessUnit"

                Case "Department"
                    cmd.CommandText = "delete from vDepartment where DepartmentID= @Field1;" _
                            & "Select DepartmentID,Department from vDepartment"

                Case "Category"
                    cmd.CommandText = "delete from vCategory where CategoryID=@Field1;" & _
                                        "SELECT CategoryID, Category , vCategory.DepartmentID, Department FROM vCategory Inner Join vDepartment ON vCategory.DepartmentID=vDepartment.DepartmentID"

                Case "ExpenseHead"
                    cmd.CommandText = "delete from vExpenseHead where ExpenseHeadID= @Field1;" _
                            & "Select ExpenseHeadID,ExpenseHead,DirectIndirect from vExpenseHead"

                Case "Personnel"
                    cmd.CommandText = "delete from vPersonnel where PersonnelID= @Field1;" _
                            & "Select PersonnelID,Personnel,PersonnelEmail from vPersonnel"

                Case "Currency"
                    cmd.CommandText = "delete from vCurrency where CurrencyID= @Field1;" _
                            & "Select CurrencyID,Currency,CurrencyExchange from vCurrency"

                Case "Therapy"
                    cmd.CommandText = "delete from vTherapy where TherapyID= @Field1;" _
                            & "Select TherapyID,Therapy from vTherapy"

                Case "PackCode"
                    cmd.CommandText = "delete from vPackCode where PackCodeID= @Field1;" _
                            & "Select PackCodeID,PackCode from vPackCode"

                Case "MfgCode"
                    cmd.CommandText = "delete from vMfgCode where MfgCodeID= @Field1;" _
                            & "Select MfgCodeID,MfgCode from vMfgCode"

                Case "BulkCode"
                    cmd.CommandText = "delete from vBulkCode where BulkCodeID= @Field1;" _
                            & "Select BulkCodeID,BulkCode from vBulkCode"

                Case "Dosage"
                    cmd.CommandText = "delete from vDosage where DosageID= @Field1;" _
                            & "Select DosageID,Dosage from vDosage"

            End Select

            cmd.Parameters.Add("@Field1", SqlDbType.VarChar).Value = Field1
            cmd.Parameters.Add("@Field2", SqlDbType.VarChar).Value = Field2
            cmd.Parameters.Add("@Field3", SqlDbType.VarChar).Value = Field3
            Return GetData(cmd)
        Catch ex As Exception
            Return Nothing
        End Try
    End Function

    Public Function DeleteProject(ByVal ProjectID As Integer) As Integer
        Dim cmd As New SqlCommand
        Dim rowsAffected As Integer
        Using con As New SqlConnection(strConnString)
            cmd.CommandText = "cDeleteProject"
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.Add(New SqlParameter("@ProjectID", SqlDbType.Int, 2))
            cmd.Parameters("@ProjectID").Value = ProjectID
            cmd.Connection = con
            con.Open()
            rowsAffected = cmd.ExecuteNonQuery()
            con.Close()
        End Using
        Return rowsAffected
    End Function

End Class
