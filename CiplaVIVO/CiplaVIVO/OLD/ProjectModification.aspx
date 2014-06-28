<%@ Page Language="vb" AutoEventWireup="false" Inherits="SCLE.User.ProjectModification" CodeFile="ProjectModification.aspx.vb" %>
<HTML>
	<HEAD>
		<title>Project Modify</title>
		<SCRIPT language="JavaScript">
		<!-- Begin
		function popUp(URL) {
		day = new Date();
		id = day.getTime();
		eval("page" + id + " = window.open(URL, '" + id + "', 'toolbar=0,scrollbars=1,location=0,statusbar=0,menubar=0,resizable=0,width=300,height=500,left = 412,top = 284');");
		}
		// End -->
		</SCRIPT>
		<LINK href="index.css" type="text/css" rel="stylesheet">
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<table id="ForAll" borderColor="#000000" cellSpacing="2" cellPadding="2" width="100%" border="1">
				<tbody>
					<tr>
						<td class="topHeading" align="center" colSpan="4">Modify a Project</td>
					</tr>
					<tr>
						<td class="heading" colSpan="4">Project&nbsp;Details:</td>
					</tr>
					<tr>
						<td style="WIDTH: 171px; HEIGHT: 25px">1. Sub GBU:</td>
						<td style="WIDTH: 273px; HEIGHT: 25px"><asp:dropdownlist id="cboCategory" tabIndex="1" runat="server" DataTextField="value" DataValueField="value"
								Width="168px" CssClass="txtBox"></asp:dropdownlist></td>
						<td style="WIDTH: 212px; HEIGHT: 25px">2. Plant / Location:</td>
						<td style="HEIGHT: 25px"><asp:dropdownlist id="cboPlant" tabIndex="2" runat="server" DataTextField="PlantDesc" DataValueField="PlantDesc"
								Width="168px" CssClass="txtBox"></asp:dropdownlist></td>
					</tr>
					<TR>
						<TD style="WIDTH: 171px; HEIGHT: 32px">3.&nbsp;Business(Brand):</TD>
						<TD style="WIDTH: 273px; HEIGHT: 32px"><asp:dropdownlist id="cboBusiness" tabIndex="3" runat="server" DataTextField="value" DataValueField="value"
								Width="167px" CssClass="txtBox" AutoPostBack="True" OnSelectedIndexChanged="Business_AfterUpdate"></asp:dropdownlist></TD>
						<TD style="WIDTH: 212px; HEIGHT: 32px">4.&nbsp;Business Form:<asp:dropdownlist id="cboBusinessForm" tabIndex="4" runat="server" DataTextField="value" DataValueField="value"
								Width="115px" CssClass="txtBox"></asp:dropdownlist></TD>
						<TD style="HEIGHT: 32px">Organizations:&nbsp;&nbsp;
							<asp:dropdownlist id="cboOtherBusiness" tabIndex="5" runat="server" DataTextField="value" DataValueField="value"
								Width="95px" CssClass="txtBox"></asp:dropdownlist></TD>
					</TR>
					<tr>
						<td style="WIDTH: 171px">5. Project Name:</td>
						<td style="WIDTH: 273px"><asp:textbox id="txtProjectName" tabIndex="6" runat="server" Width="224px" CssClass="txtbox"></asp:textbox></td>
						<td style="WIDTH: 212px">6. Project Leader:</td>
						<td><asp:dropdownlist id="cboProjectLeader" tabIndex="7" runat="server" DataTextField="Name" DataValueField="PersonnelID"
								Width="224px" CssClass="txtBox"></asp:dropdownlist></td>
					</tr>
					<tr>
						<td style="WIDTH: 171px; HEIGHT: 32px">7. Project Begins:</td>
						<td style="WIDTH: 273px; HEIGHT: 32px">Month:
							<asp:dropdownlist id="cboProjectStartMonth" tabIndex="9" runat="server" DataTextField="MonthLiteral"
								DataValueField="MonthInteger" Width="88px" CssClass="txtBox" AutoPostBack="True" OnSelectedIndexChanged="ProjectMonth_AfterUpdate"></asp:dropdownlist>&nbsp;&nbsp;&nbsp;Year:
							<asp:dropdownlist id="cboProjectStartYear" tabIndex="10" runat="server" DataTextField="YearInteger"
								DataValueField="YearInteger" Width="88px" CssClass="txtBox" AutoPostBack="True" OnSelectedIndexChanged="ProjectYear_AfterUpdate"></asp:dropdownlist></td>
						<td style="WIDTH: 212px; HEIGHT: 32px">8. Savings Begin:</td>
						<td style="HEIGHT: 32px">Month:
							<asp:dropdownlist id="cboSavingsStartMonth" tabIndex="11" runat="server" DataTextField="MonthLiteral"
								DataValueField="MonthInteger" Width="88px" CssClass="txtBox"></asp:dropdownlist>&nbsp;&nbsp;&nbsp;Year:
							<asp:dropdownlist id="cboSavingsStartYear" tabIndex="12" runat="server" DataTextField="YearInteger"
								DataValueField="YearInteger" Width="88px" CssClass="txtBox"></asp:dropdownlist></td>
					</tr>
					<tr>
						<td style="WIDTH: 171px">9. Status:</td>
						<td style="WIDTH: 273px">
							<asp:dropdownlist id="cboStatus" tabIndex="13" runat="server" CssClass="txtBox" Width="184px" DataValueField="Status"
								DataTextField="Status"></asp:dropdownlist>
						</td>
						<td></td>
						<td></td>
						</TD>
					</tr>
					<tr>
						<td align="center" colSpan="4"><strong>PROJECT TYPE:&nbsp;</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
							&nbsp;&nbsp;&nbsp; &nbsp; TDC&nbsp;
							<asp:checkbox id="TDCCheck" AutoPostBack="True" BackColor="LightSkyBlue" Runat="server" OnCheckedChanged="TDC_CheckChanged"
								tabIndex="14"></asp:checkbox>&nbsp;&nbsp;&nbsp;&nbsp; 
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Cash&nbsp;
							<asp:checkbox id="CashCheck" AutoPostBack="True" BackColor="Wheat" Runat="server" OnCheckedChanged="Cash_CheckChanged"
								tabIndex="15"></asp:checkbox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
							NOS/ Co-Value Creation CVC &nbsp;
							<asp:checkbox id="CustomerCheck" AutoPostBack="True" BackColor="DarkTurquoise" Runat="server"
								OnCheckedChanged="Customer_CheckChanged" tabIndex="16"></asp:checkbox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
							&nbsp;Supply Chain Time&nbsp;SCT
							<asp:checkbox id="SCTCheck" AutoPostBack="True" BackColor="Thistle" Runat="server" OnCheckedChanged="SCT_CheckChanged"
								tabIndex="17"></asp:checkbox></td>
					</tr>
				</tbody>
			</table>
			<asp:panel id="TDCPanel" Runat="server" Visible="False">
				<TABLE id="TDC" borderColor="#000000" cellSpacing="2" cellPadding="2" width="100%" border="1">
					<TR>
						<TD class="heading" bgColor="#ccccff" colSpan="4">TDC Project Details:</TD>
					</TR>
					<TR>
						<TD style="WIDTH: 248px; HEIGHT: 23px" bgColor="#ccccff">&nbsp;TDC Element:</TD>
						<TD style="WIDTH: 267px; HEIGHT: 23px" bgColor="#ccccff">
							<asp:dropdownlist id="cboCostBucket" tabIndex="18" runat="server" CssClass="txtBox" Width="167px"
								DataValueField="value" DataTextField="value" OnSelectedIndexChanged="TDCElement_AfterUpdate" AutoPostBack="True"></asp:dropdownlist></TD>
						<TD style="WIDTH: 270px; HEIGHT: 23px" bgColor="#ccccff"><A href="javascript:popUp('VolumeView.aspx')">View 
								Current Business Volume</A></TD>
						<TD style="HEIGHT: 23px" bgColor="#ccccff"></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 248px; HEIGHT: 23px" bgColor="#ccccff">&nbsp;TDC Sub Element:</TD>
						<TD style="WIDTH: 267px; HEIGHT: 23px" bgColor="#ccccff">
							<asp:dropdownlist id="cboTDCSubElement" tabIndex="19" runat="server" CssClass="txtBox" Width="168px"
								DataValueField="value" DataTextField="value"></asp:dropdownlist></TD>
						<TD style="WIDTH: 270px; HEIGHT: 23px" bgColor="#ccccff"></TD>
						<TD style="HEIGHT: 23px" bgColor="#ccccff"></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 248px" bgColor="#ccccff">Total Annual Savings (in $M):</TD>
						<TD style="WIDTH: 267px" bgColor="#ccccff">
							<asp:textbox id="txtRecoverableLosses" tabIndex="20" runat="server" CssClass="txtBox">0</asp:textbox></TD>
						<TD align="center" bgColor="#66cc99" colSpan="2">&nbsp;SYSTEM CALCULATIONS</TD>
					</TR>
					<TR>
						<TD style="WIDTH: 248px" bgColor="#ccccff">Total Annual Cost (in $M): (incl. 
							depr,&nbsp;expenses)</TD>
						<TD style="WIDTH: 267px" bgColor="#ccccff">
							<asp:textbox id="txtCostAmt" tabIndex="21" runat="server" CssClass="txtBox">0</asp:textbox></TD>
						<TD style="WIDTH: 270px" bgColor="#66cc99">&nbsp;Implied Savings Accounting Date</TD>
						<TD bgColor="#66cc99">
							<asp:textbox id="AccountingMonth" runat="server" CssClass="txtBox" Width="40px" BackColor="#E0E0E0"
								ReadOnly="True"></asp:textbox>&nbsp;/
							<asp:textbox id="AccountingYear" runat="server" CssClass="txtBox" Width="72px" BackColor="#E0E0E0"
								ReadOnly="True"></asp:textbox></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 248px" bgColor="#ccccff">&nbsp;Probability (in %):</TD>
						<TD style="WIDTH: 267px" bgColor="#ccccff">&nbsp;
							<asp:dropdownlist id="txtProbability" tabIndex="22" runat="server" CssClass="txtBox">
								<asp:ListItem Value="0">0 %</asp:ListItem>
								<asp:ListItem Value="25">25 %</asp:ListItem>
								<asp:ListItem Value="50">50 %</asp:ListItem>
								<asp:ListItem Value="75">75 %</asp:ListItem>
								<asp:ListItem Value="100">100 %</asp:ListItem>
							</asp:dropdownlist>
							<asp:Button id="CalculateTDC" onclick="PerformCalculation" tabIndex="23" runat="server" CausesValidation="False"
								Text="Calculate Adj. Value"></asp:Button></TD>
						<TD style="WIDTH: 270px" bgColor="#66cc99">&nbsp;Probability Adjusted Amount (in 
							$M):</TD>
						<TD bgColor="#66cc99">
							<asp:textbox id="txtProbabilityAdjustedAmt" runat="server" CssClass="txtBox" BackColor="#E0E0E0"
								ReadOnly="True"></asp:textbox></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 248px" bgColor="#ccccff">
							<P>&nbsp;Project Stage</P>
						</TD>
						<TD style="WIDTH: 267px" bgColor="#ccccff">
							<asp:dropdownlist id="ProjectStage" tabIndex="24" runat="server" CssClass="txtBox" Width="160px">
								<asp:ListItem Value="Idea">Idea</asp:ListItem>
								<asp:ListItem Value="Plan To Deliver">Plan To Deliver</asp:ListItem>
								<asp:ListItem Value="Committed to Finance">Committed to Finance</asp:ListItem>
							</asp:dropdownlist></TD>
						<TD style="WIDTH: 270px" bgColor="#66cc99">&nbsp;Time Adjusted Amount (in $M):</TD>
						<TD bgColor="#66cc99">
							<asp:textbox id="txtTimeAdjustedAmount" runat="server" CssClass="txtBox" BackColor="#E0E0E0"
								ReadOnly="True"></asp:textbox></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 248px" bgColor="#ccccff"></TD>
						<TD style="WIDTH: 267px" bgColor="#ccccff"></TD>
						<TD style="WIDTH: 270px" bgColor="#66cc99">&nbsp;Total (Time&nbsp;&amp; Prob.) 
							Adjusted Amount (in $M):</TD>
						<TD bgColor="#66cc99">
							<asp:textbox id="txtTotalAdjustedAmount" runat="server" CssClass="txtBox" BackColor="#E0E0E0"
								ReadOnly="True"></asp:textbox></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 248px; HEIGHT: 24px" bgColor="#ccccff">&nbsp;</TD>
						<TD style="WIDTH: 267px; HEIGHT: 24px" bgColor="#ccccff"></TD>
						<TD style="WIDTH: 270px; HEIGHT: 24px" bgColor="#ccccff">Committed to Forecast 
							(F&amp;A Use only):</TD>
						<TD style="HEIGHT: 24px" bgColor="#ccccff">
							<asp:checkbox id="chkCommitted" runat="server" AutoPostBack="True" OnCheckedChanged="CmtForecast_Changed"></asp:checkbox></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 248px" bgColor="#ccccff">&nbsp;Additional Comments/Notes:</TD>
						<TD bgColor="#ccccff" colSpan="3">
							<asp:textbox id="txtDescription" tabIndex="19" runat="server" CssClass="txtBox" Width="672px"></asp:textbox></TD>
					</TR>
				</TABLE>
			</asp:panel><asp:panel id="CashPanel" Runat="server" Visible="False">
				<TABLE id="Cash" borderColor="#000000" cellSpacing="2" cellPadding="2" width="100%" border="1"
					DESIGNTIMEDRAGDROP="253">
					<TR>
						<TD class="heading" bgColor="wheat" colSpan="4">Cash Project Details:</TD>
					</TR>
					<TR>
						<TD style="WIDTH: 248px; HEIGHT: 23px" bgColor="wheat">&nbsp;Cash Element:</TD>
						<TD style="WIDTH: 267px; HEIGHT: 23px" bgColor="wheat">
							<asp:dropdownlist id="cboCashElement" tabIndex="5" runat="server" CssClass="txtBox" Width="167px"
								DataValueField="value" DataTextField="value" OnSelectedIndexChanged="CashElement_AfterUpdate"
								AutoPostBack="True"></asp:dropdownlist></TD>
						<TD style="WIDTH: 270px; HEIGHT: 23px" bgColor="wheat"></TD>
						<TD style="HEIGHT: 23px" bgColor="wheat"></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 248px; HEIGHT: 23px" bgColor="wheat">&nbsp;Cash Sub Element:</TD>
						<TD style="WIDTH: 267px; HEIGHT: 23px" bgColor="wheat">
							<asp:dropdownlist id="cboCashSubElement" tabIndex="6" runat="server" CssClass="txtBox" Width="168px"
								DataValueField="value" DataTextField="value"></asp:dropdownlist></TD>
						<TD style="WIDTH: 270px; HEIGHT: 23px" bgColor="wheat"></TD>
						<TD style="HEIGHT: 23px" bgColor="wheat"></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 248px; HEIGHT: 23px" bgColor="wheat">&nbsp;Total Cash Savings:</TD>
						<TD style="WIDTH: 267px; HEIGHT: 23px" bgColor="wheat">
							<asp:dropdownlist id="cboTotalCashSaving" tabIndex="6" runat="server" CssClass="txtBox" Width="168px"
								DataValueField="value" DataTextField="value">
								<asp:ListItem></asp:ListItem>
								<asp:ListItem Value="Average">Average</asp:ListItem>
								<asp:ListItem Value="June End">June End</asp:ListItem>
							</asp:dropdownlist></TD>
						<TD style="WIDTH: 270px; HEIGHT: 23px" bgColor="wheat"></TD>
						<TD style="HEIGHT: 23px" bgColor="wheat"></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 230px; HEIGHT: 23px" bgColor="wheat">
							<P>&nbsp;Cash Savings: (if any) (in $M)
							</P>
						</TD>
						<TD style="WIDTH: 361px; HEIGHT: 23px" bgColor="wheat">
							<asp:textbox id="txtCash" tabIndex="14" runat="server" CssClass="txtBox">0</asp:textbox></TD>
						<TD style="WIDTH: 270px; HEIGHT: 23px" bgColor="wheat">&nbsp;</TD>
						<TD style="HEIGHT: 23px" bgColor="wheat"></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 230px; HEIGHT: 23px" bgColor="wheat">
							<P>&nbsp;Probability
							</P>
						</TD>
						<TD style="WIDTH: 361px; HEIGHT: 23px" bgColor="wheat">
							<asp:dropdownlist id="cboCashProbability" tabIndex="15" runat="server" CssClass="txtBox">
								<asp:ListItem Value="0">0 %</asp:ListItem>
								<asp:ListItem Value="25">25 %</asp:ListItem>
								<asp:ListItem Value="50">50 %</asp:ListItem>
								<asp:ListItem Value="75">75 %</asp:ListItem>
								<asp:ListItem Value="100">100 %</asp:ListItem>
							</asp:dropdownlist>
							<asp:Button id="CalculateCash" onclick="subCashProbAdjAmt" runat="server" CausesValidation="False"
								Text="Calculate Adj. Value"></asp:Button></TD>
						<TD style="WIDTH: 270px; HEIGHT: 23px" bgColor="wheat">Probability Adjusted Amount 
							(in $M):</TD>
						<TD style="HEIGHT: 23px" bgColor="wheat">
							<asp:textbox id="txtCashAdjAmt" runat="server" CssClass="txtBox" BackColor="#E0E0E0" ReadOnly="True">0</asp:textbox></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 248px" bgColor="wheat">&nbsp;Additional Comments/Notes:</TD>
						<TD bgColor="wheat" colSpan="3">
							<asp:textbox id="txtCashDescription" tabIndex="19" runat="server" CssClass="txtBox" Width="672px"></asp:textbox></TD>
					</TR>
				</TABLE>
			</asp:panel><asp:panel id="CustomerPanel" Runat="server" Visible="False">
				<TABLE id="Customer" borderColor="#000000" cellSpacing="2" cellPadding="2" width="100%"
					border="1">
					<TR>
						<TD class="heading" bgColor="darkturquoise" colSpan="4">NOS/Co-Value Creation (CVC) 
							Project Details:</TD>
					</TR>
					<TR>
						<TD style="WIDTH: 248px; HEIGHT: 17px" bgColor="darkturquoise">
							<P>&nbsp;CVC Element:
							</P>
						</TD>
						<TD style="WIDTH: 267px; HEIGHT: 17px" bgColor="darkturquoise">
							<asp:dropdownlist id="cboCVCElement" tabIndex="15" runat="server" CssClass="txtBox" DataValueField="Value"
								DataTextField="value"></asp:dropdownlist></TD>
						<TD style="WIDTH: 202px; HEIGHT: 17px" bgColor="darkturquoise"></TD>
						<TD style="HEIGHT: 17px" bgColor="darkturquoise"></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 248px; HEIGHT: 25px" bgColor="darkturquoise">&nbsp;Customer Name:
						</TD>
						<TD bgColor="darkturquoise" colSpan="2">
							<asp:dropdownlist id="cboCVCCustomer" tabIndex="15" runat="server" CssClass="txtBox" DataValueField="value"
								DataTextField="value"></asp:dropdownlist></TD>
						<TD style="HEIGHT: 25px" bgColor="darkturquoise"></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 248px; HEIGHT: 23px" bgColor="darkturquoise">&nbsp;Supplier Name:
						</TD>
						<TD bgColor="darkturquoise" colSpan="2">
							<asp:dropdownlist id="cboCVCSupplier" tabIndex="15" runat="server" CssClass="txtBox" DataValueField="value"
								DataTextField="value"></asp:dropdownlist></TD>
						<TD style="HEIGHT: 23px" bgColor="darkturquoise"></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 248px; HEIGHT: 23px" bgColor="darkturquoise">&nbsp;P&amp;G 
							Partner Org:
						</TD>
						<TD style="WIDTH: 267px; HEIGHT: 23px" bgColor="darkturquoise">
							<asp:ListBox id="lstCVCPartner" tabIndex="15" runat="server" CssClass="txtBox" SelectionMode="Multiple">
								<asp:ListItem Value="Engineering">Engineering</asp:ListItem>
								<asp:ListItem Value="MPO">MPO</asp:ListItem>
								<asp:ListItem Value="Purchases">Purchases</asp:ListItem>
								<asp:ListItem Value="R&amp;D">R&amp;D</asp:ListItem>
								<asp:ListItem Value="GBU CSL">GBU CSL</asp:ListItem>
								<asp:ListItem Value="MS&amp;P CSL">MS&amp;P CSL</asp:ListItem>
								<asp:ListItem Value="MS&amp;P CBD">MS&amp;P CBD</asp:ListItem>
								<asp:ListItem Value="Field CBD">Field CBD</asp:ListItem>
							</asp:ListBox>&nbsp;(Press Ctrl for multiple select)</TD>
						<TD style="WIDTH: 202px; HEIGHT: 23px" bgColor="darkturquoise"></TD>
						<TD style="HEIGHT: 23px" bgColor="darkturquoise"></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 248px; HEIGHT: 23px" bgColor="darkturquoise">&nbsp;NOS&nbsp;Addition(in 
							$M):
						</TD>
						<TD style="WIDTH: 267px; HEIGHT: 23px" bgColor="darkturquoise">
							<asp:textbox id="txtNOS" runat="server" CssClass="txtBox" BackColor="White">0</asp:textbox></TD>
						<TD style="WIDTH: 202px; HEIGHT: 23px" bgColor="darkturquoise"></TD>
						<TD style="HEIGHT: 23px" bgColor="darkturquoise"></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 248px; HEIGHT: 23px" bgColor="darkturquoise">&nbsp;Customer 
							Saving /Hurts&nbsp;: (if any) (in $M)</TD>
						<TD style="WIDTH: 267px; HEIGHT: 23px" bgColor="darkturquoise">
							<asp:textbox id="txtCustomerSaving" tabIndex="14" runat="server" CssClass="txtBox">0</asp:textbox></TD>
						<TD style="WIDTH: 202px; HEIGHT: 23px" bgColor="darkturquoise"></TD>
						<TD style="HEIGHT: 23px" bgColor="darkturquoise"></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 248px; HEIGHT: 23px" bgColor="darkturquoise">&nbsp;P&amp;G 
							Savings/Hurts (in $M):
						</TD>
						<TD style="WIDTH: 267px; HEIGHT: 23px" bgColor="darkturquoise">
							<asp:textbox id="txtCVCPGSavings" runat="server" CssClass="txtBox" BackColor="White">0</asp:textbox></TD>
						<TD style="WIDTH: 202px; HEIGHT: 23px" bgColor="darkturquoise">Overall Supply Chain 
							Savings</TD>
						<TD style="HEIGHT: 23px" bgColor="darkturquoise"></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 248px; HEIGHT: 23px" bgColor="darkturquoise">&nbsp;Probability:
						</TD>
						<TD style="WIDTH: 267px; HEIGHT: 23px" bgColor="darkturquoise">
							<asp:dropdownlist id="cboCVCProb" tabIndex="15" runat="server" CssClass="txtBox">
								<asp:ListItem Value="0">0 %</asp:ListItem>
								<asp:ListItem Value="25">25 %</asp:ListItem>
								<asp:ListItem Value="50">50 %</asp:ListItem>
								<asp:ListItem Value="75">75 %</asp:ListItem>
								<asp:ListItem Value="100">100 %</asp:ListItem>
							</asp:dropdownlist>
							<asp:Button id="CalculateNOS" onclick="subNOSCVCProbAdjAmt" runat="server" CausesValidation="False"
								Text="Calculate Adj. Value"></asp:Button></TD>
						<TD style="WIDTH: 202px; HEIGHT: 23px" bgColor="darkturquoise">Probability 
							Adjusted&nbsp;Savings (in $M):</TD>
						<TD style="HEIGHT: 23px" bgColor="darkturquoise">
							<asp:textbox id="txtCVCProbAdjAmt" runat="server" CssClass="txtBox" BackColor="#E0E0E0" ReadOnly="True">0</asp:textbox></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 248px" bgColor="darkturquoise">&nbsp;Additional Comments/Notes:</TD>
						<TD bgColor="darkturquoise" colSpan="3">
							<asp:textbox id="txtCVCDescription" tabIndex="19" runat="server" CssClass="txtBox" Width="672px"></asp:textbox></TD>
					</TR>
				</TABLE>
			</asp:panel><asp:panel id="SupplyChainTimePanel" Runat="server" Visible="False">
				<TABLE id="SupplyChainTime" borderColor="#000000" cellSpacing="2" cellPadding="2" width="100%"
					border="1">
					<TR>
						<TD class="heading" bgColor="thistle" colSpan="4">Supply Chain Time&nbsp;(SCT) 
							Project Details:</TD>
					</TR>
					<TR>
						<TD style="WIDTH: 133px; HEIGHT: 12px" bgColor="thistle">&nbsp;Supply Chain:
						</TD>
						<TD style="HEIGHT: 12px" bgColor="thistle" colSpan="3">
							<asp:dropdownlist id="cboSCsupplyChain" tabIndex="15" runat="server" CssClass="txtBox" DataValueField="value"
								DataTextField="value"></asp:dropdownlist></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 133px; HEIGHT: 23px" bgColor="thistle">&nbsp;Element:
						</TD>
						<TD bgColor="thistle" colSpan="3">
							<asp:dropdownlist id="cboSCElement" tabIndex="15" runat="server" CssClass="txtBox">
								<asp:ListItem></asp:ListItem>
								<asp:ListItem Value="Material">Material</asp:ListItem>
								<asp:ListItem Value="Manufacturing">Manufacturing</asp:ListItem>
								<asp:ListItem Value="Distribution">Distribution</asp:ListItem>
								<asp:ListItem Value="International Sourcing">International Sourcing</asp:ListItem>
								<asp:ListItem Value="All (End to End)">All (End to End)</asp:ListItem>
							</asp:dropdownlist></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 133px; HEIGHT: 14px" bgColor="thistle">&nbsp;Sub Element:
						</TD>
						<TD bgColor="thistle" colSpan="3">Source:
							<asp:dropdownlist id="cboSCSubElement" tabIndex="15" runat="server" CssClass="txtBox">
								<asp:ListItem></asp:ListItem>
								<asp:ListItem Value="Supplier to Plant Time (Materials)">Supplier to Plant Time (Materials)</asp:ListItem>
								<asp:ListItem Value="Cycle TIme/ DNBR Time (Manufacturing)">Cycle TIme/ DNBR Time (Manufacturing)</asp:ListItem>
								<asp:ListItem Value="Order to Delivery Time (Distribution)">Order to Delivery Time (Distribution)</asp:ListItem>
								<asp:ListItem Value="Int'l Sourcing to Destination Time (Sourcing)">Int'l Sourcing to Destination Time (Sourcing)</asp:ListItem>
								<asp:ListItem Value="Supplier to Customer Time (All - End to End)">Supplier to Customer Time (All - End to End)</asp:ListItem>
							</asp:dropdownlist>&nbsp;&nbsp;&nbsp;
						</TD>
					</TR>
					<TR>
						<TD style="WIDTH: 133px" bgColor="thistle">&nbsp;Supply Chain Time</TD>
						<TD style="WIDTH: 354px" bgColor="thistle">Current
							<asp:textbox id="SCTCurrent" runat="server" CssClass="txtBox" Width="40px" BackColor="White">0</asp:textbox>&nbsp;Expected
							<asp:textbox id="SCTExpected" runat="server" CssClass="txtBox" Width="40px" BackColor="White">0</asp:textbox>&nbsp;days<A href="javascript:popUp('LossType.aspx')"></A></TD>
						<TD style="WIDTH: 270px" bgColor="thistle">&nbsp;Total Supply Chain Impact</TD>
						<TD bgColor="thistle">
							<asp:textbox id="txtSCImpact" runat="server" CssClass="txtBox" BackColor="#E0E0E0" ReadOnly="True">0</asp:textbox></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 133px" bgColor="thistle">&nbsp;Probability:
						</TD>
						<TD style="WIDTH: 354px" bgColor="thistle">
							<asp:dropdownlist id="cboSCProbability" tabIndex="15" runat="server" CssClass="txtBox">
								<asp:ListItem Value="0">0 %</asp:ListItem>
								<asp:ListItem Value="25">25 %</asp:ListItem>
								<asp:ListItem Value="50">50 %</asp:ListItem>
								<asp:ListItem Value="75">75 %</asp:ListItem>
								<asp:ListItem Value="100">100 %</asp:ListItem>
							</asp:dropdownlist>
							<asp:Button id="CalculateSCT" onclick="subSCTProbAdjAmt" runat="server" CausesValidation="False"
								Text="Calculate Adj. Value"></asp:Button></TD>
						<TD style="WIDTH: 270px" bgColor="thistle"></TD>
						<TD bgColor="thistle"></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 133px" bgColor="thistle">&nbsp;Additional Comments/Notes:</TD>
						<TD bgColor="thistle" colSpan="3">
							<asp:textbox id="txtSCDescription" tabIndex="19" runat="server" CssClass="txtBox" Width="672px"></asp:textbox></TD>
					</TR>
				</TABLE>
			</asp:panel>
			<table id="Optional" borderColor="#000000" cellSpacing="2" cellPadding="2" width="100%"
				border="1">
				<tbody>
					<tr>
						<td class="heading" bgColor="#ffffcc" colSpan="4">Additional&nbsp;Info (Optional):</td>
					</tr>
					<TR>
						<TD style="WIDTH: 248px">21. Loss Type:</TD>
						<TD style="WIDTH: 267px"><asp:dropdownlist id="cboLossType" tabIndex="30" runat="server" DataTextField="LossType" DataValueField="LossType"
								Width="118px" CssClass="txtBox"></asp:dropdownlist><A href="javascript:popUp('LossType.aspx')"></A></TD>
						<TD style="WIDTH: 270px">22. Department</TD>
						<TD><asp:dropdownlist id="cboDepartment" tabIndex="31" runat="server" DataTextField="Value" DataValueField="Value"
								Width="118px" CssClass="txtBox"></asp:dropdownlist></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 248px">Included in TDC Standards (for F&amp;A Use)</TD>
						<TD style="WIDTH: 267px"><asp:checkbox id="chkStandards" runat="server" tabIndex="32"></asp:checkbox></TD>
						<TD style="WIDTH: 270px"></TD>
						<TD></TD>
					</TR>
				</tbody>
			</table>
			<table id="Submit" borderColor="#000000" cellSpacing="2" cellPadding="2" width="100%" border="1">
				<tbody>
					<tr>
						<td align="center" colSpan="4"><asp:button id="SaveProject" onclick="SaveNewProject" tabIndex="20" runat="server" Text="Save Project"></asp:button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<asp:button id="Cancel" runat="server" Text="Cancel" CausesValidation="False"></asp:button></td>
					</tr>
					<tr>
						<td colSpan="4"><asp:label id="TestOut" runat="server"></asp:label></td>
					</tr>
					<TR>
						<TD colSpan="4">
							<asp:requiredfieldvalidator id="Requiredfieldvalidator1" runat="server" ErrorMessage="Enter Project Name" ControlToValidate="txtProjectName"></asp:requiredfieldvalidator>
							<asp:requiredfieldvalidator id="Requiredfieldvalidator2" runat="server" ErrorMessage="Select Project Leader" ControlToValidate="cboProjectLeader"></asp:requiredfieldvalidator>
							<asp:requiredfieldvalidator id="Requiredfieldvalidator3" runat="server" ErrorMessage="Select Status" ControlToValidate="cboStatus"></asp:requiredfieldvalidator>
							<asp:requiredfieldvalidator id="Requiredfieldvalidator4" runat="server" ErrorMessage="Select Project Start Year" ControlToValidate="cboProjectStartYear"></asp:requiredfieldvalidator>
							<asp:requiredfieldvalidator id="Requiredfieldvalidator5" runat="server" ErrorMessage="Select Project Start Month" ControlToValidate="cboProjectStartMonth"></asp:requiredfieldvalidator>
							<asp:requiredfieldvalidator id="Requiredfieldvalidator6" runat="server" ErrorMessage="Select Savings Start Year" ControlToValidate="cboSavingsStartYear"></asp:requiredfieldvalidator>
							<asp:requiredfieldvalidator id="Requiredfieldvalidator7" runat="server" ErrorMessage="Select Savings Start Month" ControlToValidate="cboSavingsStartMonth"></asp:requiredfieldvalidator>
							<asp:requiredfieldvalidator id="Requiredfieldvalidator9" runat="server" ErrorMessage="Select TDC Element" ControlToValidate="cboCostBucket"></asp:requiredfieldvalidator>
							<asp:requiredfieldvalidator id="Requiredfieldvalidator13" runat="server" ErrorMessage="Select Sub GBU" ControlToValidate="cboCategory"></asp:requiredfieldvalidator>
							<asp:requiredfieldvalidator id="Requiredfieldvalidator11" runat="server" ErrorMessage="Select Business" ControlToValidate="cboBusiness"></asp:requiredfieldvalidator>
							<asp:requiredfieldvalidator id="Requiredfieldvalidator8" runat="server" ErrorMessage="Select Total Annual Savings" ControlToValidate="txtRecoverableLosses"></asp:requiredfieldvalidator>
							<asp:requiredfieldvalidator id="Requiredfieldvalidator14" runat="server" ErrorMessage="Select Probability" ControlToValidate="txtProbability"></asp:requiredfieldvalidator>
							<asp:validationsummary id="Validationsummary1" runat="server" ShowMessageBox="true" ShowSummary="false" HeaderText="You must enter/select a value in the following &#13;&#10;fields:" EnableClientScript="true"></asp:validationsummary>
						</TD>
					</TR>
				</tbody>
			</table>
		</form>
	</body>
</HTML>