<%@ Page Language="vb" AutoEventWireup="false" Inherits="SCLE.User.ReportSummary" CodeFile="ReportSummary.aspx.vb" %>
<HTML>
	<HEAD>
		<title>Project Report</title>
		<LINK href="index.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<table border="1" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#111111"
				width="100%" id="AutoNumber1">
				<tr>
					<td width="100%" class="topheading" align="center">
						<asp:Label id="HeaderLabel" runat="server">TOTAL HOMECARE SUMMARY</asp:Label></td>
				</tr>
				<tr>
					<td>
						<asp:Button ID="ExcelExport" runat="server" Text="Export to excel" OnClick="SubmitBtn_Click"></asp:Button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						Select Financial Year&nbsp;&nbsp;
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
						<asp:Button id="Go" OnClick="Year_Refresh" runat="server" Text="Go"></asp:Button>
					</td>
				</tr>
				<tr>
					<td width="100%" class="heading" align="center" bgcolor="#33cc33">IN BPE - BUSINESS 
						SUMMARY</td>
				</tr>
				<tr>
					<td width="100%" align="right">
						<p align="center">Total (Time and Probability Adjusted) Savings (in $M)</p>
					</td>
				</tr>
				<tr>
					<td width="100%">
						<asp:datagrid id="BPEDataGrid" runat="server" BackColor="#ccccff" AlternatingItemStyle-BackColor="#ffffff"
							Width="100%" BorderColor="black" CellPadding="3" CellSpacing="0" Font-Name="Verdana" Font-Size="8pt"
							HeaderStyle-BackColor="#9999ff" FooterStyle-Font-Bold="True" FooterStyle-BackColor="#99ff00"
							HeaderStyle-Font-Bold="True" MaintainViewState="false"></asp:datagrid>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td width="100%" class="heading" align="center" bgcolor="#ffcc00">TOTAL PIPELINE - 
						BUSINESS SUMMARY</td>
				</tr>
				<tr>
					<td width="100%" align="right">
						<p align="center">Total (Time and Probability Adjusted) Savings (in $M)</p>
					</td>
				</tr>
				<tr>
					<td width="100%">
						<asp:datagrid id="StretchDataGrid" runat="server" BackColor="#ccccff" AlternatingItemStyle-BackColor="#ffffff"
							Width="100%" BorderColor="black" CellPadding="3" CellSpacing="0" Font-Name="Verdana" Font-Size="8pt"
							HeaderStyle-BackColor="#9999ff" HeaderStyle-Font-Bold="True" MaintainViewState="false"></asp:datagrid>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
