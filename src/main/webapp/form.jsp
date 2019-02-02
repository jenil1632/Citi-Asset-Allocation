<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setHeader("Expires", "0");
		session = request.getSession(false);
	if(session == null)
	{
	RequestDispatcher dispatch = request.getRequestDispatcher("index.jsp");
	dispatch.forward(request, response);
	}
	%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Asset Allocation">
	<meta name="author" content="Kalyan">
	<title>Asset Allocation</title>

	<!-- Favicons-->
	<link rel="shortcut icon" href="img/citi-logo-small.ico" type="image/x-icon">
	<link rel="apple-touch-icon" type="image/x-icon" href="img/apple-touch-icon-57x57-precomposed.png">
	<link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="img/apple-touch-icon-72x72-precomposed.png">
	<link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="img/apple-touch-icon-114x114-precomposed.png">
	<link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="img/apple-touch-icon-144x144-precomposed.png">

	<!-- GOOGLE WEB FONT -->
	<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i" rel="stylesheet">

	<!-- BASE CSS -->
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
	<link href="css/menu.css" rel="stylesheet">
	<link href="css/animate.min.css" rel="stylesheet">
	<link href="css/icon_fonts/css/all_icons_min.css" rel="stylesheet">
	<link href="css/skins/square/grey.css" rel="stylesheet">

	<!-- YOUR CUSTOM CSS -->
	<link href="css/custom.css" rel="stylesheet">

	<script src="js/modernizr.js"></script>
	<!-- Modernizr -->

</head>

<body>
	<div id="preloader">
		<div data-loader="circle-side"></div>
	</div><!-- /Preload -->
	
	<div id="loader_form">
		<div data-loader="circle-side-2"></div>
	</div><!-- /loader_form -->

	<header style="padding:7px 7px">
		<div class="container-fluid">
		    <div class="row">
                <div class="col-3">
                   <img src="images/Logo.png" alt="" width="50" height="40">
                </div>
                <div class="col-9">
                    <nav>
                        <ul class="cd-primary-nav fade in" style="padding-top:150px">
                            <li><a href="about.html" class="animated_link">About Us</a></li>
                            <li><a href="Logout" class="animated_link">Logout</a></li>
                        </ul>
                    </nav>
                
            </div>
            </div>
		</div>
		<!-- container -->
	</header>
	<!-- End Header -->

	<main>
		<div id="form_container" style="margin-top:75px">
			<div class="row">
				<div class="col-lg-5">
					<div id="left_form" style="height:100%; background-color:#667f87" >
						<figure><img src="img/avatar-01.png" alt=""></figure>
						<h2>Realise your dreams</h2>
						<a href="#0" id="more_info" data-toggle="modal" data-target="#more-info"><i class="pe-7s-info"></i></a>
					</div>
				</div>
				<div class="col-lg-7">

					<div id="wizard_container">
						<div id="top-wizard">
							<div id="progressbar"></div>
						</div>
						<!-- /top-wizard -->
						<form action="info" name="example-1" id="wrapped" method="POST">
							<input id="website" name="website" type="text" value="">
							<!-- Leave for security protection, read docs for details -->
							<div id="middle-wizard">

									<div class="step">
										<h3 class="main_question">Basic Information</h3>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<input type="text" id="name" name="name" class="form-control" placeholder="Name">
												</div>
											</div>
											</div>
											<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<input type="text" id="age" name="age" class="form-control" placeholder="Age">
												</div>
											</div>
											</div>
										
										<!-- /row -->

										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<input type="text" id="income"  name="income" class="form-control" placeholder="Yearly Income ($)">
												</div>
											</div>
											</div>
											<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<input type="text" id="expenditure" name="expenditure" class="form-control" placeholder="Yearly Expenditure ($)">
												</div>
											</div>
											</div>
											<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<input type="text" id="dependnum" name="dependnum" class="form-control" placeholder="Number of Financial Dependents">
													<input type="text" value="1" id = "important" name = "important" style = "display: none">
												</div><BR>
												</div>
											</div>
											<div class=row style="width:100px">
												<button id="random" class="btn">Randomize data</button>				
											</div>
										</div>
										
										<!-- /row -->
									
									<!-- /step-->

									<div class="step">
										<h3 class="main_question">Investment Portfolio</h3>
										
										<div class="row">
										<div class="col-md-18" style="margin-left: 16px">
											<h4>How long have you been investing (not counting real estate mortgage or deposits)?</h4>
												<div class="col-md-6" style="margin-left: 16px; margin-top:25px">
												<div class="form-group radio_input">
													<label><input type="radio" value="5"  class="icheck" name="invest" id="curport1" required>For more than 3 years</label>
													<label><input type="radio" value="7" class="icheck" name="invest" id="curport2">Less than 3 years</label>
													<label><input type="radio" value="9" class="icheck" name="invest" id="curport3">This is my first investment</label>
												</div>
												</div>
											</div>
										</div>
										
								
										
										<!-- /row -->
										<div id="currentportfolio">
										<strong>Current Portfolio:</strong>
										<div class="row">

											<div class="col-md-3">
												<div class="form-group">
													<input type="text" name="stocks" class="form-control" placeholder="Stocks ($)" id = "stocks">
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group">
													<input type="text" name="bonds" class="form-control" placeholder="Bonds ($)" id="bonds">
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group">
													<input type="text" name="commodities" class="form-control" placeholder="Commodities ($)" id="gold">
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group">
													<input type="text" name="deposits" class="form-control" placeholder="Deposits ($)" id="deposits">
												</div>
											</div>
											</div>
											</div> <BR>
										
									</div>
									<!-- /step-->

									<div class="step">
										<h3 class="main_question">Goal Setting</h3>
										<div id = "goals">
										<strong>Goal 1</strong>
									<div id="goalstart">	
										<div class="row">
											<div class="col-md-12">	For the purpose of:
												<div class="form-group">
													<div class="styled-select">
														<select id="goal_type1" name="goal_type1">
															<option value="0" selected></option>
															<option value="Retirement">Retirement</option>
															<option value="Buying a House">Buying a House</option>
															<option value="Buying a Car">Buying a Car</option>
															<option value="Destination Wedding">Destination Wedding</option>
															<option value="Buying Properties">Buying Properties</option>
															<option value="Education fees">Education fees</option>
															<option value="Travelling abroad">Travelling abroad</option>
															<option value="To start a business">To start a business</option>
															<option value="Other">Other</option>
														</select>
													</div>
												</div>
											</div>
										</div><BR>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													Funds necessary to achieve the goal today<input type="text" name="assets1" id="assets1" class="form-control" placeholder="$">
													</div>
											</div><BR>
										</div><BR>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													In how many years:<input type="text" name="year1" id="year1" class="form-control" placeholder="">
													</div>
											</div>
											</div><BR>
									</div>
									
									</div>
									
									<div class=row style="width:100px">
										<button id="goalbtn" class="btn">Add Goal</button>				
									</div>
									
									</div>
									<!-- /step-->
									
									
									
									<div class="step">
										<h3 class="main_question">Questionnaire					1/4</h3>
										<div class="row">
										<div class="col-md-18" style="margin-left: 16px">
											<h4>My current and future income sources (for example, salary, pension) are</h4>
												<div class="col-md-6" style="margin-left: 16px; margin-top:25px">
												<div class="form-group radio_input">
													<label><input type="radio" value="1"  name="invest1" class="icheck" required>Very unstable</label>
													<label><input type="radio" value="3" name="invest1" class="icheck"> Unstable </label>
													<label><input type="radio" value="5" name="invest1" class="icheck"> Somewhat stable</label>
													<label><input type="radio" value="8" name="invest1" class="icheck">Stable</label><BR>
													<label><input type="radio" value="10" name="invest1" class="icheck">Very stable</label>
												</div>
												</div>
												</div>
											</div>
											
											<div class="row">
										<div class="col-md-18" style="margin-left: 16px">
											<h4>How much money have you set aside (outside of your pension / Central Provident Fund savings) to handle emergencies?</h4>
												<div class="col-md-12" style="margin-left: 16px; margin-top:25px">
												<div class="form-group radio_input">
													<label><input type="radio" value="9"  name="invest2" class="icheck" required>More than six months of living expenses</label>
													<label><input type="radio" value="6" name="invest2" class="icheck">Between one and six months of living expenses</label>
													<label><input type="radio" value="2" name="invest2" class="icheck">Less than one month of living expenses </label><BR>
												</div>
												</div>
												</div>
											</div><BR>
									</div>
									<!-- /step-->
									<div class="step">
										<h3 class="main_question">Questionnaire					2/4</h3>
										<div class="row">
										<div class="col-md-18" style="margin-left: 16px">
											<h4>Over the longer term, what return do you reasonably expect to achieve from your investment portfolio? </h4>
												<div class="col-md-6" style="margin-left: 16px; margin-top:25px">
												<div class="form-group radio_input">
													<label><input type="radio" value="1"  name="invest3" class="icheck" required>More than 11%</label>
													<label><input type="radio" value="4" name="invest3" class="icheck">9-11% per annum</label>
													<label><input type="radio" value="7" name="invest3" class="icheck">6-9% per annum</label>
													<label><input type="radio" value="10" name="invest3" class="icheck">2-6% per annum</label><BR>
												</div>
												</div>
												</div>
											</div>
										
										<div class="row">
										<div class="col-md-18" style="margin-left: 16px">
											<h4>Generally, I prefer investments with little or no fluctuation in value, and I'm willing to accept the lower return associated with these investments</h4>
												<div class="col-md-6" style="margin-left: 16px; margin-top:25px">
												<div class="form-group radio_input">
													<label><input type="radio" value="1"  name="invest4" class="icheck" required>Strongly disagree</label>
													<label><input type="radio" value="3" name="invest4" class="icheck">Disagree</label><BR>
													<label><input type="radio" value="5" name="invest4" class="icheck">Neutral</label><BR>
													<label><input type="radio" value="8" name="invest4" class="icheck">Agree</label><BR>
													<label><input type="radio" value="10" name="invest4" class="icheck">Strongly agree</label>
												</div>
												</div>
												</div>
											</div>
									</div>
									<!-- /step-->
									<div class="step">
										<h3 class="main_question">Questionnaire				3/4</h3>

											<div class="row">
										<div class="col-md-18" style="margin-left: 16px">
											<h4>I would invest in equities based solely on a brief conversation with a friend, coworker or relative: </h4>
												<div class="col-md-12" style="margin-left: 16px; margin-top:25px">
												<div class="form-group radio_input">
													<label><input type="radio" value="9"  name="invest5" class="icheck" required>Strongly disagree</label><BR>
													<label><input type="radio" value="7" name="invest5" class="icheck">Disagree</label><BR>
													<label><input type="radio" value="5" name="invest5" class="icheck">Somewhat agree</label><BR>
													<label><input type="radio" value="3" name="invest5" class="icheck">Agree</label><BR>
													<label><input type="radio" value="1" name="invest5" class="icheck">Strongly agree</label><BR>
												</div>
												</div>
												</div>
											</div>
											<div class="row">
										<div class="col-md-18" style="margin-left: 16px">
											<h4>During market declines, I am most likely to :</h4>
												<div class="col-md-12" style="margin-left: 16px; margin-top:25px">
												<div class="form-group radio_input">
													<label><input type="radio" value="10"  name="invest6" class="icheck" required>Sell all of the investments</label><BR>
													<label><input type="radio" value="7" name="invest6" class="icheck">Sell a portion of my portfolio to cut my losses</label><BR>
													<label><input type="radio" value="4" name="invest6" class="icheck">Hold the investment and sell nothing</label><BR>
													<label><input type="radio" value="1" name="invest6" class="icheck">Invest more funds to lower my average investment price</label><BR>
												</div>
												</div>
												</div>
											</div><BR>
											
											
									</div>
									
									<!-- /step-->
									<div class="submit step">
									<h3 class="main_question">Questionnaire				4/4</h3>
									<div class="row">
										<div class="col-md-18" style="margin-left: 16px">
											<h4>The chart below shows the greatest 1-year loss and the highest 1-year gain on 3 different hypothetical investments of $10,000. Given the potential gain or loss in any 1 year, I would invest my money in</h4>
												<div class="col-md-12" style="margin-left: 16px; margin-top:25px">
												<div class="form-group radio_input">
													<label><input type="radio" value="10"  name="invest7" class="icheck" required>loss of $164, gain of $593</label><BR>
													<label><input type="radio" value="5" name="invest7" class="icheck">loss of $1,020, gain of $1,921</label><BR>
													<label><input type="radio" value="1" name="invest7" class="icheck">loss of $3,639, gain of $4,229</label><BR>
												</div>
												</div>
												</div>
											</div><BR>
											
											<figure><img src="img/img-01.gif"><figure><BR>
									
								</div>	
								<!-- /step-->
							</div>
							<!-- /middle-wizard -->
							<div id="bottom-wizard" style="width:300px">
								<button type="button" name="backward" class="backward">Backward </button>
								<button type="button" name="forward" class="forward">Forward</button>
								<button type="submit" name="process" class="submit">Submit</button>
							</div>
							<!-- /bottom-wizard -->
						</form>
					</div>
					<!-- /Wizard container -->
				</div>
			</div><!-- /Row -->
		</div><!-- /Form_container -->
	</main>
	
	
	<div class="cd-overlay-nav">
		<span></span>
	</div>
	<!-- cd-overlay-nav -->

	<div class="cd-overlay-content">
		<span></span>
	</div>
	<!-- cd-overlay-content -->

	<a href="#0" class="cd-nav-trigger">Menu<span class="cd-icon"></span></a>

	<!-- Modal terms -->
	<div class="modal fade" id="terms-txt" tabindex="-1" role="dialog" aria-labelledby="termsLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="termsLabel">Terms and conditions</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<p>Lorem ipsum dolor sit amet, in porro albucius qui, in <strong>nec quod novum accumsan</strong>, mei ludus tamquam dolores id. No sit debitis meliore postulant, per ex prompta alterum sanctus, pro ne quod dicunt sensibus.</p>
					<p>Lorem ipsum dolor sit amet, in porro albucius qui, in nec quod novum accumsan, mei ludus tamquam dolores id. No sit debitis meliore postulant, per ex prompta alterum sanctus, pro ne quod dicunt sensibus. Lorem ipsum dolor sit amet, <strong>in porro albucius qui</strong>, in nec quod novum accumsan, mei ludus tamquam dolores id. No sit debitis meliore postulant, per ex prompta alterum sanctus, pro ne quod dicunt sensibus.</p>
					<p>Lorem ipsum dolor sit amet, in porro albucius qui, in nec quod novum accumsan, mei ludus tamquam dolores id. No sit debitis meliore postulant, per ex prompta alterum sanctus, pro ne quod dicunt sensibus.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn_1" data-dismiss="modal">Close</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- Modal info -->
	<div class="modal fade" id="more-info" tabindex="-1" role="dialog" aria-labelledby="more-infoLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="more-infoLabel">Disclaimer</h4></div>
				<div class="modal-body">
					<p>All market data contained within the Asset Allocation website should be considered as a reference only and should not be used as validation against, nor as a complement to, the Asset Allocation real time feed via Market Data Platform (MDP).</p>
					<p>Asset Allocation Team is not responsible for technical, hardware or software failures of any kind; lost or unavailable network connections; incomplete, garbled or delayed computer transmissions. Under no circumstances will Asset Allocation Team or its suppliers be liable for any damages or injury that results from the use of the materials on this site. Some jurisdictions prohibit the exclusion or limitation of liability for consequential or incidental damages, in which case the above limitation may not apply to you.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn_1" data-dismiss="modal">Close</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- SCRIPTS -->
	<!-- Jquery-->
	<script src="js/jquery-3.2.1.min.js"></script>
	
	<!-- Common script -->
	<script src="js/common_scripts_min.js"></script>
	<!-- Wizard script -->
	<script src="js/registration_wizard_func.js"></script>
	<!-- Menu script -->
	<script src="js/velocity.min.js"></script>
	<script src="js/main1.js"></script>
	<!-- Theme script -->
	<script src="js/functions.js"></script>
	
	<!-- Randomize Script -->
	<script src="js/randomize.js"></script>
	<script>
	$("#curport1").on('ifChecked', ()=>{
	    // Do something interesting here
	    $("#currentportfolio").show();
	});
	$("#curport2").on('ifChecked', ()=>{
	    // Do something interesting here
	    $("#currentportfolio").show();
	});
	$("#curport3").on('ifChecked', ()=>{
	    // Do something interesting here
	    $("#currentportfolio").hide();
	});
	
	
 	//var f=$('#goalstart');
 	
	var goalnum=2;
	$("#goalbtn").on('click', (e)=>{
		e.preventDefault();
		if(goalnum<5){
			$('#important').val(goalnum);
			$("#goals").append("<strong>Goal "+goalnum + "</strong>");

			var gs='<div id="goalstart"><div class="row"><div class="col-md-12">For the purpose of:<div class="form-group"><div class="styled-select"><select id="goal_type'+goalnum+'" name="goal_type'+goalnum+'"><option value="0" selected></option><option value="Retirement">Retirement</option><option value="Buying a House">Buying a House</option><option value="Buying a Car">Buying a Car</option><option value="Destination Wedding">Destination Wedding</option><option value="Buying Properties">Buying Properties</option><option value="Education fees">Education fees</option><option value="Travelling abroad">Travelling abroad</option><option value="To start a business">To start a business</option><option value="Other">Other</option></select></div></div></div></div><BR><div class="row"><div class="col-md-12"><div class="form-group">Funds necessary to achieve the goal today<input type="text" name="assets'+goalnum+'" id="assets'+goalnum+'" class="form-control" placeholder="$"></div></div><BR></div><BR><div class="row"><div class="col-md-12"><div class="form-group">In how many years:<input type="text" name="year'+goalnum+'" id="year'+goalnum+'" class="form-control" placeholder=""></div></div></div><BR></div>';
			
			$("#goals").append(gs);
			goalnum++;
			
		}
		else{
			alert('Goal limit exceeded');
		}
		
	});

	
	</script>
</body>

</html>
