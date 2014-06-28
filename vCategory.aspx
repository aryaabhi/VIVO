<%@ Page Language="vb" AutoEventWireup="false" Inherits="SCLE.Admin.vCategory" CodeFile="vCategory.aspx.vb" %>
<HTML>
	<body>
		<div>
			<asp:ScriptManager ID="ScriptManager1" runat="server">
        	</asp:ScriptManager>
        	<asp:UpdatePanel ID="UpdatePanel1" runat="server">
				<ContentTemplate>
					<asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns = "false" Width = "550px" Font-Names = "Arial" Font-Size = "11pt" AlternatingRowStyle-BackColor = "#C2D69B" HeaderStyle-BackColor = "green" AllowPaging ="true"  ShowFooter = "true" OnPageIndexChanging = "OnPaging" onrowediting="EditCustomer" onrowupdating="UpdateCustomer"  onrowcancelingedit="CancelEdit" 	PageSize = "10" >
				
				<Columns>
					<asp:TemplateField ItemStyle-Width = "30px"  HeaderText = "PlantID">
					    <ItemTemplate>
					        <asp:Label ID="PlantID" runat="server"
					        Text='<%# Eval("PlantID")%>'></asp:Label>
					    </ItemTemplate>
					    <FooterTemplate>
					        <asp:TextBox ID="txtPlantID" Width = "40px" MaxLength = "5" runat="server"></asp:TextBox>
					    </FooterTemplate>
					</asp:TemplateField>
					
					<asp:TemplateField ItemStyle-Width = "100px"  HeaderText = "Name">
					    <ItemTemplate>
					        <asp:Label ID="lblPlantName" runat="server" Text='<%# Eval("Plant")%>'></asp:Label>
					    </ItemTemplate>
					    <EditItemTemplate>
					        <asp:TextBox ID="txtPlantName" runat="server" Text='<%# Eval("Plant")%>'></asp:TextBox>
					    </EditItemTemplate> 
					    <FooterTemplate>
					        <asp:TextBox ID="txtPlantName" runat="server"></asp:TextBox>
					    </FooterTemplate>
					</asp:TemplateField>
					
					<asp:TemplateField ItemStyle-Width = "150px"  HeaderText = "Company">
					    <ItemTemplate>
					        <asp:Label ID="Category" runat="server"
					            Text='<%# Eval("CategoryID")%>'></asp:Label>
					    </ItemTemplate>
					    <EditItemTemplate>
					        <asp:TextBox ID="txtCategory" runat="server"
					            Text='<%# Eval("CategoryID")%>'></asp:TextBox>
					    </EditItemTemplate> 
					    <FooterTemplate>
					        <asp:TextBox ID="txtCategory" runat="server"></asp:TextBox>
					    </FooterTemplate>
					</asp:TemplateField>
					
					<asp:TemplateField>
					    <ItemTemplate>
					        <asp:LinkButton ID="lnkRemove" runat="server"
					            CommandArgument = '<%# Eval("PlantID")%>'
					         OnClientClick = "return confirm('Do you want to delete?')"
					        Text = "Delete" OnClick = "DeletePlant"></asp:LinkButton>
					    </ItemTemplate>
					    <FooterTemplate>
					        <asp:Button ID="btnAdd" runat="server" Text="Add"
					            OnClick = "AddNewPlant" />
					    </FooterTemplate>
					</asp:TemplateField>
					
					<asp:CommandField  ShowEditButton="True" />
				</Columns>
				<AlternatingRowStyle BackColor="#C2D69B"  />
				</asp:GridView>
			</ContentTemplate>
				<Triggers>
				<asp:AsyncPostBackTrigger ControlID = "GridView1" />
			</Triggers>
		</asp:UpdatePanel>
	</div>