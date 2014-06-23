<%@ Page Language="vb" AutoEventWireup="false" Inherits="SCLE.User.searchoutput" CodeFile="SearchOutput.aspx.vb" %>
<HTML>
	<HEAD>
		<title>projectlist</title>
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<asp:Button id="ExcelExport" onclick="SubmitBtn_Click" runat="server" Text="Export to excel"></asp:Button>
			<asp:datagrid id="ProjectDataGrid" runat="server" HeaderStyle-BackColor="#aaaadd" Font-Size="8pt"
				Font-Name="Verdana" CellSpacing="0" CellPadding="3" BorderColor="black" BackColor="#ccccff"
				OnItemDataBound="ProjectDataGrid_ItemDataBound"></asp:datagrid>
			<asp:datagrid id="SumDataGrid" runat="server" HeaderStyle-BackColor="#aaaadd" Font-Size="8pt"
				Font-Name="Verdana" CellSpacing="0" CellPadding="3" BorderColor="black" BackColor="#ccccff"></asp:datagrid>
		</form>
		<p>
			&nbsp;
		</p>
	</body>
</HTML>
