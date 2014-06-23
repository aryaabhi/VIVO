<%@ Page Language="vb" AutoEventWireup="false" Inherits="SCLE.User.ReportSummaryMonthlyExcel" CodeFile="ReportSummaryMonthlyExcel.aspx.vb" %>
<HTML>
	<HEAD>
		<title>Project Report</title>
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
							HeaderStyle-BackColor="#9999ff" HeaderStyle-Font-Bold="True" MaintainViewState="false"></asp:datagrid>
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
