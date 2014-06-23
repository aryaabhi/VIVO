<%@ Page Language="vb" AutoEventWireup="false" Inherits="SCLE.User.ProjectCopy" CodeFile="ProjectCopy.aspx.vb" %>
<HTML>
	<body>
		<form id="Form1" method="post" runat="server">
			<P>
				<asp:Label id="HeaderLabel" runat="server" Font-Size="Medium" BackColor="White" Width="736px"
					CssClass="topheading" Font-Names="trebuchet ms, verdana, arial"></asp:Label></P>
			<P>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Select 
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
			<asp:datagrid id="ProjectDataGrid" runat="server" BackColor="#ccccff" BorderColor="black" OnSortCommand="SortData"
				AllowSorting="True" CellPadding="3" CellSpacing="0" Font-Name="Verdana" Font-Size="7pt" HeaderStyle-BackColor="#003366"
				HeaderStyle-Font-Bold="True" OnEditCommand="DBEditDataGrid_Edit" OnDeleteCommand="DBDelDataGrid_Delete"
				DataKeyField="ProjectID" HeaderStyle-ForeColor="#ffffff" MaintainViewState="false" AutoGenerateColumns="False"
				AlternatingItemStyle-BackColor="#ffffff">
				<Columns>
					<asp:ButtonColumn Text="Copy" CommandName="Edit" />
					<asp:BoundColumn HeaderText="Business" SortExpression="Business" DataField="Business"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="BusinessForm" SortExpression="BusinessForm" DataField="BusinessForm"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="TDC Element" SortExpression="CostBucket" DataField="CostBucket"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="TDC Sub Element" SortExpression="TDCSubElement" DataField="TDCSubElement"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Project Name" SortExpression="ProjectName" DataField="ProjectName"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Project Leader" SortExpression="tblPersonnel.FirstName" DataField="ProjectLeader"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Total Savings $M" SortExpression="RecoverableLosses DESC" DataField="RecoverableLosses"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Time Savings Begin" SortExpression="SavingsStartMonthYearLiteral" DataField="SavingsStartMonthYearLiteral"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Probability" SortExpression="Probability" DataField="Probability"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Total (Time & Prob) Adjust $M" SortExpression="TotalAdjustedAmt DESC"
						DataField="TotalAdjustedAmt"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Status" SortExpression="Status" DataField="Status"></asp:BoundColumn>
					<asp:ButtonColumn Text="Delete" CommandName="Delete" />
				</Columns>
			</asp:datagrid>
		</form>
	</body>
</HTML>
