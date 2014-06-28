<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Page Language="VB"%>
<HTML>
	<script language="VB" runat="server">
	
	Dim MyConnection As OleDbConnection
	Dim connstring as string
		
	Sub Page_Load(Src as object, E as EventArgs)
	        connstring = ConfigurationSettings.AppSettings("AccessConnectionString")
	        '		MyConnection = New SqlConnection(connstring)
		If Not (IsPostBack)
            BindGrid()
            PopulateDropDown1()
        End If
	End Sub

    Sub MyDataGrid_Edit(Sender As Object, E As DataGridCommandEventArgs)
		PopulateDropDown()
        MyDataGrid.EditItemIndex = CInt(E.Item.ItemIndex)
        BindGrid()
    End Sub

    Sub MyDataGrid_Cancel(Sender As Object, E As DataGridCommandEventArgs)
        MyDataGrid.EditItemIndex = -1
        BindGrid()
    End Sub
    
    Protected TempDataView1 As DataView = New DataView()
	
	Sub PopulateDropDown()
		Dim myDataSet as DataSet
		myDataSet = New DataSet()
		myDataSet.ReadXml(Server.MapPath("tblTeamGroups.xml"))
		TempDataView1 = myDataSet.Tables("tblTeamGroups").DefaultView	
	End Sub
	
	Sub PopulateDropDown1()
		Dim myDataSet as DataSet
		myDataSet = New DataSet()
		myDataSet.ReadXml(Server.MapPath("tblTeamGroups.xml"))
		GroupName.DataSource = myDataSet.Tables("tblTeamGroups").DefaultView	
		GroupName.DataBind()
		GroupName.Items.Insert(0,"")
	End Sub

    Sub MyDataGrid_Update(Sender As Object, E As DataGridCommandEventArgs)

        Dim DS As DataSet
        Dim MyCommand As OleDBCommand
		Dim TempList As DropDownList
		Dim TempValue As String
		Dim CurrentTextBox As TextBox
        Dim ColValue As String  
        
		Dim a0 as Integer  = MyDataGrid.DataKeys(CInt(E.Item.ItemIndex))
		Dim x1 as string = MyDataGrid.DataKeys(E.Item.ItemIndex)

        CurrentTextBox = E.Item.Cells(2).Controls(0)
        ColValue = CurrentTextBox.Text    
        Dim a1 as String = ColValue
            
        CurrentTextBox = E.Item.Cells(3).Controls(0)
        ColValue = CurrentTextBox.Text    
        Dim a2 as String  = ColValue
   
        TempList = E.Item.FindControl("TeamGroupName")
		Dim a3 as String  = TempList.SelectedItem.Value
		
		Dim a4 as String = a2 & " " & a1
		
        Dim UpdateCmd As String = "UPDATE tblPersonnel SET LastName = '" & a2 & "', FirstName = '" & a1 & "', TeamGroupID='" & a3 & "' where PersonnelID = " & a0
        
        MyCommand = New OleDBCommand(UpdateCmd, MyConnection)
		MyCommand.Connection.Open()
        MyCommand.ExecuteNonQuery()
        
        Dim objdata as New DataSet
        objdata.ReadXML(Server.Mappath("tblPersonnel.xml"))
        objdata.Tables("tblPersonnel").DefaultView.RowFilter="PersonnelID='" & x1 & "'"
        If objdata.Tables("tblPersonnel").DefaultView.Count>0 Then
           objdata.Tables("tblPersonnel").DefaultView.Delete(0)
        End If
        objdata.Tables("tblPersonnel").DefaultView.RowFilter=""
		Dim dr as DataRow
		dr=objdata.Tables("tblPersonnel").NewRow()

		dr(0)=a0
		dr(1)=a3
		dr(2)=a4
		objdata.Tables("tblPersonnel").Rows.Add(dr)
		objdata.WriteXML(Server.mappath("tblPersonnel.xml"))
        
		MyDataGrid.EditItemIndex = -1
        MyCommand.Connection.Close()
        BindGrid()
        
    End Sub
    
    Sub MyDataGrid_Insert(sender As Object, e As System.EventArgs)

        Dim DS As DataSet
        Dim MyCommand As OleDBCommand
        Dim FullName as String
		FullName = LastName.Text & " " & FirstName.Text
        Dim UpdateCmd As String = "Insert into tblPersonnel (LastName,FirstName,TeamGroupID) Values (@LastName,@FirstName,@TeamGroupID)"

        MyCommand = New OleDBCommand(UpdateCmd, MyConnection)
        
        With MyCommand.Parameters
	        .Add(New OleDbParameter("@LastName",LastName.Text))
	        .Add(New OleDbParameter("@FirstName",FirstName.Text))
	        .Add(New OleDbParameter("@TeamGroupID",GroupName.SelectedItem.Value))
	    End With
	   
        MyCommand.Connection.Open()
        MyCommand.ExecuteNonQuery()
        MyDataGrid.EditItemIndex = -1
        MyCommand = New OleDbCommand("SELECT @@IDENTITY", MyConnection) 
        Dim nId as integer = CInt(MyCommand.ExecuteScalar())
        MyCommand.Connection.Close()
        
        Dim objdata as New DataSet
		Dim dr as DataRow

		objdata.ReadXML(Server.Mappath("tblPersonnel.xml"))
		objdata.Tables("tblPersonnel").DefaultView.RowFilter=""
		dr=objdata.Tables("tblPersonnel").NewRow()

		dr(0)=nId
		dr(1)=GroupName.SelectedItem.Value
		dr(2)=FullName
		objdata.Tables("tblPersonnel").Rows.Add(dr)
		objdata.WriteXML(Server.mappath("tblPersonnel.xml"))
        
        
        BindGrid()
        
        LastName.Text =""
        FirstName.Text=""
       
    End Sub

    Sub MyDataGrid_ItemDataBound(Sender As Object, E As DataGridItemEventArgs)
        If (e.Item.ItemType = ListItemType.EditItem) Then
            Dim i As Integer
            For i = 0 To e.Item.Controls.Count-1
                Try
                    If (e.Item.Controls(i).Controls(0).GetType().ToString() = "System.Web.UI.WebControls.TextBox") Then
                        Dim tb As TextBox
                        tb = e.Item.Controls(i).Controls(0)
                        tb.Text = Server.HtmlDecode(tb.Text)
                    End If
                Catch
                
                End Try
            Next
        End If
    End Sub

    Sub BindGrid()
		Dim objCommand As OleDbCommand
		Dim objDataReader As OleDbDataReader
		Dim SQLText As String
		SQLText = "SELECT PersonnelID, FirstName, LastName, tblTeamGroups.TeamGroupName FROM tblPersonnel, tblTeamGroups WHERE tblTeamGroups.TeamGroupID = tblPersonnel.TeamGroupID ORDER BY FirstName" 
		objCommand = New OleDbCommand(SQLText, MyConnection)
		MyConnection.Open()
		objDataReader = objCommand.ExecuteReader(CommandBehavior.CloseConnection)
		MyDataGrid.DataSource = objDataReader
		MyDataGrid.DataBind()
		MyConnection.Close()
    End Sub

    Sub MyDataGrid_Delete(source As Object, E As DataGridCommandEventArgs)
		Dim objCommand As OleDbCommand
		Dim objDataReader As OleDbDataReader
		Dim SQLText As String
		Dim x1 as string
	    x1=MyDataGrid.DataKeys(E.Item.ItemIndex)
	    
		SQLText = "DELETE * FROM tblPersonnel WHERE PersonnelID = " & MyDataGrid.DataKeys(E.Item.ItemIndex)
			
		objCommand = New OleDbCommand(SQLText, MyConnection)
		MyConnection.Open()
		objCommand.ExecuteNonQuery()
		MyConnection.Close()
		
		Dim objdata as New DataSet
        objdata.ReadXML(Server.Mappath("tblPersonnel.xml"))
        objdata.Tables("tblPersonnel").DefaultView.RowFilter="PersonnelID='" & x1 & "'"
        If objdata.Tables("tblPersonnel").DefaultView.Count>0 Then
           objdata.Tables("tblPersonnel").DefaultView.Delete(0)
        End If
        objdata.Tables("tblPersonnel").DefaultView.RowFilter=""
        objdata.WriteXML(Server.mappath("tblPersonnel.xml"))  	
		
		' Refresh our Datagrid to show the record is gone
		BindGrid()
			
	End Sub
		

	</script>
	<body style="FONT: 10pt verdana">
		<form id="Form1" runat="server">
			<h3><font face="Verdana">Manage Personnel</font></h3>
				<TABLE id="Table1" borderColor="black" cellSpacing="0" cellPadding="0" width="800" border="1">
					<TR>
						<TD class="Heading" bgColor="#aaaadd" colSpan="3">Insert New Personnel</TD>
					</TR>
					<TR>
						<TD bgColor="#ccccff">First Name:
							<asp:textbox id="FirstName" runat="server" Width="176px" CssClass="TextBox" Height="21px"></asp:textbox></TD>
						<TD bgColor="#ccccff">Last Name:
							<asp:textbox id="LastName" runat="server" Width="176px" CssClass="TextBox" Height="21px"></asp:textbox></TD>
						<td bgColor="#ccccff" width="253">Group Name:&nbsp;&nbsp; &nbsp;
							<asp:dropdownlist id="GroupName" CssClass="TextBox" datatextfield="TeamGroupName" datavaluefield="TeamGroupID"
								Runat="server"></asp:dropdownlist></td>
					</TR>
					<TR>
						<TD Colspan="3" bgColor="#ccccff">
							<P align="center"><asp:linkbutton id="Insert" onclick="MyDataGrid_Insert" runat="server" Width="80px">Insert Record</asp:linkbutton></P>
						</TD>
					</TR>
				</TABLE>
			<span id="Message" runat="server" EnableViewState="false"></span>
			<P><ASP:DATAGRID id="MyDataGrid" runat="server" OnDeleteCommand="MyDataGrid_Delete" Width="800" BackColor="#ccccff"
					BorderColor="black" ShowFooter="false" CellPadding="3" CellSpacing="0" Font-Name="Verdana"
					Font-Size="8pt" HeaderStyle-BackColor="#aaaadd" OnEditCommand="MyDataGrid_Edit" OnCancelCommand="MyDataGrid_Cancel"
					OnUpdateCommand="MyDataGrid_Update" DataKeyField="PersonnelID" AutoGenerateColumns="false" OnItemDataBound="MyDataGrid_ItemDataBound">
					<Columns>
						<asp:EditCommandColumn EditText="Edit" CancelText="Cancel" UpdateText="Update" ItemStyle-Wrap="false" />
						<asp:BoundColumn HeaderText="Personnel ID" SortExpression="PersonnelID" ReadOnly="True" DataField="PersonnelID"
							ItemStyle-Wrap="false" />
						<asp:BoundColumn HeaderText="First Name" SortExpression="FirstName" DataField="FirstName" />
						<asp:BoundColumn HeaderText="Last Name" SortExpression="LastName" DataField="LastName" />
						<asp:TemplateColumn HeaderText="Team Group Name" SortExpression="TeamGroupName">
							<ItemTemplate>
								<asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "TeamGroupName") %>' ID="Label4"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:DropDownList id="TeamGroupName" runat="server" datavaluefield="TeamGroupID" datatextfield="TeamGroupName" DataSource="<%#TempDataView1%>"/>
							</EditItemTemplate>
						</asp:TemplateColumn>
						<asp:ButtonColumn Text="Delete" CommandName="Delete" />
					</Columns>
				</ASP:DATAGRID></P>
		</form>
	</body>
</HTML>
