<%@ Page Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeBehind="vBulkCode.aspx.vb" Inherits="CiplaVIVO.vBulkCode" %>
	    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">                
            <div class="row">
            <div class="panel panel-default">
                <div class="panel-heading">
                    BulkCode
                </div>
                <div class="panel-body">
                    <!--The GridView for the table-->

                    <asp:GridView ID="GridView1" runat="server" AllowSorting="true" OnSorting="SortData"
                            class="table table-striped table-bordered table-hover"
                            AutoGenerateColumns="false" 
                            AllowPaging ="true"  
                            ShowFooter = "true" 
                            OnPageIndexChanging = "OnPaging" 
                            onrowediting="EditRecord" 
                            onrowupdating="UpdateRecord"  
                            onrowcancelingedit="CancelEdit" 	
                            PageSize = "10" >
    			    <Columns>
					    <asp:TemplateField HeaderText = "BulkCodeID" SortExpression="BulkCodeID" ItemStyle-CssClass="hidden-phone" HeaderStyle-CssClass="hidden-phone" FooterStyle-CssClass="hidden-phone">
					        <ItemTemplate>
					            <asp:Label ID="txtField1" runat="server"
					            Text='<%# Eval("BulkCodeID")%>'></asp:Label>
					        </ItemTemplate>
					        <FooterTemplate>
					            <asp:label ID="txtField1" text="" MaxLength = "5" runat="server"></asp:label>
					        </FooterTemplate>
					    </asp:TemplateField>
					
					    <asp:TemplateField HeaderText = "BulkCode" SortExpression="BulkCode" FooterStyle-CssClass="hidden-phone">
					        <ItemTemplate>
					            <asp:Label ID="txtField2" runat="server" Text='<%# Eval("BulkCode")%>'></asp:Label>
					        </ItemTemplate>
					        <EditItemTemplate>
					            <asp:TextBox ID="txtField2" runat="server" Text='<%# Eval("BulkCode")%>'></asp:TextBox>
					        </EditItemTemplate> 
					        <FooterTemplate>
					            <asp:TextBox ID="txtField2" runat="server"></asp:TextBox>
					        </FooterTemplate>
					    </asp:TemplateField>
					
					    <asp:TemplateField ItemStyle-CssClass="hidden-phone" HeaderStyle-CssClass="hidden-phone" FooterStyle-CssClass="hidden-phone">
					        <ItemTemplate>
					            <asp:LinkButton ID="lnkRemove" runat="server"
					                CommandArgument = '<%# Eval("BulkCodeID")%>'
					                OnClientClick = "return confirm('Do you want to delete?')"
					            Text = "Delete" OnClick = "DeleteRecord"></asp:LinkButton>
					        </ItemTemplate>
					        <FooterTemplate>
					            <asp:Button ID="btnAdd" runat="server" Text="Add"
					                OnClick = "AddRecord" />
					        </FooterTemplate>
					    </asp:TemplateField>
					    <asp:CommandField  ShowEditButton="True" ItemStyle-CssClass="hidden-phone" HeaderStyle-CssClass="hidden-phone" FooterStyle-CssClass="hidden-phone" />
				    </Columns>
				    </asp:GridView>

                </div>
            </div>
        </div>
   </asp:Content>

