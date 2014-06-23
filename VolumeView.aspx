<%@ Page Language="vb" AutoEventWireup="false" Inherits="SCLE.User.VolumeView" CodeFile="VolumeView.aspx.vb" %>
<HTML>
	<body>
		<form id="Form1" method="post" runat="server">
			<asp:Button ID="ExcelExport" runat="server" Text="Export to excel" OnClick="SubmitBtn_Click"></asp:Button>
			<h3><font face="Verdana">Total Business Volumes</font></h3>
			<ASP:DataGrid id="MyDataGrid1" runat="server" BackColor="#ccccff" BorderColor="black" ShowFooter="false"
				CellPadding="3" CellSpacing="0" Font-Name="Verdana" Font-Size="8pt" HeaderStyle-BackColor="#aaaadd"
				EnableViewState="false" />
			<h3><font face="Verdana">Business Volumes - By Business Forms</font></h3>
			<ASP:DataGrid id="MyDataGrid" runat="server" BackColor="#ccccff" BorderColor="black" ShowFooter="false"
				CellPadding="3" CellSpacing="0" Font-Name="Verdana" Font-Size="8pt" HeaderStyle-BackColor="#aaaadd"
				EnableViewState="false" />
		</form>
	</body>
</HTML>
