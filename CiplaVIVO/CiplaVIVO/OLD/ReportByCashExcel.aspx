<%@ Page Language="vb" AutoEventWireup="false" Inherits="SCLE.User.ReportByCashExcel" CodeFile="ReportByCashExcel.aspx.vb" %>
<HTML>
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
					<asp:BoundColumn HeaderText="Business" DataField="Business"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="BusinessForm" DataField="BusinessForm"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Cash Element" DataField="CashElement"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Cash Sub Element" DataField="CashSubElement"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Acct. Method" DataField="CashAccMethod"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Project Name" DataField="ProjectName"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Project Leader" DataField="ProjectLeader"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Total Savings $M" DataFormatString="{0:C0}" DataField="CashSavings"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Probability" DataFormatString="{0:N0}%" DataField="CashProbability"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Prob. Adjust $M" DataFormatString="{0:C0}" DataField="CashProbAdjAmt"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Status" DataField="Status"></asp:BoundColumn>
				</Columns>
			</asp:datagrid>
		
		</form>
	</body>
</HTML>