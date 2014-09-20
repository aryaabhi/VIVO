<%@ Page Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeBehind="rReportAll.aspx.vb" Inherits="CiplaVIVO.rReportAll" %>
	    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">                
            <div class="panel panel-default">
                <div class="panel-heading">
                    <asp:Label id="HeaderLabel" runat="server"></asp:Label>
                </div>
                <div class="panel-body">
                     <div class="form-group">
                        <div class="row">
                          <div class="col-lg-4">
                              <label>Select Year</label>
                              </div>
                          <div class="col-lg-4">
                                    <asp:dropdownlist id="cboYear" cssClass="form-control" runat="server" DataValueField="YearInteger" DataTextField="YearLiteral"/>
                          </div>
                              
                        <div class="col-lg-4">
                                <asp:Button id="Go" OnClick="Year_Refresh" runat="server" Text="Go"></asp:Button>
                        </div>
                      </div>
                    </div>
                    <asp:panel id="ReportParam" Runat="server" Visible="true">

                    <div class="row">
                        <div class="col-lg-12">
                             <label>SELECT REPORT PARAMETERS TO CREATE REPORT</label>
                        </div>
                     </div>
                    <div class="row">
                        <div class ="col-md-3">
							<label>   </label>
                        </div>
                        <div class ="col-md-3">
                            <div class="form-group">
							        <asp:listbox Class="form-control"  id="Listbox1" runat="server"  Height="181px"></asp:listbox>
                            </div>
                        </div>
                        <div class ="col-md-3">
                            <div class="form-group">
                        	        <asp:listbox Class="form-control"  id="Listbox2" runat="server" SelectionMode="Multiple" Height="181px"></asp:listbox>
                            </div>
                        </div>
                        <div class ="col-md-3">
                            <div class="form-group">
                                <asp:TextBox ID="Filters" runat="server"></asp:TextBox>
                                <asp:Button id="AddFilterBtn" onclick="OnFilterChanged" runat="server" Text="Search"></asp:Button>
                            </div>
                        </div>
                        
                    </div>

                    <div class="row">
                        <div class="col-lg-12">
                             <label>SELECT REPORT PARAMETERS TO CREATE REPORT</label>
                        </div>
                     </div>
                    <div class="row">
                        <div class ="col-md-3">
							<label>   </label>
                        </div>
                        <div class ="col-md-3">
                            <div class="form-group">
                                   
							        <asp:listbox Class="form-control"  id="lstReportTags" runat="server" SelectionMode="Multiple" Height="181px"></asp:listbox>
                            </div>
                        </div>
                        <div class ="col-md-3">
                            <div class="form-group">
                                    <P>
								        <asp:Button id="Add" onclick="cmdAdd_Click" runat="server" Text="Add >>"></asp:Button>
							        </P>
							        <P>
								        <asp:Button id="Remove" onclick="cmdRemove_Click" runat="server" Text="Remove <<"></asp:Button>
							        </P>
                            </div>
                        </div>
                        <div class ="col-md-3">
                            <div class="form-group">
                        	        <asp:listbox Class="form-control"  id="lstReport" runat="server" Height="181px"></asp:listbox>
                            </div>
                        </div>
                    </div>
                  </asp:panel>

                    <div class="row" >
                        <div class="col-lg-12">
                            <asp:button id="buttonSearch"  onclick="cmdSearch_Click" runat="server" Text="Search"></asp:button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <label>Provide unique name to custom report for future(Optional)</label>
                            <asp:textbox id="txtCustomReport" runat="server" CssClass="txtBox"></asp:textbox>
                        </div>
                    </div>
                    </div>
                </div>
                    <div class="row">
                    <!--The GridView for the table-->
                    <asp:GridView ID="ProjectGrid" runat="server" AllowSorting="true" 
                        OnRowDataBound="ProjectGrid_RowDataBound" 
                        SelectedIndex="0" 
                        OnSelectedIndexChanged="EditRow" 
                        AutoGenerateColumns="true" 
                        AllowPaging ="true"  
                        cssClass="table table-striped table-bordered"
                        OnPageIndexChanging = "OnPaging"
                        OnRowDeleting="DeleteRecord"
                        OnSorting="SortData" 
                        DataKeyNames="ProjectID" 
                        PageSize = "20" >
                        <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Edit" ItemStyle-CssClass="hidden-phone" HeaderStyle-CssClass="hidden-phone"  />
                        <asp:CommandField ShowDeleteButton="True" ItemStyle-CssClass="hidden-phone" HeaderStyle-CssClass="hidden-phone" FooterStyle-CssClass="hidden-phone" />
				        </Columns>
                    </asp:GridView>
                    </div>
                <div class="row">

                    <asp:GridView ID="SumGrid" runat="server" AllowSorting="true"
                        SelectedIndex="0" cssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="true" >
                    </asp:GridView>
                    </div>
   </asp:Content>

