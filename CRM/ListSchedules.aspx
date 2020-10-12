<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListSchedules.aspx.cs" Inherits="CRM.ListSchedules" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpPageContent" runat="server">
        <!---- Page Title   --->
    <div class="page-header">
        <div class="crms-title row bg-white">
            <div class="col">
                <h3 class="page-title m-0">
                    <span class="page-title-icon bg-gradient-primary text-white mr-2">
                        <i class="fa fa-user-o" aria-hidden="true"></i>
                    </span>Enquiry </h3>
            </div>
            <div class="col text-right">
                <asp:LinkButton ID="lnkCrtEnq" runat="server" href="Leads.aspx" CssClass="add btn btn-gradient-primary font-weight-bold text-white todo-list-add-btn btn-rounded">Create Enquiry</asp:LinkButton>
            </div>
        </div>
    </div>
    <!--- /Page Title --->
    <!-- Content Starts -->
    <div class="row">
        <div class="col-md-12">
            <div class="card mb-0">
                <div class="card-body">
                    <!---- Repeater to list records --->
                    <asp:Repeater ID="rptEnq" runat="server">
                        <HeaderTemplate>
                            <div class="table-responsive">
                                <table class="table table-striped table-nowrap custom-table mb-0 datatable">
                                    <thead>
                                        <tr>
                                            <th class="font-weight-bold">Name</th>
                                            <th class="font-weight-bold">Contact No</th>
                                            <th class="font-weight-bold">Parent</th>
                                            <th class="font-weight-bold">Activity</th>
                                            <th class="font-weight-bold">Location</th>
                                            <th class="font-weight-bold">Source</th>
                                            <th class="font-weight-bold">Enq.Type</th>
                                            <th class="font-weight-bold">Enq.Date</th>
                                            <th class="font-weight-bold">Status</th>
                                        </tr>
                                    </thead>
                            </div>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:LinkButton ID="btnEdit" Text='<%#Eval("Name") %>' runat="server" CommandArgument='<%#Eval("EnqId")%>' OnClick="btnEdit_Click"></asp:LinkButton></td>
                                </td>
                              <%--  <td><%#Eval("Email") %></td>--%>
                                <td><%#Eval("Contact") %></td>
                                <td><%#Eval("ParentName") %></td>
                                <td><%#Eval("Course") %></td>
                                <td><%#Eval("LocName") %></td>
                                <td><%#Eval("SourceName") %></td>
                                <td><%#Eval("EnqType") %></td>
                                <td><%#Eval("EnqDate") %></td>
                                <td><%#Eval("EnqStatus") %></td>
                            </tr>
                        </ItemTemplate>

                        <FooterTemplate>
                            </table>  
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
                <asp:HiddenField ID="hdnId" runat="server" ClientIDMode="Static" />
                <asp:Button ID="btnEdit" ClientIDMode="Static" runat="server" OnClick="btnEdit_Click" ValidationGroup="edit" Style="display: none" />
            </div>
        </div>
    </div>

    <!-- /Content End -->
</asp:Content>

