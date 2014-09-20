<%@ Page Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeBehind="Rough.aspx.vb" Inherits="CiplaVIVO.Rough" %>
	    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">                
            <div class="row">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <asp:Label id="HeaderLabel" runat="server"></asp:Label>
                </div>
                <div class="panel-body">

                    <div class="row">
                          <div class="col-lg-2">
                              <div class="form-group">
                                    <label>Select Year</label>
                                    <asp:dropdownlist id="cboYear" Class="form-control" runat="server" DataValueField="YearInteger" DataTextField="YearLiteral"/>
                                    <asp:Button id="Go" OnClick="Year_Refresh" runat="server" Text="Go"></asp:Button>
                              </div>
                          </div>
                          <div class="col-lg-2">

                          </div>
                    </div>

                    <!--The GridView for the table-->
                    <asp:GridView ID="GridView1" runat="server" AllowSorting="true" OnRowCreated="ProjectDataGrid_ItemDataBound"
                        SelectedIndex="0" 
                        OnSelectedIndexChanged="EditRow" 
                            class="table table-striped table-bordered table-hover"
                            AutoGenerateColumns="true" 
                            AllowPaging ="true"  
                            ShowFooter = "true" 
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
            </div>
        </div>
   </asp:Content>

