<%@ Page Language="vb" AutoEventWireup="false" Inherits="SCLE.User.outputexcel" CodeFile="SearchOutputExcel.aspx.vb" %>
<HTML>
	<body>
		<form id="Form1" method="post" runat="server">
			<asp:datagrid EnableViewState="false" id="ProjectDataGrid" runat="server" HeaderStyle-BackColor="#aaaadd"
				Font-Size="8pt" Font-Name="Verdana" CellSpacing="0" CellPadding="3" BorderColor="black" BackColor="#ccccff"
				OnItemDataBound="ProjectDataGrid_ItemDataBound"></asp:datagrid>
		</form>
	</body>
</HTML>
