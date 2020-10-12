<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="CRM.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpPageContent" runat="server">
     <div class="page-header">
        <div class="crms-title row bg-white">
            <div class="col">
                <h3 class="page-title m-0">
                    <span class="page-title-icon bg-gradient-primary text-white mr-2">
                        <i class="fa fa-user-o" aria-hidden="true"></i>
                    </span>Profile </h3>
            </div>
            <div class="col text-right">
                <asp:LinkButton ID="lnkCrt" runat="server" href="ChangePassword.aspx" CssClass="add btn btn-gradient-primary font-weight-bold text-white todo-list-add-btn btn-rounded">Change Password</asp:LinkButton>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 d-flex">
            <div class="card profile-box flex-fill">
                <div class="card-body">
                     <div class="form-group row">
                        <label class="col-lg-4 col-form-label ">Login Name</label>
                        <div class="col-lg-8">
                            <asp:TextBox ID="txtUsername" runat="server" Enabled="false" CssClass="form-control" data-toggle="validator"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-4 col-form-label ">Name</label>
                        <div class="col-lg-8">
                            <asp:TextBox ID="txtName" runat="server" class="form-control" data-toggle="validator"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-4 col-form-label ">Email</label>
                        <div class="col-lg-8">
                            <asp:TextBox ID="txtEmail" runat="server" class="form-control" data-toggle="validator" TextMode="Email"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="text-center py-3">
        <asp:Button ID="btnSave" runat="server" class="border-0 btn btn-primary btn-gradient-primary btn-rounded" Text="Update" BackColor="#0066FF" OnClick="btnSave_Click" />
        <asp:Button ID="btnClose" runat="server" class="border-0 btn btn-info btn-gradient-primary btn-rounded" Text="Close" BackColor="#0066FF" OnClick="btnClose_Click" />
    </div>
</asp:Content>
