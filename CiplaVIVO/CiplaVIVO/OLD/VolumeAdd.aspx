<%@ Page Language="vb" AutoEventWireup="false" Inherits="SCLE.User.VolumeAdd" CodeFile="VolumeAdd.aspx.vb" %>
<HTML>
	<body style="FONT: 10pt verdana">
		<form runat="server" ID="Form1">
			<h3><font face="Verdana">Updating Business Volume</font></h3>
			<span id="Message" EnableViewState="false" runat="server" /><p>
				<ASP:DataGrid id="MyDataGrid" runat="server" AlternatingItemStyle-BackColor="#ffffff" Width="800"
					BackColor="#ccccff" BorderColor="black" ShowFooter="false" CellPadding="3" CellSpacing="0"
					Font-Name="Verdana" Font-Size="8pt" HeaderStyle-BackColor="#aaaadd" OnEditCommand="MyDataGrid_Edit"
					OnCancelCommand="MyDataGrid_Cancel" OnUpdateCommand="MyDataGrid_Update" DataKeyField="BusinessForm"
					AutoGenerateColumns="false" OnItemDataBound="MyDataGrid_ItemDataBound">
					<Columns>
						<asp:BoundColumn HeaderText="Business" ReadOnly="True" DataField="Business" ItemStyle-Wrap="false" />
						<asp:BoundColumn HeaderText="Business Form" ReadOnly="True" DataField="BusinessForm" />
						<asp:BoundColumn HeaderText="Business Volume" DataField="Volume" />
						<asp:EditCommandColumn EditText="Edit" CancelText="Cancel" UpdateText="Update" ItemStyle-Wrap="false" />
					</Columns>
				</ASP:DataGrid>
		</form>
		</P>
	</body>
</HTML>
