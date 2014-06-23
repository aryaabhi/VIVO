<%@ Page Language="vb" AutoEventWireup="false" Inherits="SCLE.User.ReportAllbyYearExcel" CodeFile="ReportAllByYearExcel.aspx.vb" %>
<HTML>
	<HEAD>
		<title>Project Report</title>
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<asp:Label id="HeaderLabel" runat="server" Font-Size="Medium" BackColor="White" Width="736px"
				CssClass="topheading" Font-Names="trebuchet ms, verdana, arial"></asp:Label>
			<asp:datagrid id="ProjectDataGrid" OnItemDataBound="ProjectDataGrid_ItemDataBound" runat="server"
				BackColor="#ccccff" BorderColor="black" CellPadding="3" CellSpacing="0" Font-Name="Verdana"
				Font-Size="7pt" HeaderStyle-BackColor="#003366" HeaderStyle-Font-Bold DataKeyField="ProjectID"
				HeaderStyle-ForeColor="#ffffff" EnableViewState="false" AutoGenerateColumns="False" AlternatingItemStyle-BackColor="#ffffff">
				<Columns>
					<asp:BoundColumn HeaderText="Business" DataField="Business"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="BusinessForm" DataField="BusinessForm"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="TDC Element" DataField="CostBucket"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="TDC Sub Element" DataField="TDCSubElement"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Project Name" DataField="ProjectName"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Project Leader" DataField="ProjectLeader"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Total Savings $M" DataFormatString="{0:C0}" DataField="RecoverableLosses"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Time Savings Begin" DataField="SavingsStartMonthYearLiteral"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Probability" DataFormatString="{0:N0}%" DataField="Probability"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Total (Time & Prob) Adjust $M" DataFormatString="{0:C0}" DataField="TotalAdjustedAmt"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="$/SU" DataFormatString="{0:F4}" DataField="DollarPerStat"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Status" DataField="Status"></asp:BoundColumn>
				</Columns>
			</asp:datagrid>
		</form>
	</body>
</HTML>
