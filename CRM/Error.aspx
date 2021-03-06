﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="CRM.Error" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="description" content="Westford Sports - CRM">
    <meta name="keywords" content="Schneide, Westford, Westford Sports, Sports, CRM, Projects">
    <meta name="author" content="Schneide Solutions Pvt Ltd">
    <meta name="robots" content="noindex, nofollow">
    <title>CRM</title>

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/westford-favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <!--font style
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@200;300;400;500;600&display=swap" rel="stylesheet">-->
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <!-- Lineawesome CSS -->
    <link rel="stylesheet" href="assets/css/line-awesome.min.css">
    <!-- Select2 CSS -->
    <link rel="stylesheet" href="assets/css/select2.min.css">
    <!-- Datetimepicker CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">
    <!-- Datatable CSS -->
    <link rel="stylesheet" href="assets/css/dataTables.bootstrap4.min.css">
    <!-- Main CSS -->
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body id="skin-color">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <!-- Main Wrapper -->
                <div class="main-wrapper">
                    <!-- Header -->
                    <div class="header" id="heading">

                        <!-- Logo -->
                        <div class="header-left">
                            <a href="#" class="logo">
                                <img src="assets/img/westford-sports.png" alt="Logo" class="sidebar-logo">
                                <img src="assets/img/westford-favicon.png" alt="Logo" class="mini-sidebar-logo">
                            </a>
                        </div>
                        <!-- /Logo -->
                    </div>
                    <!-- /Header -->
                    <!--    </asp:ContentPlaceHolder>
                   /Sidebar -->
                    <div class="page-wrapper">

                        <!-- Page Content -->
                        <div class="content container-fluid">
                            <!-- PAGE CONTENT BEGINS -->
                            <div class="main-container">
                                <div class="main-content">
                                    <div class="row">
                                        <div class="col-md-12 ">
                                            <div class="">
                                                <div class="">
                                                    <div>

                                                        <div style="font-size: 20px">
                                                            <span style="font-size: 30px; color: red;" class="danger"><i class="fa fa-info-circle"></i></span>
                                                            <asp:Label runat="server" ID="lblErrorMsg" CssClass="form-Label"></asp:Label>
                                                        </div>
                                                        <br />
                                                        <asp:Button runat="server" CssClass="btn btn-warning" ID="btnRedirect" OnClick="btnRedirect_Click" Text="Relogin" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /.col -->
                                    </div>
                                    <!-- /.row -->
                                </div>
                                <!-- /.main-content -->
                            </div>
                        </div>
                        <!--- Page Content -->
                    </div>
                    <!-- Main wrapper -->
            </ContentTemplate>
        </asp:UpdatePanel>

        <!-- /.page-content -->
        <!-- jQuery -->
        <script src="assets/js/jquery-3.5.0.min.js"></script>

        <!-- Bootstrap Core JS -->
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!-- Slimscroll JS -->
        <script src="assets/js/jquery.slimscroll.min.js"></script>

        <!-- Select2 JS -->
        <script src="assets/js/select2.min.js"></script>

        <!-- Datatable JS -->
        <script src="assets/js/jquery.dataTables.min.js"></script>
        <script src="assets/js/dataTables.bootstrap4.min.js"></script>

        <!-- Datetimepicker JS -->
        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/bootstrap-datetimepicker.min.js"></script>


        <!-- Custom JS -->
        <script src="assets/js/app.js"></script>
    </form>
</body>

</html>

