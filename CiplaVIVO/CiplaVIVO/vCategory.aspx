<%@ Page Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeBehind="vCategory.aspx.vb" Inherits="CiplaVIVO.vCategory" %>
	    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">                
          <div id="dvGrid" class="grid-contenttemplate">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
				<ContentTemplate>
                   <asp:GridView ID="GridView1" runat="server" Class="footable" AutoGenerateColumns="false" 
                        AllowPaging ="true"  
                        ShowFooter = "true" 
                        OnPageIndexChanging = "OnPaging" 
                        onrowediting="EditRecord" 
                        onrowupdating="UpdateRecord"  
                        onrowcancelingedit="CancelEdit" 	
                        PageSize = "10" >
    			<Columns>
					<asp:TemplateField HeaderText  = "PlantID">
					    <ItemTemplate>
					        <asp:Label ID="txtField1" runat="server"
					        Text='<%# Eval("PlantID")%>'></asp:Label>
					    </ItemTemplate>
					    <FooterTemplate>
					        <asp:label ID="txtField1" text="PlantID" MaxLength = "5" runat="server"></asp:label>
					    </FooterTemplate>
					</asp:TemplateField>
					
					<asp:TemplateField HeaderText = "Plant/Location">
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
					
					<asp:TemplateField HeaderText = "Category">
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
					<asp:CommandField ShowEditButton="True" />
				</Columns>
				</asp:GridView>
			</ContentTemplate>
				<Triggers>
				<asp:AsyncPostBackTrigger ControlID = "GridView1" />
			</Triggers>
		</asp:UpdatePanel>
            </div>
            <script type="text/javascript">

                $(function () {
                    $(<%=GridView1.ClientID %>).footable();
        });


    </script>

    </asp:Content>

