<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Homeold.aspx.cs" Inherits="CRM.Home" %>

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
                <button class="add btn btn-gradient-primary font-weight-bold text-white todo-list-add-btn btn-rounded" id="add-task" data-toggle="modal" data-target="#add_contact">Create Enquiry</button>

            </div>
        </div>
    </div>
    <!-- Content Starts -->
    <div class="row">
        <div class="col-md-12">
            <div class="card mb-0">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-nowrap custom-table mb-0 datatable">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Contact No</th>
                                    <th>Parent</th>
                                    <th>Activity</th>
                                    <th>Location</th>
                                    <th></th>
                                    <th class="text-right">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <td>VP of Sales	</td>
                                <td>Umbrella		
                                </td>
                                <td>(406) 653-3860</td>
                                <td>abc@gmail.com</td>
                                <td>OPEN - NotContacted	</td>
                                <td>03-Jun-20 1:14 AM</td>
                                <td>John Doe</td>
                            </tbody>
                       
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
