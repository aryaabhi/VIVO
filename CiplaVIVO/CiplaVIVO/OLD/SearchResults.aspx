<%@ Page Language="vb" AutoEventWireup="false" Inherits="SCLE.User.SearchResults" CodeFile="SearchResults.aspx.vb" %>
<HTML>
	<body>
		<form id="Form1" method="post" runat="server">
			<P>
				<asp:Label id="HeaderLabel" runat="server" Font-Size="Medium" BackColor="White" Width="736px"
					CssClass="topheading" Font-Names="trebuchet ms, verdana, arial"></asp:Label></P>
			<P>
				<asp:Button ID="ExcelExport" runat="server" Text="Export to excel" OnClick="SubmitBtn_Click"></asp:Button>
				<asp:datagrid id="ProjectDataGrid" OnItemDataBound="ProjectDataGrid_ItemDataBound" runat="server"
					BackColor="#ccccff" BorderColor="black" OnSortCommand="SortData" AllowSorting="True" CellPadding="3"
					CellSpacing="0" Font-Name="Verdana" Font-Size="7pt" HeaderStyle-BackColor="#003366" HeaderStyle-Font-Bold
					OnEditCommand="DBEditDataGrid_Edit" DataKeyField="ProjectID" HeaderStyle-ForeColor="#ffffff"
					MaintainViewState="false" AutoGenerateColumns="False" AlternatingItemStyle-BackColor="#ffffff">
					<Columns>
						<asp:BoundColumn HeaderText="Business" SortExpression="Business" DataField="Business"></asp:BoundColumn>
						<asp:BoundColumn HeaderText="BusinessForm" SortExpression="BusinessForm" DataField="BusinessForm"></asp:BoundColumn>
						<asp:BoundColumn HeaderText="TDC Element" SortExpression="CostBucket" DataField="CostBucket"></asp:BoundColumn>
						<asp:BoundColumn HeaderText="TDC Sub Element" SortExpression="TDCSubElement" DataField="TDCSubElement"></asp:BoundColumn>
						<asp:hyperlinkcolumn DataNavigateUrlField="ProjectID" DataNavigateUrlFormatString="projectModification.aspx?ProjectID={0}"
						DataTextField="ProjectName" Target="_blank" SortExpression="ProjectName" HeaderText="Project Name (Click on Name to Edit)"></asp:hyperlinkcolumn>
						<asp:BoundColumn HeaderText="Project Leader" SortExpression="tblPersonnel.FirstName" DataField="ProjectLeader"></asp:BoundColumn>
						<asp:BoundColumn HeaderText="Total Savings $M" SortExpression="RecoverableLosses DESC" DataField="RecoverableLosses"></asp:BoundColumn>
						<asp:BoundColumn HeaderText="Time Savings Begin" SortExpression="SavingsStartMonthYearLiteral" DataField="SavingsStartMonthYearLiteral"></asp:BoundColumn>
						<asp:BoundColumn HeaderText="Probability" SortExpression="Probability" DataField="Probability"></asp:BoundColumn>
						<asp:BoundColumn HeaderText="Status" SortExpression="Status" DataField="Status"></asp:BoundColumn>
					</Columns>
				</asp:datagrid>
		</form>
		</P>
	</body>
</HTML>
