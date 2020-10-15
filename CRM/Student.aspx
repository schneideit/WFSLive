<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="CRM.Student" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpPageContent" runat="server">
    <asp:UpdatePanel ID="updImg" runat="server">
        <contenttemplate>
            <div class="page-header">
                <div class="crms-title row bg-white">
                    <div class="col">
                        <h3 class="page-title m-0">
                            <span class="page-title-icon bg-gradient-primary text-white mr-2">
                                <i class="fa fa-user-o" aria-hidden="true"></i>
                            </span>Student</h3>
                    </div>
                </div>
            </div>
            <%--    <div class="row">
        <div class="col-md-12">
            <div class="form-group row">
                <label class="col-lg-2 col-form-label">Enquiry Type</label>
                <div class="col-lg-2">
                    <asp:DropDownList ID="ddlEnqType" runat="server" class="form-control">
                        <asp:ListItem Text="Individual" Value="Individual"></asp:ListItem>
                        <asp:ListItem Text="Facilty Booking" Value="Facilty Booking"></asp:ListItem>
                        <asp:ListItem Text="Schools" Value="Schools"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <label class="col-lg-2 col-form-label">School Name</label>
                <div class="col-lg-4">
                    <asp:TextBox ID="txtSchool" runat="server" class="form-control" data-toggle="validator"></asp:TextBox>
                </div>
            </div>

        </div>
    </div>--%>
            <div class="row">
                <div class="col-md-6 d-flex">
                    <div class="card profile-box flex-fill">
                        <div class="card-body">
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label">First Name</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtFname" runat="server" class="form-control" data-toggle="validator"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label">Last Name</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtLname" runat="server" class="form-control" data-toggle="validator"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label">Gender</label>
                                <div class="col-lg-8">
                                    <asp:DropDownList ID="ddlGender" runat="server" class="form-control">
                                        <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label">Parent Name</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtParent" runat="server" class="form-control" data-toggle="validator"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label">Email</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtEmail" runat="server" class="form-control" data-toggle="validator" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label">Contact No</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtContactno" runat="server" class="form-control" TextMode="Phone" data-toggle="validator"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label">Temporary Address</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtaddress1" runat="server" class="form-control" TextMode="MultiLine" data-toggle="validator"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label">Present Address</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtaddress2" runat="server" class="form-control" TextMode="MultiLine" data-toggle="validator"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label">Upload Photo</label>
                                <div class="col-lg-8">

                                    <img src="" alt="No Image" id="imgStud" runat="server" style="max-height: 150px; max-width: 100px" visible="false" />
                                    <div class="file-upl"></div>
                                    <asp:FileUpload ID="FileUpload1" ClientIDMode="Static" runat="server" onchange="fl_change(this)" />
                                    <asp:Button ID="btnUpload" ClientIDMode="Static" Text="Upload" runat="server"
                                        accept="image/*"
                                        OnClick="BtnUpload_Click" Style="display: none" />

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-md-6 d-flex">
                    <div class="card profile-box flex-fill">
                        <div class="card-body">
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label">Date of Birth</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtDob" ClientIDMode="Static" placeholder="dd/MM/yyyy" TextMode="Date" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label">Emirates Id</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtemid" runat="server" class="form-control" data-toggle="validator" required="txtemid"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label">Expiry Date</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtedate" ClientIDMode="Static" placeholder="dd/MM/yyyy" TextMode="Date" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label">Emergency Contact No</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtEContactno" runat="server" class="form-control" TextMode="Number" data-toggle="validator" required="txtEContactno"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label">Has Sibling</label>
                                <div class="col-lg-8">
                                    <asp:CheckBox ID="Chksib" runat="server" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label">Sibling/Couple/Family</label>
                                <div class="col-lg-8">
                                    <asp:DropDownList ID="ddlsib" runat="server" Width="200px" Height="30px"></asp:DropDownList>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>

            <div class="text-center py-3">
                <asp:Button ID="BtnStudSave" runat="server" class="border-0 btn btn-primary btn-gradient-primary btn-rounded" Text="Save" BackColor="#0066FF" OnClick="BtnStudSave_Click" />
                <asp:Button ID="btnClose" runat="server" class="border-0 btn btn-info btn-gradient-primary btn-rounded" Text="Close" BackColor="#0066FF" OnClick="btnClose_Click" />
            </div>
        </contenttemplate>
        <triggers>
            <asp:AsyncPostBackTrigger ControlID="BtnStudSave"  EventName="click" />
            <asp:PostBackTrigger ControlID="btnUpload" />
        </triggers>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="cntScript" ContentPlaceHolderID="cpScripts" runat="server">
    <script type="text/javascript">
        function fl_change(ctrl) {
            $("#btnUpload").click();
        }
    </script>
</asp:Content>
