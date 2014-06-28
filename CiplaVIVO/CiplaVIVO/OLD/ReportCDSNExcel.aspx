<%@ Page Language="vb" AutoEventWireup="false" Inherits="SCLE.User.ReportCDSNExcel" CodeFile="ReportCDSNExcel.aspx.vb" %>
<HTML>
	<HEAD>
		<title>Project Report</title>
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<asp:Label id="HeaderLabel" runat="server" Font-Size="Medium" BackColor="White" Width="736px"
				CssClass="topheading" Font-Names="trebuchet ms, verdana, arial"></asp:Label>
				<asp:datagrid id="ProjectDataGrid" OnItemDataBound="ProjectDataGrid_ItemDataBound" runat="server"
				BackColor="#ccccff" BorderColor="black" CellPadding="3"
				CellSpacing="0" Font-Name="Verdana" Font-Size="7pt" HeaderStyle-BackColor="#003366" HeaderStyle-Font-Bold=True
				DataKeyField="ProjectID"
				HeaderStyle-ForeColor="#ffffff" EnableViewState="false" AutoGenerateColumns="False" AlternatingItemStyle-BackColor="#ffffff">
				<Columns>
					<asp:BoundColumn HeaderText="Project Name" DataField="ProjectName"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Project Leader" DataField="ProjectLeader"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Time Savings Begin" DataField="SavingsStartMonthYearLiteral"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Total (Time & Prob) Adjust $M" DataFormatString="{0:C0}" DataField="TotalAdjustedAmt"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="NOS(msu)" DataFormatString="{0:C0}" DataField="NOSAddition"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Customer ($mm)" DataFormatString="{0:C0}" DataField="ProbAdjAmt"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Cash ($mm)" DataFormatString="{0:C0}" DataField="CashProbAdjAmt"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Time (days)" DataField="SCTimeEffect"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Status" DataField="Status"></asp:BoundColumn>
				</Columns>
			</asp:datagrid>
			
		</form>
	</body>
</HTML>
