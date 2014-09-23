<%@ Page Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeBehind="ProjectAddition.aspx.vb" Inherits="CiplaVIVO.ProjectAddition" %>

	<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">        
     <div class="row">
                <div class="col-lg-12">
                    <h4 class="page-header">Add a Project</h4>
                </div>
                <!-- /.col-lg-12 -->
     </div>
     <div>
		    <asp:ValidationSummary runat=server ForeColor="red" HeaderText="There were errors on the page:" />
	</div>
    <!-- /.row -->
    
    <!-- OVERALL PANEL GROUP -->
   
    <div class="panel-group" id="accordion">

    <!-- PANEL 1 -->
   
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                            Project Details
                                </a>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-4">
                                   <div class="form-group">
                                        <asp:RequiredFieldValidator runat=server ForeColor="red" ControlToValidate=txtProjectName ErrorMessage="Project Name is required.">*</asp:RequiredFieldValidator>
					                    <label>Project Name:</label>
					                    <asp:textbox id="txtProjectName" Class="form-control" runat="server"/>
				                   </div>
                                   
                                   <div class="form-group">
                                        <label>&nbsp;Project Leader:</label>
					                    <asp:dropdownlist id="cboProjectLeader" Class="form-control" runat="server" DataValueField="PersonnelID" DataTextField="Name"/>
				                   </div>
                                   <div class="form-group">
                                        <label>Finance Leader:</label>
					                    <asp:dropdownlist id="cboFinanceLeader" Class="form-control" runat="server" DataValueField="PersonnelID" DataTextField="Name"/>
				                    </div>
                                    
                                    <div class="form-group">
                                        <label>Team Members:</label>
					                    <asp:ListBox id="cboTeamMembers" Class="form-control" SelectionMode="Multiple" runat="server" DataValueField="PersonnelID" DataTextField="Name" AppendDataBoundItems="true"/>
				                    </div>
                                   
                                </div>
                                <!-- /.col-lg-4 (nested) -->
                                <div class="col-lg-4">
                                   <div class="form-group">
                                    	<label>Department</label>
					                    <asp:dropdownlist id="cboDepartment" Class="form-control" runat="server" DataValueField="Value" DataTextField="Value" OnSelectedIndexChanged="Department_AfterUpdate" AutoPostBack="True"/>
				                   </div>

                                   <div class="form-group">
                                        <label>&nbsp;Category:</label>
					                    <asp:ListBox id="cboCategory" Class="form-control" SelectionMode="Multiple" runat="server" DataValueField="Value" DataTextField="Value" AppendDataBoundItems="true"/>
                                   </div>

                                   <div class="form-group">
                                        <label>&nbsp;Business Unit:</label>
                                        <asp:dropdownlist id="cboBusinessUnit" Class="form-control" SelectionMode="Multiple"  runat="server" DataValueField="value" DataTextField="value"/>
                                   </div>

                                    
                                </div>
                                <!-- /.col-lg-4 (nested) -->
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <label>Direct/Indirect</label>
                                           <asp:dropdownlist id="cboDIC" Class="form-control" runat="server" OnSelectedIndexChanged="DIC_AfterUpdate" AutoPostBack="True">
                                                <asp:ListItem Value="Direct">Direct</asp:ListItem>
                        						<asp:ListItem Value="Indirect">Indirect</asp:ListItem>
						                    </asp:dropdownlist>
                                    </div>
                                    <div class="form-group">
                                    	<label>Expense Head</label>
					                    <asp:dropdownlist id="cboExpenseHead" Class="form-control" runat="server" DataValueField="Value" DataTextField="Value"/>
				                   </div>
                                    <div class="form-group">
                                        <label>P&L/Capex</label>
                                        <asp:RadioButtonList ID="plcapex" CssClass="radio-inline" runat="server">
                                            <asp:ListItem selected="true" Value="P&L">P&L</asp:ListItem>
                                            <asp:ListItem Value="Capex">Capex</asp:ListItem>
                                        </asp:RadioButtonList>
                                     </div>

                                    <div class="form-group">
                                        <label>Project Classification:</label>
                                           <asp:dropdownlist id="cboProjectClassification" Class="form-control" runat="server">
                                                <asp:ListItem Value="Cost Saving">Cost Saving</asp:ListItem>
						                        <asp:ListItem Value="Risk Mitigation">Risk Mitigation</asp:ListItem>
                        						<asp:ListItem Value="Compliance">Compliance</asp:ListItem>
                                                <asp:ListItem Value="Inventory Salvage">Inventory Salvage</asp:ListItem>
						                    </asp:dropdownlist>
                                    </div>
                                    <div class="form-group">
					                    <label>&nbsp;Project Summary:</label>
					                    <asp:textbox id="txtProjectSummary" Class="form-control" runat="server"/>
				                   </div>
                                    
                                     
                                </div>
                                <!-- /.col-lg-4 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
     
        <!-- /.row -->
        </div>
        <!-- End of PANEL 1 -->
        <!-- PANEL 2 -->
                    <div class="panel-warning">
                        <div class="panel-heading">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                            Optional Fields
                            </a>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="form-group">
                                    	<label>&nbsp;Dosage</label>
					                    <asp:ListBox id="cboDosage" Class="form-control" SelectionMode="Multiple"  runat="server" DataValueField="Value" DataTextField="Value" AppendDataBoundItems="true"/>
				                   </div>
                                    <div class="form-group">
                                    	<label>&nbsp;Manufacturing Code</label>
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
                                    	<label>Bulk Code</label>
					                    <asp:ListBox id="cboBulkCode" Class="form-control" SelectionMode="Multiple"  runat="server" DataValueField="Value" DataTextField="Value" AppendDataBoundItems="true"/>
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
        <!-- End of PANEL 2 -->
        <!-- PANEL 3 -->
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                            Saving Fields
                                </a>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <label>Project Begin:</label>
					                     <asp:dropdownlist id="cboProjectStartMonth" Class="form-control" runat="server" DataValueField="MonthInteger" DataTextField="MonthLiteral" OnSelectedIndexChanged="ProjectMonth_AfterUpdate" AutoPostBack="True"/>
					                    <asp:dropdownlist id="cboProjectStartYear" Class="form-control" runat="server" DataValueField="YearInteger" DataTextField="YearLiteral" OnSelectedIndexChanged="ProjectYear_AfterUpdate" AutoPostBack="True"/>
				                    </div>
                                    <div class="form-group">
                                         <label>Project Ends:</label>
					                     <asp:dropdownlist id="cboProjectEndMonth" Class="form-control" runat="server" DataValueField="MonthInteger" DataTextField="MonthLiteral"/>
					                     <asp:dropdownlist id="cboProjectEndYear" Class="form-control" runat="server" DataValueField="YearInteger" DataTextField="YearLiteral"/>
				                    </div>
                                   <div class="form-group">
                                       <label>Savings Begin:</label>
                                                <asp:dropdownlist id="cboSavingsStartMonth" Class="form-control" runat="server" DataValueField="MonthInteger" DataTextField="MonthLiteral"/>
					                            <asp:dropdownlist id="cboSavingsStartYear" Class="form-control" runat="server" DataValueField="YearInteger" DataTextField="YearLiteral"/>
				                    </div>
                                    <div class="form-group">
                                                <label>Savings Ends:</label>
                                                <asp:dropdownlist id="cboSavingsEndMonth" Class="form-control" runat="server" DataValueField="MonthInteger" DataTextField="MonthLiteral"/>
					                            <asp:dropdownlist id="cboSavingsEndYear" Class="form-control" runat="server" DataValueField="YearInteger" DataTextField="YearLiteral"/>
				                      </div>
                                </div>
                                <!-- /.col-lg-4 (nested) -->
                                <div class="col-lg-4">
                                   <div class="form-group">
                                        <asp:RequiredFieldValidator runat=server ForeColor="red" ControlToValidate=txtAnnualSavings ErrorMessage="Annual Savings is required.">*</asp:RequiredFieldValidator>
					                    <label>Total Annual Savings:</label>
					                    <asp:textbox id="txtAnnualSavings" onkeypress="return onlyNumbers();" Class="form-control" runat="server"></asp:textbox>
				                    </div>
				                    <div class="form-group">
					                    <label>Any one off saving included?</label>
					                    <asp:textbox id="txtOneOffSaving" onkeypress="return onlyNumbers();" Class="form-control" runat="server">0</asp:textbox>
                                     </div>
                                    <div class="form-group">
					                    <label>Currency:</label>
					                    <asp:dropdownlist id="cboCurrency" Class="form-control" runat="server" DataTextField="Currency" DataValueField="value"/>
				                    </div>
                                    <div class="form-group">
					                    <label>Status:</label>
					                    <asp:dropdownlist id="cboStatus" Class="form-control" runat="server" DataTextField="Status" DataValueField="Status"/>
				                    </div>
                                    <div class="form-group">
					                    <label>&nbsp;Probability (Risk) Rating (in %):</label>
					                    <asp:dropdownlist id="cboProbability" Class="form-control" runat="server">
						                    <asp:ListItem Value="0">0% - Nil to Low</asp:ListItem>
						                    <asp:ListItem Value="25">25% - Low Probability</asp:ListItem>
						                    <asp:ListItem Value="50">50% - Medium</asp:ListItem>
						                    <asp:ListItem Value="75">75% - High</asp:ListItem>
						                    <asp:ListItem Value="100">100% - In the bag</asp:ListItem>
					                    </asp:dropdownlist>
				                    </div>
                                    <div class="form-group">
                                         <asp:Button id="CalculateTDC" onclick="PerformCalculation" Class="btn btn-primary" runat="server" CausesValidation="False" Text="Calculate Adjusted Value"></asp:Button>
			                        </div>
				                                                        
                                </div>
                                <!-- /.col-lg-4 (nested) -->
                                <div class="col-lg-4">
                                    <div class="form-group">
					                    <label>Stage</label>
					                    <asp:textbox id="txtStage" Class="form-control" runat="server"></asp:textbox>
                                     </div>
                                    
                                    <div class="form-group">
					                    <label>Committed to Forecast (F&amp;A Use only):</label>
					                    <asp:checkbox id="chkCommitted" Class="form-control" runat="server"></asp:checkbox>
				                    </div>
                                    <div class="form-group">
                                        <label>Time Adjusted Amount (in $M):</label>
					                    <asp:textbox id="txtTimeAdjustedAmount" Class="form-control" runat="server" ReadOnly="True"/>
				                    </div>
                                    <div class="form-group">
                                        <label>&nbsp;Probability Adjusted Amount (in $M):</label>
					                    <asp:textbox id="txtProbabilityAdjustedAmt" Class="form-control" runat="server" ReadOnly="True"/>
				                    </div>
                                    <div class="form-group">
					                    <label>Total (Time &amp; Prob.) Adjusted Amount (in $M):</label>
					                    <asp:textbox id="txtTotalAdjustedAmount" Class="form-control" runat="server" ReadOnly="True"/>
				                    </div>
                                    <div class="form-group">
					                    <asp:textbox id="txtAccountingMonth" Visible="false" Class="form-control" runat="server" ReadOnly="True"/>
				                    </div>
				                    <div class="form-group">
					                    <asp:textbox id="txtAccountingYear" Visible="false" Class="form-control" runat="server" ReadOnly="True"/>
				                    </div>
                                    
				                    
                                </div>
                                <!-- /.col-lg-4 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
        <!-- End of PANEL 3 -->
        </div>
        <!-- PANEL 4 -->
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
                            Cost Fields
                                </a>
                        </div>
                        <div id="collapseFour" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-3">
					                    <label>&nbsp;Cost Buckets</label>
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
					                    <label>&nbsp;Capex</label>
					                </div>
                                    
                                    <div class="col-lg-3">
                                        <asp:textbox id="txtCapexCost" onkeypress="return onlyNumbers();" Class="form-control" runat="server">0</asp:textbox>
                                    </div>
                                    <div class="col-lg-3">
					                <asp:dropdownlist id="cboCapexCurrency" Class="form-control" runat="server"/>
				                    </div>
                                    <div class="col-lg-3">
                                        <asp:textbox id="txtCapexJust" Class="form-control" runat="server">0</asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-3">
					                    <label>&nbsp;Working Capital</label>
					                </div>
                                    <div class="col-lg-3">
                                        <asp:textbox id="txtWorkCapCost" onkeypress="return onlyNumbers();" Class="form-control" runat="server">0</asp:textbox>
                                    </div>
                                    <div class="col-lg-3">
					                <asp:dropdownlist id="cboWorkCapCurrency" Class="form-control" runat="server"/>
				                    </div>
                                    <div class="col-lg-3">
                                        <asp:textbox id="txtWorkCapJust" Class="form-control" runat="server">0</asp:textbox>
                                    </div>
                                </div>
                            </div>
                             <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-12">
					                    <label>&nbsp;Opex:</label>
					                </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-3">
					                    <label>&nbsp;Regulatory Cost</label>
					                </div>
                                    <div class="col-lg-3">
                                        <asp:textbox id="txtRegulatoryCost"  onkeypress="return onlyNumbers();"  Class="form-control" runat="server">0</asp:textbox>
                                    </div>
                                    <div class="col-lg-3">
					                <asp:dropdownlist id="cboRegulatoryCurrency" Class="form-control" runat="server"/>
				                    </div>
                                    <div class="col-lg-3">
                                        <asp:textbox id="txtRegulatoryJust" Class="form-control" runat="server">0</asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <!-- /.row (nested) -->
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-3">
					                    <label>&nbsp;Sample Cost</label>
					                </div>
                                    <div class="col-lg-3">
                                        <asp:textbox id="txtSampleCost" onkeypress="return onlyNumbers();" Class="form-control" runat="server">0</asp:textbox>
                                    </div>
                                    <div class="col-lg-3">
					                <asp:dropdownlist id="cboSampleCurrency" Class="form-control" runat="server"/>
				                    </div>
                                    <div class="col-lg-3">
                                        <asp:textbox id="txtSampleJust" Class="form-control" runat="server">0</asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <!-- /.row (nested) -->
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-3">
					                    <label>&nbsp;R&D Cost</label>
					                </div>
                                    <div class="col-lg-3">
                                        <asp:textbox id="txtRDCost"  onkeypress="return onlyNumbers();" Class="form-control" runat="server">0</asp:textbox>
                                    </div>
                                    <div class="col-lg-3">
					                <asp:dropdownlist id="cboRDCurrency" Class="form-control" runat="server"/>
				                    </div>
                                    <div class="col-lg-3">
                                        <asp:textbox id="txtRDJust" Class="form-control" runat="server">0</asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <!-- /.row (nested) -->
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-3">
					                    <label>&nbsp;QA/QC Cost</label>
					                </div>
                                    <div class="col-lg-3">
                                        <asp:textbox id="txtQACost"  onkeypress="return onlyNumbers();" Class="form-control" runat="server">0</asp:textbox>
                                    </div>
                                    <div class="col-lg-3">
					                <asp:dropdownlist id="cboQACurrency" Class="form-control" runat="server"/>
				                    </div>
                                    <div class="col-lg-3">
                                        <asp:textbox id="txtQAJust" Class="form-control" runat="server">0</asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <!-- /.row (nested) -->
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-3">
					                    <label>&nbsp;Audit Cost</label>
					                </div>
                                    <div class="col-lg-3">
                                        <asp:textbox id="txtAuditCost"  onkeypress="return onlyNumbers();" Class="form-control" runat="server">0</asp:textbox>
                                    </div>
                                    <div class="col-lg-3">
					                <asp:dropdownlist id="cboAuditCurrency" Class="form-control" runat="server"/>
				                    </div>
                                    <div class="col-lg-3">
                                        <asp:textbox id="txtAuditJust" Class="form-control" runat="server">0</asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <!-- /.row (nested) -->
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-3">
					                    <label>&nbsp;Other Cost</label>
					                </div>
                                    <div class="col-lg-3">
                                        <asp:textbox id="txtOtherCost"  onkeypress="return onlyNumbers();" Class="form-control" runat="server">0</asp:textbox>
                                    </div>
                                    <div class="col-lg-3">
					                <asp:dropdownlist id="cboOtherCurrency" Class="form-control" runat="server"/>
				                    </div>
                                    <div class="col-lg-3">
                                        <asp:textbox id="txtOtherJust" Class="form-control" runat="server">0</asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <!-- /.row (nested) -->
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-3">
					                    <label>&nbsp;Total Opex Cost</label>
					                </div>
                                    <div class="col-lg-3">
                                        <asp:textbox id="txtTotalCost" onkeypress="return onlyNumbers();"  Class="form-control" runat="server">0</asp:textbox>
                                    </div>
                                    <div class="col-lg-3">
					                <asp:dropdownlist id="cboTotalCurrency" Class="form-control" runat="server"/>
				                    </div>
                                    <div class="col-lg-3">
                                        <asp:textbox id="txtTotalJust" Class="form-control" runat="server">0</asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <!-- /.row (nested) -->

                        </div>
                        <!-- /.panel-body -->
                    </div>
              </div>
              <!-- /.panel -->
        </div>
    <!-- /.OVERALL PANEL GROUP -->
                <div class="form-group">
                    <label>&nbsp;Any attachment</label><asp:FileUpload ID="FileUpload1" runat="server" />
                    <asp:HyperLink ID="FileLink" runat="server" Visible="false" >[FileLink]</asp:HyperLink>
                    <asp:Button ID="downloadFile" runat="server" Text="Download File" Visible="False" />
                    <br />
					<asp:button id="SaveProject" onclick="SaveNewProject" Class="btn btn-primary" runat="server" Text="Save Project"></asp:button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<asp:button id="Cancel" Class="btn btn-danger" runat="server" Text="Cancel" CausesValidation="False"></asp:button>
                    <br />
                    <asp:textbox id="TestOut" Class="form-control" runat="server">0</asp:textbox>
				</div>
</asp:Content>
