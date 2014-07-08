<%@ Page Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeBehind="ProjectAddition.aspx.vb" Inherits="CiplaVIVO.ProjectAddition" %>

	<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">                
                <header class="codrops-header">
                        <h1><span>Add New Project</span></h1>
                </header>
				<div>
					<p>Project Details:</p>
				</div>
				<div>
                    <label>Sub GBU:</label>
					<asp:dropdownlist id="cboCategory" runat="server" DataValueField="value" DataTextField="value"/>
					<label>Plant / Location:</label>
					<asp:dropdownlist id="cboPlant" runat="server" DataValueField="PlantDesc" DataTextField="PlantDesc"/>
				</div>
				<div>
					<label>Business(Brand):</label>
					<asp:dropdownlist id="cboBusiness" runat="server" DataValueField="value"
					DataTextField="value" OnSelectedIndexChanged="Business_AfterUpdate" AutoPostBack="True"/>
					<label>Business Form:</label>
					<asp:dropdownlist id="cboBusinessForm" runat="server" DataValueField="value" DataTextField="value"/>
					<label>Organizations:</label>
					<asp:dropdownlist id="cboOtherBusiness" runat="server" DataValueField="value" DataTextField="value"/>
				</div>
				<div>
					<label>Project Name:</label>
					<asp:textbox id="txtProjectName" runat="server" Class="txtbox"/>
					<label>Project Leader:</label>
					<asp:dropdownlist id="cboProjectLeader" runat="server" DataValueField="PersonnelID" DataTextField="Name"/>
				</div>
				<div>
					<label>Project Begins:</label>
					<label>Month:</label>
					<asp:dropdownlist id="cboProjectStartMonth" runat="server" DataValueField="MonthInteger" DataTextField="MonthLiteral" OnSelectedIndexChanged="ProjectMonth_AfterUpdate" AutoPostBack="True"/>
					<label>Year:</label>
					<asp:dropdownlist id="cboProjectStartYear" runat="server" DataValueField="YearInteger" DataTextField="YearInteger" OnSelectedIndexChanged="ProjectYear_AfterUpdate" AutoPostBack="True"/>
					<label>Savings Begin:</label>
					<label>Month:</label>
					<asp:dropdownlist id="cboSavingsStartMonth" runat="server" DataValueField="MonthInteger" DataTextField="MonthLiteral"/>
					<label>Year:</label>
					<asp:dropdownlist id="cboSavingsStartYear" runat="server" DataValueField="YearInteger" DataTextField="YearInteger"/>
				</div>
				<div>
					<label>Status:</label>
					<asp:dropdownlist id="cboStatus" runat="server" DataTextField="Status" DataValueField="Status" Class="txtBox"/>
				</div>
				<div>
					<label>PROJECT TYPE: </label> 
					<label>TDC</label>
					<asp:checkbox id="TDCCheck" AutoPostBack="True" OnCheckedChanged="TDC_CheckChanged" Runat="server"></asp:checkbox>
					<label>Cash</label>
					<asp:checkbox id="CashCheck" AutoPostBack="True" OnCheckedChanged="Cash_CheckChanged" Runat="server"></asp:checkbox>
					<label>NOS/ Co-Value Creation CVC</label>
					<asp:checkbox id="CustomerCheck" AutoPostBack="True" OnCheckedChanged="Customer_CheckChanged" Runat="server"></asp:checkbox>
					<label>Supply Chain Time &nbsp;SCT</label>
					<asp:checkbox id="SCTCheck" AutoPostBack="True" OnCheckedChanged="SCT_CheckChanged" Runat="server"></asp:checkbox>
				</div>
			
				<asp:panel id="TDCPanel" Runat="server" Visible="False">
		
				<div>
					<label>TDC Project Details:</label>
				</div>
				<div>
					<label>TDC Element:</label>
					<asp:dropdownlist id="cboCostBucket" runat="server" DataTextField="value" DataValueField="value" AutoPostBack="True" OnSelectedIndexChanged="TDCElement_AfterUpdate"/>
					<label><A href="javascript:popUp('VolumeView.aspx')">View Current Business Volume</A></label>
				</div>
				<div>
					<label>TDC Sub Element:</label>
					<asp:dropdownlist id="cboTDCSubElement" runat="server" DataTextField="value" DataValueField="value" Class="txtBox"/>
				</div>
				<div>
					<label>Total Annual Savings (in $M):</label>
					<asp:textbox id="txtRecoverableLosses" runat="server" Class="txtBox">0</asp:textbox>
					<label>SYSTEM CALCULATIONS</label>
				</div>
				<div>
					<label>Total Annual Cost (in $M): (incl. depr,expenses)</label>
					<asp:textbox id="txtCostAmt" runat="server" Class="txtBox">0</asp:textbox>
					<label>Implied Savings Accounting Date</label>
					<asp:textbox id="AccountingMonth" runat="server" ReadOnly="True"/>/
					<asp:textbox id="AccountingYear" runat="server" ReadOnly="True"/>
				</div>
				<div>
					<label>Probability (in %):</label>
					<asp:dropdownlist id="txtProbability" runat="server" Class="txtBox">
						<asp:ListItem Value="0">0 %</asp:ListItem>
						<asp:ListItem Value="25">25 %</asp:ListItem>
						<asp:ListItem Value="50">50 %</asp:ListItem>
						<asp:ListItem Value="75">75 %</asp:ListItem>
						<asp:ListItem Value="100">100 %</asp:ListItem>
					</asp:dropdownlist>
					<asp:Button id="CalculateTDC" onclick="PerformCalculation" runat="server" CausesValidation="False" Text="Calculate Adj. Value"></asp:Button>
					<label>Probability Adjusted Amount (in $M):</label>
					<asp:textbox id="txtProbabilityAdjustedAmt" runat="server" ReadOnly="True"/>
				</div>
				<div>
					<label>Project Stage</label>
					<asp:dropdownlist id="ProjectStage" tabIndex="23" runat="server" Width="160px" Class="txtBox">
						<asp:ListItem Value="Idea">Idea</asp:ListItem>
						<asp:ListItem Value="Plan To Deliver">Plan To Deliver</asp:ListItem>
						<asp:ListItem Value="Committed to Finance">Committed to Finance</asp:ListItem>
					</asp:dropdownlist>
					<label>Time Adjusted Amount (in $M):</label>
					<asp:textbox id="txtTimeAdjustedAmount" runat="server" ReadOnly="True"/>
				</div>
				<div>
					<label>Total (Time &amp; Prob.) Adjusted Amount (in $M):</label>
					<asp:textbox id="txtTotalAdjustedAmount" runat="server" ReadOnly="True"/>
				</div>
				<div>
					<label>Committed to Forecast (F&amp;A Use only):</label>
					<asp:checkbox id="chkCommitted" runat="server"></asp:checkbox>
				</div>
				<div>
					<label>Additional Comments/Notes:</label>
					<asp:textbox id="txtDescription" runat="server" Class="txtBox"/>
				</div>
			</asp:panel>
			<asp:panel id="CashPanel" Runat="server" Visible="False">
				<div>
					<label>Cash Project Details:</label>
				</div>
				<div>
					<label>Cash Element:</label>
					<asp:dropdownlist id="cboCashElement" runat="server" DataTextField="value" DataValueField="value" AutoPostBack="True" OnSelectedIndexChanged="CashElement_AfterUpdate"/>
				</div>
				<div>
					<label>Cash Sub Element:</label>
					<asp:dropdownlist id="cboCashSubElement" runat="server" DataTextField="value" DataValueField="value" Class="txtBox"/>
				</div>
				<div>
					<label>Total Cash Savings:</label>
					<asp:dropdownlist id="cboTotalCashSaving" runat="server" DataTextField="value" DataValueField="value" Class="txtBox">
						<asp:ListItem></asp:ListItem>
						<asp:ListItem Value="Average">Average</asp:ListItem>
						<asp:ListItem Value="June End">June End</asp:ListItem>
					</asp:dropdownlist>
				</div>
				<div>
					<label>Cash Savings: (if any) (in $M)</label>
					<asp:textbox id="txtCash" runat="server" Class="txtBox">0</asp:textbox>
				</div>
				<div>
					<label>Probability</label>
					<asp:dropdownlist id="cboCashProbability" tabIndex="29" runat="server" Class="txtBox">
						<asp:ListItem Value="0">0 %</asp:ListItem>
						<asp:ListItem Value="25">25 %</asp:ListItem>
						<asp:ListItem Value="50">50 %</asp:ListItem>
						<asp:ListItem Value="75">75 %</asp:ListItem>
						<asp:ListItem Value="100">100 %</asp:ListItem>
					</asp:dropdownlist>
					<asp:Button id="CalculateCash" onclick="subCashProbAdjAmt" runat="server" CausesValidation="False" Text="Calculate Adj. Value"></asp:Button>
					<label>Probability Adjusted Amount (in $M):</label>
					<asp:textbox id="txtCashAdjAmt" runat="server" ReadOnly="True">0</asp:textbox>
				</div>
				<div>
					<label>Additional Comments/Notes:</label>
					<asp:textbox id="txtCashDescription" runat="server" Width="672px" Class="txtBox"/>
				</div>
			</asp:panel>
			<asp:panel id="CustomerPanel" Runat="server" Visible="False">
				<div>
					<label>NOS/Co-Value Creation (CVC) Project Details:</label>
				</div>
				<div>
					<label>CVC Element:</label>
					<asp:dropdownlist id="cboCVCElement" runat="server" DataTextField="value" DataValueField="Value" Class="txtBox"/>
				</div>
				<div>
					<label>Customer Name:</label>
					<asp:dropdownlist id="cboCVCCustomer" runat="server" DataTextField="value" DataValueField="value" Class="txtBox"/>
				</div>
				<div>
					<label>Supplier Name:
					<asp:dropdownlist id="cboCVCSupplier" runat="server" DataTextField="value" DataValueField="value" Class="txtBox"/>
				</div>
				<div>
					<label>Partner Org:</label>
					<asp:ListBox id="lstCVCPartner" tabIndex="35" runat="server" class="chosen-select" SelectionMode="Multiple">
						<asp:ListItem Value="Engineering">Engineering</asp:ListItem>
						<asp:ListItem Value="MPO">MPO</asp:ListItem>
						<asp:ListItem Value="Purchases">Purchases</asp:ListItem>
						<asp:ListItem Value="R&amp;D">R&amp;D</asp:ListItem>
						<asp:ListItem Value="GBU CS/L">GBU CS/L</asp:ListItem>
						<asp:ListItem Value="MS&amp;P CS/L">MS&amp;P CS/L</asp:ListItem>
						<asp:ListItem Value="MS&amp;P CBD">MS&amp;P CBD</asp:ListItem>
						<asp:ListItem Value="Field CBD">Field CBD</asp:ListItem>
						</asp:ListBox>
				</div>
				<div>
					<label>NOS Addition(in $M):</label>
					<asp:textbox id="txtNOS" runat="server" Class="txtBox">0</asp:textbox>
				</div>
				<div>
					<label>Customer Saving/Hurts: (if any) (in $M)</label>
					<asp:textbox id="txtCustomerSaving" runat="server" Class="txtBox">0</asp:textbox>
				</div>
				<div>
					<label>Savings/Hurts (in $M):	</label>
					<asp:textbox id="txtCVCPGSavings" tabIndex="39" runat="server" BackColor="White">0</asp:textbox>
					<label>Overall Supply Chain Savings</label>
				</div>
				<div>
					<label>Probability:</label>
					<asp:dropdownlist id="cboCVCProb" tabIndex="40" runat="server" Class="txtBox">
						<asp:ListItem Value="0">0 %</asp:ListItem>
						<asp:ListItem Value="25">25 %</asp:ListItem>
						<asp:ListItem Value="50">50 %</asp:ListItem>
						<asp:ListItem Value="75">75 %</asp:ListItem>
						<asp:ListItem Value="100">100 %</asp:ListItem>
					</asp:dropdownlist>
					<asp:Button id="CalculateNOS" onclick="subNOSCVCProbAdjAmt" runat="server" CausesValidation="False" Text="Calculate Adj. Value"></asp:Button>
					<label>Probability Adjusted Savings (in $M):</label>
					<asp:textbox id="txtCVCProbAdjAmt" runat="server" ReadOnly="True">0</asp:textbox>
				</div>
				<div>
					<label>Additional Comments/Notes:</label>
					<asp:textbox id="txtCVCDescription" tabIndex="42" runat="server" Width="672px" Class="txtBox"/>
				</div>
			</asp:panel>

			<asp:panel id="SupplyChainTimePanel" Runat="server" Visible="False">
				<div>
				<label>Supply Chain Time(SCT) Project Details:</label>
				</div>
				<div>
					<label>Supply Chain:</label>
					<asp:dropdownlist id="cboSCsupplyChain" runat="server" DataTextField="value" DataValueField="value" Class="txtBox"/>
				</div>
				<div>
					<label>Element:</label>
					<asp:dropdownlist id="cboSCElement" tabIndex="44" runat="server" Class="txtBox">
						<asp:ListItem></asp:ListItem>
						<asp:ListItem Value="Material">Material</asp:ListItem>
						<asp:ListItem Value="Manufacturing">Manufacturing</asp:ListItem>
						<asp:ListItem Value="Distribution">Distribution</asp:ListItem>
						<asp:ListItem Value="International Sourcing">International Sourcing</asp:ListItem>
						<asp:ListItem Value="All (End to End)">All (End to End)</asp:ListItem>
					</asp:dropdownlist>
				</div>
				<div>
					<label>Sub Element:</label>
					<label>Source:</label>
					<asp:dropdownlist id="cboSCSubElement" tabIndex="45" runat="server" Class="txtBox">
						<asp:ListItem></asp:ListItem>
						<asp:ListItem Value="Supplier to Plant Time (Materials)">Supplier to Plant Time (Materials)</asp:ListItem>
						<asp:ListItem Value="Cycle TIme/ DNBR Time (Manufacturing)">Cycle TIme/ DNBR Time (Manufacturing)</asp:ListItem>
						<asp:ListItem Value="Order to Delivery Time (Distribution)">Order to Delivery Time (Distribution)</asp:ListItem>
						<asp:ListItem Value="Int'l Sourcing to Destination Time (Sourcing)">Int'l Sourcing to Destination Time (Sourcing)</asp:ListItem>
						<asp:ListItem Value="Supplier to Customer Time (All - End to End)">Supplier to Customer Time (All - End to End)</asp:ListItem>
					</asp:dropdownlist>
				</div>
				<div>
					<label>Supply Chain Time</label>
					<label>Current</label>
					<asp:textbox id="SCTCurrent" runat="server" Class="txtBox">0</asp:textbox>Expected
					<asp:textbox id="SCTExpected" runat="server" Class="txtBox">0</asp:textbox>days<A href="javascript:popUp('LossType.aspx')"></A>
					<label>Total Supply Chain Impact</label>
					<asp:textbox id="txtSCImpact" runat="server" ReadOnly="True">0</asp:textbox>
				</div>
				<div>
					<label>Probability:</label>
					<asp:dropdownlist id="cboSCProbability" tabIndex="48" runat="server" Class="txtBox">
						<asp:ListItem Value="0">0 %</asp:ListItem>
						<asp:ListItem Value="25">25 %</asp:ListItem>
						<asp:ListItem Value="50">50 %</asp:ListItem>
						<asp:ListItem Value="75">75 %</asp:ListItem>
						<asp:ListItem Value="100">100 %</asp:ListItem>
					</asp:dropdownlist>
					<asp:Button id="CalculateSCT" onclick="subSCTProbAdjAmt" runat="server" CausesValidation="False" Text="Calculate Adj. Value"></asp:Button>
				</div>
				<div>
					<label>Additional Comments/Notes:</label>
					<asp:textbox id="txtSCDescription" tabIndex="50" runat="server" Width="672px" Class="txtBox"/>
				</div>
		</asp:panel>
	
				<div>
					<span class="centercolumn">Additional Info (Optional):</label>
				</div>
				<div>
					<label>Loss Type:</label>
					<asp:dropdownlist id="cboLossType" runat="server" DataValueField="LossType" DataTextField="LossType"/><A href="javascript:popUp('LossType.aspx')"></A>
					<label>Department</label>
					<asp:dropdownlist id="cboDepartment" runat="server" DataValueField="Value" DataTextField="Value"/>
				</div>
				<div>
					<label>Included in TDC Standards (for F&amp;A Use)</label>
					<asp:checkbox id="chkStandards" runat="server"></asp:checkbox>
				</div>
		
				<div>
					<asp:button id="SaveProject" onclick="SaveNewProject" runat="server" Text="Save Project"></asp:button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<asp:button id="Cancel" runat="server" Text="Cancel" CausesValidation="False"></asp:button>
				</div>
				<div>
					<span class="centercolumn"><asp:label id="TestOut" runat="server"></asp:label>
				</div>
				<div>
					<span class="centercolumn">
					<asp:requiredfieldvalidator id="Requiredfieldvalidator1" runat="server" ErrorMessage="Enter Project Name" ControlToValidate="txtProjectName"></asp:requiredfieldvalidator>
					<asp:requiredfieldvalidator id="Requiredfieldvalidator2" runat="server" ErrorMessage="Select Project Leader" ControlToValidate="cboProjectLeader"></asp:requiredfieldvalidator>
					<asp:requiredfieldvalidator id="Requiredfieldvalidator3" runat="server" ErrorMessage="Select Status" ControlToValidate="cboStatus"></asp:requiredfieldvalidator>
					<asp:requiredfieldvalidator id="Requiredfieldvalidator4" runat="server" ErrorMessage="Select Project Start Year" ControlToValidate="cboProjectStartYear"></asp:requiredfieldvalidator>
					<asp:requiredfieldvalidator id="Requiredfieldvalidator5" runat="server" ErrorMessage="Select Project Start Month" ControlToValidate="cboProjectStartMonth"></asp:requiredfieldvalidator>
					<asp:requiredfieldvalidator id="Requiredfieldvalidator6" runat="server" ErrorMessage="Select Savings Start Year" ControlToValidate="cboSavingsStartYear"></asp:requiredfieldvalidator>
					<asp:requiredfieldvalidator id="Requiredfieldvalidator7" runat="server" ErrorMessage="Select Savings Start Month" ControlToValidate="cboSavingsStartMonth"></asp:requiredfieldvalidator>
					<asp:requiredfieldvalidator id="Requiredfieldvalidator9" runat="server" ErrorMessage="Select TDC Element" ControlToValidate="cboCostBucket"></asp:requiredfieldvalidator>
					<asp:requiredfieldvalidator id="Requiredfieldvalidator13" runat="server" ErrorMessage="Select Sub GBU" ControlToValidate="cboCategory"></asp:requiredfieldvalidator>
					<asp:requiredfieldvalidator id="Requiredfieldvalidator10" runat="server" ErrorMessage="Select Plant" ControlToValidate="cboPlant"></asp:requiredfieldvalidator>
					<asp:requiredfieldvalidator id="Requiredfieldvalidator11" runat="server" ErrorMessage="Select Business" ControlToValidate="cboBusiness"></asp:requiredfieldvalidator>
					<asp:requiredfieldvalidator id="Requiredfieldvalidator8" runat="server" ErrorMessage="Select Total Annual Savings" ControlToValidate="txtRecoverableLosses"></asp:requiredfieldvalidator>
					<asp:requiredfieldvalidator id="Requiredfieldvalidator14" runat="server" ErrorMessage="Select Probability" ControlToValidate="txtProbability"></asp:requiredfieldvalidator>
					<asp:validationsummary id="Validationsummary1" runat="server" ShowMessageBox="true" ShowSummary="false" HeaderText="You must enter/select a value in the following &#13;&#10;fields:" EnableClientScript="true"></asp:validationsummary>
				</div>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
	  		<script src="Scripts/chosen.jquery.js" type="text/javascript"></script>
	  		<script src="Scripts/prism.js" type="text/javascript" charset="utf-8"></script>
	  		<script type="text/javascript">
	  		    var config = {
	  		        '.chosen-select': {},
	  		        '.chosen-select-deselect': { allow_single_deselect: true },
	  		        '.chosen-select-no-single': { disable_search_threshold: 10 },
	  		        '.chosen-select-no-results': { no_results_text: 'Oops, nothing found!' },
	  		        '.chosen-select-width': { width: "95%" }
	  		    }
	  		    for (var selector in config) {
	  		        $(selector).chosen(config[selector]);
	  		    }
		  	</script>
</asp:Content>
