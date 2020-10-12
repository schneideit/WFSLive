<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RoleAdd.aspx.cs" Inherits="CRM.RoleAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpPageContent" runat="server">
    <div class="page-header">
        <div class="crms-title row bg-white">
            <div class="col">
                <h3 class="page-title m-0">
                    <span class="page-title-icon bg-gradient-primary text-white mr-2">
                        <i class="fa fa-user-o" aria-hidden="true"></i>
                    </span>Role</h3>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 d-flex">
            <div class="card profile-box flex-fill">
                <div class="card-body">
                    <div class="form-group row">
                        <label class="col-lg-4 col-form-label">Description</label>
                        <div class="col-lg-8">
                            <asp:TextBox ID="txtRoleName" runat="server" class="form-control" data-toggle="validator"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6 d-flex">
            <div class="card profile-box flex-fill">
                <div class="card-body">
                    <div class="form-group row">
                        <label class="col-lg-4 col-form-label ">Status</label>
                        <div class="col-lg-8">
                            <asp:DropDownList ID="drpStatus" runat="server" class="form-control">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
     <div class="row">
        <div class="col-md-12 d-flex">
            <div class="card profile-box flex-fill">
                <div class="card-body">
                    <asp:GridView runat="server" ID="grvPriv"
                    AutoGenerateColumns="false"
                    EnableViewState="true"
                    AutoGenerateSelectButton="false"
                    CssClass="table table-bordered table-condensed table-striped table-hover"
                    Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderText="Description">
                            <HeaderStyle CssClass="text-left" />
                            <ItemTemplate>
                                <asp:Label ID="lblPageID" runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "PageID")%>'></asp:Label>
                                <asp:Label ID="lblPageDesc" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "PageDescription")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Modify">
                            <HeaderStyle CssClass="text-center" />
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:CheckBox runat="server" ID="chkModify" Checked='<%#(Convert.ToString(Eval("CanModify"))=="True") %>' Visible='<%#(Convert.ToString(Eval("EntCanModify"))=="True") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="View">
                            <HeaderStyle CssClass="text-center" />
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:CheckBox runat="server" ID="chkView" Checked='<%#(Convert.ToString(Eval("CanView"))=="True") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                </div>
            </div>
        </div>
    </div>

    <div class="text-center py-3">
        <asp:HiddenField ID="hdnRoleID" Value="0" runat="server" />
        <asp:Button ID="btnSave" runat="server" class="border-0 btn btn-primary btn-gradient-primary btn-rounded" Text="Save" BackColor="#0066FF" OnClick="btnSave_Click" />
        <asp:Button ID="btnClose" runat="server" class="border-0 btn btn-info btn-gradient-primary btn-rounded" Text="Close" BackColor="#0066FF" OnClick="btnClose_Click" />
    </div>
</asp:Content>

