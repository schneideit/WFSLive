<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Attendance.aspx.cs" Inherits="CRM.Attendance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpPageContent" runat="server">
    <div class="page-header">
        <div class="crms-title row bg-white">
            <div class="col">
                <h3 class="page-title m-0">
                    <span class="page-title-icon bg-gradient-primary text-white mr-2">
                        <i class="fa fa-user-o" aria-hidden="true"></i>
                    </span>Attendance </h3>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 d-flex">
            <div class="card profile-box flex-fill">
                <div class="card-body">
                    <div class="form-group row">
                        <label class="col-lg-4 col-form-label ">Student Name</label>
                        <div class="col-lg-8">
                            <asp:TextBox ID="txtStudent" runat="server" class="form-control" data-toggle="validator"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-4 col-form-label ">Student Id</label>
                        <div class="col-lg-8">
                            <asp:TextBox ID="txtstudId" runat="server" class="form-control" data-toggle="validator"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-4 col-form-label ">Date</label>
                        <div class="col-lg-8">
                            <asp:TextBox ID="txtdate" runat="server" class="form-control" TextMode="Date" data-toggle="validator"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-4 col-form-label ">In Time</label>
                        <div class="col-lg-8">
                            <asp:TextBox ID="txtIN" runat="server" class="form-control" TextMode="Time" data-toggle="validator"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-4 col-form-label ">Out Time</label>
                        <div class="col-lg-8">
                            <asp:TextBox ID="txtOUT" runat="server" class="form-control" TextMode="Time" data-toggle="validator"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-4 col-form-label ">Course</label>
                        <div class="col-lg-8">
                            <asp:DropDownList ID="ddlcourse" runat="server" class="form-control"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-4 col-form-label ">Location</label>
                        <div class="col-lg-8">
                            <asp:DropDownList ID="ddllocation" runat="server" class="form-control"></asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6 d-flex">
            <div class="card profile-box flex-fill">
                <div class="card-body">
                    <p>Details</p>
                    <asp:Repeater ID="rptattnd" runat="server">
                        <HeaderTemplate>
                            <div class="table-responsive">
                                <table class="table table-striped table-nowrap custom-table mb-0 datatable">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Course</th>
                                            <th>Location</th>
                                            <th>Date</th>
                                            <th>IN Time</th>
                                            <th>OUT Time</th>
                                        </tr>
                                    </thead>
                            </div>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:LinkButton ID="btnAttndEdt" Text='<%#Eval("FirstName") %>' runat="server"  CommandArgument='<%#Eval("AttendId")%>'></asp:LinkButton></td>
                                </td>
                                        <td><%#Eval("CourseName") %></td>
                                <td><%#Eval("LocName") %></td>
                                <td><%#Eval("AttendDate") %></td>
                                <td><%#Eval("InTime") %></td>
                                <td><%#Eval("OutTime") %></td>
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
    <div class="text-center py-3">
        <asp:Button ID="BtnAttndSave" runat="server" class="border-0 btn btn-primary btn-gradient-primary btn-rounded" Text="Save" OnClick="BtnAttndSave_Click" />
        <asp:Button ID="BtnClose" runat="server" class="border-0 btn btn-primary btn-gradient-primary btn-rounded" Text="Close" />
    </div>
    <%--<div class="panel-body custom_panel">
        <div class="table-responsive">
            <table class="table table-bordered table-striped table-hover">
                <thead class="back_table_color">
                    <tr class="info">
                        <th>Date</th>
                        <th>In Time</th>
                        <th>Out Time</th>
                        <th>Hours</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>16-09-2020</td>
                        <td>09:45 AM</td>
                        <td>10:45 AM</td>
                        <td>1:00</td>
                        <td class="text-center">
                            <button type="button" class="btn btn-add btn-sm" data-toggle="modal" data-target="#update"><i class="fa fa-pencil"></i></button>
                        </td>
                    </tr>
                    <tr>
                        <td>15-09-2020</td>
                        <td>09:45 AM</td>
                        <td>10:15 AM</td>
                        <td>1:15</td>
                        <td class="text-center">
                            <button type="button" class="btn btn-add btn-sm" data-toggle="modal" data-target="#update"><i class="fa fa-pencil"></i></button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>--%>
</asp:Content>

