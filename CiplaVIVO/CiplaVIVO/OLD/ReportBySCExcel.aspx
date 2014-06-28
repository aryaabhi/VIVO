<%@ Page Language="vb" AutoEventWireup="false" Inherits="SCLE.User.ReportBySCExcel" CodeFile="ReportBySCExcel.aspx.vb" %>
<HTML>
	<body>
		<form id="Form1" method="post" runat="server">
				<asp:Label id="HeaderLabel" runat="server" Font-Size="Medium" BackColor="White" Width="736px"
					CssClass="topheading" Font-Names="trebuchet ms, verdana, arial"></asp:Label>
			<asp:datagrid id="ProjectDataGrid" OnItemDataBound="ProjectDataGrid_ItemDataBound" runat="server"
				BackColor="#ccccff" BorderColor="black"  CellPadding="3"
				CellSpacing="0" Font-Name="Verdana" Font-Size="7pt" HeaderStyle-BackColor="#003366" HeaderStyle-Font-Bold=True
			 DataKeyField="ProjectID"
				HeaderStyle-ForeColor="#ffffff" EnableViewState="false"  AutoGenerateColumns="False" AlternatingItemStyle-BackColor="#ffffff">
				<Columns>
					<asp:BoundColumn HeaderText="Business"  DataField="Business"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="BusinessForm"  DataField="BusinessForm"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Supply Chain"  DataField="SupplyChain"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="SC Element"  DataField="SCElement"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="SC Sub Element" DataField="SCSubElement"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Project Name" DataField="ProjectName"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Project Leader" DataField="ProjectLeader"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="SC Time Current" DataField="SCTimeCurrent"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="SC Time Expected" DataField="SCTimeExpected"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="SC Time Effect" DataField="SCTimeEffect"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Probability" DataFormatString="{0:N0}%" DataField="SCProbability"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Status" DataField="Status"></asp:BoundColumn>
					
				</Columns>
			</asp:datagrid>
		</form>
	</body>
</HTML>
