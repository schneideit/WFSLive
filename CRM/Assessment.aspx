<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Assessment.aspx.cs" Inherits="CRM.Assessment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpPageContent" runat="server">
    <div class="page-header">
        <div class="crms-title row bg-white">
            <div class="col">
                <h3 class="page-title m-0">
                    <span class="page-title-icon bg-gradient-primary text-white mr-2">
                        <i class="fa fa-certificate" aria-hidden="true"></i>
                    </span>Skill Assessment </h3>
            </div>
        </div>
    </div>

    <section class="content">
        <div class="row m-md-4">
            <div class="col-md-10">
              <div class="card profile-box flex-fill">
                <div class="card-body">
                    <!--- Copy above Header -->
                      <div class="row m-lg-2">

                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label">Student ID<span class="required-asterix">*</span></label>
                                <div class="form-material">
                                    <asp:TextBox ID="txtstudid" runat="server" Width="200px" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                          <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label">Student Name<span class="required-asterix">*</span></label>
                                <div class="form-material">
                                    <asp:TextBox ID="txtStudent" runat="server" Width="300px" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label">Course<span class="required-asterix">*</span></label>
                                <div class="form-material">
                                    <asp:DropDownList ID="ddlcourse" runat="server" Width="300px" Height="30px"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label">Trainer<span class="required-asterix">*</span></label>
                                <div class="form-material">
                                    <asp:DropDownList ID="ddltrainer" runat="server" Width="300px" Height="30px"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label">Assessment Date<span class="required-asterix">*</span></label>
                                <div class="form-material">
                                    <asp:TextBox ID="txtadate" runat="server" TextMode="Date" Width="300px"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label">Level<span class="required-asterix">*</span></label>
                                <div class="form-material">
                                    <asp:DropDownList ID="ddllevel" runat="server" Width="300px" Height="30px">
                                        <asp:ListItem Text="Level 1" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Level 2" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Level 3" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Level 4" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="Level 5" Value="4"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label">Grade<span class="required-asterix">*</span></label>
                                <div class="form-material">
                                    <asp:TextBox ID="txtgrade" runat="server"  Width="300px"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label">Assessor</label>
                                <div class="form-material">
                                    <asp:DropDownList ID="ddlassign" runat="server" Width="300px" Height="30px"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label">Remarks</label>
                                <div class="form-material">
                                    <asp:TextBox ID="txtremark" runat="server" TextMode="MultiLine" Width="500px" Height="100px"></asp:TextBox>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
       

        <div>
            <asp:HiddenField ID="HdnStdId" runat="server" />
        </div>

        <div class="row ml-3">
            <asp:Button ID="BtnSave" runat="server" CssClass="btn-blue" Text="Save" class="btn btn-primary" BackColor="#0066FF" ForeColor="White" OnClick="BtnSave_Click" />&nbsp;
                        <asp:Button ID="BtnUpdate" runat="server" CssClass="btn-blue" Text="Update" BackColor="#0066FF" ForeColor="White" OnClick="BtnUpdate_Click" />&nbsp;
                        <asp:Button ID="BtnClear" runat="server" CssClass="btn-blue" Text="Clear" BackColor="#0066FF" ForeColor="White" OnClick="BtnClear_Click" />
            <asp:Label ID="lblUnitId" runat="server" Visible="false"></asp:Label>

        </div>

        </div>
    </section>


</asp:Content>
