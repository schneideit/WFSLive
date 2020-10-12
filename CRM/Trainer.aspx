<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Trainer.aspx.cs" Inherits="CRM.Trainer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpPageContent" runat="server">
<div class="page-header">
        <div class="crms-title row bg-white">
            <div class="col">
                <h3 class="page-title m-0">
                    <span class="page-title-icon bg-gradient-primary text-white mr-2">
                        <i class="fa fa-user-o" aria-hidden="true"></i>
                    </span>Trainer</h3>
            </div>
        </div>
    </div>
 
    <div class="tab-content">

        <div class="tab-pane show active" id="feedet">
            <div class="row">
                <div class="col-md-6 d-flex">
                    <div class="card profile-box flex-fill">
                        <div class="card-body">
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label fas fa-address-card">First Name</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtFname" runat="server" class="form-control" data-toggle="validator" ></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label fa fa-dollar">Last Name</label>
                                <div class="col-lg-8">
                                  <asp:TextBox ID="txtLname" runat="server" class="form-control" data-toggle="validator" ></asp:TextBox>  
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label fa fa-dollar">Email</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtEmail" runat="server" class="form-control" data-toggle="validator" ></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label fa fa-calendar">Address</label>
                                <div class="col-lg-8">
                                  <asp:TextBox ID="txtaddress1" runat="server" class="form-control" TextMode="MultiLine" data-toggle="validator" ></asp:TextBox>  
                                </div>
                            </div>
                              <div class="form-group row">
                                <label class="col-lg-4 col-form-label fa fa-hourglass">Contact</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtContactno" runat="server" class="form-control" data-toggle="validator" ></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label fa fa-hourglass">Course</label>
                                <div class="col-lg-8">
                                    <asp:DropDownList ID="ddltrcourse" runat="server" class="form-control" ></asp:DropDownList>
                                </div>
                            </div>
                                <div class="form-group row">
                                <label class="col-lg-4 col-form-label fa fa-hourglass">IsActive</label>
                                <div class="col-lg-8">
                                    <asp:CheckBox ID="Chkactive" runat="server" />
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-md-6 d-flex">
                    <div class="card profile-box flex-fill">
                        <div class="card-body">
                            <p>Details</p>
                            <asp:Repeater ID="rptrnr" runat="server">
                                <HeaderTemplate>
                                    <div class="table-responsive">
                                        <table class="table table-striped table-nowrap custom-table mb-0 datatable">
                                            <thead>
                                                <tr>
                                                    <th>Trainer</th>
                                                    <th>Activity</th>
                                                    
                                                </tr>
                                            </thead>
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        
                                        <td><%#Eval("FirstName") %></td>
                                        <td><%#Eval("CourseName") %></td>
                                        
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
                <asp:Button ID="BtnPaySave" runat="server" class="border-0 btn btn-primary btn-gradient-primary btn-rounded" Text="Save" OnClick="Btnsave" />
                <asp:Button ID="btnClose" runat="server" class="border-0 btn btn-info btn-gradient-primary btn-rounded" Text="Clear" OnClick="BtnClear_Click"  />
            </div>
        </div>

    </div>
          
</asp:Content>
