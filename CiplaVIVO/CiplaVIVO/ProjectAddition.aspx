<%@ Page Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeBehind="ProjectAddition.aspx.vb" Inherits="CiplaVIVO.ProjectAddition" %>

	<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">        
        
         <div class="row">
                <div class="col-lg-12">
                    <h4 class="page-header">Add a Project</h4>
                </div>
                <!-- /.col-lg-12 -->
         </div>
        <!-- /.row -->
         <!-- PANEL 1 -->
        <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Project Details
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-4">
                                   <div class="form-group">
                                        <label>Business Unit:</label>
                                        <asp:dropdownlist id="cboBusinessUnit" Class="form-control" runat="server" DataValueField="value" DataTextField="value"/>
                                    </div>
                                     
                                    <div class="form-group">
                                        <label>Direct/Indirect/Capex:</label>
                                           <asp:dropdownlist id="cboDIC" Class="form-control" runat="server" OnSelectedIndexChanged="DIC_AfterUpdate" AutoPostBack="True">
                                                <asp:ListItem Value=""></asp:ListItem>
	                        					<asp:ListItem Value="Directs">Direct</asp:ListItem>
                        						<asp:ListItem Value="Indirects">Indirects</asp:ListItem>
						                        <asp:ListItem Value="Capex">Capex</asp:ListItem>
						                    </asp:dropdownlist>
                                      </div>

                                    <div class="form-group">
					                    <label>Project Name:</label>
					                    <asp:textbox id="txtProjectName" Class="form-control" runat="server"/>
				                    </div>
				                    <div class="form-group">
                                        <label>Project Leader:</label>
					                    <asp:dropdownlist id="cboProjectLeader" Class="form-control" runat="server" DataValueField="PersonnelID" DataTextField="Name"/>
				                    </div>
                        
                                </div>
                                <!-- /.col-lg-4 (nested) -->
                                <div class="col-lg-4">
                                   <div class="form-group">
                                    	<label>Department</label>
					                    <asp:dropdownlist id="cboDepartment" Class="form-control" runat="server" DataValueField="Value" DataTextField="Value" OnSelectedIndexChanged="Department_AfterUpdate" AutoPostBack="True"/>
				                   </div>
                                    <div class="form-group">
                                    	<label>Expense Head</label>
					                    <asp:ListBox id="cboExpenseHead" Class="form-control" SelectionMode="Multiple"  runat="server" DataValueField="Value" DataTextField="Value" AppendDataBoundItems="true"/>
				                   </div>
                                    <div class="form-group">
                                        <label>Finance Leader:</label>
					                    <asp:dropdownlist id="cboFinanceLeader" Class="form-control" runat="server" DataValueField="PersonnelID" DataTextField="Name"/>
				                    </div>
                                </div>
                                <!-- /.col-lg-4 (nested) -->
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <label>Category:</label>
					                    <asp:ListBox id="cboCategory" Class="form-control" SelectionMode="Multiple" runat="server" DataValueField="Value" DataTextField="Value" AppendDataBoundItems="true"/>
                                    </div>
                                    <div class="form-group">
                                        <label>P&L/Capex</label>
                                        <asp:RadioButtonList ID="plcapex" CssClass="radio-inline" runat="server">
                                            <asp:ListItem selected="true" Value="P&L">P&L</asp:ListItem>
                                            <asp:ListItem Value="Capex">Capex</asp:ListItem>
                                        </asp:RadioButtonList>
                                     </div>
                                     <div class="form-group">
                                        <label>Team Members:</label>
					                    <asp:ListBox id="cboTeamMembers" Class="form-control" SelectionMode="Multiple" runat="server" DataValueField="PersonnelID" DataTextField="Name" AppendDataBoundItems="true"/>
				                    </div>
                                </div>
                                <!-- /.col-lg-4 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        <!-- End of PANEL 1 -->
        <!-- PANEL 2 -->
        <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Optional Project Fields
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="form-group">
                                    	<label>Dosage</label>
					                    <asp:ListBox id="cboDosage" Class="form-control" SelectionMode="Multiple"  runat="server" DataValueField="Value" DataTextField="Value" AppendDataBoundItems="true"/>
				                   </div>
                                    <div class="form-group">
                                    	<label>Manufacturing Code</label>
					                    <asp:ListBox id="cboMfgCode" Class="form-control" SelectionMode="Multiple"  runat="server" DataValueField="Value" DataTextField="Value" AppendDataBoundItems="true"/>
				                   </div>
                                   
                                </div>
                                <!-- /.col-lg-4 (nested) -->
                                <div class="col-lg-4">
                                   <div class="form-group">
                                    	<label>Therapy</label>
					                    <asp:ListBox id="cboTherapy" Class="form-control" SelectionMode="Multiple"  runat="server" DataValueField="Value" DataTextField="Value" AppendDataBoundItems="true"/>
				                   </div>
                                   
                                    <div class="form-group">
                                    	<label>Pack Code</label>
					                    <asp:ListBox id="cboPackcode" Class="form-control" SelectionMode="Multiple"  runat="server" DataValueField="Value" DataTextField="Value" AppendDataBoundItems="true"/>
				                   </div>
                                </div>
                                <!-- /.col-lg-4 (nested) -->
                                <div class="col-lg-4">
                                    <div class="form-group">
                                    	<label>Manufacturing Code</label>
					                    <asp:ListBox id="cboManfCode" Class="form-control" SelectionMode="Multiple"  runat="server" DataValueField="Value" DataTextField="Value" AppendDataBoundItems="true"/>
				                   </div>
                                </div>
                                <!-- /.col-lg-4 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        <!-- End of PANEL 2 -->
        <!-- PANEL 3 -->
        <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Saving Fields
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-lg-4">
					                            <label>Project Begin:</label>
					                         </div>
                                             <div class="col-lg-4">
                                                 <label>Month:</label>
					                            <asp:dropdownlist id="cboProjectStartMonth" Class="form-control" runat="server" DataValueField="MonthInteger" DataTextField="MonthLiteral" OnSelectedIndexChanged="ProjectMonth_AfterUpdate" AutoPostBack="True"/>
					                         </div>
                                             <div class="col-lg-4">
					                            <label>Year:</label>
					                            <asp:dropdownlist id="cboProjectStartYear" Class="form-control" runat="server" DataValueField="YearInteger" DataTextField="YearLiteral" OnSelectedIndexChanged="ProjectYear_AfterUpdate" AutoPostBack="True"/>
				                            </div>
                                       </div>
                                        </div>
                                    <div class="form-group">
					                    <label>Total Annual Savings:</label>
					                    <asp:textbox id="txtRecoverableLosses" Class="form-control" runat="server">0</asp:textbox>
				                    </div>
				                    <div class="form-group">
					                    <label>Risk Rating (in %):</label>
					                    <asp:dropdownlist id="txtProbability" Class="form-control" runat="server">
						                    <asp:ListItem Value="0">0% - Nil to Low</asp:ListItem>
						                    <asp:ListItem Value="25">25% - Low Probability</asp:ListItem>
						                    <asp:ListItem Value="50">50% - Medium</asp:ListItem>
						                    <asp:ListItem Value="75">75% - High</asp:ListItem>
						                    <asp:ListItem Value="100">100% - In the bag</asp:ListItem>
					                    </asp:dropdownlist>
				                    </div>
                                    <div class="form-group">
                                         <asp:Button id="CalculateTDC" onclick="PerformCalculation" Visible="false" Class="btn btn-primary" runat="server" CausesValidation="False" Text="Calculate Adjusted Value"></asp:Button>
			                        </div>
                                    <div class="form-group">
                                        <label>Probability Adjusted Amount (in $M):</label>
					                    <asp:textbox id="txtProbabilityAdjustedAmt" Class="form-control" runat="server" ReadOnly="True"/>
				                    </div>
				                    
                                </div>
                                <!-- /.col-lg-4 (nested) -->
                                <div class="col-lg-4">
                                   <div class="form-group">
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <label>Savings Begin:</label>
                                            </div>
                                            <div class="col-lg-4">
					                            <label>Month:</label>
					                            <asp:dropdownlist id="cboSavingsStartMonth" Class="form-control" runat="server" DataValueField="MonthInteger" DataTextField="MonthLiteral"/>
					                        </div>
                                            <div class="col-lg-4">
                                                <label>Year:</label>
					                            <asp:dropdownlist id="cboSavingsStartYear" Class="form-control" runat="server" DataValueField="YearInteger" DataTextField="YearLiteral"/>
				                            </div>
                                            </div>
                                       </div>
                                    <div class="form-group">
					                    <label>Any one off saving included?</label>
					                    <asp:textbox id="txtOneOffRecoverable" Class="form-control" runat="server">0</asp:textbox>
                                     </div>
                                    <div class="form-group">
					                    <label>Status:</label>
					                    <asp:dropdownlist id="cboStatus" Class="form-control" runat="server" DataTextField="Status" DataValueField="Status"/>
				                    </div>
                                    <div class="form-group">
					                    <asp:textbox id="AccountingMonth" Visible="false" Class="form-control" runat="server" ReadOnly="True"/>
				                    </div>
				                    <div class="form-group">
                                        <label>Time Adjusted Amount (in $M):</label>
					                    <asp:textbox id="txtTimeAdjustedAmount" Class="form-control" runat="server" ReadOnly="True"/>
				                    </div>
				                                                        
                                </div>
                                <!-- /.col-lg-4 (nested) -->
                                <div class="col-lg-4">
                                  <div class="form-group">
                                      <div class="row">
                                            <div class="col-lg-4">
                                                <label>Savings ends:</label>
                                            </div>
                                            <div class="col-lg-4">
					                            <label>Month:</label>
					                            <asp:dropdownlist id="cboTenureEndMonth" Class="form-control" runat="server" DataValueField="MonthInteger" DataTextField="MonthLiteral"/>
					                        </div>
                                            <div class="col-lg-4">
                                                <label>Year:</label>
					                            <asp:dropdownlist id="cboTenureEndYear" Class="form-control" runat="server" DataValueField="YearInteger" DataTextField="YearLiteral"/>
				                            </div>
                                          </div>
                                      </div>
                                    <div class="form-group">
					                    <label>Currency:</label>
					                    <asp:dropdownlist id="cboCurrency" Class="form-control" runat="server" DataTextField="Currency" DataValueField="value"/>
				                    </div>
                                    <div class="form-group">
					                    <label>Committed to Forecast (F&amp;A Use only):</label>
					                    <asp:checkbox id="chkCommitted" Class="form-control" runat="server"></asp:checkbox>
				                    </div>
                                    <div class="form-group">
					                    <asp:textbox id="AccountingYear" Visible="false" Class="form-control" runat="server" ReadOnly="True"/>
				                    </div>
                                    <div class="form-group">
					                    <label>Total (Time &amp; Prob.) Adjusted Amount (in $M):</label>
					                    <asp:textbox id="txtTotalAdjustedAmount" Class="form-control" runat="server" ReadOnly="True"/>
				                    </div>
                                </div>
                                <!-- /.col-lg-4 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        <!-- End of PANEL 3 -->
        <!-- PANEL 4 -->
        <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Cost Fields
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-3">
					                    <label>Cost Buckets</label>
					                </div>
                                    <div class="col-lg-3">
                                        <label>Cost Amount</label>
                                    </div>
                                    <div class="col-lg-3">
                                        <label>Currency</label>				                    
                                    </div>
                                    <div class="col-lg-3">
                                        <label>Justification</label>				                    
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-3">
					                    <label>Capex</label>
					                </div>
                                    <div class="col-lg-3">
                                        <asp:textbox id="Textbox1" Class="form-control" runat="server">0</asp:textbox>
                                    </div>
                                    <div class="col-lg-3">
					                <asp:dropdownlist id="Dropdownlist3" Class="form-control" runat="server" DataValueField="YearInteger" DataTextField="YearLiteral" OnSelectedIndexChanged="ProjectYear_AfterUpdate" AutoPostBack="True"/>
				                    </div>
                                    <div class="col-lg-3">
                                        <asp:textbox id="Textbox4" Class="form-control" runat="server">0</asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-3">
					                    <label>Working Capital</label>
					                </div>
                                    <div class="col-lg-3">
                                        <asp:textbox id="Textbox5" Class="form-control" runat="server">0</asp:textbox>
                                    </div>
                                    <div class="col-lg-3">
					                <asp:dropdownlist id="Dropdownlist1" Class="form-control" runat="server" DataValueField="YearInteger" DataTextField="YearLiteral" OnSelectedIndexChanged="ProjectYear_AfterUpdate" AutoPostBack="True"/>
				                    </div>
                                    <div class="col-lg-3">
                                        <asp:textbox id="Textbox6" Class="form-control" runat="server">0</asp:textbox>
                                    </div>
                                </div>
                            </div>
                             <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-12">
					                    <label>Opex:</label>
					                </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-3">
					                    <label>Regulatory Cost</label>
					                </div>
                                    <div class="col-lg-3">
                                        <asp:textbox id="Textbox2" Class="form-control" runat="server">0</asp:textbox>
                                    </div>
                                    <div class="col-lg-3">
					                <asp:dropdownlist id="Dropdownlist2" Class="form-control" runat="server" DataValueField="YearInteger" DataTextField="YearLiteral" OnSelectedIndexChanged="ProjectYear_AfterUpdate" AutoPostBack="True"/>
				                    </div>
                                    <div class="col-lg-3">
                                        <asp:textbox id="Textbox3" Class="form-control" runat="server">0</asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <!-- /.row (nested) -->
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-3">
					                    <label>Sample Cost</label>
					                </div>
                                    <div class="col-lg-3">
                                        <asp:textbox id="Textbox7" Class="form-control" runat="server">0</asp:textbox>
                                    </div>
                                    <div class="col-lg-3">
					                <asp:dropdownlist id="Dropdownlist4" Class="form-control" runat="server" DataValueField="YearInteger" DataTextField="YearLiteral" OnSelectedIndexChanged="ProjectYear_AfterUpdate" AutoPostBack="True"/>
				                    </div>
                                    <div class="col-lg-3">
                                        <asp:textbox id="Textbox8" Class="form-control" runat="server">0</asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <!-- /.row (nested) -->
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-3">
					                    <label>R&D Cost</label>
					                </div>
                                    <div class="col-lg-3">
                                        <asp:textbox id="Textbox9" Class="form-control" runat="server">0</asp:textbox>
                                    </div>
                                    <div class="col-lg-3">
					                <asp:dropdownlist id="Dropdownlist5" Class="form-control" runat="server" DataValueField="YearInteger" DataTextField="YearLiteral" OnSelectedIndexChanged="ProjectYear_AfterUpdate" AutoPostBack="True"/>
				                    </div>
                                    <div class="col-lg-3">
                                        <asp:textbox id="Textbox10" Class="form-control" runat="server">0</asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <!-- /.row (nested) -->
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-3">
					                    <label>QA/QC Cost</label>
					                </div>
                                    <div class="col-lg-3">
                                        <asp:textbox id="Textbox11" Class="form-control" runat="server">0</asp:textbox>
                                    </div>
                                    <div class="col-lg-3">
					                <asp:dropdownlist id="Dropdownlist6" Class="form-control" runat="server" DataValueField="YearInteger" DataTextField="YearLiteral" OnSelectedIndexChanged="ProjectYear_AfterUpdate" AutoPostBack="True"/>
				                    </div>
                                    <div class="col-lg-3">
                                        <asp:textbox id="Textbox12" Class="form-control" runat="server">0</asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <!-- /.row (nested) -->
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-3">
					                    <label>Audit Cost</label>
					                </div>
                                    <div class="col-lg-3">
                                        <asp:textbox id="Textbox13" Class="form-control" runat="server">0</asp:textbox>
                                    </div>
                                    <div class="col-lg-3">
					                <asp:dropdownlist id="Dropdownlist7" Class="form-control" runat="server" DataValueField="YearInteger" DataTextField="YearLiteral" OnSelectedIndexChanged="ProjectYear_AfterUpdate" AutoPostBack="True"/>
				                    </div>
                                    <div class="col-lg-3">
                                        <asp:textbox id="Textbox14" Class="form-control" runat="server">0</asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <!-- /.row (nested) -->
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-3">
					                    <label>Other Cost</label>
					                </div>
                                    <div class="col-lg-3">
                                        <asp:textbox id="Textbox15" Class="form-control" runat="server">0</asp:textbox>
                                    </div>
                                    <div class="col-lg-3">
					                <asp:dropdownlist id="Dropdownlist8" Class="form-control" runat="server" DataValueField="YearInteger" DataTextField="YearLiteral" OnSelectedIndexChanged="ProjectYear_AfterUpdate" AutoPostBack="True"/>
				                    </div>
                                    <div class="col-lg-3">
                                        <asp:textbox id="Textbox16" Class="form-control" runat="server">0</asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <!-- /.row (nested) -->
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-3">
					                    <label>Total Cost</label>
					                </div>
                                    <div class="col-lg-3">
                                        <asp:textbox id="txtCostAmt" Class="form-control" runat="server">0</asp:textbox>
                                    </div>
                                    <div class="col-lg-3">
					                <asp:dropdownlist id="Dropdownlist9" Class="form-control" runat="server" DataValueField="YearInteger" DataTextField="YearLiteral" OnSelectedIndexChanged="ProjectYear_AfterUpdate" AutoPostBack="True"/>
				                    </div>
                                    <div class="col-lg-3">
                                        <asp:textbox id="Textbox18" Class="form-control" runat="server">0</asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <!-- /.row (nested) -->

                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
                <div class="form-group">
					<asp:button id="SaveProject" onclick="SaveNewProject" Class="btn btn-primary" runat="server" Text="Save Project"></asp:button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<asp:button id="Cancel" Class="btn btn-danger" runat="server" Text="Cancel" CausesValidation="False"></asp:button>
				</div>
</asp:Content>
                               