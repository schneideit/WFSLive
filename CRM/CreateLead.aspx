<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateLead.aspx.cs" Inherits="CRM.CreateLead" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
		<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <!--font style-->
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@200;300;400;500;600&display=swap" rel="stylesheet">
		
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
    <title></title>
</head>
<body>
    <form id="addlead" runat="server">
        <div>
            	<!-- Modal -->
			<div class="modal right fade" id="add_contact" tabindex="-1" role="dialog" aria-modal="true">
				<div class="modal-dialog" role="document">
					<button type="button" class="close md-close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<div class="modal-content">

						<div class="modal-header">
		                    <h4 class="modal-title text-center">Add Contact</h4>
		                    <button type="button" class="close xs-close" data-dismiss="modal">×</button>
		                  </div>

						<div class="modal-body">
							<div class="row">
						        <div class="col-md-12">
						            <form>
						            	<h4>Name & Occupation</h4>
						            	<div class="form-group row">
				                            <div class="col-md-12"><label class="col-form-label">Name <span class="text-danger">*</span></label></div>
				                            <div class="col-md-4">
				                                <input class="form-control" type="text" placeholder="Prefix" name="prefix">
				                            </div>
				                            <div class="col-md-4">
				                                <input class="form-control" type="text" placeholder="First name" name="prefix-name">
				                            </div>
				                            <div class="col-md-4">
				                                <input class="form-control" type="text" placeholder="Last name" name="last-name">
				                            </div>
				                        </div>
						                <div class="form-group row">
											<div class="col-sm-6">
												<label class="col-form-label">Organization</label>
					                            <select class="form-control">
					                                <option>Select</option>
					                            </select>
											</div>
											<div class="col-sm-6">
												<label class="col-form-label">Title</label>
                            					<input type="text" class="form-control"  name="title" placeholder="Title">
											</div>
										</div>
										<h4>Contact Details</h4>
										<div class="form-group row">
											<div class="col-sm-6">
												<label class="col-form-label">Email</label>
                            					<input type="text" class="form-control"  name="email" placeholder="Email">
											</div>
											<div class="col-sm-6">
												<label class="col-form-label">Email Opted out</label>
					                            <div >
					                            <label class="container-checkbox">
												  	<input type="checkbox">
												  	<span class="checkmark"></span>
												</label>
					                            </div>
											</div>
										</div>
										<div class="form-group row">
											<div class="col-sm-6">
												<label class="col-form-label">Phone</label>
                            					<input type="text" class="form-control" name="phone" placeholder="Phone">
											</div>
											<div class="col-sm-6">
												<label class="col-form-label">Home Phone</label>
                            					<input type="text" class="form-control"  name="h-phone" placeholder="Phone">
											</div>
										</div>
										<div class="form-group row">
											<div class="col-sm-6">
												<label class="col-form-label">Mobile Phone</label>
                            					<input type="text" class="form-control" name="m-phone" placeholder="Phone">
											</div>
											<div class="col-sm-6">
												<label class="col-form-label">Other Phone</label>
                            					<input type="text" class="form-control" id="o-phone" name="o-phone" placeholder="Phone">
											</div>
										</div>
										<div class="form-group row">
											<div class="col-sm-6">
												<label class="col-form-label">Assistant Phone</label>
                            					<input type="text" class="form-control" name="assistant-phone" placeholder="Phone">
											</div>
											<div class="col-sm-6">
												<label class="col-form-label">Assistant Name</label>
                            					<input type="text" class="form-control"  name="assistant-name" placeholder="Assistant Name">
											</div>
										</div>
										<div class="form-group row">
											<div class="col-sm-6">
												<label class="col-form-label">Fax</label>
                            					<input type="text" class="form-control" name="fax" placeholder="Fax">
											</div>
											<div class="col-sm-6">
												<label class="col-form-label">Linkedin</label>
                            					<input type="text" class="form-control"  name="linkedin" placeholder="linkedin">
											</div>
										</div>
										<div class="form-group row">
											<div class="col-sm-6">
												<label class="col-form-label">Facebook</label>
                            					<input type="text" class="form-control"  name="fb" placeholder="Facebook">
											</div>
											<div class="col-sm-6">
												<label class="col-form-label">Twitter</label>
                            					<input type="text" class="form-control"  name="twitter" placeholder="Twitter">
											</div>
										</div>
										<h4>Address Information</h4>
										<div class="form-group row">
											<div class="col-sm-6">
												<label class="col-form-label">Mailing Address</label>
                            					<textarea class="form-control" rows="3" name="mailing-address" placeholder="Address"></textarea>
											</div>
											<div class="col-sm-6 mt-3">
												<label class="col-form-label"></label><br>
                            					<input type="text" class="form-control" placeholder="Mailing City" name="mailing-city">
											</div>
										</div>
										<div class="form-group row">
											<div class="col-sm-6">
												<input type="text" class="form-control" placeholder="Mailing State" name="mailing-state">
											</div>
											<div class="col-sm-6">
												<input type="text" class="form-control" placeholder="Mailing Postal code" name="mailing-postal-code">
											</div>
										</div>
										<div class="form-group row">
											<div class="col-sm-6">
												<label class="col-form-label">Mailing Country</label>
					                            <select class="form-control">
					                                <option>India</option>
					                                <option>US</option>
					                                <option>Japan</option>
					                            </select>
											</div>
											<div class="col-sm-6 mt-3">
												<label class="col-form-label">Other Address</label>
                            					<textarea class="form-control" rows="3" name="other-address" placeholder="Address"></textarea>
											</div>
										</div>
										<div class="form-group row">
											<div class="col-sm-6">
												<input type="text" class="form-control" placeholder="Other City" name="other-city">
											</div>
											<div class="col-sm-6">
												<input type="text" class="form-control" placeholder="Other State" name="other-state">
											</div>
										</div>
										<div class="form-group row">
											<div class="col-sm-6">
												<input type="text" class="form-control"  placeholder="Other Postal code" name="other-postal-code">
											</div>
											<div class="col-sm-6">
												<select class="form-control">
					                                <option>India</option>
					                                <option>US</option>
					                                <option>Japan</option>
					                            </select>
											</div>
										</div>
										<h4>Dates To Remember</h4>
										<div class="form-group row">
											<div class="col-sm-6">
												<label class="col-form-label">Due Date <span class="text-danger">*</span></label>
				                                <div class="cal-icon"><input class="form-control datetimepicker" type="text" placeholder="MM/DD/YY"></div>
											</div>
											<div class="col-sm-6">
												<label class="col-form-label">Date of Birth <span class="text-danger">*</span></label>
				                                <div class="cal-icon"><input class="form-control datetimepicker" type="text" placeholder="MM/DD/YY"></div>
											</div>
										</div>
										
										<h4>Description Information</h4>
										<div class="form-group row">
											<div class="col-sm-12">
												<label class="col-form-label">Description </label>
				                            	<textarea class="form-control" rows="3" id="description" placeholder="Description"></textarea>
											</div>
										</div>
										<h4>Tag Information</h4>
										<div class="form-group row">
											<div class="col-sm-12">
												<label class="col-form-label">Tag List</label>
                            					<input type="text" class="form-control" name="tag-name" placeholder="Tag List">
											</div>
										</div>
										<h4>Permissions</h4>
										<div class="form-group row">
											<div class="col-sm-6">
												<label class="col-form-label">Permission</label>
					                        	<select class="form-control">
					                                <option>Task Visibility</option>
					                                <option>Private Task</option>
					                         	</select>
											</div>
											
										</div>
						                <div class="text-center py-3">
						                	<button type="button" class="border-0 btn btn-primary btn-gradient-primary btn-rounded">Save</button>&nbsp;&nbsp;
						                	<button type="button" class="btn btn-secondary btn-rounded">Cancel</button>
						                </div>
						            </form>
						        </div>
							</div>

						</div>

					</div><!-- modal-content -->
				</div><!-- modal-dialog -->
			</div><!-- modal -->
        </div>
    </form>
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

		
</body>
</html>
