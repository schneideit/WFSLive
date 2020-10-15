<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewStudents.aspx.cs" Inherits="CRM.ViewStudents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpPageContent" runat="server">
    <!---- Page Title   --->
    <div class="page-header">
        <div class="crms-title row bg-white">
            <div class="col">
                <h3 class="page-title m-0">
                    <span class="page-title-icon bg-gradient-primary text-white mr-2">
                        <i class="fa fa-user-o" aria-hidden="true"></i>
                    </span>Student </h3>
            </div>
            <div class="col text-right">
                <asp:LinkButton ID="lnkCrtEnq" runat="server" href="Student.aspx" CssClass="add btn btn-gradient-primary font-weight-bold text-white todo-list-add-btn btn-rounded">Register Student</asp:LinkButton>
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
                    <asp:Repeater ID="rptEnq" runat="server">
                        <HeaderTemplate>
                            <div class="table-responsive">
                                <table class="table table-striped table-nowrap custom-table mb-0 datatable">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th class="font-weight-bold">Name</th>
                                            <th class="font-weight-bold">Contact No</th>
                                            <th class="font-weight-bold">Parent</th>
                                            <%--      <th class="font-weight-bold">Activity</th>
                                            <th class="font-weight-bold">Location</th>
                                           <th class="font-weight-bold">Enq.Source</th>
                                            <th class="font-weight-bold">Enq.Type</th>
                                            <th class="font-weight-bold">Enq.Date</th>--%>
                                        </tr>
                                    </thead>
                            </div>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td  width="3%">
                                    <asp:LinkButton ID="btnPymnt" class="fa fa-credit-card" runat="server" CommandArgument='<%#Eval("StudId")%>' OnClick="btnPymnt_Click"></asp:LinkButton></td>
                                </td>
                                     <td width="3%">
                                         <asp:LinkButton ID="btnAssmnt" class="fa fa-check-circle-o" runat="server" CommandArgument='<%#Eval("StudId")%>' OnClick="btnAssmnt_Click"></asp:LinkButton></td>
                                </td>
                                <td width="3%">
                                    <asp:LinkButton ID="btnAttnd" class="fa fa-calendar" runat="server" CommandArgument='<%#Eval("StudId")%>' OnClick="btnAttnd_Click"></asp:LinkButton>
                                </td>
                                <td>
                                    <img id="imgStud" runat="server" style="max-height:70px; max-width:50px" src='<%# "Uploads\\Students\\"+(Convert.ToString(Eval("Imagepath"))==""?"NoImage.gif":Eval("Imagepath")) %>'  />
                                    <asp:LinkButton ID="btnEdit" Text='<%#Eval("Name") %>' runat="server" CommandArgument='<%#Eval("StudId")%>' OnClick="btnEdit_Click"></asp:LinkButton>
                                </td>

                                <td><%#Eval("ContactNo") %></td>
                                <td><%#Eval("ParentName") %></td>
                                <%--    <td><%#Eval("Course") %></td>
                                <td><%#Eval("LocName") %></td>
                              <td><%#Eval("SourceName") %></td>
                                <td><%#Eval("EnqType") %></td>
                                <td><%#Eval("EnqDate") %></td>--%>
                            </tr>
                        </ItemTemplate>

                        <FooterTemplate>
                            </table>  
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
                <asp:HiddenField ID="hdnId" runat="server" ClientIDMode="Static" />
                <asp:Button ID="Button1" ClientIDMode="Static" runat="server" OnClick="btnEdit_Click" ValidationGroup="edit" Style="display: none" />
            </div>
        </div>
    </div>

    <!-- /Content End -->
</asp:Content>

