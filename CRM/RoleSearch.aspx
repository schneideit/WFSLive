<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RoleSearch.aspx.cs" Inherits="CRM.RoleSearch" %>

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
                    </span>Roles </h3>
            </div>
            <div class="col text-right">
                <asp:LinkButton ID="lnkCrt" runat="server" href="RoleAdd.aspx" CssClass="add btn btn-gradient-primary font-weight-bold text-white todo-list-add-btn btn-rounded">Create Role</asp:LinkButton>
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
                    <asp:Repeater ID="rptSearch" runat="server" OnItemCommand="rptSearch_ItemCommand">
                        <HeaderTemplate>
                            <div class="table-responsive">
                                <table class="table table-striped table-nowrap custom-table mb-0 datatable">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th class="font-weight-bold">Name</th>
                                            <th class="font-weight-bold">Status</th>
                                        </tr>
                                    </thead>
                            </div>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:LinkButton ID="btnEdit" Text='Edit' runat="server" CommandArgument='<%#Eval("RoleID")%>' ></asp:LinkButton>
                                </td>

                                <td><%#Eval("Description") %></td>
                                <td><%#Eval("Status") %></td>
                            </tr>
                        </ItemTemplate>

                        <FooterTemplate>
                            </table>  
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>

    <!-- /Content End -->
</asp:Content>

