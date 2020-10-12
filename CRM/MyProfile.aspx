<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="MyProfile.aspx.cs" Inherits="CRM.MyProfile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: "Lato", sans-serif;
        }

        .progress {
            position: relative;
            height: 141px;
            width: 120px;
            cursor: pointer;
            top: 0;
            background: #fff;
            left: 164px;
            margin: -6px 0 0 -60px;
        }

        .progress-circle {
            transform: rotate(-90deg);
            margin-top: 10px;
        }

        .progress-circle-back {
            fill: none;
            stroke: #D2D2D2;
            stroke-width: 10px;
        }

        .progress-circle-prog {
            fill: none;
            stroke: #f00297;
            stroke-width: 10px;
            stroke-dasharray: 0 999;
            stroke-dashoffset: 0px;
            transition: stroke-dasharray 0.7s linear 0s;
        }

        .progress-text {
            width: 100%;
            position: absolute;
            top: 50px;
            text-align: center;
            font-size: 2em;
        }

        }
    </style>

    <%-- <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>--%>

    <script type="text/javascript">
        //function UploadFile(uploadControl) {
        $(function () {
            $('#FileUpload1').change(function () {
                if (FileUpload1.value != '') {
                    document.getElementById("<%=btnUpload.ClientID %>").click();
                }
            });
        });
        $(document).ready(function () {



            var val = document.getElementById('lblprogress').innerText;
            var progressVal = parseInt(val), totalPercentageVal = 100;
            if (parseInt(val) == 100) {
                document.getElementById('lblprogrestext').innerText = "Well done! Your profile is completed";
            }
            else {
                document.getElementById('lblprogrestext').innerText = "Your profile is incomplete";
            }
            var strokeVal = (2.51 * 100) / totalPercentageVal;
            var x = document.querySelector('.progress-circle-prog');
            x.style.strokeDasharray = progressVal * (strokeVal) + ' 999';
            var el = document.querySelector('.progress-text');
            var from = $('.progress-text').data('progress');
            $('.progress-text').data('progress', progressVal);
            var start = new Date().getTime();

            setTimeout(function () {
                var now = (new Date().getTime()) - start;
                var progress = now / 700;
                el.innerHTML = progressVal / totalPercentageVal * 100 + '%';
                if (progress < 1) setTimeout(arguments.callee, 10);
            }, 10);


            progressBar(10, 200);
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

            function EndRequestHandler(sender, args) {
                $(function () {
                    $('[id*=txtDOB]').datepicker({
                        changeMonth: true,
                        changeYear: true,
                        yearRange: '-100:+0',
                        maxDate: 0
                    });
                });
            }

        });

        $(function () {
            $('[id*=txtDOB]').datepicker({
                changeMonth: true,
                changeYear: true,
                yearRange: '-100:+0',
                maxDate: 0
            });
        });

    </script>
    <style>
        /*img#ContentPlaceHolder1_ImgStudent {
            top: 77px;
            position: absolute;
        }*/
        .control-label {
            background: #b38ab2;
            font-size: 13px;
            color: #fff;
            padding: 3px 10px;
        }

        .controls {
            background: #efefef;
            margin-left: 10px;
            width: 54%;
            font-size: 13px;
            padding: 2px 10px;
            height: 25px;
            color: #000;
        }

        .snap-canvas {
            width: 45%;
            margin: 0 auto !important;
            position: absolute;
            left: 27.5%;
            top: 61%;
        }

        #dllMonth {
            width: 44%;
            float: left;
        }

        #dllYear {
            float: left;
            width: 46%;
        }

        #dllEndmonth {
            width: 50%;
            float: left;
        }

        #dllEndYear {
            width: 47%;
            float: left;
        }

        .Popup-snap {
            width: 45%;
            left: 28% !important;
            top: 11% !important;
            bottom: 2% !important;
            height: 85% !important;
            border-radius: 11px;
            box-shadow: 0 0 100px #000;
            padding: 29px;
            position: absolute;
            background: #fff;
            border: 15px solid #eee;
        }

        .snapit {
            width: 100px !important;
            float: left;
            background: #91278f;
            color: #fff;
            margin: 14px 44%;
        }

        .snapit2 {
            width: 100px !important;
            float: none;
            background: #91278f;
            color: #fff;
            margin: 14px 44%;
            bottom: 0;
            position: absolute;
            left: 0%;
        }

        #canvas {
            float: left;
            display: block;
            margin-top: 0;
            margin-left: 16px;
        }

        .Popup {
            width: 96%;
            left: 2% !important;
            top: 1% !important;
            bottom: 2% !important;
            height: 100% !important;
            position: absolute;
            background: #fff;
        }

        #ContentPlaceHolder1_pnlFiles {
            /*background: #eee;*/
        }

        .pop-iframe {
            width: 100% !important;
            height: 88vh !important;
            border-radius: 10px;
            padding: 64px 20px 20px 20px;
        }

        .clos-btn1 {
            background: #91278f;
            border: none;
            color: #fff;
            border-radius: 3px;
            top: 11px;
            right: 19px;
            position: absolute;
            width: 39px !important;
            z-index: 999;
        }

        .checkbox label::before {
            border: 3px solid #695d72;
        }

        .uplbtn45 {
            padding: 7px;
            border-radius: 20px;
            width: 23%;
            margin-left: 10px;
            background: #695c71;
            color: white;
        }


        #TxtalterPhnCode {
            width: 20%;
        }

        #txtalternatePhone {
            width: 78%;
        }

        #ContentPlaceHolder1_txtmobprefix {
            width: 20%;
        }

        #ContentPlaceHolder1_txtmobile {
            width: 78%;
        }

        input#FileExpeCertificateUpload {
            float: left;
        }

        div#ExpUpload {
            float: left;
        }

        .pomblcodn {
            width: 22% !important;
            margin-left: 0px !important;
        }

        .pomblcod {
            width: 7% !important;
            margin-left: 0px !important;
        }

        .col-sm-5 {
            text-align: left;
        }

        .col-sm-6 {
            text-align: left;
        }



        .chklbl {
            float: left;
            z-index: 9999;
            position: absolute;
            top: 30px;
            left: -21px;
        }

        .chklblt {
            text-align: left;
            font-size: 17px;
            font-style: italic;
            color: #6d587a;
            font-weight: 400;
            line-height: 60px;
            position: absolute;
            left: 67px;
        }

        .chklbl-new {
            float: right;
        }

        .chklblt-new {
            text-align: right;
            font-size: 17px;
            font-style: italic;
            color: #6d587a;
            font-weight: 400;
        }

        #results {
            float: right;
            margin: 20px;
            padding: 20px;
            border: 1px solid;
            background: #ccc;
        }

        body {
            font-family: Helvetica, sans-serif;
        }

        h2, h3 {
            margin-top: 0;
        }

        form {
            margin-top: 15px;
        }

            form > input {
                margin-right: 15px;
            }
        /*#results { float:right; margin:20px; padding:20px; border:1px solid; background:#ccc;*/

        }

        .crntcmpa {
            width: 100% !important;
            text-align: right;
            padding-right: 10%;
        }

        td, th {
            text-align: center;
        }

        /*Radio button style*/
        .uplbtn {
            float: left;
            padding: 7px;
            border-radius: 20px;
            width: 23%;
            margin-left: 10px;
            background: #695c71;
            color: white;
        }

        .uplmarkbtn {
            float: left;
            padding: 7px;
            border-radius: 20px;
            width: 23%;
            margin-left: 10px;
            background: #695c71;
            color: white;
        }

        .uplexpbtn {
            float: left;
            padding: 7px;
            border-radius: 20px;
            width: 23%;
            margin-left: 10px;
            background: #695c71;
            color: white;
        }

        .uplPhotobtn {
            float: left;
            padding: 7px;
            border-radius: 20px;
            width: 23%;
            margin-left: 10px;
            background: #695c71;
            color: white;
        }

        .uplPassportbtn {
            float: left;
            padding: 7px;
            border-radius: 20px;
            width: 23%;
            margin-left: 10px;
            background: #695c71;
            color: white;
        }

        .uplResumebtn {
            float: left;
            padding: 7px;
            border-radius: 20px;
            width: 23%;
            margin-left: 10px;
            background: #695c71;
            color: white;
        }

        .uplOtherbtn {
            float: left;
            padding: 7px;
            border-radius: 20px;
            width: 23%;
            margin-left: 10px;
            background: #695c71;
            color: white;
        }

        .clrchn {
            background: #50888f !important;
            float: left;
            padding: 7px;
            border-radius: 20px;
            width: 23%;
            margin-left: 10px;
            color: white;
        }

        .clrchnupl {
            background: #695c71 !important;
            float: left;
            padding: 7px;
            border-radius: 20px;
            width: 23%;
            margin-left: 10px;
            color: white;
        }

        .chkbx1 input[type="checkbox"] {
            float: left;
        }

        .checkbox label::after {
            margin-left: -21px !important;
            padding-left: 10px !important;
            padding-top: 0px !important;
            font-size: 34px !important;
            color: #91278f !important;
            margin-top: -11px !important;
        }

        .checkbox label::before {
            width: 33px !important;
            height: 31px !important;
        }

        .checkbox label {
            padding-left: 24px;
        }

        .chkdf {
            font-size: 24px;
        }

        .chkdf1 {
            font-size: 24px;
            padding-left: 77px;
            margin-top: -13px;
            padding-bottom: 54px;
        }
        /* Radio button style end*/

        .mobccod {
            width: 20%;
        }

        .mbcpox {
            width: 78%;
        }

        select.invalid {
            background-color: #ffdddd;
        }

        .yrmonth {
            width: 13% !important;
        }

        #regForm {
            background-color: #ffffff;
            margin: 100px auto;
            font-family: Raleway;
            padding: 40px;
            width: 70%;
            min-width: 300px;
        }

        .popup .header {
            font-size: 16px;
            color: White;
            background-color: #7f508f;
            padding: 10px 5px;
        }

        .popup .body {
            padding: 10px !important;
        }

        .popup {
            display: block;
            top: 10%;
            box-shadow: rgb(102, 102, 102) 1px 1px 80px;
            z-index: 99;
            right: 17%;
            min-width: 300px;
            position: absolute;
            left: 17%;
            background: #fff;
            min-height: auto;
            margin-top: 40%;
        }

        input[type="checkbox"] {
            width: 46px;
            height: 21px;
        }

        #ContentPlaceHolder1_UserDocdet {
            margin: auto;
            width: 100%;
        }

        .popup-new {
            display: block;
            top: 13%;
            z-index: 99;
            right: 1%;
            min-width: 300px;
            position: absolute;
            left: 1%;
        }

        .clos-btn {
            border: none;
            color: black;
            border-radius: 3px;
            top: 45px;
            /* right: 35px; */
            position: absolute;
            z-index: 999;
        }

        h1, h2, h3 {
            text-align: center;
        }

        .savebutton {
            background-color: #91278f;
            color: #ffffff;
            border: none;
            padding: 10px 52px;
            font-size: 17px;
            border-radius: 20px;
            font-family: Raleway;
            cursor: pointer;
            display: inline-block !important;
        }

        input[type="submit"] {
            width: 100%;
        }


        button:hover {
            opacity: 0.8;
        }

        th {
            background-color: #774476;
            color: white;
            font-size: small;
            text-align: center;
        }

        tr {
            font-size: smaller;
        }

        .usr-profile-form {
            text-align: center;
        }

            .usr-profile-form p {
                display: inline-block;
                margin: 13px 16px;
                width: 29%;
            }

            .usr-profile-form ul li {
                display: inline-block;
                margin: 3px 19px;
                width: 29%;
            }

        li {
            list-style: none;
        }

            li.bach-degree input {
                background: #fff;
            }

            li.bach-degree {
                width: 56%;
                background: #fff !important;
                box-shadow: 0 2px 0 0 #ccc;
                border-radius: 13px;
            }

            li.marklist2 {
                width: 45% !important;
                position: relative !important;
            }

                li.marklist2 em {
                    position: relative !important;
                    bottom: 2px !important;
                    font-size: 12px;
                    left: 0 !important;
                    color: #91278f;
                    text-align: left;
                }


                li.marklist2 input[type="file"] {
                    float: left;
                    width: 100%;
                }

                li.marklist2 input[type="submit"] {
                    width: 25% !important;
                    float: right;
                    color: #fff;
                    border: none;
                    background: #695c71;
                }



            li.marklist input[type="file"] {
                float: left;
                width: 30%;
                border-radius: 20px;
            }

            li.marklist input[type="submit"] {
                width: 10%;
                float: left;
                padding: 8px;
                color: #fff;
                border: none;
                background: #695c71;
                border-radius: 15px;
                margin: 0px 5px;
            }

            li.marklist {
                width: 75% !important;
            }

                li.marklist label {
                    float: left;
                    width: 21%;
                    text-align: left;
                }

        .fa {
            color: #91278f;
        }

        .hdrEdit {
            font-size: 20px;
            float: right;
        }

        .hdrEdit-01 {
            font-size: 20px;
            float: right;
            margin-top: -25px;
        }

            .hdrEdit-01 i {
                color: #999;
            }

        .hdrtext {
            font-size: medium;
            padding-bottom: 5px;
            border-bottom: 1px solid gray;
            margin-bottom: 20px;
        }

        .my-pro-h3 {
            color: #000;
            font-size: 15px;
            font-weight: bold;
            text-align: left;
            margin-bottom: 16px;
            margin-top: 11px;
        }

        .myprofile-heading {
            background: #fff;
            padding-top: 5px;
            color: #695d72;
            margin: 20px auto;
        }

            .myprofile-heading .fa {
                color: #695d72;
            }

        .eye-ico i {
            font-size: 22px;
            float: left;
            margin-left: 0px;
            padding: 10px 50px;
            color: #fff;
            background: #774476;
            border-radius: 0 10px 10px 0;
        }

        .clos-btn i {
            font-size: 25px;
            margin-top: 14px;
        }

        .popup .fa-times-circle {
            color: #fff;
        }

        .close {
            filter: alpha(opacity=80);
            opacity: .8;
        }

        h1, h2, h3 {
            text-align: center;
        }



        /* Mark input boxes that gets an error on validation: */
        input.invalid {
            background-color: #ffdddd;
        }



        .usr-profile-btn-wrap button {
            background-color: #91278f;
            color: #ffffff;
            border: none;
            padding: 10px 52px;
            font-size: 17px;
            border-radius: 20px;
            font-family: Raleway;
            cursor: pointer;
            display: inline-block;
        }

        input[type="submit"] {
            width: 100%;
        }


        button:hover {
            opacity: 0.8;
        }

        #prevBtn {
            background-color: #7c7c7c;
        }

        .usr-profile-btn-wrap {
            padding-bottom: 20px;
        }

        /* Make circles that indicate the steps of the form: */
        .step {
            height: 15px;
            width: 15px;
            margin: 0 2px;
            background-color: #bbbbbb;
            border: none;
            border-radius: 50%;
            display: inline-block;
            opacity: 0.5;
        }

            .step.active {
                opacity: 1;
            }

            /* Mark the steps that are finished and valid: */
            .step.finish {
                background-color: #4CAF50;
            }

        .usr-profile-form {
            text-align: center;
        }

            .usr-profile-form p {
                display: inline-block;
                margin: 13px 16px;
                width: 29%;
            }

            .usr-profile-form ul li {
                display: inline-block;
                margin: 3px 19px;
                width: 29%;
            }

                .usr-profile-form ul li em {
                    position: relative;
                    bottom: 0;
                    font-size: 12px;
                    left: 0;
                    color: #91278f;
                    float: left;
                }

        li {
            list-style: none;
        }

            li.bach-degree input {
                background: #fff;
            }

            li.bach-degree {
                width: 56%;
                background: #fff !important;
                box-shadow: 0 2px 0 0 #ccc;
                border-radius: 13px;
            }

        /* li.marklist input[type="file"] {
                float: left;
                width: 72%;
                border-radius: 15px 0px 0px 15px;
            }

            li.marklist input[type="submit"] {
                width: 28%;
                float: right;
                padding: 8px;
                color: #fff;
                border: none;
                background: #695c71;
                border-radius: 0px 15px 15px 0px;
            }

            li.marklist {
                width: 75% !important;
            }

                li.marklist label {
                    float: left;
                    width: 100%;
                    text-align: center;
                }
           */
        .myprofile-heading {
            background: #fff;
            padding-top: 5px;
            color: #695d72;
            margin: 0 auto;
        }

            .myprofile-heading .fa {
                color: #90268e;
            }

        .modal-footer input[type="submit"] {
            background: #91278f;
            border: none;
            color: #fff;
        }

        .modal-title {
            margin: 0;
            text-align: center;
            font-size: 23px;
            float: left;
            margin-top: -6px;
            line-height: 1.42857143;
        }
        /* camera style*/
        #my_camera {
            max-height: 242px;
        }

        #divcapture {
            max-width: 590px;
            margin: auto;
        }

        .mejs-offscreen {
            display: none;
        }

        #btnsaveimage {
            width: 27% !important;
        }

        #btnsnap {
            width: 27% !important;
        }

        #ContentPlaceHolder1_imgphoto {
            float: right;
            border: 7px solid white;
            width: 40%;
        }
        /* camera style End*/

        .profile-pic {
            top: 0;
            position: relative;
            padding: 20px 0;
        }

        .profile-pic-wrap {
            border-top: 0px solid #cf0093;
            background: #fff;
            position: relative;
        }

            .profile-pic-wrap input[type="file"] {
                position: absolute;
                top: 175px;
                width: 82%;
                padding: 3px;
                border: none;
                left: 16px;
                border-radius: 0;
                background: #666;
                font-size: 11px;
                color: #eee;
                opacity: 0;
                cursor: pointer;
                /*position: absolute;
                top: 19px;
                width: 59%;
                padding: 3px;
                border: none;
                left: 42px;
                border-radius: 0;
                background: #666;
                font-size: 11px;
                color: #eee;
                opacity: 0;*/
            }

        .mgtp-10 {
            margin-top: 10px !important;
        }

        .mgbt-xs-15 {
            margin-bottom: 15px !important;
        }

        .font-semibold {
            font-weight: 500;
        }

        .mgr-10 {
            margin-right: 10px !important;
        }

        .profile-icon {
            font-size: 32px;
        }

        .tr {
            top: 8px;
            right: 20px;
        }

        .vd_info {
            position: absolute;
        }

        .mgbt-xs-0 {
            margin-bottom: 5px;
        }

        .pr-update {
            position: absolute;
            top: 175px;
            z-index: 2;
            background: rgba(0,0,0,.8);
            width: 83%;
            text-align: center;
            color: #999;
            padding: 2px 0;
            font-weight: bold;
            left: 15px;
            pointer-events: none;
        }

        .doc-uploaded p {
            margin: 0;
            padding-left: 28px;
        }
    </style>

    <section class="bg-light pt-4">
        <div class="container body-content">
            <ul class="nav mt-5 tabs tab-theme-pink">
                <li class="tab"><a href="#Files" data-toggle="tab" class="active"><span class="hidden-xs"><b>Member Profile</b></span> </a></li>
                <%--    <li class="tab"><a href="#Submit" data-toggle="tab"><span class="hidden-xs"><b>Personal Billing</b></span> </a></li>
                <li class="tab"><a href="#Log" data-toggle="tab" aria-expanded="true"><span class="hidden-xs"><b>Manage Notification Preferences</b></span> </a></li>--%>
            </ul>
            <div class="tab-content tab-content mt-4 w-100">
                <div class="dash-banner clearfix text-dark pt-4 pb-3">
                    <h2 class="hding-big text-dark w-100 float-left text-left">My Private Profile</h2>

                </div>
                <%-- <div class="row mb-4">
                    <div class="col-md-4">
                        <img src="Images/icons/badge.svg" class="mb-3 mr-2 float-left" />
                        <h6 class="font-weight-bold mb-0">Top 10% Course taker</h6>
                        <p class="font-14">Completed a course with a score of 90%</p>
                    </div>
                    <div class="col-md-4">
                        <img src="Images/icons/badge.svg" class="mb-3 mr-2 float-left" />
                        <h6 class="font-weight-bold mb-0">Certified Course Completer</h6>
                        <p class="font-14">Completed atleast One Course</p>
                    </div>
                    <div class="col-md-4">
                        <img src="Images/icons/badge.svg" class="mb-3 mr-2 float-left" />
                        <h6 class="font-weight-bold mb-0">Best in Class</h6>
                        <p class="font-14">Complete a course with a score of 100% </p>
                    </div>
                </div>--%>
                <div class="tab-pane active" id="Files">

                    <%-- Personal Details Show--%>
                    <div id="dvprof" runat="server">

                        <div class="row">
                            <div class="col-md-8">
                                <div class="row" id="dvpersonaldet" runat="server">
                                    <asp:Repeater ID="rptprofiledet" runat="server">
                                        <itemtemplate>
                                            <div class="col-md-12 float-none">
                                                <div class="bg-white explore-courses shadow rounded p-3 h-100 clearfix">
                                                    <div class="row">
                                                        <div class="col-md-3">
                                                            <img src='<%#Eval("Image")%>' class="w-100 h-100 float-left mb-3" />
                                                        </div>
                                                        <div class="col-md-9">
                                                            <h6 class="pr-2 mb-0 font-weight-bold font-18">
                                                                <asp:Label ID="lblFname" runat="server" Text='<%#Eval("FirstName")%>'></asp:Label>
                                                                <asp:Label ID="lblLname" runat="server" Text='<%#Eval("LastName")%>'></asp:Label>&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;ID: 
                                                                <asp:Label ID="lblStudId" runat="server" Text='<%#Eval("StudentId")%>'></asp:Label>
                                                            </h6>
                                                            <asp:LinkButton ID="lnkeditpersonal" runat="server" OnClick="lnkeditpersonal_Click" ToolTip="Edit" CssClass="hdrEdit-01 font-16 opacity-05"><i class="fa fa-edit"></i> Edit Profile </asp:LinkButton>
                                                             <p class="pt-3 m-0 opacity-05 font-weight-bold">
                                                                <asp:Label ID="lblParent" runat="server" Text='<%#Eval("ParentName")%>'></asp:Label>
                                                             </p>
                                                            <p class="pt-3 m-0 opacity-05 font-weight-bold">
                                                                <asp:Label ID="lblContact" runat="server" Text='<%#Eval("ContactNo")%>'></asp:Label>
                                                            </p>
                                                            <p class="pt-3 m-0 opacity-05 font-weight-bold">
                                                              <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("Email")%>'></asp:Label>
                                                            </p>
                                                            <p class="pt-3 m-0 opacity-05 font-weight-bold">
                                                                <asp:Label ID="Label4" runat="server" Text='<%#Eval("Activity")%>'></asp:Label>
                                                            </p>
                                                            <p class="pt-3 m-0 opacity-05 font-weight-bold">   | 
                                                                <asp:Label ID="Label5" runat="server" Text='<%#Eval("Location")%>'>   |   </asp:Label>
                                                            </p>
                                                      </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </itemtemplate>
                                    </asp:Repeater>

                                </div>
                          
                            </div>
                    
                        </div>

                        <%-- Education Details Show--%>
                    </div>

                    <div id="divProfile" runat="server" clientidmode="Static" style="display: none">
                        <div class="bg-white">
                            <div class="header">
                                <a onclick="Closeprofile()" class="close mr-2 mt-3"><span class="fa fa-times-circle fa-fw"></span></a>
                            </div>
                            <div class="row">
                                <div class="col-md-2 profile-pic-wrap">
                                    <asp:Image ID="ImgStudent" CssClass="profile-pic" BorderColor="Black" ImageUrl="" TabIndex="0" runat="server" Width="100%" />
                                    <div class="pr-update">Update</div>
                                    <div class="file-upl"></div>
                                    <asp:FileUpload ID="FileUpload1" ClientIDMode="Static" runat="server" />
                                    <asp:Button ID="btnUpload" Text="Upload" runat="server" OnClick="btnUpload_Click" Style="display: none" />
                                </div>
                                <div class="col-md-10 mb-5 usr-profile-form">
                                    <div class="row mb-4 mt-3">
                                        <div class="col-md-12 text-left">
                                            <h4 class="m-0 hding-pink-border">Personal Information</h4>
                                            <hr class="hding-border-hr">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="register-form">
                                                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                    <contenttemplate>
                                                        <label>First Name</label>
                                                        <asp:TextBox ID="txtFname" ReadOnly="true" CssClass="form-control" onkeypress="return onlyAlphabets(event,this.id,this.value);" placeholder="First name..." runat="server" TabIndex="1"></asp:TextBox>
                                                    </contenttemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="register-form">
                                                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                                    <contenttemplate>
                                                        <label>Last Name</label>
                                                        <asp:TextBox ID="txtLname" ClientIDMode="Static" CssClass="form-control" onkeypress="return onlyAlphabets(event,this.id,this.value);" placeholder="Last name..." runat="server" TabIndex="2"></asp:TextBox>
                                                    </contenttemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mt-5">
                                        <div class="col-md-6">
                                            <div class="register-form">
                                                <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Conditional">
                                                    <contenttemplate>
                                                        <label>Gender</label>
                                                        <asp:DropDownList ID="ddlGender" ClientIDMode="Static" placeholder="Gender..." runat="server" CssClass="form-control" TabIndex="4">
                                                            <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                                                            <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                                            <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                                            <asp:ListItem Text="Others" Value="Others"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </contenttemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                        <div class="row mt-5">
                                         <div class="col-md-6">
                                            <div class="register-form">
                                               <label>Birth Date</label>
                                                <asp:TextBox ID="txtDOB" ClientIDMode="Static" CssClass="form-control" placeholder="dd-MM-yyyy" runat="server" TextMode="Date" TabIndex="5"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                  </div>
                                  <div class="row">
                                        <div class="col-md-6">
                                            <div class="register-form">
                                                <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                                    <contenttemplate>
                                                        <label>Emirates Id</label>
                                                        <asp:TextBox ID="txtemid" CssClass="form-control" placeholder="Emirates Id" runat="server" TabIndex="6"></asp:TextBox>
                                                    </contenttemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                     <div class="row mt-5">
                                         <div class="col-md-6">
                                            <div class="register-form">
                                               <label>Expiry Date</label>
                                                <asp:TextBox ID="txtedate" ClientIDMode="Static" CssClass="form-control" placeholder="dd-MM-yyyy" runat="server" TextMode="Date" TabIndex="5"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                 </div>
                                    <div class="row mt-4">
                                        <div class="col-md-12 text-left">
                                            <h4 class="m-0 hding-pink-border">Contact Information</h4>
                                            <hr class="hding-border-hr">
                                        </div>
                                    </div>
                                    <div class="row mt-5">
                                        <div class="col-md-6">
                                            <div class="register-form">
                                                <label>Parent Name</label>
                                                <asp:TextBox ID="txtParent" ClientIDMode="Static" CssClass="form-control" textmode="multiline" placeholder="Parent Name" runat="server" TabIndex="7"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="register-form">
                                                <label>City</label>
                                                <asp:TextBox ID="txtaddress1" ClientIDMode="Static" CssClass="form-control" textmode="multiline" placeholder="Address..." runat="server" TabIndex="8"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mt-5">
                                        <div class="col-md-6">
                                            <div class="register-form">
                                                <label>State/Province</label>
                                                <asp:TextBox ID="txtEContactno" ClientIDMode="Static" CssClass="form-control"  placeholder="Contact No" runat="server" TabIndex="9"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="register-form">
                                                <label>Postal Code</label>
                                                <asp:TextBox ID="txtEmail1" ClientIDMode="Static" CssClass="form-control" textmode="Email" placeholder="Email" runat="server" TabIndex="10"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mt-5">
                                       <div class="col-md-6">
                                            <div class="register-form marklist2">
                                                <div>
                                                    <label>Upload  Your Photo ID</label>
                                                </div>
                                                <asp:FileUpload ID="fupphotoid" ClientIDMode="Static" runat="server" TabIndex="7" class="form-control" />
                                                <em>Upload File size must under 5MB!</em>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mt-5">
                                        <div class="col-md-6">
                                            <div class="register-form">
                                                <asp:UpdatePanel ID="UpdatePanel50" runat="server" UpdateMode="Conditional">
                                                    <contenttemplate>
                                                        <label>Nationality</label>
                                                        <asp:DropDownList ID="ddlNationality" ClientIDMode="Static" CssClass="form-control" runat="server" TabIndex="10"></asp:DropDownList>
                                                    </contenttemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                           <div class="col-md-6">
                                            <div class="register-form">
                                                <label>Emergency Phone</label>
                                                <div>
                                                    <asp:TextBox CssClass="mbcpox" ID="txtEmergencyNo" onkeypress="return isNumberKey(event)" ClientIDMode="Static" placeholder="Alternative Phone..." runat="server" TabIndex="17"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mt-5">
                                        <div class="col-md-6">
                                            <div class="register-form">
                                                <label>E-mail</label>
                                                <asp:TextBox ID="txtEmail2" ReadOnly="true" placeholder="Email Address..." CssClass="form-control" onchange="GetMailValid(this.value)" TextMode="Email" runat="server" TabIndex="14"></asp:TextBox>
                                                <asp:Label ID="lblemailchk" ClientIDMode="Static" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>
                                   
                                    </div>

                                    <div class="row mt-5">
                                        <div class="col-md-6">
                                            <div class="register-form">
                                                <label>Alternative Phone</label>
                                                <div>
                                                    <asp:TextBox CssClass="mobccod" ID="TxtalterPhnCode" onkeypress="return isNumberKey(event)" ClientIDMode="Static" placeholder="Code..." runat="server" TabIndex="16"></asp:TextBox>
                                                    <asp:TextBox CssClass="mbcpox" ID="txtalternatePhone" onkeypress="return isNumberKey(event)" ClientIDMode="Static" placeholder="Alternative Phone..." runat="server" TabIndex="17"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="register-form text-left">
                                                <asp:UpdatePanel ID="UpdatePanel21" runat="server" UpdateMode="Conditional">
                                                    <contenttemplate>
                                                        <asp:Button ID="btnPersonal" runat="server" OnClick="btnPersonal_Click" OnClientClick="return ValidatePersonalDet();" CssClass="btn-small-purple pt-3 pb-3 w-50" Text="Update Student Profile" />
                                                    </contenttemplate>
                                                    <triggers>
                                                        <asp:PostBackTrigger ControlID="btnPersonal" />
                                                    </triggers>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                    </div>
        </div>
        </div>
                        </div>
                    </div>

                    <asp:HiddenField ID="HdnMonthValue" runat="server" />
                    <asp:HiddenField ID="HdnMonthEnd" runat="server" />
                </div>

  



            </div>
            <link media="screen" rel="stylesheet" type="text/css" href="css/toastr.css" />
            <script type="text/javascript" src="js/toastr.js"></script>
        </div>
    </section>
    <script>
        function popupnote() {

            if ($('#divfileview').css('display') == 'none') {
                document.getElementById("divfileview").style.display = "block";
                $('html, body').animate({
                    scrollTop: $('#divfileview').offset().top
                }, 'slow');

            }
            else {
                document.getElementById("divfileview").style.display = "none";
            }
        }

    </script>

    <script>   
        function changedivpaid(value) {

            var element = document.getElementById("MainContent_RptPaidcourse_pddet_" + value + "");
            var className = $(element).attr('class');
            if (className.includes('show')) {
                element.setAttribute("class", "collapse mb-3");
            }
            else {
                element.setAttribute("class", "collapse show mb-3");
            }
        }
    </script>
    <script>   
        function changedivpending(value) {
            var element = document.getElementById("MainContent_RptPendingcourse_pydet_" + value + "");
            var className = $(element).attr('class');
            if (className.includes('show')) {
                element.setAttribute("class", "collapse mb-3");
            }
            else {
                element.setAttribute("class", "collapse show mb-3");
            }
        }
    </script>
    <script>

        function OpenPersonaldetails() {
            $("#divProfile").css("display", "block");
        }
        function Opencontactdetails() {
            $("#divContact").css("display", "block");
        }
        function OpenEdudetails() {
            debugger;
            $("#diveducation").css("display", "block");
            $("#diveducation").focus();
            $('html, body').animate({
                scrollTop: $('#diveducation').offset().top
            }, 'slow');
        }
        function Openwork() {
            $("#divwork").css("display", "block");
            $('html, body').animate({
                scrollTop: $('#divwork').offset().top
            }, 'slow');
            HideEndDate();
        }
        function OpenDocs() {
            $("#divDocs").css("display", "block");
            $('html, body').animate({
                scrollTop: $('#divDocs').offset().top
            }, 'slow');
        }
        function Closeprofile() {
            debugger;
            $("#divProfile").fadeOut();
            $("#MainContent_dvprof").css("display", "block");
        }
        function Closeexpire() {
            $("#divProfile").fadeOut();
            $("#divContact").fadeOut();
            $("#diveducation").fadeOut();
            $("#divwork").fadeOut();
            $("#divDocs").fadeOut();
            (0 == $(this).parents(".nomodal").length && 1 == $(this).attr("class").split(/\s+/).length || $(this).hasClass("ok")) && HideModal($(this).parents(".popup")[0].id)
        }

        //function charOnly(evt, textboxid, str) {
        //    var charCode = (evt.which) ? evt.which : window.event.keyCode;

        //    if (charCode <= 13) {
        //        return true;
        //    }
        //    else {
        //        var keyChar = String.fromCharCode(charCode);
        //        var re = /^[a-zA-Z,./#0-9]+$/
        //        return re.test(keyChar);
        //    }
        //    capitalize(textboxid, str)
        //}


        function capitalize(textboxid, str) {
            // string with alteast one character
            if (str && str.length >= 1) {
                var firstChar = str.charAt(0);
                var remainingStr = str.slice(1);
                str = firstChar.toUpperCase() + remainingStr;
            }
            document.getElementById(textboxid).value = str;
        }

        //To accept the number only in text box
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode != 43 && charCode > 31 && (charCode < 48 || charCode > 57))
                return false;

            return true;

        }

        function AddresscharOnly(evt, textboxid, str) {
            var charCode = (evt.which) ? evt.which : event.keyCode

            if (((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)) || (charCode == 32
                || charCode == 46 || charCode == 44 || charCode == 47 || charCode == 92 || charCode == 95 || charCode == 35 || charCode == 39)) {
                capitalize(textboxid, str);
                return true;
            }
            else {

                if (charCode != 43 && charCode > 31 && (charCode < 48 || charCode > 57)) {
                    return false;
                }
                else {
                    return true;
                }
            }

        }

        function onlyAlphabets(evt, textboxid, str) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || charCode == 32) {
                capitalize(textboxid, str);
                return true;
            }
            else {

                return false;
            }

        }

        function HideEndDate() {
            if (document.getElementById('chkCurrentcompany').checked) {
                document.getElementById("DivEndDate").style.display = "none";
            }
            else {
                document.getElementById("DivEndDate").style.display = "block";
            }

        }

        function showpop5(msg, title) {
            toastr.options = {
                "closeButton": true,
                "debug": false,
                "newestOnTop": false,
                "progressBar": true,
                "positionClass": "toast-top-right",
                "preventDuplicates": true,
                "onclick": null,
                "showDuration": "300",
                "hideDuration": "1000",
                "timeOut": "2000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            }
            toastr.success(msg, title);
            return false;
        }

        function viewCertificate() {
            document.getElementById("dvEdudtl").style.display = "none";
            document.getElementById("dvmarklist").style.display = "none";
            document.getElementById("dvcertificate").style.display = "block";
            return false;
        }
        function viewMarkList() {
            document.getElementById("dvEdudtl").style.display = "none";
            document.getElementById("dvmarklist").style.display = "block";
            document.getElementById("dvcertificate").style.display = "none";
            return false;
        }

        function Gotoback() {
            document.getElementById("dvEdudtl").style.display = "block";
            document.getElementById("dvmarklist").style.display = "none";
            document.getElementById("dvcertificate").style.display = "none";
            return false;
        }
        function Gotowork() {
            document.getElementById("dvwork").style.display = "block";
            document.getElementById("dvworkcertificate").style.display = "none";
            return false;
        }
        function viewworkexperience() {
            document.getElementById("dvwork").style.display = "none";
            document.getElementById("dvworkcertificate").style.display = "block";
            return false;
        }
        function ValidatePersonalDet() {
            var valpersonal = 0;
            if (document.getElementById("txtDOB").value.trim().length < 1) {
                document.getElementById("txtDOB").className += " invalid";
                valpersonal = 1;
            }
            else {
                document.getElementById("txtDOB").className = "";
            }
            if (document.getElementById("txtaddress").value.trim().length < 1) {
                document.getElementById("txtaddress").className += " invalid";
                valpersonal = 1;
            }
            else {
                document.getElementById("txtaddress").className = "";
            }
            if (document.getElementById("txtmobile").value.trim().length < 1) {
                document.getElementById("txtmobile").className += " invalid";
                valpersonal = 1;
            }
            else {
                document.getElementById("txtmobile").className = "";
            }
            if (document.getElementById("txtcity").value.trim().length < 1) {
                document.getElementById("txtcity").className += " invalid";
                valpersonal = 1;
            }
            else {
                document.getElementById("txtcity").className = "";
            }
            if (document.getElementById("ddlGender").value == "Select") {
                document.getElementById("ddlGender").className = "form-control invalid";
                valpersonal = 1;
            }
            else {
                document.getElementById("ddlGender").className = "form-control";
            }
            if (document.getElementById("ddlMStatus").value == "Select") {
                document.getElementById("ddlMStatus").className = "form-control invalid";
                valpersonal = 1;
            }
            else {
                document.getElementById("ddlMStatus").className = "form-control";
            }
            if (document.getElementById("ddlCountry").value == "Select") {
                document.getElementById("ddlCountry").className = "form-control invalid";
                valpersonal = 1;
            }
            else {
                document.getElementById("ddlCountry").className = "form-control";
            }

            if (valpersonal == 1)
                return false
            else
                return true;
        }
        function ValidateEducation() {
            var valEducation = 0;
            if (document.getElementById("txtQname").value.trim().length < 1) {
                document.getElementById("txtQname").className += " invalid";
                valEducation = 1;
            }
            else {
                document.getElementById("txtQname").className = "";
            }

            if (document.getElementById("txtflgrade").value.trim().length < 1) {
                document.getElementById("txtflgrade").className += " invalid";
                valEducation = 1;
            }
            else {
                document.getElementById("txtflgrade").className = "";
            }

            if (document.getElementById("txtUniversity").value.trim().length < 1) {
                document.getElementById("txtUniversity").className += " invalid";
                valEducation = 1;
            }
            else {
                document.getElementById("txtUniversity").className = "";
            }

            if (document.getElementById("txtYPassing").value.trim().length < 1) {
                document.getElementById("txtYPassing").className += " invalid";
                valEducation = 1;
            }
            else {
                document.getElementById("txtYPassing").className = "";
            }


            if (document.getElementById("dllQlevel").value == "Select") {
                document.getElementById("dllQlevel").className = "form-control invalid";
                valEducation = 1;
            }
            else {
                document.getElementById("dllQlevel").className = "form-control";
            }
            if (document.getElementById("dllEduCountry").value == "Select") {
                document.getElementById("dllEduCountry").className = "form-control invalid";
                valEducation = 1;
            }
            else {
                document.getElementById("dllEduCountry").className = "form-control";
            }

            if (valEducation == 1)
                return false
            else
                return true;
        }

        function ValidateWork() {

            var valWorkdet = 0;
            if (document.getElementById("txtComp").value.trim().length < 1) {
                document.getElementById("txtComp").className += " invalid";
                valWorkdet = 1;
            }
            else {
                document.getElementById("txtComp").className = "";
            }

            if (document.getElementById("txtdesg").value.trim().length < 1) {
                document.getElementById("txtdesg").className += " invalid";
                valWorkdet = 1;
            }
            else {
                document.getElementById("txtdesg").className = "";
            }

            if (document.getElementById("dllIndustry").value == "Select") {
                document.getElementById("dllIndustry").className = "form-control invalid";
                valWorkdet = 1;
            }
            else {
                document.getElementById("dllIndustry").className = "form-control";
            }

            if (document.getElementById("dllMonth").value == "Month") {
                document.getElementById("dllMonth").className = "form-control invalid";
                valWorkdet = 1;
            }
            else {
                document.getElementById("dllMonth").className = "form-control";
            }
            if (!document.getElementById('chkCurrentcompany').checked) {
                if (document.getElementById("dllEndmonth").value == "Month") {
                    document.getElementById("dllEndmonth").className = "form-control invalid";
                    valWorkdet = 1;
                }
                else {
                    document.getElementById("dllEndmonth").className = "form-control";
                }
                if (document.getElementById("dllEndYear").value == "0") {
                    document.getElementById("dllEndYear").className = "form-control invalid";
                    valWorkdet = 1;
                }
                else {
                    document.getElementById("dllEndYear").className = "form-control";
                }
            }
            if (document.getElementById("dllYear").value == "0") {
                document.getElementById("dllYear").className = "form-control invalid";
                valWorkdet = 1;
            }
            else {
                document.getElementById("dllYear").className = "form-control";
            }


            if (document.getElementById("dllGrade").value == "Select") {
                document.getElementById("dllGrade").className = "form-control invalid";
                valWorkdet = 1;
            }
            else {
                document.getElementById("dllGrade").className = "form-control";
            }




            if (document.getElementById("dlWorkcountry").value == "Select") {
                document.getElementById("dlWorkcountry").className = "form-control invalid";
                valWorkdet = 1;
            }
            else {
                document.getElementById("dlWorkcountry").className = "form-control";
            }
            if (valWorkdet == 1)
                return false
            else
                return true;
        }
        function ValidateFileup() {
            var valFileUp = 0;
            if (document.getElementById("FileDocsUpload").value.trim().length < 1) {
                document.getElementById("FileDocsUpload").className += " invalid";
                valFileUp = 1;
            }
            else {
                document.getElementById("FileDocsUpload").className = "";
            }
            if (document.getElementById("ddlFtype").value == "0") {
                document.getElementById("ddlFtype").className = "form-control invalid";
                valFileUp = 1;
            }
            else {
                document.getElementById("ddlFtype").className = "form-control";
            }

            if (valFileUp == 1)
                return false
            else
                return true;
        }
    </script>
</asp:Content>
