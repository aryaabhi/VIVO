<%@ Page Language="vb" AutoEventWireup="false" Inherits="SCLE.User.ReportByCVC" CodeFile="ReportByCVC.aspx.vb" %>
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
				<asp:Button ID="ExcelExport" runat="server" Text="Export to excel"></asp:Button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Select 
				Financial Year&nbsp;&nbsp;
				<asp:DropDownList id="cboYear" runat="server">
					<asp:ListItem Value=""></asp:ListItem>
					<asp:ListItem Value="2002">2002-03</asp:ListItem>
					<asp:ListItem Value="2003">2003-04</asp:ListItem>
					<asp:ListItem Value="2004">2004-05</asp:ListItem>
					<asp:ListItem Value="2005">2005-06</asp:ListItem>
					<asp:ListItem Value="2006">2006-07</asp:ListItem>
					<asp:ListItem Value="2007">2007-08</asp:ListItem>
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
					<asp:BoundColumn HeaderText="CVC Element" SortExpression="CVCElement" DataField="CVCElement"></asp:BoundColumn>
					<asp:hyperlinkcolumn DataNavigateUrlField="ProjectID" DataNavigateUrlFormatString="projectModification.aspx?ProjectID={0}"
						DataTextField="ProjectName" Target="_blank" SortExpression="ProjectName" HeaderText="Project Name (Click on Name to Edit)"></asp:hyperlinkcolumn>
					<asp:BoundColumn HeaderText="Project Leader" DataField="ProjectLeader"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="NOS Addition $M" DataFormatString="{0:C0}" SortExpression="NosAddition"
						DataField="NosAddition"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Customer Amt $M" DataFormatString="{0:C0}" SortExpression="CustomerAmt"
						DataField="CustomerAmt"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="PG Amt $M" DataFormatString="{0:C0}" SortExpression="PGAmt" DataField="PGAmt"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Probability" DataFormatString="{0:N0}%" SortExpression="CVCProb" DataField="CVCProb"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Prob Adjust $M" DataFormatString="{0:C0}" SortExpression="ProbAdjAmt"
						DataField="ProbAdjAmt"></asp:BoundColumn>
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
