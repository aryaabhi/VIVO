<%@ Page Language="vb" AutoEventWireup="false" Inherits="SCLE.User.ReportAllByYear" CodeFile="ReportAllByYear.aspx.vb" %>
<HTML>
	<HEAD>
		<title>Project Report</title>
		<script language="javascript">
			function confirm_delete()
			{
			if (confirm("Are you sure you want to delete this Project?")==true)
				return true;
			else
				return false;
			}
		</script>
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<P>
				<asp:Label id="HeaderLabel" runat="server" Font-Size="Medium" BackColor="White" Width="736px"
					CssClass="topheading" Font-Names="trebuchet ms, verdana, arial"></asp:Label></P>
			<P>
				<asp:Button ID="ExcelExport" runat="server" Text="Export to excel" OnClick="SubmitBtn_Click"></asp:Button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Select 
				Financial Year&nbsp;&nbsp;
				<asp:DropDownList id="cboYear" runat="server">
					<asp:ListItem Value=""></asp:ListItem>
					<asp:ListItem Value="2012">2012-13</asp:ListItem>
					<asp:ListItem Value="2013">2013-14</asp:ListItem>
					<asp:ListItem Value="2014">2014-15</asp:ListItem>
					<asp:ListItem Value="2015">2015-16</asp:ListItem>
					<asp:ListItem Value="2016">2016-17</asp:ListItem>
					<asp:ListItem Value="2017">2017-18</asp:ListItem>
					<asp:ListItem></asp:ListItem>
				</asp:DropDownList>
				<asp:Button id="Go" OnClick="Year_Refresh" runat="server" Text="Go"></asp:Button></P>
			<asp:datagrid id="ProjectDataGrid" OnItemDataBound="ProjectDataGrid_ItemDataBound" runat="server"
				BackColor="#ccccff" BorderColor="black" OnSortCommand="SortData" AllowSorting="True" CellPadding="3"
				CellSpacing="0" Font-Name="Verdana" Font-Size="7pt" HeaderStyle-BackColor="#003366" HeaderStyle-Font-Bold
				OnEditCommand="DBEditDataGrid_Edit" OnDeleteCommand="DBDelDataGrid_Delete" DataKeyField="ProjectID"
				HeaderStyle-ForeColor="#ffffff" MaintainViewState="false" AutoGenerateColumns="False" AlternatingItemStyle-BackColor="#ffffff">
				<Columns>
					<asp:BoundColumn HeaderText="Business" SortExpression="Business" DataField="Business"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="BusinessForm" SortExpression="BusinessForm" DataField="BusinessForm"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="TDC Element" SortExpression="CostBucket" DataField="CostBucket"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="TDC Sub Element" SortExpression="TDCSubElement" DataField="TDCSubElement"></asp:BoundColumn>
					<asp:hyperlinkcolumn DataNavigateUrlField="ProjectID" DataNavigateUrlFormatString="projectModification.aspx?ProjectID={0}"
						DataTextField="ProjectName" Target="_blank" SortExpression="ProjectName" HeaderText="Project Name (Click on Name to Edit)"></asp:hyperlinkcolumn>
					<asp:BoundColumn HeaderText="Project Leader" DataField="ProjectLeader"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Total Savings $M" DataFormatString="{0:C0}" SortExpression="RecoverableLosses DESC"
						DataField="RecoverableLosses"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Time Savings Begin" SortExpression="SavingsStartMonthYearLiteral" DataField="SavingsStartMonthYearLiteral"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Probability" DataFormatString="{0:N0}%" SortExpression="Probability"
						DataField="Probability"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Total (Time & Prob) Adjust $M" DataFormatString="{0:C0}" SortExpression="TotalAdjustedAmt DESC"
						DataField="TotalAdjustedAmt"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="$/SU" DataFormatString="{0:F4}" DataField="DollarPerStat"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Status" SortExpression="Status" DataField="Status"></asp:BoundColumn>
					<asp:TemplateColumn>
						<ItemTemplate>
							<asp:LinkButton id="btnDelete" runat="server" Text="Delete" CommandName="Delete" />
						</ItemTemplate>
					</asp:TemplateColumn>
				</Columns>
			</asp:datagrid>
			<asp:Label Runat="server" ID="TestOut"></asp:Label>
			<asp:datagrid id="SumDataGrid" runat="server" BackColor="#ccccff" BorderColor="black" CellPadding="3"
				CellSpacing="0" Font-Name="Verdana" Font-Size="8pt" HeaderStyle-BackColor="#aaaadd" MaintainViewState="false"></asp:datagrid>
		</form>
	</body>
</HTML>
