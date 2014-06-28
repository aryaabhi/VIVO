<%@ Page Language="vb" AutoEventWireup="false" Inherits="SCLE.Admin.tblBusiness" CodeFile="tblBusiness.aspx.vb" %>
<HTML>
	<body>
		<center>
			<form runat="server" ID="Form1">
				<h3>Manage Business / Brand</h3>
				<asp:datagrid id="datagrid1" runat="server" Font-Size="8pt" Font-Name="verdana" Cellpadding="3"
					onUpdateCommand="UpdateXML" OnCancelCommand="cancelEdit" onEditCommand="setEditMode" AutoGenerateColumns="False"
					onDeleteCommand="delXML" ShowFooter="True" DataKeyField="value" onItemCommand="doInsert" BackColor="#ccccff"
					Font-Names="verdana" BorderStyle="None" CellSpacing="2">
					<FooterStyle forecolor="#ccccff" backcolor="#cccccc"></FooterStyle>
					<HeaderStyle font-size="8pt" font-names="Arial" font-bold="True" horizontalalign="Center" forecolor="White"
						backcolor="#3399cc"></HeaderStyle>
					<PagerStyle horizontalalign="Center" forecolor="#cccccc" mode="NumericPages"></PagerStyle>
					<SelectedItemStyle font-bold="True" forecolor="White" backcolor="#cccccc"></SelectedItemStyle>
					<ItemStyle forecolor="#333399" backcolor="#ccccff"></ItemStyle>
					<Columns>
						<asp:TemplateColumn HeaderText="Sub GBU">
							<ItemTemplate>
								<%# DataBinder.Eval(Container.DataItem,"SubGBU") %>
							</ItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="SubGBU_Add" runat="server" Columns="20" />
							</FooterTemplate>
							<EditItemTemplate>
								<asp:Textbox runat="server" Columns="20" id="SubGBU_edit" Text='<%# DataBinder.Eval(Container.DataItem,"SubGBU") %>' />
							</EditItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Business">
							<ItemTemplate>
								<%# DataBinder.Eval(Container.DataItem,"Value") %>
							</ItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="Business_add" runat="server" Columns="10" />
							</FooterTemplate>
							<EditItemTemplate>
								<asp:Textbox runat="server" Columns="15" id="Business_edit" Text='<%# DataBinder.Eval(Container.DataItem,"Value") %>' />
							</EditItemTemplate>
						</asp:TemplateColumn>
						<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="Update" CancelText="Cancel" EditText="Edit"
							HeaderText="Edit"></asp:EditCommandColumn>
						<asp:TemplateColumn HeaderText="Delete">
							<ItemTemplate>
								<asp:LinkButton runat="Server" Text="Delete" CommandName="Delete" ID="Linkbutton1" NAME="Linkbutton1" />
							</ItemTemplate>
							<FooterTemplate>
								<asp:LinkButton Text="Add" Runat="Server" CommandName="doAdd" ID="Linkbutton2" NAME="Linkbutton2" />
							</FooterTemplate>
						</asp:TemplateColumn>
					</Columns>
				</asp:datagrid>
				<asp:DataGrid id="datagrid2" runat="server" Font-Size="8pt" AutoGenerateColumns="False" Font-Name="verdana"
					Cellpadding="3" BackColor="#ccccff" Font-Names="verdana" BorderStyle="None" CellSpacing="2">
					<HeaderStyle font-size="8pt" font-names="Arial" font-bold="True" horizontalalign="Center" forecolor="White"
						backcolor="#3399cc"></HeaderStyle>
					<Columns>
						<asp:BoundColumn HeaderText="Sub GBU's Available for reference" SortExpression="value" DataField="value"></asp:BoundColumn>
					</Columns>
				</asp:DataGrid>
				<asp:Label id="error1" runat="server" visible="False" font-names="Tahoma" bordercolor="#FFC080"
					font-size="Smaller" font-bold="True" forecolor="Red" tooltip="Id must be unique" backcolor="White"
					width="161px">Error!
            Id must be unique</asp:Label>
				<asp:Label id="error3" runat="server" visible="False" font-names="Tahoma" bordercolor="#FFC080"
					font-size="Smaller" font-bold="True" forecolor="Red" tooltip="The Record you are updating has been deleted by another user!"
					backcolor="White" width="402px">Error! The Record you are updating has been deleted by another user!</asp:Label>
				<asp:Label id="error4" runat="server" visible="False" font-names="Tahoma" bordercolor="#FFC080"
					font-size="Smaller" font-bold="True" forecolor="Red" tooltip="The Record you are trying to Edit has been deleted by another user!"
					backcolor="White" width="402px">Error! The Record you are trying to Edit has been deleted by another user!</asp:Label>
				<asp:Label id="error5" runat="server" visible="False" font-names="Tahoma" bordercolor="#FFC080"
					font-size="Smaller" font-bold="True" forecolor="Red" tooltip="The Record cannot be deleted while in Edit Mode"
					backcolor="White" width="402px">Error! The Record cannot be deleted while in Edit Mode</asp:Label>
			</form>
		</center>
	</body>
</HTML>
