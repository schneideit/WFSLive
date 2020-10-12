<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Students.aspx.cs" Inherits="CRM.Students" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpPageContent" runat="server">
    <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
        <!-- Left navbar links -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="#student" data-toggle="tab" aria-expanded="false"><i class="ti-book"></i>Student</a>
                <%--<a href="#schedule" class="nav-link">Create Schedule</a>--%>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="#search" data-toggle="tab" aria-expanded="true"><i class="ti-search"></i>Search</a>
                <%--<a href="#search" class="nav-link">Search</a>--%>
            </li>
        </ul>
    </nav>
    <!-- Main content -->
    <div class="tab-content br-n pn">

        <div id="student" class="tab-pane active">
            <section class="content">
                <div class="row m-md-4">
                    <div class="col-md-12">
                        <div class="card card-primary">
                            <!--- Copy above Header -->
                            <div class="card-header">
                                <h3 class="card-title">Students</h3>
                            </div>

                            <div class="row m-lg-2">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label">First Name <span class="required-asterix">*</span></label>
                                        <div class="form-material">
                                            <asp:TextBox ID="txtFname" runat="server" class="form-control" data-toggle="validator" required="txtCourseName"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label">Last Name<span class="required-asterix">*</span></label>
                                        <div class="form-material">
                                            <asp:TextBox ID="txtLname" runat="server" class="form-control" data-toggle="validator" required="txtLname"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label class="control-label">Gender<span class="required-asterix">*</span></label>
                                        <div class="form-material">
                                            <asp:DropDownList ID="ddlGender" runat="server" class="form-control">
                                                <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                                <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label class="control-label">Date of Birth<span class="required-asterix">*</span></label>
                                        <div class="form-material">
                                            <asp:TextBox ID="txtDob" ClientIDMode="Static" placeholder="dd/MM/yyyy" TextMode="Date" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row m-lg-2">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label">Parent Name<span class="required-asterix">*</span></label>
                                        <div class="form-material">
                                            <asp:TextBox ID="txtParent" runat="server" class="form-control" data-toggle="validator" required="txtParent"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label">Address 1<span class="required-asterix">*</span></label>
                                        <div class="form-material">
                                            <asp:TextBox ID="txtaddress1" runat="server" class="form-control" TextMode="MultiLine" data-toggle="validator" required="txtaddress1"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label">Address 2<span class="required-asterix">*</span></label>
                                        <div class="form-material">
                                            <asp:TextBox ID="txtaddress2" runat="server" class="form-control" data-toggle="validator"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row m-lg-2">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label">Email<span class="required-asterix">*</span></label>
                                        <div class="form-material">
                                            <asp:TextBox ID="txtEmail" runat="server" class="form-control" data-toggle="validator" TextMode="Email" required="txtEmail"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label class="control-label">Contact<span class="required-asterix">*</span></label>
                                        <div class="form-material">
                                            <asp:TextBox ID="txtContactno" runat="server" class="form-control" data-toggle="validator" TextMode="Number" required="txtContactno"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label class="control-label">Emergency Contact No<span class="required-asterix">*</span></label>
                                        <div class="form-material">
                                            <asp:TextBox ID="txtEContactno" runat="server" class="form-control" TextMode="Number" data-toggle="validator" required="txtEContactno"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label class="control-label">Upload Photo<span class="required-asterix">*</span></label>
                                        <div class="form-material">
                                            <asp:FileUpload ID="FileUploadpic" runat="server" />
                                        </div>
                                        <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
                                    </div>
                                </div>

                            </div>
                            <div class="row m-lg-2">
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label class="control-label">Emirates Id<span class="required-asterix">*</span></label>
                                        <div class="form-material">
                                            <asp:TextBox ID="txtemid" runat="server" class="form-control" data-toggle="validator" required="txtemid"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label class="control-label">Expiry Date<span class="required-asterix">*</span></label>
                                        <div class="form-material">
                                            <asp:TextBox ID="txtedate" ClientIDMode="Static" placeholder="dd/MM/yyyy" TextMode="Date" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label class="control-label">Has Sibling<span class="required-asterix">*</span></label>
                                        <div class="form-material">
                                            <asp:CheckBox ID="Chksib" runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label class="control-label">Name of Sibling<span class="required-asterix">*</span></label>
                                        <div class="form-material">
                                            <asp:DropDownList ID="ddlsib" runat="server" Width="200px" Height="30px"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

            </section>


           <%-- <section class="content">
                <div class="row m-md-4">
                    <div class="col-md-10">
                        <div class="card card-primary">
                            <!--- Copy above Header -->
                            <div class="card-header">
                                <h3 class="card-title">Register</h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i></button>
                                    <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i></button>
                                </div>
                            </div>
                            <div class="row m-lg-2">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label">Course<span class="required-asterix">*</span></label>
                                        <div class="form-material">
                                            <asp:DropDownList ID="ddlcou" runat="server" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlcou_SelectedIndexChanged" Width="200px" Height="40px">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label">Location<span class="required-asterix">*</span></label>
                                        <div class="form-material">
                                            <asp:DropDownList ID="ddlloc" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlloc_SelectedIndexChanged" Width="200px" Height="40px"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label">Batch<span class="required-asterix">*</span></label>
                                        <div class="form-material">
                                            <asp:DropDownList ID="ddlsch" runat="server" AutoPostBack="True" Width="200px" Height="40px" OnSelectedIndexChanged="ddlsch_SelectedIndexChanged"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label">Fees<span class="required-asterix">*</span></label>
                                        <div class="form-material">
                                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </section>--%>
            <div class="row ml-3">
                <asp:Button ID="BtnSave" runat="server" CssClass="btn-green" Text="Save" OnClick="BtnSave_Click" BackColor="#0066FF" ForeColor="White" />&nbsp;
                        <asp:Button ID="BtnUpdate" runat="server" CssClass="btn-green" Text="Update" OnClick="BtnUpdate_Click" BackColor="#0066FF" ForeColor="White" />&nbsp;
                        <asp:Button ID="BtnClear" runat="server" CssClass="btn-blue" Text="Clear" OnClick="BtnClear_Click" BackColor="#0066FF" ForeColor="White" />&nbsp;
                <asp:Button ID="BtnAdd" runat="server" CssClass="btn-green" Text="Add" OnClick="BtnAdd_Click" Visible="false" />
                <asp:Button ID="Btnpay" runat="server" CssClass="btn-green" Text="Payment" OnClick="Btnpay_Click" BackColor="#0066FF" ForeColor="White" />
                <asp:Label ID="lblUnitId" runat="server" Visible="false"></asp:Label>
            </div>
        </div>

        <div id="search" class="tab-pane">
            <div class="row">
                <div class="col-md-12">
                <%--    <asp:Panel ID="PanelBatch" runat="server" BorderColor="#660033" BorderStyle="Solid" Width="100%" Height="600px" ScrollBars="Vertical" Visible="true">
                        <dx:ASPxGridView ID="GrdStudent" runat="server" Font-Size="Small" Font-Bold="False" Styles-LoadingPanel-Paddings-Padding="2" Theme="Default" Width="100%" KeyFieldName="StudId" OnRowCommand="GrdStudent_rowcommand">
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="FirstName" Caption="Student Name" Visible="true" VisibleIndex="0" Width="12%">
                                    <Settings AllowHeaderFilter="True" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="ParentName" Caption="Parent Name" Visible="true" VisibleIndex="0" Width="10%">
                                    <Settings AllowHeaderFilter="True" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Address1" Caption="Address" Visible="false" VisibleIndex="0">
                                    <Settings AllowHeaderFilter="True" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Email" Caption="Email" Visible="true" VisibleIndex="0" Width="15%">
                                    <Settings AllowHeaderFilter="True" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataColumn Caption="Edit" Width="5%" VisibleIndex="5">
                            
                                      <DataItemTemplate>
                                        <asp:LinkButton ID="lnkEdit"  CommandName="Edit" Text="" CommandArgument='<%# Eval("StudId")%>' runat="server">Edit</asp:LinkButton>
                                    </DataItemTemplate>
                                </dx:GridViewDataColumn>
                            </Columns>
                            <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowFooter="true" ShowFilterRowMenu="true"
                                VerticalScrollBarMode="Visible" VerticalScrollableHeight="450" />
                            <SettingsBehavior EnableRowHotTrack="true" />
                            <SettingsPager AlwaysShowPager="True" PageSize="25">
                            </SettingsPager>
                            <SettingsSearchPanel ShowClearButton="true" Visible="true" />
                            <SettingsPager Mode="ShowAllRecords" />
                        </dx:ASPxGridView>
                    </asp:Panel>--%>
                </div>
            </div>
        </div>

    </div>
    <div>
        <asp:HiddenField ID="HdnfEdit" runat="server" />
        <asp:HiddenField ID="HdnEdit" runat="server" />
        <asp:HiddenField ID="HdnStdId" runat="server" />

    </div>
</asp:Content>
