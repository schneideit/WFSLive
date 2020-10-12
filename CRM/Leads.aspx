<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Leads.aspx.cs" Inherits="CRM.Leads" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpPageContent" runat="server">
    <div class="page-header">
        <div class="crms-title row bg-white">
            <div class="col">
                <h3 class="page-title m-0">
                    <span class="page-title-icon bg-gradient-primary text-white mr-2">
                        <i class="fa fa-user-o" aria-hidden="true"></i>
                    </span>Enquiry </h3>
            </div>
        </div>
    </div>

    <ul class="nav nav-tabs nav-tabs-solid">
        <li class="nav-item"><a class="nav-link active" href="#enqdet" data-toggle="tab">Details</a></li>
        <li class="nav-item"><a class="nav-link" href="#followup" data-toggle="tab">Followup</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane show active" id="enqdet">
            <div class="row">
                <div class="card profile-box flex-fill">
                    <div class="card-body">
                        <div class="col-md-12">
                            <div class="card due-dates">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col">
                                            <span>Enquiry Date</span>
                                            <asp:TextBox ID="txtdt" runat="server" Enabled="false" class="form-control" data-toggle="validator"></asp:TextBox>
                                        </div>
                                        <div class="col">
                                            <span>Enquiry Type</span>
                                            <asp:DropDownList ID="ddlEnqType" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="OnSelectedIndexChanged">
                                                <asp:ListItem Text="Individual" Value="Individual"></asp:ListItem>
                                                <asp:ListItem Text="Facility Booking" Value="Facility Booking"></asp:ListItem>
                                                <asp:ListItem Text="Schools" Value="Schools"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col">
                                            <span>School</span>
                                            <asp:TextBox ID="txtSchool" runat="server" Visible="false" class="form-control" data-toggle="validator"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 d-flex">
                    <div class="card profile-box flex-fill">
                        <div class="card-body">
                            <h4>Basic Information</h4>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label fa fa-user-o">  First Name</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtFname" runat="server" class="form-control" data-toggle="validator"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label fa fa-user-o">  Last Name</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtLname" runat="server" class="form-control" data-toggle="validator"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label fa fa-venus-double">  Gender</label>
                                <div class="col-lg-8">
                                    <asp:DropDownList ID="ddlGender" runat="server" class="form-control">
                                        <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label fa fa-users">  Parent Name</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtParent" runat="server" class="form-control" data-toggle="validator"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label fa fa-envelope">  Email</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtEmail" runat="server" class="form-control" data-toggle="validator" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label fa fa-phone">  Contact No</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtContactno" runat="server" class="form-control" TextMode="Phone" data-toggle="validator"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label fa fa-address-card">  Present Address</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtaddress1" runat="server" class="form-control" TextMode="MultiLine" data-toggle="validator"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-md-6 d-flex">
                    <div class="card profile-box flex-fill">
                        <div class="card-body">
                            <h4>Other Information</h4>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label fa fa-book">  Activity</label>
                                <div class="col-lg-8">
                                    <asp:DropDownList ID="DDLCourse" runat="server" class="form-control"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label fa fa-building-o"> Location</label>
                                <div class="col-lg-8">
                                    <asp:DropDownList ID="DDLloc" runat="server" class="form-control"></asp:DropDownList>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label fa fa-facebook-f">  Enq. Source</label>
                                <div class="col-lg-8">
                                    <asp:DropDownList ID="ddlSource" runat="server" class="form-control"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label fa fa-user-plus">  Assign To</label>
                                <div class="col-lg-8">
                                    <asp:DropDownList ID="ddlAssigned" runat="server" class="form-control"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label fa fa-file-o">  Status</label>
                                <div class="col-lg-8">
                                    <asp:DropDownList ID="ddlEnqStatus" runat="server" class="form-control">
                                        <asp:ListItem Text="Cold" Value="Cold"></asp:ListItem>
                                        <asp:ListItem Text="Warm" Value="Warm"></asp:ListItem>
                                        <asp:ListItem Text="Hot" Value="Hot"></asp:ListItem>
                                        <asp:ListItem Text="Lost" Value="Lost"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div id="divfenq" runat="server" visible="false">
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label fa fa-calendar">  From Date</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtFromDt" ClientIDMode="Static" placeholder="dd/MM/yyyy" TextMode="Date" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="form-group row">
                                    <label class="col-lg-4 col-form-label fa fa-calendar">  To Date</label>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="txtToDt" ClientIDMode="Static" placeholder="dd/MM/yyyy" TextMode="Date" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-center py-3">
                    <asp:Button ID="BtnEnqSave" runat="server" OnClick="BtnEnqSave_Click" class="btn btn-primary" Text="Save" />
                    <asp:Button ID="btnClose" runat="server" OnClick="BtnClose_Click" class="btn btn-btn-secondary" Text="Close" />
                </div>
            </div>
        </div>
        <%--<!--Tab 1 Ends -->--%>
        <div class="tab-pane" id="followup">
            <div class="card due-dates">
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <span>Name</span>
                            <asp:TextBox ID="lblfname" runat="server" class="form-control" Enabled="false" data-toggle="validator"></asp:TextBox>
                        </div>
                        <div class="col">
                            <span>Priority</span>
                            <p>Medium</p>
                        </div>
                        <div class="col">
                            <span>Status</span>
                            <p>Not Started</p>
                        </div>
                        <div class="col">
                            <span>Progress</span>
                            <p>0</p>
                        </div>
                        <div class="col">
                            <span>Assigned To</span>
                            <p>John Doe</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 d-flex">
                    <div class="card profile-box flex-fill">
                        <div class="card-body">

                            <div class="col">
                                <span>Followup Date</span>
                                <asp:TextBox ID="txtfolwdt" ClientIDMode="Static" placeholder="dd/MM/yyyy" TextMode="Date" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col">
                                <span>Followup Description</span>
                                <asp:TextBox ID="txtremarks" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col">
                                <span>Status</span>
                                <asp:DropDownList ID="ddlFolStatus" runat="server" class="form-control">
                                    <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                    <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col">
                                <span>Outcome</span>
                                <asp:TextBox ID="txtoutcome" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col">
                                <span>Followup Date</span>
                                <asp:TextBox ID="txtNxtFldt" ClientIDMode="Static" placeholder="dd/MM/yyyy" TextMode="Date" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="text-center py-3">
                                <asp:Button ID="btnFlwSave" runat="server" OnClick="btnFlwSave_Click" class="btn btn-primary" Text="Save" />
                                <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" class="btn btn-secondary" Text="Clear" />

                            </div>
                        </div>

                    </div>
                </div>

                <div class="col-md-8 d-flex">
                    <div class="card profile-box flex-fill">
                        <div class="card-body">
                            <p>Folowup</p>
                            <asp:Repeater ID="rptFolwup" runat="server">
                                <HeaderTemplate>
                                    <div class="table-responsive">
                                        <table class="table table-striped table-nowrap custom-table mb-0 datatable">
                                            <thead>
                                                <tr>
                                                    <th>Followup Date</th>
                                                    <th>Description</th>
                                                    <th>Status</th>
                                                    <th>Outcome</th>
                                                    <th>Next Followup</th>
                                                </tr>
                                            </thead>
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="btnFlwEdit" Text='<%#Eval("FollowupDate") %>' runat="server" CommandArgument='<%#Eval("FollowId")%>' OnClick="btnFlwEdit_Click"></asp:LinkButton></td>
                                        </td>
                                        <td><%#Eval("Description") %></td>
                                        <td><%#Eval("FollowupStatus") %></td>
                                        <td><%#Eval("Outcome") %></td>
                                        <td><%#Eval("NextFollowup") %></td>
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
        </div>
        <%--<!--Tab 2 Ends -->--%>
    </div>


</asp:Content>
