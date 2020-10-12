<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CRM.Login" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>WF Sports | Log in</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">

    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">

    <!--font style-->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@200;300;400;500;600&display=swap" rel="stylesheet">

    <!-- Main CSS -->
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
 
        <!-- Main Wrapper -->
        <div class="main-wrapper">
            <div class="account-content">
                <div class="container">
                    <!-- Account Logo -->
                    <div class="account-logo">
                        <a href="index.html">
                            <img src="assets/img/westford-sports.png" alt="Westford Sports"></a>
                    </div>
                    <!-- /Account Logo -->
                    <div class="account-box">
                        <div class="account-wrapper">
                            <h3 class="account-title">Login</h3>
                            <p class="account-subtitle">Access to our session</p>
                            <!-- Account Form -->
                            <form id="login" runat="server">
                                <div class="form-group">
                                    <label>User Name</label>
                                    <asp:TextBox runat="server" ID="txtusername" class="form-control" TabIndex="1" data-toggle="validator" required="txtusername"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col">
                                            <label>Password</label>
                                        </div>
                                    </div>
                                    <asp:TextBox runat="server" ID="txtpassword" class="form-control" TabIndex="2" TextMode="Password" data-toggle="validator" required="txtpassword"></asp:TextBox>
                                </div>
                                <div class="form-group text-center">
                                    <asp:Button ID="btnlogin" class="btn btn-primary account-btn" runat="server" Text="Sign In" TabIndex="3" OnClick="btnlogin_Click" />
                                </div>
                                 <a href="#">I Forgot my password?</a>
                            <asp:HiddenField ID="hdnUTCoffset" ClientIDMode="Static" runat="server" Value="0" />
                            </form>
                            <!-- /Account Form -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /Main Wrapper -->
    
    <!-- jQuery -->
    <script src="assets/js/jquery-3.5.0.min.js"></script>
    <!-- Bootstrap Core JS -->
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- Custom JS -->
    <script src="assets/js/app.js"></script>
</body>
</html>
