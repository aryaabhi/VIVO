<%@ Page Language="vb" AutoEventWireup="false" Inherits="SCLE.User.CustomSearch" CodeFile="CustomSearch.aspx.vb" %>
<HTML>
	<HEAD>
		<title>Custom Report</title>
		<LINK href="index.css" type="text/css" rel="stylesheet">
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<script language="VB" runat="server">

		</script>
	</HEAD>
	<body>
		<form id="Form2" method="post" runat="server">
			<asp:panel id="prebuilt" Runat="server" Visible="true">
				<TABLE borderColor="#000000" cellSpacing="2" cellPadding="2" width="100%" border="1">
					<TR>
						<TD class="Heading" align="center" width="100%">SEARCH PROJECTS TO 
							CREATE REPORT</TD>
					</TR>
					<TR>
						<TD align="center">Select Pre-saved Custom Report:
							<asp:dropdownlist id="cboCustomReportList" runat="server" DataTextField="ReportName" DataValueField="ReportID"
								CssClass="txtBox" Width="304px"></asp:dropdownlist>&nbsp;
							<asp:Button id="Show" onclick="show_onclick" runat="server" Font-Size="Smaller" Font-Names="Trebuchet MS"
								Text="Show Report"></asp:Button></TD>
					</TR>
				</TABLE>
			</asp:panel><asp:panel id="searchParam" Runat="server" Visible="True">
				<TABLE borderColor="#000000" cellSpacing="2" cellPadding="2" width="100%" border="1">
					<TR>
						<TD class="Heading" align="center" width="100%" colSpan="6">SELECT SEARCH 
							PARAMETERS TO CREATE REPORT</TD>
					</TR>
					<TR>
						<TD align="center" bgColor="#cccccc">Sub GBU:</TD>
						<TD align="center" bgColor="#99ccff">Plant:</TD>
						<TD align="center" bgColor="#cccccc">Business:</TD>
						<TD align="center" bgColor="#99ccff">Business Form:</TD>
						<TD align="center" bgColor="#cccccc">TDC Element:</TD>
						<TD align="center" bgColor="#99ccff">TDC SubElement:</TD>
					</TR>
					<TR>
						<TD align="center" bgColor="#cccccc">&nbsp;
							<asp:listbox id="cboCategory" runat="server" DataTextField="value" DataValueField="value" CssClass="txtBox"
								Width="112px" SelectionMode="Multiple"></asp:listbox></TD>
						<TD align="center" bgColor="#99ccff">&nbsp;
							<asp:listbox id="cboPlant" runat="server" DataTextField="PlantDesc" DataValueField="PlantDesc"
								CssClass="txtBox" Width="112px" SelectionMode="Multiple"></asp:listbox></TD>
						<TD align="center" bgColor="#cccccc">
							<asp:listbox id="cboBusiness" runat="server" DataTextField="value" DataValueField="value" CssClass="txtBox"
								Width="112px" SelectionMode="Multiple"></asp:listbox></TD>
						<TD align="center" bgColor="#99ccff">&nbsp;
							<asp:listbox id="cboBusinessForm" tabIndex="3" runat="server" DataTextField="value" DataValueField="value"
								CssClass="txtBox" Width="112px" SelectionMode="Multiple"></asp:listbox></TD>
						<TD align="center" bgColor="#cccccc">
							<asp:listbox id="cboTDCElement" runat="server" DataTextField="value" DataValueField="value" CssClass="txtBox"
								Width="112px" SelectionMode="Multiple"></asp:listbox></TD>
						<TD align="center" bgColor="#99ccff">
							<asp:listbox id="cboTDCSubElement" tabIndex="6" runat="server" DataTextField="value" DataValueField="value"
								CssClass="txtBox" Width="112px" SelectionMode="Multiple"></asp:listbox></TD>
					</TR>
					<TR>
						<TD align="center" bgColor="#99ccff">Pillars:</TD>
						<TD align="center" bgColor="#cccccc">Project Leader:</TD>
						<TD align="center" bgColor="#99ccff">Project Stage:</TD>
						<TD align="center" bgColor="#cccccc">Project Status:</TD>
						<TD align="center" bgColor="#99ccff">Loss Type:</TD>
						<TD align="center" bgColor="#cccccc">Department</TD>
					</TR>
					<TR>
						<TD align="center" bgColor="#99ccff">
							<asp:listbox id="cboOtherBusiness" tabIndex="3" runat="server" DataTextField="value" DataValueField="value"
								CssClass="txtBox" Width="112px" SelectionMode="Multiple"></asp:listbox></TD>
						<TD align="center" bgColor="#cccccc">
							<asp:listbox id="cboProjectLeader" runat="server" DataTextField="Name" DataValueField="PersonnelID"
								CssClass="txtBox" Width="112px" SelectionMode="Multiple"></asp:listbox></TD>
						<TD align="center" bgColor="#99ccff">
							<asp:listbox id="ProjectStage" tabIndex="17" runat="server" CssClass="txtBox" Width="112px" SelectionMode="Multiple">
								<asp:ListItem Value="Idea">Idea</asp:ListItem>
								<asp:ListItem Value="Planned To Deliver">Planned To Deliver</asp:ListItem>
								<asp:ListItem Value="Committed to Finance">Committed to Finance</asp:ListItem>
							</asp:listbox></TD>
						<TD align="center" bgColor="#cccccc">
							<asp:listbox id="cboStatus" runat="server" DataTextField="Status" DataValueField="Status" CssClass="txtBox"
								Width="112px" SelectionMode="Multiple"></asp:listbox></TD>
						<TD align="center" bgColor="#99ccff">
							<asp:listbox id="cboLossType" tabIndex="18" runat="server" DataTextField="LossType" DataValueField="LossType"
								CssClass="txtBox" Width="112px" SelectionMode="Multiple"></asp:listbox></TD>
						<TD align="center" bgColor="#cccccc">
							<asp:listbox id="cboDepartment" tabIndex="18" runat="server" DataTextField="Value" DataValueField="Value"
								CssClass="txtBox" Width="112px" SelectionMode="Multiple"></asp:listbox></TD>
					</TR>
					<TR>
						<TD align="center">Start between:</TD>
						<TD align="center">&nbsp;From:
							<asp:dropdownlist id="cboProjectStartMonthFrom" runat="server" DataTextField="MonthLiteral" DataValueField="MonthInteger"
								CssClass="txtBox" OnSelectedIndexChanged="ProjectMonth_AfterUpdate" AutoPostBack="True"></asp:dropdownlist>&nbsp;</TD>
						<TD align="center">
							<asp:dropdownlist id="cboProjectStartYearFrom" runat="server" DataTextField="YearInteger" DataValueField="YearInteger"
								CssClass="txtBox" OnSelectedIndexChanged="ProjectYear_AfterUpdate" AutoPostBack="True"></asp:dropdownlist></TD>
						<TD align="center">Till:
						</TD>
						<TD align="center">
							<asp:dropdownlist id="cboProjectStartMonthTill" runat="server" DataTextField="MonthLiteral" DataValueField="MonthInteger"
								CssClass="txtBox"></asp:dropdownlist></TD>
						<TD align="center">
							<asp:dropdownlist id="cboProjectStartYearTill" runat="server" DataTextField="YearInteger" DataValueField="YearInteger"
								CssClass="txtBox"></asp:dropdownlist></TD>
					</TR>
					<TR>
						<TD align="center">Savings Between:</TD>
						<TD align="center">&nbsp;From:
							<asp:dropdownlist id="cboSavingStartMonthFrom" runat="server" DataTextField="MonthLiteral" DataValueField="MonthInteger"
								CssClass="txtBox" OnSelectedIndexChanged="SavingMonth_AfterUpdate" AutoPostBack="True"></asp:dropdownlist>&nbsp;&nbsp;</TD>
						<TD align="center">
							<asp:dropdownlist id="cboSavingStartYearFrom" runat="server" DataTextField="YearInteger" DataValueField="YearInteger"
								CssClass="txtBox" OnSelectedIndexChanged="SavingYear_AfterUpdate" AutoPostBack="True"></asp:dropdownlist></TD>
						<TD align="center">Till:&nbsp;</TD>
						<TD align="center">
							<asp:dropdownlist id="cboSavingStartMonthTill" runat="server" DataTextField="MonthLiteral" DataValueField="MonthInteger"
								CssClass="txtBox"></asp:dropdownlist></TD>
						<TD align="center">
							<asp:dropdownlist id="cboSavingStartYearTill" runat="server" DataTextField="YearInteger" DataValueField="YearInteger"
								CssClass="txtBox"></asp:dropdownlist></TD>
					</TR>
					<TR>
						<TD align="center">Amount Range$:</TD>
						<TD align="center">&nbsp;
							<asp:dropdownlist id="cboAmountList" runat="server" CssClass="txtBox" Width="112px">
								<asp:ListItem Selected="True"></asp:ListItem>
								<asp:ListItem Value="tblTDC.ProbabilityAdjustedAmt">Probability Adjusted Savings</asp:ListItem>
								<asp:ListItem Value="tblProjects.RecoverableLosses">Recoverable Losses</asp:ListItem>
								<asp:ListItem Value="tblTDC.TimeAdjustedAmt">Time Adjusted Amount</asp:ListItem>
								<asp:ListItem Value="tblTDC.TotalAdjustedAmt">Total Adjusted Amount</asp:ListItem>
							</asp:dropdownlist></TD>
						<TD align="center">&nbsp;&nbsp;&nbsp;
							<asp:dropdownlist id="cboDollarChoice" runat="server" CssClass="txtBox">
								<asp:ListItem Selected="True"></asp:ListItem>
								<asp:ListItem Value="Less than">Less than</asp:ListItem>
								<asp:ListItem Value="Greater Than">Greater Than</asp:ListItem>
								<asp:ListItem Value="Between">Between</asp:ListItem>
							</asp:dropdownlist></TD>
						<TD align="center">
							<asp:textbox id="cboDollarLowerLimit" runat="server" CssClass="txtBox" Width="67px"></asp:textbox>
							<asp:label id="lblAnd" runat="server" Visible="False">And</asp:label></TD>
						<TD align="center">
							<asp:textbox id="cboDollarUpperLimit" runat="server" Visible="False" CssClass="txtBox" Width="67px"></asp:textbox></TD>
						<TD align="center"></TD>
					</TR>
					<TR>
						<TD align="center">Display TOP:</TD>
						<TD align="center">&nbsp;
							<asp:dropdownlist id="cboTopNumber" runat="server" CssClass="txtBox" Width="112px">
								<asp:ListItem Selected="True"></asp:ListItem>
								<asp:ListItem Value="5">5</asp:ListItem>
								<asp:ListItem Value="10">10</asp:ListItem>
								<asp:ListItem Value="15">15</asp:ListItem>
								<asp:ListItem Value="20">20</asp:ListItem>
							</asp:dropdownlist></TD>
						<TD align="center">Projects Ordered by &nbsp;
						</TD>
						<TD>
							<asp:dropdownlist id="cboTopCriteria" runat="server" CssClass="txtBox">
								<asp:ListItem Selected="True"></asp:ListItem>
								<asp:ListItem Value="tblProjects.RecoverableLosses">Recoverable Losses</asp:ListItem>
								<asp:ListItem Value="tblTDC.ProbAdjustedAmt">Prob Adjusted Amt</asp:ListItem>
								<asp:ListItem Value="tblTDC.TimeAdjustedAmt">Time Adjusted Amt</asp:ListItem>
								<asp:ListItem Value="tblTDC.TotalAdjustedAmt">Total (Time & Prob) Adjusted Amt</asp:ListItem>
							</asp:dropdownlist></TD>
						<TD></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD align="center" bgColor="#99ccff">Committed to Finance:</TD>
						<TD align="center" bgColor="#cccccc">Standards:</TD>
						<TD align="center" bgColor="#99ccff"></TD>
						<TD align="center" bgColor="#cccccc"></TD>
						<TD align="center" bgColor="#99ccff"></TD>
						<TD align="center" bgColor="#cccccc"></TD>
					</TR>
					<TR>
						<TD align="center" bgColor="#99ccff">
							<asp:checkbox id="chkCommitted" runat="server"></asp:checkbox></TD>
						<TD align="center" bgColor="#cccccc">
							<asp:checkbox id="chkStandards" runat="server"></asp:checkbox></TD>
						<TD align="center" bgColor="#99ccff"></TD>
						<TD align="center" bgColor="#cccccc"></TD>
						<TD align="center" bgColor="#99ccff"></TD>
						<TD align="center" bgColor="#cccccc"></TD>
					</TR>
					<TR>
						<TD align="center" colSpan="6">
							<asp:button id="buttonExtend" onclick="cmdExtend_Click" runat="server" Text="Select Report Parameters"></asp:button></TD>
					</TR>
				</TABLE>
			</asp:panel>
            <asp:panel id="ReportParam" Runat="server" Visible="False">
				<TABLE borderColor="#000000" cellSpacing="2" cellPadding="2" width="100%" border="1">
					<TR>
						<TD class="Heading" align="center" width="100%" colSpan="3">SELECT REPORT 
							PARAMETERS TO CREATE REPORT</TD>
					</TR>
					<TR>
						<TD style="WIDTH: 446px" align="center">
							<asp:listbox id="lstReportTags" runat="server" DataTextField="EMPS" DataValueField="EMPSTag"
								CssClass="txtBox" Width="416px" SelectionMode="Multiple" BackColor="#E0E0E0" Height="181px"></asp:listbox></TD>
						<TD style="WIDTH: 102px" align="center">
							<P>
								<asp:Button id="Add" onclick="cmdAdd_Click" runat="server" Text="Add >>"></asp:Button></P>
							<P>
								<asp:Button id="Remove" onclick="cmdRemove_Click" runat="server" Text="Remove <<"></asp:Button></P>
						</TD>
						<TD align="center">
							<asp:listbox id="lstReport" runat="server" DataTextField="EMPS" DataValueField="EMPSTag" CssClass="txtBox"
								Width="391px" BackColor="PowderBlue" Height="181px"></asp:listbox></TD>
					</TR>
					<TR>
						<TD align="center" colSpan="3">Provide unique name to custom report for future 
							(Optional)
							<asp:textbox id="txtCustomReport" runat="server" CssClass="txtBox"></asp:textbox></TD>
					</TR>
					<TR>
						<TD align="center" colSpan="3">
							<asp:button id="btnBack" onclick="cmdBack_Click" runat="server" Text="Back to Search Parameters"></asp:button>
							<asp:button id="buttonSearch" onclick="cmdSearch_Click" runat="server" Text="Search"></asp:button>&nbsp;
							<asp:Label id="msgText" runat="server"></asp:Label></TD>
					</TR>
				</TABLE>
			</asp:panel></form>
	</body>
</HTML>
