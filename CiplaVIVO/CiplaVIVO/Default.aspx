<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="CiplaVIVO._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 <table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#111111"
			width="100%" id="AutoNumber1">
			<tr>
				<td colspan="2" align="center" class="topheading1">HOMECARE MENU</td>
			<tr>
				<td width="50%" valign="top">
					<table border="0" cellpadding="4" style="BORDER-COLLAPSE: collapse" bordercolor="#111111"
						width="100%" id="AutoNumber2" cellspacing="4">
						<tr>
							<td class="topheading" width="100%" align="center">REPORTING</td>
						</tr>
						<tr>
							<td width="100%" align="center">
								<table border="1" cellpadding="3" cellspacing="3" style="BORDER-COLLAPSE: collapse" bordercolor="#111111"
									width="100%" id="AutoNumber4" bgcolor="#ded7ff">
									<tr>
										<td width="100%">
											<table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#111111"
												width="100%" id="AutoNumber5">
												<tr>
													<td class="heading" align="center" width="100%">BY BUSINESS</td>
												</tr>
												<tr>
													<td align="center" width="100%"><a href="ReportSummary.aspx">Summary Sheet</a>&nbsp; 
														,&nbsp; <a href="ReportSummaryMonthly.aspx">Summary Sheet by Month</a></td>
												</tr>
												<tr>
													<td align="center" width="100%">
														<a href="reportbybusiness.aspx?Business=HandDish">Hand Dish </a>&nbsp;,&nbsp; <a href="reportbybusiness.aspx?Business=ADW(Cascade)">
															ADW (Cascade)</a> ,&nbsp; <a href="reportbybusiness.aspx?Business=AirCare(Febreze)">
															AirCare (Febreze)</a> ,&nbsp; <a href="reportbybusiness.aspx?Business=Mr. Clean">
															Mr. Clean</a>&nbsp; , <a href="reportbybusiness.aspx?Business=Swiffer">Swiffer</a></td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td class="heading" width="100%" align="center">
								<table border="1" cellpadding="3" cellspacing="3" style="BORDER-COLLAPSE: collapse" bordercolor="#111111"
									width="100%" id="AutoNumber6" bgcolor="#cccccc">
									<tr>
										<td width="100%">
											<table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#111111"
												width="100%" id="AutoNumber7">
												<tr>
													<td class="heading" width="100%" align="center">BY TDC ELEMENTS</td>
												</tr>
												<tr>
													<td width="100%" align="center">
														<a href="ReportByTDCSubElement.aspx?TDCSubElement=Purchasing">Purchasing</a>&nbsp; 
														,&nbsp; <a href="ReportByTDCElement.aspx?TDCElement=RM">Raw Material</a>&nbsp; 
														,&nbsp; <a href="ReportByTDCElement.aspx?TDCElement=PM">Packaging Material</a>&nbsp; 
														,&nbsp; <a href="ReportByTDCElement.aspx?TDCElement=MOE">MOE</a>&nbsp; ,&nbsp; <a href="ReportByTDCElement.aspx?TDCElement=FPLC">
															FPLC</a>&nbsp; ,&nbsp; <a href="ReportByTDCElement.aspx?TDCElement=Other TDC">Other 
															TDC</a>&nbsp; ,&nbsp; <a href="ReportByTDCElement.aspx?TDCElement=Other Non TDC">
															Other Non-TDC</a>&nbsp; , <A href="ReportByPillars.aspx?TDCElement=ValueAdd">Value 
															Add</A>&nbsp;,<A href="ReportByPillars.aspx?TDCElement=MSM">MSM</A>&nbsp;
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td class="heading" width="100%" align="center">
								<table border="1" cellpadding="3" cellspacing="3" style="BORDER-COLLAPSE: collapse" bordercolor="#111111"
									width="100%" id="AutoNumber8" bgcolor="#ded7ff">
									<tr>
										<td width="100%">
											<table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#111111"
												width="100%" id="AutoNumber9">
												<tr>
													<td class="heading" width="100%" align="center">BY PLANTS</td>
												</tr>
												<tr>
													<td width="100%" align="center">
														<a href="ReportSummaryPlant.aspx">Summary Sheet</a>&nbsp; ,&nbsp; <a href="ReportSummaryMonthlyPlant.aspx">
															Summary Sheet by Month</a></td>
												</tr>
												<tr>
													<td width="100%" align="center">
														<a href="ReportByPlant.aspx?plant=St.Louis">St. Louis</a>&nbsp; ,&nbsp; <a href="ReportByPlant.aspx?plant=Kansas City">
															Kansas City</a>&nbsp; ,&nbsp; <a href="ReportByPlant.aspx?plant=Brockville">Brockville</a>&nbsp; 
														,&nbsp; <a href="ReportByPlant.aspx?plant=Contract Mfg.">Contract Manufacturing</a></td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td class="heading" width="100%" align="center">
								<table border="1" cellpadding="3" cellspacing="3" style="BORDER-COLLAPSE: collapse" bordercolor="#111111"
									width="100%" id="AutoNumber10" bgcolor="#cccccc">
									<tr>
										<td width="100%">
											<table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#111111"
												width="100%" id="AutoNumber11">
												<tr>
													<td class="heading" width="100%" align="center">NOS, CVC, CASH, SUPPLY CHAIN &amp; 
														CUSTOM REPORTS</td>
												</tr>
												<tr>
													<td width="100%" align="center"><A href="ReportByCash.aspx">Cash Projects</A>&nbsp;,&nbsp;&nbsp;<A href="ReportByCVC.aspx">NOS/CVC&nbsp;Projects</A>&nbsp; 
														, <A href="ReportBySC.aspx">Supply Chain TIme&nbsp;Projects</A>&nbsp;&nbsp;</td>
												</tr>
												<tr>
													<td width="100%" align="center"><a href="ReportCDSN.aspx">CDSN Action Plans</a></td>
												</tr>
												<tr>
													<td width="100%" align="center"><a href="CustomSearch.aspx"> Create your own report</a></td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
				<td width="50%" valign="top">
					<table border="0" cellpadding="4" style="BORDER-COLLAPSE: collapse" bordercolor="#111111"
						width="100%" id="AutoNumber3" cellspacing="4">
						<tr>
							<td class="topheading" width="100%" align="center">PROJECT MANAGEMENT</td>
						</tr>
						<tr>
							<td width="100%" align="center">
								<table border="1" cellpadding="3" cellspacing="3" style="BORDER-COLLAPSE: collapse" bordercolor="#111111"
									width="100%" id="AutoNumber12" bgcolor="#cccccc">
									<tr>
										<td width="100%">
											<table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#111111"
												width="100%" id="AutoNumber13">
												<tr>
													<td class="heading" width="100%" align="center">ADD PROJECTS</td>
												</tr>
												<tr>
													<td width="100%" align="center">
														<a href="ProjectAddition.aspx?subGBU=HomeCare&amp;Business=">Add New Project</a></td>
												</tr>
												<tr>
													<td width="100%" align="center">
														<a href="ProjectAddition.aspx?subGBU=HomeCare&amp;Business=HandDish">Add HandDish 
															Project </a>&nbsp;,&nbsp; <a href="ProjectAddition.aspx?subGBU=HomeCare&amp;Business=ADW(Cascade)">
															Add ADW Project</a></td>
												</tr>
												<tr>
													<td width="100%" align="center">
														<a href="ProjectAddition.aspx?subGBU=HomeCare&amp;Business=Aircare(Febreze)">Add 
															Febreze Project</a>&nbsp; ,&nbsp; <a href="ProjectAddition.aspx?subGBU=HomeCare&amp;Business=Mr. Clean">
															Add Mr. Clean Project</a>&nbsp; ,&nbsp; <a href="ProjectAddition.aspx?subGBU=HomeCare&amp;Business=Swiffer">
															Add Swiffer Project</a></td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td width="100%" align="center">
								<table border="1" cellpadding="3" cellspacing="3" style="BORDER-COLLAPSE: collapse" bordercolor="#111111"
									width="100%" id="AutoNumber12" bgcolor="#ded7ff">
									<tr>
										<td width="100%">
											<table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#111111"
												width="100%" id="AutoNumber13">
												<tr>
													<td class="heading" width="100%" align="center">MANAGE PROJECTS</td>
												</tr>
												<tr>
													<td width="100%" align="center"><a href="ReportAllByYear.aspx"> Edit a Project</a></td>
												</tr>
												<tr>
													<td width="100%" align="center"><a href="ReportAllByYear.aspx"> Delete a Project</a></td>
												</tr>
												<tr>
													<td width="100%" align="center"><a href="ReportAllByYear.aspx">List all projects</a></td>
												</tr>
												<tr>
													<td width="100%" align="center"><a href="ProjectCopy.aspx">Copy projects</a></td>
												</tr>
												<tr>
														<td width="100%" align="center">Search Project:&nbsp;&nbsp;&nbsp;
															<asp:TextBox id="txtSearch" runat="server" Width="87px"></asp:TextBox>&nbsp; 
															&nbsp;
															<asp:DropDownList id="cboSearch" runat="server">
																<asp:ListItem Value=""></asp:ListItem>
																<asp:ListItem Value="ProjectName">Project Name</asp:ListItem>
																<asp:ListItem Value="ProjectLeader">Project Leader</asp:ListItem>
																<asp:ListItem Value="Status">Status</asp:ListItem>
															</asp:DropDownList>&nbsp;
															<asp:LinkButton id="SearchButton"  runat="server">Search</asp:LinkButton>
														</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td width="100%" align="center">
								<table border="1" cellpadding="3" cellspacing="3" style="BORDER-COLLAPSE: collapse" bordercolor="#111111"
									width="100%" id="AutoNumber12" bgcolor="#cccccc">
									<tr>
										<td width="100%">
											<table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#111111"
												width="100%" id="AutoNumber13">
												<tr>
													<td class="heading" width="100%" align="center">VOLUME</td>
												</tr>
												<tr>
													<td width="100%" align="center"><a href="VolumeView.aspx">View Current Volume</a>&nbsp; 
														,&nbsp; <a href="VolumeAdd.aspx">Update Volume </a>(For F&amp;A Use Only)</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td width="100%" align="center">&nbsp;</td>
						</tr>
						<tr>
							<td class="heading" width="100%" align="center" height="24">&nbsp;</td>
						</tr>
						<tr>
							<td width="100%" align="center">
								&nbsp;</td>
						</tr>
						<tr>
							<td width="100%" align="center">
								&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
</asp:Content>
