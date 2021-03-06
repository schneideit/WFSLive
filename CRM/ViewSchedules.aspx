﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewSchedules.aspx.cs" Inherits="CRM.ViewSchedules" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpsidebar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpPageContent" runat="server">
     <div class="page-header">
        <div class="crms-title row bg-white">
            <div class="col">
                <h3 class="page-title m-0">
                    <span class="page-title-icon bg-gradient-primary text-white mr-2">
                        <i class="fa fa-user-o" aria-hidden="true"></i>
                    </span>Schedules </h3>
            </div>
            <div class="col text-right">
                <asp:LinkButton ID="lnkCrtEnq" runat="server" href="Schedule.aspx" CssClass="add btn btn-gradient-primary font-weight-bold text-white todo-list-add-btn btn-rounded">Register Student</asp:LinkButton>
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
                    <asp:Repeater ID="rptSch" runat="server">
                        <HeaderTemplate>
                            <div class="table-responsive">
                                <table class="table table-striped table-nowrap custom-table mb-0 datatable">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th class="font-weight-bold">Schedule Name</th>
                                            <th class="font-weight-bold">Activity</th>
                                            <th class="font-weight-bold">Location</th>
                                            <th class="font-weight-bold">Trainer</th>
                                            <th class="font-weight-bold">Class Days</th>
                                            <th class="font-weight-bold">From Time</th>
                                            <th class="font-weight-bold">To Time</th>
                                        </tr>
                                    </thead>
                            </div>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                      <%--          <td width="3%">
                                    <asp:LinkButton ID="btnPymnt" class="fa fa-credit-card" runat="server" CommandArgument='<%#Eval("StudId")%>' OnClick="btnPymnt_Click"></asp:LinkButton></td>
                                </td>
                                     <td width="3%">
                                         <asp:LinkButton ID="btnAssmnt" class="fa fa-check-circle-o" runat="server" CommandArgument='<%#Eval("StudId")%>' OnClick="btnAssmnt_Click"></asp:LinkButton></td>
                                </td>
                                <td width="3%">
                                    <asp:LinkButton ID="btnAttnd" class="fa fa-calendar" runat="server" CommandArgument='<%#Eval("StudId")%>' OnClick="btnAttnd_Click"></asp:LinkButton>
                                </td>--%>
                                <td>
                                    <asp:LinkButton ID="btnEdit" Text='<%#Eval("ScheduleName") %>' runat="server" CommandArgument='<%#Eval("TSchdlId")%>' OnClick="btnEdit_Click"></asp:LinkButton>
                                </td>
                                <td><%#Eval("Activity") %></td>
                                <td><%#Eval("Location") %></td>
                                <td><%#Eval("Trainer") %></td>
                                <td><%#Eval("ClassDays") %></td>
                                <td><%#Eval("FromTime") %></td>
                                <td><%#Eval("ToTime") %></td>
                            </tr>
                        </ItemTemplate>

                        <FooterTemplate>
                            </table>  
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
                <asp:HiddenField ID="hdnId" runat="server" ClientIDMode="Static" />
                <asp:Button ID="Button1" ClientIDMode="Static" runat="server" OnClick="btnEdit_Click" ValidationGroup="edit" Style="display: none" />
            </div>
        </div>
    </div>

    <!-- /Content End -->
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cpScripts" runat="server">
</asp:Content>
