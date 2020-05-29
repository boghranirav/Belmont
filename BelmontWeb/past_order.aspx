<%@ Page Title="" Language="C#" MasterPageFile="~/UserSideMst1.master" AutoEventWireup="true" CodeFile="past_order.aspx.cs" Inherits="past_order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="page-title centred">
        <div class="container">
            <div class="content-box">
                <div class="title">
                    <h2>Past Order</h2>
                </div>
            </div>
        </div>
    </section>

    <section class="contact-section sp-one">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12 contact-column">
                    <div class="contact-form-area">
                        <h3>Past Order &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <a href="new_order.aspx">Place New Order</a></h3>
                        <hr style="height: 2px; border: none; color: #333; background-color: #333;" />
                        <form runat="server" name="contact_form" class="default-form" action="#" method="post">
                            <div class="limiter">
                                <div class="container-table100">
                                    <div class="wrap-table100">
                                        <div class="table100 ver1 m-b-10">
                                            <div class="table100-head">
                                                <table>
                                                    <thead>
                                                        <tr class="row100 head">
                                                            <th class="cell100 column1">Order By</th>
                                                            <th class="cell100 column2">Order Date</th>
                                                            <th class="cell100 column3">Pick Up Date</th>
                                                            <th class="cell100 column4">Quantity</th>
                                                            <th class="cell100 column5">Amount</th>
                                                            <th class="cell100 column6">Complaint</th>
                                                            <th class="cell100 column7">View</th>
                                                            <th class="cell100 column8">Delete</th>
                                                        </tr>
                                                    </thead>
                                                </table>
                                            </div>

                                            <div class="table100-body js-pscroll">
                                                <table>
                                                    <tbody runat="server" id="displayData">
                                                        
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>


                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			var ps = new PerfectScrollbar(this);

			$(window).on('resize', function(){
				ps.update();
			})
		});
			
		
	</script>
</asp:Content>

