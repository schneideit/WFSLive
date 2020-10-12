<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="CRM.Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cpPageContent" runat="server">
    <div class="page-header">
        <div class="crms-title row bg-white">
            <div class="col">
                <h3 class="page-title m-0">
                    <span class="page-title-icon bg-gradient-primary text-white mr-2">
                        <i class="fa fa-user-o" aria-hidden="true"></i>
                    </span>Payment </h3>
            </div>
        </div>
    </div>
    <ul class="nav nav-tabs nav-tabs-solid">
        <li class="nav-item"><a class="nav-link active" href="#feedet" data-toggle="tab">Fees</a></li>
        <li class="nav-item"><a class="nav-link" href="#merchandise" data-toggle="tab">Merchandise</a></li>
    </ul>
    <div class="tab-content">
        <div class="row">
            <div class="card profile-box flex-fill">
                <div class="card-body">
                    <div class="col-md-12">
                        <div class="card due-dates">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <span>Student Name</span>
                                        <asp:TextBox ID="txtStudent" runat="server" class="form-control" data-toggle="validator"></asp:TextBox>
                                    </div>
                                    <div class="col">
                                        <span>Student Id</span>
                                        <asp:TextBox ID="txtstudId" runat="server" class="form-control" data-toggle="validator"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-pane show active" id="feedet">
            <div class="row">
                <div class="col-md-6 d-flex">
                    <div class="card profile-box flex-fill">
                        <div class="card-body">
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label fas fa-address-card">Course</label>
                                <div class="col-lg-8">
                                    <asp:DropDownList ID="ddlcourse" runat="server" AutoPostBack="true" class="form-control" OnSelectedIndexChanged="ddlcourse_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label fa fa-dollar">Registration Fee</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtRegFee" runat="server" class="form-control" data-toggle="validator"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label fa fa-dollar">Course Fee</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtcoursefee" runat="server" class="form-control" data-toggle="validator"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label fa fa-calendar">Session</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtsessn" runat="server" class="form-control" data-toggle="validator"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label fa fa-hourglass">Hours</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txthrs" runat="server" class="form-control" data-toggle="validator"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-md-6 d-flex">
                    <div class="card profile-box flex-fill">
                        <div class="card-body">
                            <p>Details</p>
                            <asp:Repeater ID="rptfees" runat="server">
                                <HeaderTemplate>
                                    <div class="table-responsive">
                                        <table class="table table-striped table-nowrap custom-table mb-0 datatable">
                                            <thead>
                                                <tr>
                                                    <th>Activity</th>
                                                    <th>Session</th>
                                                    <th>Hours</th>
                                                    <th>Amount</th>
                                                     <th>Paid Date</th>
                                                </tr>
                                            </thead>
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="btnFeeEdt" Text='<%#Eval("CourseName") %>' runat="server" OnClick="btnFeeEdt_Click" CommandArgument='<%#Eval("SFeeId")%>'></asp:LinkButton></td>
                                        </td>
                                        <td><%#Eval("Sessn") %></td>
                                        <td><%#Eval("Hrs") %></td>
                                        <td><%#Eval("RegAmt") %></td>
                                        <td><%#Eval("PDate") %></td>
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
                <asp:Button ID="BtnPaySave" runat="server" class="border-0 btn btn-primary btn-gradient-primary btn-rounded" Text="Pay" OnClick="BtnPaySave_Click" />
                <asp:Button ID="btnClose" runat="server" class="border-0 btn btn-info btn-gradient-primary btn-rounded" Text="Close" OnClick="btnClose_Click" />
            </div>
        </div>
        <div class="tab-pane" id="merchandise">
            <div class="row">
                <div class="col-md-6 d-flex">
                    <div class="card profile-box flex-fill">
                        <div class="card-body">
                            <div class="form-group row">
                                <label class="col-lg-8 col-form-label fa fa-gifts">Merchandise</label>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label fa fa-cubes">Item Name</label>
                                <div class="col-lg-8">
                                    <asp:DropDownList ID="ddlitem" runat="server" AutoPostBack="true" class="form-control" OnSelectedIndexChanged="ddlitem_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label fa fa-cart-plus">Quantity</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtqty" runat="server" class="form-control" data-toggle="validator"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label fa fa-dollar">Unit Cost</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtuc" runat="server" class="form-control" data-toggle="validator"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label fa fa-dollar">Total Cost</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txttotal" runat="server" class="form-control" data-toggle="validator"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-md-6 d-flex">
                    <div class="card profile-box flex-fill">
                        <div class="card-body">
                            <p>Details</p>
                            <asp:Repeater ID="rptitem" runat="server">
                                <HeaderTemplate>
                                    <div class="table-responsive">
                                        <table class="table table-striped table-nowrap custom-table mb-0 datatable">
                                            <thead>
                                                <tr>
                                                    <th>Item Name</th>
                                                    <th>Quantity</th>
                                                    <th>Total</th>

                                                </tr>
                                            </thead>
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="btnitemEdit" Text='<%#Eval("ItemName") %>' runat="server" CommandArgument='<%#Eval("ItemSFId")%>'></asp:LinkButton></td>
                                        </td>
                                        
                                        <td><%#Eval("ItemQty") %></td>
                                        <td><%#Eval("TotalAmt") %></td>

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
                <asp:Button ID="BtnitemSave" runat="server" class="border-0 btn btn-primary btn-gradient-primary btn-rounded" Text="Pay" OnClick="BtnItemSave_Click" />
                <asp:Button ID="BtnIclose" runat="server" class="border-0 btn btn-info btn-gradient-primary btn-rounded" Text="Close" OnClick="btnClose_Click" />
            </div>
        </div>
    </div>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cpScripts" runat="server">
</asp:Content>
