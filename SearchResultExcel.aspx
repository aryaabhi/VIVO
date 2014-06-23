<%@ Page Language="vb" AutoEventWireup="false" Inherits="SCLE.User.SearchResultExcel" CodeFile="SearchResultExcel.aspx.vb" %>
<HTML>
	<body>
		<form id="Form1" method="post" runat="server">
			<asp:Label id="HeaderLabel" runat="server" Font-Size="Medium" BackColor="White" Width="736px"
				CssClass="topheading" Font-Names="trebuchet ms, verdana, arial"></asp:Label>
			<P></P>
			<asp:datagrid id="ProjectDataGrid" OnItemDataBound="ProjectDataGrid_ItemDataBound" runat="server"
				BackColor="#ccccff" BorderColor="black" AllowSorting="True" CellPadding="3" CellSpacing="0"
				Font-Name="Verdana" Font-Size="7pt" HeaderStyle-BackColor="#003366" HeaderStyle-Font-Bold
				OnEditCommand="DBEditDataGrid_Edit" DataKeyField="ProjectID" HeaderStyle-ForeColor="#ffffff"
				MaintainViewState="false" AutoGenerateColumns="False" AlternatingItemStyle-BackColor="#ffffff">
				<Columns>
					<asp:BoundColumn HeaderText="Business" DataField="Business"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="BusinessForm" DataField="BusinessForm"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="TDC Element" DataField="CostBucket"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="TDC Sub Element" DataField="TDCSubElement"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Project Name" DataField="ProjectName"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Project Leader" DataField="ProjectLeader"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Total Savings $M" DataField="RecoverableLosses"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Time Savings Begin" DataField="SavingsStartMonthYearLiteral"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Probability" DataField="Probability"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Status" DataField="Status"></asp:BoundColumn>
				</Columns>
			</asp:datagrid>
		</form>
	</body>
</HTML>
