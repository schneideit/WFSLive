<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Schedule.aspx.cs" Inherits="CRM.Schedule" %>


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
                <a href="#schedule" data-toggle="tab" aria-expanded="false"><i class="ti-book"></i>Create Schedule</a>
                <%--<a href="#schedule" class="nav-link">Create Schedule</a>--%>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="#search" data-toggle="tab" aria-expanded="true"><i class="ti-search"></i>Search</a>
                <%--<a href="#search" class="nav-link">Search</a>--%>
            </li>
        </ul>
    </nav>
    <%--    <ul class="nav-item d-none d-sm-inline-block">
        <li class="active"><a href="#schedule" data-toggle="tab" aria-expanded="false"><i class="ti-book"></i>Create Schedule</a> </li>
        <li class=""><a href="#search" data-toggle="tab" aria-expanded="true"><i class="ti-search"></i>Search</a> </li>
    </ul>--%>
    <div class="tab-content br-n pn">
        <div id="schedule" class="tab-pane active">
            <section class="content">



                <%--First Tab--%>
                <div class="row m-md-4">
                    <div class="col-md-10">
                        <div class="card card-primary">
                            <!--- Copy above Header -->
                            <div class="card-header">
                                <h3 class="card-title">Schedule</h3>
                            </div>

                            <div class="row m-lg-2">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label">Schedule Name<span class="required-asterix">*</span></label>
                                        <div class="form-material">
                                            <asp:TextBox ID="txtschname" runat="server" class="form-control" data-toggle="validator" required="txtCourseName"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label">Location<span class="required-asterix">*</span></label>
                                        <div class="form-material">
                                            <asp:DropDownList ID="ddlloc" runat="server" class="form-control">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label">Course<span class="required-asterix">*</span></label>
                                        <div class="form-material">
                                            <asp:DropDownList ID="ddlcourse" runat="server" class="form-control">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label">Trainer<span class="required-asterix">*</span></label>
                                        <div class="form-material">
                                            <asp:DropDownList ID="ddltrain" runat="server" class="form-control">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label">From Date<span class="required-asterix">*</span></label>
                                        <div class="form-material">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="vgschedule" ControlToValidate="ASPxfromDate" runat="server" ErrorMessage="Enter Date"></asp:RequiredFieldValidator></span></label>
                                       <%--<dx:ASPxDateEdit ID="ASPxfromDate" TabIndex="8" CssClass="form-control" runat="server" EditFormatString="dd-MM-yyyy" DisplayFormatString="dd-MM-yyyy" AutoPostBack="true" Width="585px"></dx:ASPxDateEdit>--%>
                                            <label id="lblmessage" runat="server" title="" visible="false" style="font-size: x-small; color: red;"></label>




                                            <asp:TextBox ID="ASPxfromDate" ClientIDMode="Static" placeholder="yyyy/MM/dd" TextMode="Date" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label">To Date<span class="required-asterix">*</span></label>
                                        <div class="form-material">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="vgschedule" ControlToValidate="ASPxtoDate" runat="server" ErrorMessage="Enter Date"></asp:RequiredFieldValidator>

                                            <%--<dx:ASPxDateEdit ID="ASPxtoDate" TabIndex="8" CssClass="form-control" runat="server" EditFormatString="dd-MM-yyyy" DisplayFormatString="dd-MM-yyyy" AutoPostBack="true" Width="585px"></dx:ASPxDateEdit>--%>
                                            <label id="Label1" runat="server" title="" visible="false" style="font-size: x-small; color: red;"></label>
                                            <asp:TextBox ID="ASPxtoDate" ClientIDMode="Static" placeholder="yyyy/MM/dd" TextMode="Date" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="form-material">
                                            <label class="control-label">From Time<span class="required-asterix">*</span></label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ValidationGroup="vgschedule" ControlToValidate="aspFromtime" runat="server" ErrorMessage="Enter Time"></asp:RequiredFieldValidator>
                                          <%--  <dx:ASPxTimeEdit ID="aspFromtime" runat="server" TabIndex="10" CssClass="form-control" DateTime="2009/11/01 12:00:00" DisplayFormatString="h:mm tt" EditFormatString="hh:mm tt" Width="585px">
                                                <ValidationSettings ErrorDisplayMode="None" />
                                            </dx:ASPxTimeEdit>--%>
                                            <asp:TextBox ID="aspFromtime" runat="server" class="col-xs-12 col-sm-12 required datetimepicker"></asp:TextBox>
                                            <label style="font-size: x-small; color: black;">(GMT+04:00) Abu Dhabi, Muscat</label>
                                            <%-- <asp:TextBox ID="txtftime" ClientIDMode="Static" placeholder="hh:mm:ss" TextMode="Time" runat="server" CssClass="form-control"></asp:TextBox>--%>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="form-material">
                                            <label class="control-label">To Time<span class="required-asterix">*</span></label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="vgschedule" ControlToValidate="aspTotime" runat="server" ErrorMessage="Enter Time"></asp:RequiredFieldValidator></span></label>
                                       <%-- <dx:ASPxTimeEdit ID="aspTotime" runat="server" CssClass="form-control" TabIndex="11" DateTime="2014/10/01 12:00:00" DisplayFormatString="h:mm tt" EditFormatString="hh:mm tt" Width="585px">
                                            <ValidationSettings ErrorDisplayMode="None" />
                                        </dx:ASPxTimeEdit>--%>
                                             <asp:TextBox ID="aspTotime" runat="server" class="col-xs-12 col-sm-12 required datetimepicker"></asp:TextBox>
                                            <%--<asp:TextBox ID="txtttime" ClientIDMode="Static" placeholder="hh:mm:ss" TextMode="Time" runat="server" CssClass="form-control"></asp:TextBox>--%>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label">Class Days<span class="required-asterix">*</span></label>
                                        <div class="form-material">
                                            <asp:CheckBoxList ID="Chkclass" runat="server" Width="100%" Height="50" CssClass="form-control" RepeatDirection="Horizontal">
                                                <asp:ListItem Value="1">Sun<label style="color:white">...</label> </asp:ListItem>

                                                <asp:ListItem Value="2">Mon <label style="color:white">...</label> </asp:ListItem>

                                                <asp:ListItem Value="3">Tue <label style="color:white">...</label></asp:ListItem>

                                                <asp:ListItem Value="4">Wed <label style="color:white">...</label></asp:ListItem>

                                                <asp:ListItem Value="5">Thu <label style="color:white">...</label></asp:ListItem>

                                                <asp:ListItem Value="6">Fri <label style="color:white">...</label></asp:ListItem>

                                                <asp:ListItem Value="7">Sat <label style="color:white">...</label> <label style="color:white">...</label></asp:ListItem>
                                            </asp:CheckBoxList>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label"><span class="required-asterix"></span></label>
                                        <div class="form-material">
                                            <asp:CheckBox ID="chkactive" runat="server" Text="IsActive" />
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

            </section>

            <section class="content">
                <div class="row m-md-4">
                    <div class="col-md-10">
                        <div class="card card-primary">
                            <!--- Copy above Header -->
                            <div class="card-header">
                                <h3 class="card-title">Fee Payment</h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i></button>
                                    <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i></button>
                                </div>
                            </div>
                            <div class="row m-lg-2">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label">Fee Type<span class="required-asterix">*</span></label>
                                        <div class="form-material">
                                            <asp:DropDownList ID="ddlfee" runat="server" class="form-control" OnSelectedIndexChanged="ddlfee_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label">Fees<span class="required-asterix">*</span></label>
                                        <div class="form-material">
                                            <asp:GridView ID="grdfee" runat="server"></asp:GridView>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label">Fee Amount<span class="required-asterix">*</span></label>
                                        <div class="form-material">
                                            <asp:TextBox ID="txtfee" runat="server" class="form-control" data-toggle="validator" required="txtCourseName"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>


            <div class="form-group">
                <asp:Button ID="btnsave" runat="server" BackColor="#3366FF" Text="Save" Width="100px" ForeColor="White" OnClick="Btbsave_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnclear" runat="server" BackColor="#3366FF" Text="Clear" Width="100px" ForeColor="White" OnClick="btnclear_Click" />
            </div>
        </div>

        <div id="search" class="tab-pane">
            <div class="row">
                <div class="col-md-12">
            <%--        <asp:Panel ID="PanelBatch" runat="server" BorderColor="#660033" BorderStyle="Solid" Width="100%" Height="600px" ScrollBars="Vertical" Visible="true">
                        <dx:ASPxGridView ID="GrdSchedule" runat="server" Font-Size="Small" Font-Bold="False" Styles-LoadingPanel-Paddings-Padding="2" Theme="Default" Width="100%" KeyFieldName="TSchdlId" OnRowCommand="GrdSchedule_RowCommand">
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="ScheduleName" Caption="Schedule Name" Visible="true" VisibleIndex="0" Width="12%">
                                    <Settings AllowHeaderFilter="True" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="CourseName" Caption="Course Name" Visible="true" VisibleIndex="0" Width="10%">
                                    <Settings AllowHeaderFilter="True" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="FirstName" Caption="Trainer" Visible="false" VisibleIndex="0">
                                    <Settings AllowHeaderFilter="True" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="LocName" Caption="Location" Visible="true" VisibleIndex="0" Width="15%">
                                    <Settings AllowHeaderFilter="True" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataDateColumn FieldName="FromDate" Caption="Start Date" Visible="true" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy" VisibleIndex="0" Width="15%">
                                    <Settings AllowHeaderFilter="True" />
                                </dx:GridViewDataDateColumn>
                                <dx:GridViewDataDateColumn FieldName="ToDate" Caption="End Date" Visible="true" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy" VisibleIndex="0" Width="15%">
                                    <Settings AllowHeaderFilter="True" />
                                </dx:GridViewDataDateColumn>
                                <dx:GridViewDataTextColumn FieldName="FromTime" Caption="Time From" Visible="true" VisibleIndex="0" Width="10%">
                                    <Settings AllowHeaderFilter="True" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="ToTime" Caption="Time To" Visible="true" VisibleIndex="0" Width="10%">
                                    <Settings AllowHeaderFilter="True" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="IsActive" Caption="Active" Visible="false" VisibleIndex="0">
                                    <Settings AllowHeaderFilter="True" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataColumn Caption="Edit" Width="5%" VisibleIndex="5">
                                    <DataItemTemplate>
                                        <asp:LinkButton ID="lnkEdit"  CommandName="Edit" Text="" CommandArgument='<%# Eval("TSchdlId")%>' runat="server">Edit</asp:LinkButton>
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
    </div>
</asp:Content>
