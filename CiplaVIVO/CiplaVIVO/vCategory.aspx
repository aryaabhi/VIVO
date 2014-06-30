<%@ Page Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeBehind="vCategory.aspx.vb" Inherits="CiplaVIVO.vCategory" %>

	    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">                
            <div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
				<ContentTemplate>
					<asp:GridView ID="GridView1" runat="server" 
                        class="mGrid"
                        GridLines="None"  
                        PagerStyle-CssClass="pgr"  
                        AlternatingRowStyle-CssClass="alt"
                        AutoGenerateColumns = "false"     
                        AllowPaging ="true"  
                        ShowFooter = "true" 
                        OnPageIndexChanging = "OnPaging" 
                        onrowediting="EditRecord" 
                        onrowupdating="UpdateRecord"  
                        onrowcancelingedit="CancelEdit" 	
                        PageSize = "10" >
    			<Columns>
					<asp:TemplateField ItemStyle-Width = "30px"  HeaderText = "PlantID">
					    <ItemTemplate>
					        <asp:Label ID="txtField1" runat="server"
					        Text='<%# Eval("PlantID")%>'></asp:Label>
					    </ItemTemplate>
					    <FooterTemplate>
					        <asp:label ID="txtField1" text="PlantID" Width = "40px" MaxLength = "5" runat="server"></asp:label>
					    </FooterTemplate>
					</asp:TemplateField>
					
					<asp:TemplateField ItemStyle-Width = "100px"  HeaderText = "Plant/Location">
					    <ItemTemplate>
					        <asp:Label ID="txtField2" runat="server" Text='<%# Eval("Plant")%>'></asp:Label>
					    </ItemTemplate>
					    <EditItemTemplate>
					        <asp:TextBox ID="txtField2" runat="server" Text='<%# Eval("Plant")%>'></asp:TextBox>
					    </EditItemTemplate> 
					    <FooterTemplate>
					        <asp:TextBox ID="txtField2" runat="server"></asp:TextBox>
					    </FooterTemplate>
					</asp:TemplateField>
					
					<asp:TemplateField ItemStyle-Width = "150px"  HeaderText = "Category">
					    <ItemTemplate>
					        <asp:Label ID="txtField3" runat="server"
					            Text='<%# Eval("CategoryID")%>'></asp:Label>
					    </ItemTemplate>
					    <EditItemTemplate>
					        <asp:TextBox ID="txtField3" runat="server"
					            Text='<%# Eval("CategoryID")%>'></asp:TextBox>
					    </EditItemTemplate> 
					    <FooterTemplate>
					        <asp:TextBox ID="txtField3" runat="server"></asp:TextBox>
					    </FooterTemplate>
					</asp:TemplateField>
					
					<asp:TemplateField>
					    <ItemTemplate>
					        <asp:LinkButton ID="lnkRemove" runat="server"
					            CommandArgument = '<%# Eval("PlantID")%>'
					         OnClientClick = "return confirm('Do you want to delete?')"
					        Text = "Delete" OnClick = "DeleteRecord"></asp:LinkButton>
					    </ItemTemplate>

					    <FooterTemplate>
					        <asp:Button ID="btnAdd" runat="server" Text="Add"
					            OnClick = "AddRecord" />
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
</asp:Content>
