<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CRM.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpPageContent" runat="server">
    <!---- Page Title   --->
    <div class="page-header">
        <div class="crms-title row bg-white">
            <div class="col">
                <h3 class="page-title m-0">
                    <span class="page-title-icon bg-gradient-primary text-white mr-2">
                        <i class="fa fa-user-o" aria-hidden="true"></i>
                    </span>Enquiry </h3>
            </div>
            <div class="col text-right">

                <asp:LinkButton ID="LinkButton1" runat="server" data-toggle="modal" CssClass="add btn btn-gradient-primary font-weight-bold text-white todo-list-add-btn btn-rounded"
                    aria-expanded="false" aria-controls="navbar" data-target="#add_contact">Create Enquiry</asp:LinkButton>

            </div>
        </div>
    </div>
    <!--- /Page Title --->
    <!-- Content Starts -->
    <div class="row">
        <div class="col-md-12">
            <div class="card mb-0">
                <div class="card-body">
                    <!---- Repeater to list records --->
                      <a id="popupedit" data-toggle="modal" class="open-popup" data-target="#add_contact" ></a>
                    <asp:Repeater ID="rptEnqs" runat="server">
                        <HeaderTemplate>
                            <div class="table-responsive">
                                
                                <table class="table table-striped table-nowrap custom-table mb-0 datatable">
                                    <thead>
                                        <tr>
                                            <th class="font-weight-bold">Name</th>
                                            <th class="font-weight-bold">Email</th>
                                            <th class="font-weight-bold">Contact No</th>
                                            <th class="font-weight-bold">Parent</th>
                                            <th class="font-weight-bold">Activity</th>
                                            <th class="font-weight-bold">Location</th>
                                            <th class="font-weight-bold">Enq.Source</th>
                                            <th></th>
                                          </tr>
                                    </thead>
                            </div>
                           </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                   <a style="color:blue;cursor:pointer"  data-id='<%#Eval("EnqId") %>' onclick="popupshow(this)" ><%#Eval("Name") %></a>
                                </td>
                              <%--  <td><%#Eval("Name") %></td>--%>
                                <td><%#Eval("Email") %></td>
                                <td><%#Eval("Contact") %></td>
                                <td><%#Eval("ParentName") %></td>
                                <td><%#Eval("Course") %></td>
                                <td><%#Eval("LocName") %></td>
                                <td><%#Eval("SourceName") %></td>
                                <td>
                                 <a href="#" class="btn btn-add" data-toggle="modal" data-id='<%#Eval("EnqId") %>' data-target="#leads-details"><i class="fa fa-calendar-check-o"></i> </a>  
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                    </div>
                    <asp:HiddenField ID="hdnId" runat="server" ClientIDMode="Static" />
                    <asp:Button ID="btnEdit" ClientIDMode="Static" runat="server" OnClick="btnEdit_Click" ValidationGroup="edit" Style="display: none" />
                
            </div>
        </div>
    </div>

    <!-- /Content End -->
    <!-- Modal Add Contact-->
    <div class="modal right fade" id="add_contact" tabindex="-1" role="dialog" aria-modal="true">
        <div class="modal-dialog" role="document">
            <button type="button" class="close md-close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title text-center fa fa-user fa-2x"">Enquiry</h3>
                        <div class="btn-group mb-3">
                            <asp:LinkButton runat="server" ID="btnedt" class="btn btn-light" OnClick="btnEdt_Click">
                                <i class="fa fa-edit" aria-hidden="true"></i>
                            </asp:LinkButton>
                            <asp:LinkButton runat="server" ID="btnstureg" class="btn btn-light" OnClick="btnstureg_Click">
                                <i class="fa fa-users" aria-hidden="true"></i>
                            </asp:LinkButton>
                              <button type="button" class="btn btn-light"><i class="fa fa-phone" aria-hidden="true"></i></button>
                              <%--<button type="button" class="btn btn-light"><i class="fa fa-users" aria-hidden="true"></i></button>--%>
                              <button type="button" class="close xs-close" data-dismiss="modal">×</button>
                        </div>
                </div>
                
                <div class="modal-body">
                        <div class="col-md-12">
                             <div class="form-group row">
                                <div class="col-md-6">
                                    <label class="col-form-label ">First Name <span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtFname" runat="server" class="form-control" data-toggle="validator"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <label class="col-form-label ">Last Name <span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtLname" runat="server" class="form-control" data-toggle="validator"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-6">
                                    <label class="col-form-label ">Gender</label>
                                    <asp:DropDownList ID="ddlGender" runat="server" class="form-control">
                                        <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-sm-6">
                                    <label class="col-form-label ">Birth Date</label>
                                    <asp:TextBox ID="txtDob" ClientIDMode="Static" placeholder="dd/MM/yyyy" TextMode="Date" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        
                            <div class="form-group row">
                                <div class="col-sm-6">
                                    <label class="col-form-label ">Email</label>
                                    <asp:TextBox ID="txtEmail" runat="server" class="form-control" data-toggle="validator" TextMode="Email"></asp:TextBox>
                                </div>
                                <div class="col-sm-6">
                                    <label class="col-form-label ">Contact No</label>
                                    <asp:TextBox ID="txtContactno" runat="server" class="form-control" TextMode="Phone" data-toggle="validator"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-6">
                                    <label class="col-form-label ">Parent Name</label>
                                    <asp:TextBox ID="txtParent" runat="server" class="form-control" data-toggle="validator"></asp:TextBox>
                                </div>
                                <div class="col-sm-6">
                                    <label class="col-form-label ">Present Address</label>
                                    <asp:TextBox ID="txtaddress1" runat="server" class="form-control" TextMode="MultiLine" data-toggle="validator"></asp:TextBox>
                                </div>

                            </div>
                             <div class="form-group row">
                                <div class="col-sm-6">
                                    <label class="col-form-label ">Activity</label>
                                    <div>
                                        <asp:DropDownList ID="DDLCourse" runat="server" class="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <label class="col-form-label ">Location</label>
                                    <div>
                                        <asp:DropDownList ID="DDLloc" runat="server" class="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-6">
                                    <label class="col-form-label ">Source</label>
                                    <div>
                                        <asp:DropDownList ID="ddlSource" runat="server" class="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <label class="col-form-label">Assign To</label>
                                    <div>
                                        <asp:DropDownList ID="ddlAssigned" runat="server" class="form-control"> </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="text-center py-3">
                                <asp:Button ID="BtnEnqSave" runat="server" OnClick="BtnEnqSave_Click" class="border-0 btn btn-primary btn-gradient-primary btn-rounded" Text="Save" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- modal-content -->
        </div>
        <!-- modal-dialog -->
    </div>
    <!-- modal add contact ends-->

    <!--system users Modal -->
    <div class="modal right fade" id="leads-details" tabindex="-1" role="dialog" aria-modal="true">
        <div class="modal-dialog" role="document">
            <button type="button" class="close md-close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close xs-close" data-dismiss="modal">×</button>
                    <div class="row w-100">
                        <div class="col-md-7 account d-flex">
                            <div class="company_img">
                                <img src="assets/img/system-user.png" alt="User" class="user-image" />
                            </div>
                            <div>
                                <p class="mb-0">System User</p>
                                <span class="modal-title">John Doe</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card due-dates">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <span>Enq Id</span>
                <asp:Label ID="lblEnqId" runat="server" />
                                 
                            </div>
                            <div class="col">
                                <span>Name</span>
                                <p>Anne Lynch</p>
                            </div>
                            <div class="col">
                                <span>Lead Source</span>
                                <p>Phone Enquiry</p>
                            </div>
                            <div class="col">
                                <span>Activity</span>
                                <p>0</p>
                            </div>
                            <div class="col">
                                <span>Location</span>
                                <p>John Doe</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal-body">
                    <div class="tab-content pipeline-tabs border-0">
                        <div role="tabpanel" class="tab-pane active p-0" id="not-contacted">
                            <div class="">
                                <div class="task-infos">
                                    <ul class="nav nav-tabs nav-tabs-solid nav-tabs-rounded nav-justified">
                                        <li class="nav-item"><a class="nav-link active" href="#not-contact-task-details" data-toggle="tab">Details</a></li>
                                        <li class="nav-item"><a class="nav-link" href="#not-contact-task-activity" data-toggle="tab">Activity</a></li>
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab-pane show active p-0" id="not-contact-task-details">
                                            <div class="crms-tasks">
                                                <div class="tasks__item crms-task-item active">
                                                    <div class="accordion-header js-accordion-header">Enquiry Information</div>
                                                    <div class="accordion-body js-accordion-body">
                                                        <div class="accordion-body__contents">
                                                            <table class="table">
                                                                <tbody>
                                                                    <tr>
                                                                        <td class="border-0">Enquiry Date</td>
                                                                        <td class="border-0">hdnEnqid.Value</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Name</td>
                                                                        <td>Anny Lench</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Title</td>
                                                                        <td>VP of Sales</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Organization</td>
                                                                        <td>Howe-Blanda LLC</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Lead Status</td>
                                                                        <td>OPEN - NotContacted</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>User Responsible</td>
                                                                        <td>Williams</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Link Email Address</td>
                                                                        <td>abc@gmail.com</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Lead Owner</td>
                                                                        <td>John Doe</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Lead Created</td>
                                                                        <td>03-Jun-20 1:14 AM</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Date of Last Activity</td>
                                                                        <td>09/01/2020</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Date of Next Activity</td>
                                                                        <td>09/01/2021</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Lead Rating</td>
                                                                        <td>0</td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="tasks__item crms-task-item">
                                                    <div class="accordion-header js-accordion-header">Additional Information</div>
                                                    <div class="accordion-body js-accordion-body">
                                                        <div class="accordion-body__contents">
                                                            <table class="table">
                                                                <tbody>
                                                                    <tr>
                                                                        <td>Email Address</td>
                                                                        <td>abc@gmail.com</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Email Opted Out</td>
                                                                        <td>Lorem</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Phone</td>
                                                                        <td>(406) 653-3860</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Mobile Phone</td>
                                                                        <td>9865665545</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Fax</td>
                                                                        <td>1234</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Website</td>
                                                                        <td>abc.com</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Industry</td>
                                                                        <td>Information Security</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Number of Employees</td>
                                                                        <td>2</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Lead Source</td>
                                                                        <td>Phone Enquiry</td>
                                                                    </tr>

                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="tasks__item crms-task-item">
                                                    <div class="accordion-header js-accordion-header">Address Information</div>
                                                    <div class="accordion-body js-accordion-body">
                                                        <div class="accordion-body__contents">
                                                            <table class="table">
                                                                <tbody>
                                                                    <tr>
                                                                        <td>Address</td>
                                                                        <td>1000 Escalon Street, Palo Alto, CA, 94020, United States map</td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>

                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="tab-pane p-0" id="not-contact-task-activity">
                                            <div class="row">
                                                <div class="crms-tasks  p-2">
                                                    <div class="tasks__item crms-task-item active">
                                                        <div class="accordion-header js-accordion-header">Upcoming Activity </div>
                                                        <div class="accordion-body js-accordion-body">
                                                            <div class="accordion-body__contents">
                                                                <div class="table-responsive">
                                                                    <table class="table table-striped table-nowrap custom-table mb-0 datatable">
                                                                        <thead>
                                                                            <tr>
                                                                                <th>Type</th>
                                                                                <th>Activity Name</th>
                                                                                <th>Assigned To</th>
                                                                                <th>Due Date</th>
                                                                                <th>Status</th>
                                                                                <th class="text-right">Actions</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr>

                                                                                <td>Meeting
                                                                                </td>
                                                                                <td>Call Enquiry</td>
                                                                                <td>John Doe</td>
                                                                                <td>13-Jul-20 11:37 PM</td>
                                                                                <td>
                                                                                    <label class="container-checkbox">
                                                                                        <input type="checkbox" checked>
                                                                                        <span class="checkmark"></span>
                                                                                    </label>
                                                                                </td>

                                                                                <td class="text-center">
                                                                                    <div class="dropdown dropdown-action">
                                                                                        <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
                                                                                        <div class="dropdown-menu dropdown-menu-right">
                                                                                            <a class="dropdown-item" href="#">Add New Task</a>
                                                                                            <a class="dropdown-item" href="#">Add New Event</a>

                                                                                        </div>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>

                                                                                <td>Meeting
                                                                                </td>
                                                                                <td>Phone Enquiry</td>
                                                                                <td>David</td>
                                                                                <td>13-Jul-20 11:37 PM</td>

                                                                                <td>
                                                                                    <label class="container-checkbox">
                                                                                        <input type="checkbox" checked>
                                                                                        <span class="checkmark"></span>
                                                                                    </label>
                                                                                </td>

                                                                                <td class="text-center">
                                                                                    <div class="dropdown dropdown-action">
                                                                                        <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
                                                                                        <div class="dropdown-menu dropdown-menu-right">
                                                                                            <a class="dropdown-item" href="#">Add New Task</a>
                                                                                            <a class="dropdown-item" href="#">Add New Event</a>

                                                                                        </div>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="tasks__item crms-task-item">
                                                        <div class="accordion-header js-accordion-header">Past Activity</div>
                                                        <div class="accordion-body js-accordion-body">
                                                            <div class="accordion-body__contents">
                                                                <div class="table-responsive">
                                                                    <table class="table table-striped table-nowrap custom-table mb-0 datatable">
                                                                        <thead>
                                                                            <tr>
                                                                                <th>Type</th>
                                                                                <th>Activity Name</th>
                                                                                <th>Assigned To</th>
                                                                                <th>Due Date</th>
                                                                                <th>Status</th>
                                                                                <th class="text-right">Actions</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr>

                                                                                <td>Meeting
                                                                                </td>
                                                                                <td>Call Enquiry</td>
                                                                                <td>John Doe</td>
                                                                                <td>13-Jul-20 11:37 PM</td>
                                                                                <td>
                                                                                    <label class="container-checkbox">
                                                                                        <input type="checkbox" checked>
                                                                                        <span class="checkmark"></span>
                                                                                    </label>
                                                                                </td>

                                                                                <td class="text-center">
                                                                                    <div class="dropdown dropdown-action">
                                                                                        <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
                                                                                        <div class="dropdown-menu dropdown-menu-right">
                                                                                            <a class="dropdown-item" href="#">Add New Task</a>
                                                                                            <a class="dropdown-item" href="#">Add New Event</a>

                                                                                        </div>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>

                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- modal-content -->
        </div>
        <!-- modal-dialog -->
    </div>
    <!-- modal -->
    <asp:HiddenField ID="hdnEnqId" runat="server" />
    <asp:HiddenField ID="hdnEdit" runat="server" />
    <!-- Scripts --->
    <script type="text/javascript">

        function popupshow(uielement) {

            var Id = $(uielement).data('id');
            document.getElementById("hdnId").value = Id;
            $("#btnEdit").click();
        }
        function Openpopup() {

            $("#popupedit").click();

        }


    </script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpScripts" runat="server">
</asp:Content>
