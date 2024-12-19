<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	<xsl:output method="html" indent="yes"/>
	<xsl:param name="templateHome" select="templateHome"></xsl:param>

	<!--TEMPLATE PRINCPAL-->

	<xsl:template match="sitioWeb">
		<head>
			<meta charset="utf-8"></meta>
			<title>CarServ - Car Repair HTML Template</title>
			<meta content="width=device-width, initial-scale=1.0" name="viewport"></meta>
			<meta content="" name="keywords"></meta>
			<meta content="" name="description"></meta>

			<!-- Favicon -->
			<link href="img/favicon.ico" rel="icon"></link>
			<!-- Google Web Fonts -->
			<link rel="preconnect" href="https://fonts.googleapis.com"></link>
			<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin=""></link>
			<link href="https://fonts.googleapis.com/css2?family=Barlow:wght@600;700=Ubuntu:wght@400;500=swap" rel="stylesheet"></link>
			<!-- Icon Font Stylesheet -->
			<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet"></link>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet"></link>
			<!-- Libraries Stylesheet -->
			<link href="lib/animate/animate.min.css" rel="stylesheet"></link>
			<link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet"></link>
			<link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

			<!-- Customized Bootstrap Stylesheet -->
			<link href="css/bootstrap.min.css" rel="stylesheet"></link>

			<!-- Template Stylesheet -->

			<link href="css/style.css" rel="stylesheet"></link>
			<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
			<script src="js/MiScript.js" type="text/javascript"></script>
			<script type="module" src="js/googleMaps.js"></script>
		</head>
		<body>
			<!-- Spinner Start -->
			<div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
				<div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
					<span class="sr-only">Loading...</span>
				</div>
			</div>
			<!-- Spinner End -->

			<!-- Topbar Start -->
			<div class="container-fluid bg-light p-0">
				<div class="row gx-0 d-none d-lg-flex">
					<div class="col-lg-7 px-5 text-start">
						<div class="h-100 d-inline-flex align-items-center py-3 me-4">
							<small class="fa fa-map-marker-alt text-primary me-2"></small>
							<small>123 Street, New York, USA</small>
						</div>
						<div class="h-100 d-inline-flex align-items-center py-3">
							<small class="far fa-clock text-primary me-2"></small>
							<small>Mon - Fri : 09.00 AM - 09.00 PM</small>
						</div>
					</div>
					<div class="col-lg-5 px-5 text-end">
						<div class="h-100 d-inline-flex align-items-center py-3 me-4">
							<small class="fa fa-phone-alt text-primary me-2"></small>
							<small>+012 345 6789</small>
						</div>
					</div>
				</div>
			</div>
			<!-- Topbar End -->

			<!-- Navbar Start -->
			<nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">
				<a href="index.html" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
					<h2 class="m-0 text-primary">
						<i class="fa fa-car me-3"></i>CarService
					</h2>
				</a>
				<button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarCollapse">
					<div class="navbar-nav ms-auto p-4 p-lg-0">
						<xsl:for-each select="Nav/NavLink">
							<xsl:choose>
								<xsl:when test="$templateHome = @Id">
									<a class="nav-item nav-link active" href="{@Url}">
										<xsl:value-of select="@Texto"/>
									</a>
								</xsl:when>

								<xsl:otherwise>
									<a class="nav-item nav-link" href="{@Url}">
										<xsl:value-of select="@Texto"/>
									</a>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</div>
				</div>
			</nav>
			<!-- Navbar End -->

			<xsl:choose>
				<xsl:when test="$templateHome= 0">
					<xsl:call-template name="Home"></xsl:call-template>
				</xsl:when>
				<xsl:when test="$templateHome= 1">
					<xsl:call-template name="About"></xsl:call-template>
				</xsl:when>
				<xsl:when test="$templateHome= 2">
					<xsl:call-template name="Services"></xsl:call-template>
				</xsl:when>
				<xsl:when test="$templateHome= 3">
					<xsl:call-template name="Booking"></xsl:call-template>
				</xsl:when>
				<xsl:when test="$templateHome= 4">
					<xsl:call-template name="Technicians"></xsl:call-template>
				</xsl:when>
				<xsl:when test="$templateHome= 5">
					<xsl:call-template name="Testimonial"></xsl:call-template>
				</xsl:when>
				<xsl:when test="$templateHome= 6">
					<xsl:call-template name="Contact"></xsl:call-template>
				</xsl:when>
				<xsl:when test="$templateHome= 7">
					<xsl:call-template name="Game"></xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="Home"></xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>



			<!-- Footer Start -->
			<div class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
				<!--FOR EACH PARA OBTENER DIRECCION, TELEFONO, ETC EN EL FOOTER-->
				<xsl:for-each select="InfGeneral">
					<div class="container py-5">
						<div class="row g-5">
							<div class="col-lg-3 col-md-6">
								<h4 class="text-light mb-4">Address</h4>
								<p class="mb-2">
									<i class="fa fa-map-marker-alt me-3"></i>
									<xsl:value-of select="Address"/>
								</p>
								<p class="mb-2">
									<i class="fa fa-phone-alt me-3"></i>
									<xsl:value-of select="Tel"/>
								</p>
								<p class="mb-2">
									<i class="fa fa-envelope me-3"></i>
									<xsl:value-of select="Email"/>
								</p>

							</div>
							<div class="col-lg-3 col-md-6">
								<h4 class="text-light mb-4">Opening Hours</h4>
								<!--FOR EACH PARA OBTENER HORARIOS-->
								<xsl:for-each select="TimeTable/Time">
									<p class="mb-4">
										<xsl:value-of select="."/>
									</p>

								</xsl:for-each>
								<!--FIN FOR-EACH HORARIOS-->

							</div>
							<div class="col-lg-3 col-md-6">
								<h4 class="text-light mb-4">Services</h4>
								<a class="btn btn-link" href="">Diagnostic Test</a>
								<a class="btn btn-link" href="">Engine Servicing</a>
								<a class="btn btn-link" href="">Tires Replacement</a>
								<a class="btn btn-link" href="">Oil Changing</a>
								<a class="btn btn-link" href="">Vacuam Cleaning</a>
							</div>

						</div>
					</div>
				</xsl:for-each>
				<!--FIN FOR-EACH-->

			</div>
			<!-- Footer End -->

			<!-- Back to Top -->
			<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top">
				<i class="bi bi-arrow-up"></i>
			</a>


			<!-- JavaScript Libraries -->
			<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
			<script src="lib/wow/wow.min.js"></script>
			<script src="lib/easing/easing.min.js"></script>
			<script src="lib/waypoints/waypoints.min.js"></script>
			<script src="lib/counterup/counterup.min.js"></script>
			<script src="lib/owlcarousel/owl.carousel.min.js"></script>
			<script src="lib/tempusdominus/js/moment.min.js"></script>
			<script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
			<script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

			<!-- Template Javascript -->
			<script src="js/main.js"></script>
			<script src="js/MiScript.js" type="text/javascript"></script>
			<script type="module" src="js/googleMaps.js"></script>
			<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
			<script type="text/javascript" src="js/dragandrop.js"></script>
		</body>

	</xsl:template>

	<!--TEMPLATE ADICIONALES-->

	<xsl:template name ="Home">

		<!-- Carousel Start -->
		<div class="container-fluid p-0 mb-5">
			<div id="header-carousel" class="carousel slide" data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="w-100" src="img/background1.jpg" alt="Image"></img>
						<div class="carousel-caption d-flex align-items-center">
							<div class="container">
								<div class="row align-items-center justify-content-center justify-content-lg-start">
									<div class="col-10 col-lg-7 text-center text-lg-start">
										<h6 class="text-white text-uppercase mb-3 animated slideInDown">// Car Servicing //</h6>
										<h1 class="display-3 text-white mb-4 pb-3 animated slideInDown">Qualified Car Repair Service Center</h1>

									</div>
									<div class="col-lg-5 d-none d-lg-flex animated zoomIn">
										<img class="img-fluid" src="img/skyline.png" alt=""></img>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="carousel-item">
						<img class="w-100" src="img/background3.jpg" alt="Image"></img>
						<div class="carousel-caption d-flex align-items-center">
							<div class="container">
								<div class="row align-items-center justify-content-center justify-content-lg-start">
									<div class="col-10 col-lg-7 text-center text-lg-start">
										<h6 class="text-white text-uppercase mb-3 animated slideInDown">// Car Servicing //</h6>
										<h1 class="display-3 text-white mb-4 pb-3 animated slideInDown">Qualified Car Wash Service Center</h1>

									</div>
									<div class="col-lg-5 d-none d-lg-flex animated zoomIn">
										<img class="img-fluid" src="img/gtr.png" alt=""></img>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#header-carousel"
					data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#header-carousel"
					data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
		<!-- Carousel End -->

		<!-- Service Start -->
		<div class="container-xxl py-5">
			<div class="container">
				<video width="100%" loop="true"  autoplay="" muted="">
					<source src="videos/video_taller.mp4" type="video/mp4"></source>
				</video>
				<audio controls="true" style="width:100%" autoplay="" preload="auto" id="audio_mp">
					<source src="audio/audio_car.mp3" type="audio/mp3"></source>
				</audio>
			</div>
		</div>

		<!-- About Start -->
		<div class="container-xxl py-5">
			<div class="container">
				<!--COMIENZA OBTENER DATOS PARA EL ABOUT (IMG, DESCRIPCION, VALORES)-->
				<!--<xsl:for-each select="AboutUs">-->
				<div class="row g-5">
					<div class="col-lg-6 pt-4" style="min-height: 400px;">
						<div class="position-relative h-100 wow fadeIn" data-wow-delay="0.1s">
							<img class="position-absolute img-fluid w-100 h-100" src="img/about.jpg" style="object-fit: cover;" alt=""></img>
							<div class="position-absolute top-0 end-0 mt-n4 me-n4 py-4 px-5" style="background: rgba(0, 0, 0, .08);">
								<h1 class="display-4 text-white mb-0">
									15 <span class="fs-4">Years</span>
								</h1>
								<h4 class="text-white">Experience</h4>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<h6 class="text-primary text-uppercase">// About Us //</h6>
						<h1 class="mb-4">
							<span class="text-primary">CarServ</span> Is The Best Place For Your Auto Care
						</h1>
						<p class="mb-4">
							<!--SE INSERTA DESCRIPCION DEL XML-->
							<xsl:value-of select="AboutUs/Description"/>
						</p>
						<div class="row g-4 mb-3 pb-3">
							<xsl:for-each select="Values/Value">

								<div class="col-12 wow fadeIn" data-wow-delay="0.1s">
									<div class="d-flex">
										<div class="bg-light d-flex flex-shrink-0 align-items-center justify-content-center mt-1" style="width: 45px; height: 45px;
																  border-radius:50%;">
											<span class="fw-bold text-secondary">-</span>
										</div>
										<div class="ps-3">
											<h6>
												<!--SE INSERTAN LOS VALORES-->
												<xsl:value-of select="@Nombre"/>
											</h6>
											<span>
												<!--SE INSERTA LA DESCRIPCION DE VALORES-->
												<xsl:value-of select="Description"/>
											</span>
										</div>
									</div>
								</div>
							</xsl:for-each>
						</div>

					</div>
				</div>
				<!--FIN DATOS ABOUT-->
			</div>
		</div>
		<!-- About End -->

		<!-- Fact Start -->
		<div class="container-fluid fact bg-dark my-5 py-5">
			<div class="container">
				<!--SELECCIONA DATOS DE FACTS-->
				<xsl:for-each select="Facts">
					<div class="row g-4">
						<div class="col-md-6 col-lg-3 text-center wow fadeIn" data-wow-delay="0.1s">
							<i class="fa fa-check fa-2x text-white mb-3"></i>
							<h2 class="text-white mb-2" data-toggle="counter-up">
								<!--INSERTAR DATOS DE FACT-->
								<xsl:value-of select="NYears"/>
								<!--FIN INSERTAR DATOS FACT-->
							</h2>
							<p class="text-white mb-0">Years Experience</p>
						</div>
						<div class="col-md-6 col-lg-3 text-center wow fadeIn" data-wow-delay="0.3s">
							<i class="fa fa-users-cog fa-2x text-white mb-3"></i>
							<h2 class="text-white mb-2" data-toggle="counter-up">
								<!--INSERTAR DATOS DE FACT-->
								<xsl:value-of select="NExperts"/>
								<!--FIN INSERTAR DATOS FACT-->
							</h2>
							<p class="text-white mb-0">Expert Technicians</p>
						</div>
						<div class="col-md-6 col-lg-3 text-center wow fadeIn" data-wow-delay="0.5s">
							<i class="fa fa-users fa-2x text-white mb-3"></i>
							<h2 class="text-white mb-2" data-toggle="counter-up">
								<!--INSERTAR DATOS DE FACT-->
								<xsl:value-of select="NClients"/>
								<!--FIN INSERTAR DATOS FACT-->
							</h2>
							<p class="text-white mb-0">Satisfied Clients</p>
						</div>
						<div class="col-md-6 col-lg-3 text-center wow fadeIn" data-wow-delay="0.7s">
							<i class="fa fa-car fa-2x text-white mb-3"></i>
							<h2 class="text-white mb-2" data-toggle="counter-up">

								<!--INSERTAR DATOS DE FACT-->
								<xsl:value-of select="NProjects"/>
								<!--FIN INSERTAR DATOS FACT-->
							</h2>
							<p class="text-white mb-0">Compleate Projects</p>
						</div>
					</div>
				</xsl:for-each>
				<!--FIN SELECCION DATOS FACTS-->
			</div>
		</div>
		<!-- Fact End -->

		<!-- Service Start -->
		<div class="container-xxl service py-5">
			<div class="container">
				<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
					<h6 class="text-primary text-uppercase">// Our Services //</h6>
					<h1 class="mb-5">Explore Our Services</h1>
				</div>
				<div class="row g-4 wow fadeInUp" data-wow-delay="0.3s">
					<div class="col-lg-4">
						<div class="nav w-100 nav-pills me-4">
							<xsl:for-each select="Servicios/Servicio">
								<!--INICIA LISTADO DE SERVICIOS-->
								<xsl:choose>
									<xsl:when test="@Orden = 1">
										<button class="nav-link w-100 d-flex align-items-center text-start p-4 mb-4 active" data-bs-toggle="pill" data-bs-target="#tab-pane-{@Orden}" type="button">
											<i class="fa fa-car-side fa-2x me-3"></i>
											<h4 class="m-0">
												<xsl:value-of select="@Nombre"/>
											</h4>
										</button>
										<!--FIN LISTADO SERVICIOS-->
									</xsl:when>
									<xsl:otherwise>
										<button class="nav-link w-100 d-flex align-items-center text-start p-4 mb-4 " data-bs-toggle="pill" data-bs-target="#tab-pane-{@Orden}" type="button">
											<i class="fa fa-car-side fa-2x me-3"></i>
											<h4 class="m-0">
												<xsl:value-of select="@Nombre"/>
											</h4>
										</button>
										<!--FIN LISTADO SERVICIOS-->

									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</div>
					</div>

					<div class="col-lg-8">
						<div class="tab-content w-100">
							<!--INICIA LISTADO DE SERVICIOS-->
							<xsl:for-each select="Servicios/Servicio">
								<xsl:choose>
									<xsl:when test="@Orden = 1">

										<div class="tab-pane fade show active" id="tab-pane-{@Orden}">
											<div class="row g-4">
												<div class="col-md-6" style="min-height: 350px;">
													<div class="position-relative h-100">
														<img class="position-absolute img-fluid w-100 h-100" src="{Imagen}"
															style="object-fit: cover;" alt=""></img>
													</div>
												</div>
												<div class="col-md-6">
													<h3 class="mb-3">
														<xsl:value-of select="@Nombre"/>
													</h3>
													<p class="mb-4">
														<xsl:value-of select="Descripcion"/>
													</p>
													<p>
														<i class="fa fa-check text-success me-3"></i>Quality Servicing
													</p>
													<p>
														<i class="fa fa-check text-success me-3"></i>Expert Workers
													</p>
													<p>
														<i class="fa fa-check text-success me-3"></i>Modern Equipment
													</p>
													<a  class="btn btn-primary py-3 px-5 mt-3">

														<p>
															Cost: <xsl:value-of select="Costo"/>
														</p>


													</a>
												</div>
											</div>
										</div>

									</xsl:when>
									<xsl:otherwise>

										<div class="tab-pane fade" id="tab-pane-{@Orden}">
											<div class="row g-4">
												<div class="col-md-6" style="min-height: 350px;">
													<div class="position-relative h-100">

														<img class="position-absolute img-fluid w-100 h-100" src="{Imagen}"
															style="object-fit: cover;" alt=""></img>
													</div>
												</div>
												<div class="col-md-6">
													<h3 class="mb-3">
														<xsl:value-of select="@Nombre"/>
													</h3>
													<p class="mb-4">

														<xsl:value-of select="Descripcion"/>

													</p>
													<p>
														<i class="fa fa-check text-success me-3"></i>Quality Servicing
													</p>
													<p>
														<i class="fa fa-check text-success me-3"></i>Expert Workers
													</p>
													<p>
														<i class="fa fa-check text-success me-3"></i>Modern Equipment
													</p>
													<a  class="btn btn-primary py-3 px-5 mt-3">
														<p>
															Cost: <xsl:value-of select="Costo"/>
														</p>

													</a>
												</div>
											</div>
										</div>

									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</div>
					</div>
				</div>

			</div>
		</div>
		<!-- Service End -->

		<!-- Booking Start -->
		<div class="container-fluid bg-secondary booking my-5 wow fadeInUp" data-wow-delay="0.1s">
			<div class="container">
				<div class="row gx-5">
					<div class="col-lg-6 py-5">
						<div class="py-5">
							<h1 class="text-white mb-4">Certified and Award Winning Car Repair Service Provider</h1>
							<p class="text-white mb-0">Eirmod sed tempor lorem ut dolores. Aliquyam sit sadipscing kasd ipsum. Dolor ea et dolore et at sea ea at dolor, justo ipsum duo rebum sea invidunt voluptua. Eos vero eos vero ea et dolore eirmod et. Dolores diam duo invidunt lorem. Elitr ut dolores magna sit. Sea dolore sanctus sed et. Takimata takimata sanctus sed.</p>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="bg-primary h-100 d-flex flex-column justify-content-center text-center p-5 wow zoomIn" data-wow-delay="0.6s">
							<h1 class="text-white mb-4">Book For A Service</h1>
							<form>
								<div class="row g-3">
									<div class="col-12 col-sm-6">
										<input id="NameForm" type="text" class="form-control border-0" placeholder="Your Name" style="height: 55px;"></input>
									</div>
									<div class="col-12 col-sm-6">
										<input id="EmailForm" type="email" class="form-control border-0" placeholder="Your Email" style="height: 55px;"></input>
									</div>
									<div class="col-12 col-sm-6">
										<select id="SelectForm" class="form-select border-0" style="height: 55px;">
											<option selected="">Select A Service</option>
											<option value="1">Service 1</option>
											<option value="2">Service 2</option>
											<option value="3">Service 3</option>
										</select>
									</div>
									<div class="col-12 col-sm-6">
										<div class="date" id="date1" data-target-input="nearest">
											<input id="DateForm" type="text"
												class="form-control border-0 datetimepicker-input"
												placeholder="Service Date" data-target="#date1" data-toggle="datetimepicker" style="height: 55px;"></input>
										</div>
									</div>
									<div class="col-12">
										<textarea id="TextForm" class="form-control border-0" placeholder="Special Request"></textarea>
									</div>
									<div class="col-12">
										<button id="BtnForm" type="button" class="btn btn-secondary w-100 py-3" onclick="validacionSweet();">Book Now</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Booking End -->

		<!-- Team Start -->
		<div class="container-xxl py-5">
			<div class="container">
				<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
					<h6 class="text-primary text-uppercase">// Our Technicians //</h6>
					<h1 class="mb-5">Our Expert Technicians</h1>
				</div>
				<div class="row g-4">
					<xsl:for-each select="Mecanicos/Nombre">
						<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
							<div class="team-item">
								<div class="position-relative overflow-hidden">
									<img class="img-fluid" src="{Imagen}" alt="" />
								</div>
								<div class="bg-light text-center p-4">
									<!-- Nombre del mecánico -->
									<h5 class="fw-bold mb-0">
										<xsl:value-of select="@Nombre" />
									</h5>
									<!-- Cargo del mecánico -->
									<small>
										<xsl:value-of select="Cargo" />
									</small>
								</div>
							</div>
						</div>
					</xsl:for-each>
				</div>
			</div>
		</div>
		<!-- Team End -->

		<!-- Testimonial Start -->
		<div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
			<div class="container">
				<div class="text-center">
					<h6 class="text-primary text-uppercase">// Testimonial //</h6>
					<h1 class="mb-5">Our Clients Say!</h1>
				</div>
				<div class="owl-carousel testimonial-carousel position-relative">
					<xsl:for-each select="Clientes/Nombre">
						<div class="testimonial-item text-center">
							<img class="bg-light rounded-circle p-2 mx-auto mb-3" src="{Imagen}" style="width: 80px; height: 80px;" alt=""></img>
							<h5 class="mb-0">
								<xsl:value-of select="@Nombre" />
							</h5>
							<p>
								<xsl:value-of select="Profesion" />
							</p>
							<div class="testimonial-text bg-light text-center p-4">
								<p class="mb-0">
									<xsl:value-of select="Opinion" />
								</p>
							</div>
						</div>
					</xsl:for-each>
				</div>
			</div>
		</div>
		<!-- Testimonial End -->



	</xsl:template>

	<xsl:template name="About">
		<!-- Page Header Start -->
		<div class="container-fluid page-header mb-5 p-0" style="background-image: url(img/carousel-bg-1.jpg);">
			<div class="container-fluid page-header-inner py-5">
				<div class="container text-center">
					<h1 class="display-3 text-white mb-3 animated slideInDown">About Us</h1>
					<nav aria-label="breadcrumb">
					</nav>
				</div>
			</div>
		</div>
		<!-- Page Header End -->

		<!-- About Start -->
		<div class="container-xxl py-5">
			<div class="container">
				<!--COMIENZA OBTENER DATOS PARA EL ABOUT (IMG, DESCRIPCION, VALORES)-->
				<!--<xsl:for-each select="AboutUs">-->
				<div class="row g-5">
					<div class="col-lg-6 pt-4" style="min-height: 400px;">
						<div class="position-relative h-100 wow fadeIn" data-wow-delay="0.1s">
							<img class="position-absolute img-fluid w-100 h-100" src="img/about.jpg" style="object-fit: cover;" alt=""></img>
							<div class="position-absolute top-0 end-0 mt-n4 me-n4 py-4 px-5" style="background: rgba(0, 0, 0, .08);">
								<h1 class="display-4 text-white mb-0">
									15 <span class="fs-4">Years</span>
								</h1>
								<h4 class="text-white">Experience</h4>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<h6 class="text-primary text-uppercase">// About Us //</h6>
						<h1 class="mb-4">
							<span class="text-primary">CarServ</span> Is The Best Place For Your Auto Care
						</h1>
						<p class="mb-4">
							<!--SE INSERTA DESCRIPCION DEL XML-->
							<xsl:value-of select="AboutUs/Description"/>
						</p>
						<div class="row g-4 mb-3 pb-3">
							<xsl:for-each select="Values/Value">

								<div class="col-12 wow fadeIn" data-wow-delay="0.1s">
									<div class="d-flex">
										<div class="bg-light d-flex flex-shrink-0 align-items-center justify-content-center mt-1" style="width: 45px; height: 45px;
																  border-radius:50%;">
											<span class="fw-bold text-secondary">-</span>
										</div>
										<div class="ps-3">
											<h6>
												<!--SE INSERTAN LOS VALORES-->
												<xsl:value-of select="@Nombre"/>
											</h6>
											<span>
												<!--SE INSERTA LA DESCRIPCION DE VALORES-->
												<xsl:value-of select="Description"/>
											</span>
										</div>
									</div>
								</div>
							</xsl:for-each>
						</div>

					</div>
				</div>
				<!--FIN DATOS ABOUT-->
			</div>
		</div>
		<!-- About End -->

		<!-- Fact Start -->
		<div class="container-fluid fact bg-dark my-5 py-5">
			<div class="container">
				<!--SELECCIONA DATOS DE FACTS-->
				<xsl:for-each select="Facts">
					<div class="row g-4">
						<div class="col-md-6 col-lg-3 text-center wow fadeIn" data-wow-delay="0.1s">
							<i class="fa fa-check fa-2x text-white mb-3"></i>
							<h2 class="text-white mb-2" data-toggle="counter-up">
								<!--INSERTAR DATOS DE FACT-->
								<xsl:value-of select="NYears"/>
								<!--FIN INSERTAR DATOS FACT-->
							</h2>
							<p class="text-white mb-0">Years Experience</p>
						</div>
						<div class="col-md-6 col-lg-3 text-center wow fadeIn" data-wow-delay="0.3s">
							<i class="fa fa-users-cog fa-2x text-white mb-3"></i>
							<h2 class="text-white mb-2" data-toggle="counter-up">
								<!--INSERTAR DATOS DE FACT-->
								<xsl:value-of select="NExperts"/>
								<!--FIN INSERTAR DATOS FACT-->
							</h2>
							<p class="text-white mb-0">Expert Technicians</p>
						</div>
						<div class="col-md-6 col-lg-3 text-center wow fadeIn" data-wow-delay="0.5s">
							<i class="fa fa-users fa-2x text-white mb-3"></i>
							<h2 class="text-white mb-2" data-toggle="counter-up">
								<!--INSERTAR DATOS DE FACT-->
								<xsl:value-of select="NClients"/>
								<!--FIN INSERTAR DATOS FACT-->
							</h2>
							<p class="text-white mb-0">Satisfied Clients</p>
						</div>
						<div class="col-md-6 col-lg-3 text-center wow fadeIn" data-wow-delay="0.7s">
							<i class="fa fa-car fa-2x text-white mb-3"></i>
							<h2 class="text-white mb-2" data-toggle="counter-up">

								<!--INSERTAR DATOS DE FACT-->
								<xsl:value-of select="NProjects"/>
								<!--FIN INSERTAR DATOS FACT-->
							</h2>
							<p class="text-white mb-0">Compleate Projects</p>
						</div>
					</div>
				</xsl:for-each>
				<!--FIN SELECCION DATOS FACTS-->
			</div>
		</div>
		<!-- Fact End -->

		<!-- Team Start -->
		<div class="container-xxl py-5">
			<div class="container">
				<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
					<h6 class="text-primary text-uppercase">// Our Technicians //</h6>
					<h1 class="mb-5">Our Expert Technicians</h1>
				</div>
				<div class="row g-4">
					<xsl:for-each select="Mecanicos/Nombre">
						<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
							<div class="team-item">
								<div class="position-relative overflow-hidden">
									<img class="img-fluid" src="{Imagen}" alt="" />
								</div>
								<div class="bg-light text-center p-4">
									<!-- Nombre del mecánico -->
									<h5 class="fw-bold mb-0">
										<xsl:value-of select="@Nombre" />
									</h5>
									<!-- Cargo del mecánico -->
									<small>
										<xsl:value-of select="Cargo" />
									</small>
								</div>
							</div>
						</div>
					</xsl:for-each>
				</div>
			</div>
		</div>
		<!-- Team End -->

	</xsl:template>

	<xsl:template name="Services">
		<!-- Page Header Start -->
		<div class="container-fluid page-header mb-5 p-0" style="background-image: url(img/carousel-bg-2.jpg);">
			<div class="container-fluid page-header-inner py-5">
				<div class="container text-center">
					<h1 class="display-3 text-white mb-3 animated slideInDown">Services</h1>

				</div>
			</div>
		</div>
		<!-- Page Header End -->

		<!-- Service Start -->
		<div class="container-xxl service py-5">
			<div class="container">
				<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
					<h6 class="text-primary text-uppercase">// Our Services //</h6>
					<h1 class="mb-5">Explore Our Services</h1>
				</div>
				<div class="row g-4 wow fadeInUp" data-wow-delay="0.3s">
					<div class="col-lg-4">
						<div class="nav w-100 nav-pills me-4">
							<xsl:for-each select="Servicios/Servicio">
								<!--INICIA LISTADO DE SERVICIOS-->
								<xsl:choose>
									<xsl:when test="@Orden = 1">
										<button class="nav-link w-100 d-flex align-items-center text-start p-4 mb-4 active" data-bs-toggle="pill" data-bs-target="#tab-pane-{@Orden}" type="button">
											<i class="fa fa-car-side fa-2x me-3"></i>
											<h4 class="m-0">
												<xsl:value-of select="@Nombre"/>
											</h4>
										</button>
										<!--FIN LISTADO SERVICIOS-->
									</xsl:when>
									<xsl:otherwise>
										<button class="nav-link w-100 d-flex align-items-center text-start p-4 mb-4 " data-bs-toggle="pill" data-bs-target="#tab-pane-{@Orden}" type="button">
											<i class="fa fa-car-side fa-2x me-3"></i>
											<h4 class="m-0">
												<xsl:value-of select="@Nombre"/>
											</h4>
										</button>
										<!--FIN LISTADO SERVICIOS-->

									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</div>
					</div>

					<div class="col-lg-8">
						<div class="tab-content w-100">
							<!--INICIA LISTADO DE SERVICIOS-->
							<xsl:for-each select="Servicios/Servicio">
								<xsl:choose>
									<xsl:when test="@Orden = 1">

										<div class="tab-pane fade show active" id="tab-pane-{@Orden}">
											<div class="row g-4">
												<div class="col-md-6" style="min-height: 350px;">
													<div class="position-relative h-100">
														<img class="position-absolute img-fluid w-100 h-100" src="{Imagen}"
															style="object-fit: cover;" alt=""></img>
													</div>
												</div>
												<div class="col-md-6">
													<h3 class="mb-3">
														<xsl:value-of select="@Nombre"/>
													</h3>
													<p class="mb-4">
														<xsl:value-of select="Descripcion"/>
													</p>
													<p>
														<i class="fa fa-check text-success me-3"></i>Quality Servicing
													</p>
													<p>
														<i class="fa fa-check text-success me-3"></i>Expert Workers
													</p>
													<p>
														<i class="fa fa-check text-success me-3"></i>Modern Equipment
													</p>
													<a  class="btn btn-primary py-3 px-5 mt-3">

														<p>
															Cost: <xsl:value-of select="Costo"/>
														</p>


													</a>
												</div>
											</div>
										</div>

									</xsl:when>
									<xsl:otherwise>

										<div class="tab-pane fade" id="tab-pane-{@Orden}">
											<div class="row g-4">
												<div class="col-md-6" style="min-height: 350px;">
													<div class="position-relative h-100">

														<img class="position-absolute img-fluid w-100 h-100" src="{Imagen}"
															style="object-fit: cover;" alt=""></img>
													</div>
												</div>
												<div class="col-md-6">
													<h3 class="mb-3">
														<xsl:value-of select="@Nombre"/>
													</h3>
													<p class="mb-4">

														<xsl:value-of select="Descripcion"/>

													</p>
													<p>
														<i class="fa fa-check text-success me-3"></i>Quality Servicing
													</p>
													<p>
														<i class="fa fa-check text-success me-3"></i>Expert Workers
													</p>
													<p>
														<i class="fa fa-check text-success me-3"></i>Modern Equipment
													</p>
													<a  class="btn btn-primary py-3 px-5 mt-3">
														<p>
															Cost: <xsl:value-of select="Costo"/>
														</p>

													</a>
												</div>
											</div>
										</div>

									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</div>
					</div>
				</div>

			</div>
		</div>
		<!-- Service End -->


		<!-- Booking Start -->
		<div class="container-fluid bg-secondary booking my-5 wow fadeInUp" data-wow-delay="0.1s">
			<div class="container">
				<div class="row gx-5">
					<div class="col-lg-6 py-5">
						<div class="py-5">
							<h1 class="text-white mb-4">Certified and Award Winning Car Repair Service Provider</h1>
							<p class="text-white mb-0">Eirmod sed tempor lorem ut dolores. Aliquyam sit sadipscing kasd ipsum. Dolor ea et dolore et at sea ea at dolor, justo ipsum duo rebum sea invidunt voluptua. Eos vero eos vero ea et dolore eirmod et. Dolores diam duo invidunt lorem. Elitr ut dolores magna sit. Sea dolore sanctus sed et. Takimata takimata sanctus sed.</p>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="bg-primary h-100 d-flex flex-column justify-content-center text-center p-5 wow zoomIn" data-wow-delay="0.6s">
							<h1 class="text-white mb-4">Book For A Service</h1>
							<form>
								<div class="row g-3">
									<div class="col-12 col-sm-6">
										<input id="NameForm" type="text" class="form-control border-0" placeholder="Your Name" style="height: 55px;"></input>
									</div>
									<div class="col-12 col-sm-6">
										<input id="EmailForm" type="email" class="form-control border-0" placeholder="Your Email" style="height: 55px;"></input>
									</div>
									<div class="col-12 col-sm-6">
										<select id="SelectForm" class="form-select border-0" style="height: 55px;">
											<option selected="">Select A Service</option>
											<option value="1">Service 1</option>
											<option value="2">Service 2</option>
											<option value="3">Service 3</option>
										</select>
									</div>
									<div class="col-12 col-sm-6">
										<div class="date" id="date1" data-target-input="nearest">
											<input id="DateForm" type="text"
												class="form-control border-0 datetimepicker-input"
												placeholder="Service Date" data-target="#date1" data-toggle="datetimepicker" style="height: 55px;"></input>
										</div>
									</div>
									<div class="col-12">
										<textarea id="TextForm" class="form-control border-0" placeholder="Special Request"></textarea>
									</div>
									<div class="col-12">
										<button id="BtnForm" type="button" class="btn btn-secondary w-100 py-3" onclick="validacionSweet();">Book Now</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Booking End -->

		<!-- Testimonial Start -->
		<div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
			<div class="container">
				<div class="text-center">
					<h6 class="text-primary text-uppercase">// Testimonial //</h6>
					<h1 class="mb-5">Our Clients Say!</h1>
				</div>
				<div class="owl-carousel testimonial-carousel position-relative">
					<xsl:for-each select="Clientes/Nombre">
						<div class="testimonial-item text-center">
							<img class="bg-light rounded-circle p-2 mx-auto mb-3" src="{Imagen}" style="width: 80px; height: 80px;" alt=""></img>
							<h5 class="mb-0">
								<xsl:value-of select="@Nombre" />
							</h5>
							<p>
								<xsl:value-of select="Profesion" />
							</p>
							<div class="testimonial-text bg-light text-center p-4">
								<p class="mb-0">
									<xsl:value-of select="Opinion" />
								</p>
							</div>
						</div>
					</xsl:for-each>
				</div>
			</div>
		</div>
		<!-- Testimonial End -->




	</xsl:template>

	<xsl:template name="Booking">
		<!-- Page Header Start -->
		<div class="container-fluid page-header mb-5 p-0" style="background-image: url(img/carousel-bg-1.jpg);">
			<div class="container-fluid page-header-inner py-5">
				<div class="container text-center">
					<h1 class="display-3 text-white mb-3 animated slideInDown">Booking</h1>
				</div>
			</div>
		</div>
		<!-- Page Header End -->

		<!-- Booking Start -->
		<div class="container-fluid bg-secondary booking my-5 wow fadeInUp" data-wow-delay="0.1s">
			<div class="container">
				<div class="row gx-5">
					<div class="col-lg-6 py-5">
						<div class="py-5">
							<h1 class="text-white mb-4">Certified and Award Winning Car Repair Service Provider</h1>
							<p class="text-white mb-0">¿Tienes dudas o necesitas agendar una cita para el mantenimiento o reparación de tu vehículo? En nuestro taller mecánico estamos aquí para ayudarte. Completa el siguiente formulario con tus datos y dinos cómo podemos asistirte. Nos pondremos en contacto contigo a la brevedad para ofrecerte la mejor solución y mantener tu auto en excelente estado. ¡Confía en nuestra experiencia para cuidar tu vehículo!</p>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="bg-primary h-100 d-flex flex-column justify-content-center text-center p-5 wow zoomIn" data-wow-delay="0.6s">
							<h1 class="text-white mb-4">Book For A Service</h1>
							<form>
								<div class="row g-3">
									<div class="col-12 col-sm-6">
										<input id="NameForm" type="text" class="form-control border-0" placeholder="Your Name" style="height: 55px;"></input>
									</div>
									<div class="col-12 col-sm-6">
										<input id="EmailForm" type="email" class="form-control border-0" placeholder="Your Email" style="height: 55px;"></input>
									</div>
									<div class="col-12 col-sm-6">
										<select id="SelectForm" class="form-select border-0" style="height: 55px;">
											<option selected="">Select A Service</option>
											<option value="1">Service 1</option>
											<option value="2">Service 2</option>
											<option value="3">Service 3</option>
										</select>
									</div>
									<div class="col-12 col-sm-6">
										<div class="date" id="date1" data-target-input="nearest">
											<input id="DateForm" type="text"
												class="form-control border-0 datetimepicker-input"
												placeholder="Service Date" data-target="#date1" data-toggle="datetimepicker" style="height: 55px;"></input>
										</div>
									</div>
									<div class="col-12">
										<textarea id="TextForm" class="form-control border-0" placeholder="Special Request"></textarea>
									</div>
									<div class="col-12">
										<button id="BtnForm" type="button" class="btn btn-secondary w-100 py-3" onclick="validacionSweet();">Book Now</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Booking End -->

		<!-- Call To Action Start -->
		<div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
			<div class="container">
				<div class="row g-4">
					<div class="col-lg-8 col-md-6">
						<h6 class="text-primary text-uppercase">// Call To Action //</h6>
						<h1 class="mb-4">Have Any Pre Booking Question?</h1>
						<p class="mb-0">¿Tienes alguna pregunta antes de realizar tu reserva? ¡Nuestro equipo está aquí para ayudarte! No dudes en comunicarte a través de este formulario, y te brindaremos toda la información que necesitas para que te sientas seguro al programar tu servicio. ¡Estamos para apoyarte!</p>
					</div>
					<div class="col-lg-4 col-md-6">
						<div class="bg-primary d-flex flex-column justify-content-center text-center h-100 p-4">
							<h3 class="text-white mb-4">
								<i class="fa fa-phone-alt me-3"></i>+52 749 103 1325
							</h3>
							<a href="" class="btn btn-secondary py-3 px-5">
								Contact Us<i class="fa fa-arrow-right ms-3"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Call To Action End -->

	</xsl:template>

	<xsl:template name="Technicians">
		<!-- Page Header Start -->
		<div class="container-fluid page-header mb-5 p-0" style="background-image: url(img/carousel-bg-2.jpg);">
			<div class="container-fluid page-header-inner py-5">
				<div class="container text-center">
					<h1 class="display-3 text-white mb-3 animated slideInDown">Technicians</h1>
				</div>
			</div>
		</div>
		<!-- Page Header End -->

		<!-- Team Start -->
		<div class="container-xxl py-5">
			<div class="container">
				<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
					<h6 class="text-primary text-uppercase">// Our Technicians //</h6>
					<h1 class="mb-5">Our Expert Technicians</h1>
				</div>
				<div class="row g-4">
					<xsl:for-each select="Mecanicos/Nombre">
						<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
							<div class="team-item">
								<div class="position-relative overflow-hidden">
									<img class="img-fluid" src="{Imagen}" alt="" />
								</div>
								<div class="bg-light text-center p-4">
									<!-- Nombre del mecánico -->
									<h5 class="fw-bold mb-0">
										<xsl:value-of select="@Nombre" />
									</h5>
									<!-- Cargo del mecánico -->
									<small>
										<xsl:value-of select="Cargo" />
									</small>
								</div>
							</div>
						</div>
					</xsl:for-each>
				</div>
			</div>
		</div>
		<!-- Team End -->


	</xsl:template>

	<xsl:template name="Testimonial">
		<!-- Page Header Start -->
		<div class="container-fluid page-header mb-5 p-0" style="background-image: url(img/carousel-bg-1.jpg);">
			<div class="container-fluid page-header-inner py-5">
				<div class="container text-center">
					<h1 class="display-3 text-white mb-3 animated slideInDown">Testimonial</h1>
				</div>
			</div>
		</div>
		<!-- Page Header End -->

		<!-- Testimonial Start -->
		<div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
			<div class="container">
				<div class="text-center">
					<h6 class="text-primary text-uppercase">// Testimonial //</h6>
					<h1 class="mb-5">Our Clients Say!</h1>
				</div>
				<div class="owl-carousel testimonial-carousel position-relative">
					<xsl:for-each select="Clientes/Nombre">
						<div class="testimonial-item text-center">
							<img class="bg-light rounded-circle p-2 mx-auto mb-3" src="{Imagen}" style="width: 80px; height: 80px;" alt=""></img>
							<h5 class="mb-0">
								<xsl:value-of select="@Nombre" />
							</h5>
							<p>
								<xsl:value-of select="Profesion" />
							</p>
							<div class="testimonial-text bg-light text-center p-4">
								<p class="mb-0">
									<xsl:value-of select="Opinion" />
								</p>
							</div>
						</div>
					</xsl:for-each>
				</div>
			</div>
		</div>
		<!-- Testimonial End -->
	</xsl:template>

	<xsl:template name="Contact">

		<script>
			// Definir la función initMap globalmente
			function initMap() {
			// Asegúrate de que aquí inicializas el mapa correctamente
			const mapOptions = {
			center: { lat: -34.397, lng: 150.644 },  // Cambia estas coordenadas por las deseadas
			zoom: 8
			};
			const map = new google.maps.Map(document.getElementById('map'), mapOptions);
			}
		</script>

		<script>
			<![CDATA[
			(g=>{var h,a,k,p="The Google Maps JavaScript API",c="google",l="importLibrary",q="__ib__",m=document,b=window;b=b[c]||(b[c]={});var d=b.maps||(b.maps={}),r=new Set,e=new URLSearchParams,u=()=>h||(h=new Promise(async(f,n)=>{await (a=m.createElement("script"));e.set("libraries",[...r]+"");for(k in g)e.set(k.replace(/[A-Z]/g,t=>"_"+t[0].toLowerCase()),g[k]);e.set("callback",c+".maps."+q);a.src=`https://maps.${c}apis.com/maps/api/js?`+e;d[q]=f;a.onerror=()=>h=n(Error(p+" could not load."));a.nonce=m.querySelector("script[nonce]")?.nonce||"";m.head.append(a)}));d[l]?console.warn(p+" only loads once. Ignoring:",g):d[l]=(f,...n)=>r.add(f)&&u().then(()=>d[l](f,...n))})({
			key: "AIzaSyCWeeateTaYGqsHhNcmoDfT7Us-vLDZVPs",
			// Add other bootstrap parameters as needed, using camel case.
			// Use the 'v' parameter to indicate the version to load (alpha, beta, weekly, etc.)
			});]]>
		</script>

		<!--Referencia a mi archivo JS-->
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCWeeateTaYGqsHhNcmoDfT7Us-vLDZVPs&amp;callback=initMap"
				async="" defer=""></script>


		<!--scripts personalizados-->

		<script src="js/googleMaps.js" type="module"></script>


		<!-- Page Header Start -->
		<div class="container-fluid page-header mb-5 p-0" style="background-image: url(img/carousel-bg-1.jpg);">
			<div class="container-fluid page-header-inner py-5">
				<div class="container text-center">
					<h1 class="display-3 text-white mb-3 animated slideInDown">Contact</h1>
				</div>
			</div>
		</div>
		<!-- Page Header End -->

		<!-- Contact Start -->
		<div class="container-xxl py-5">
			<div class="container">
				<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
					<h6 class="text-primary text-uppercase">// Contact Us //</h6>
					<h1 class="mb-5">Contact For Any Query</h1>
				</div>
				<div class="row g-4">
					<div class="col-12">
						<div class="row gy-4">
							<div class="col-md-4">
								<div class="bg-light d-flex flex-column justify-content-center p-4">
									<h5 class="text-uppercase">// Booking //</h5>
									<p class="m-0">
										<i class="fa fa-envelope-open text-primary me-2"></i>book@example.com
									</p>
								</div>
							</div>
							<div class="col-md-4">
								<div class="bg-light d-flex flex-column justify-content-center p-4">
									<h5 class="text-uppercase">// General //</h5>
									<p class="m-0">
										<i class="fa fa-envelope-open text-primary me-2"></i>info@example.com
									</p>
								</div>
							</div>
							<div class="col-md-4">
								<div class="bg-light d-flex flex-column justify-content-center p-4">
									<h5 class="text-uppercase">// Technical //</h5>
									<p class="m-0">
										<i class="fa fa-envelope-open text-primary me-2"></i>tech@example.com
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6 wow fadeIn" data-wow-delay="0.1s">

						<iframe class="position-relative rounded w-100 h-100"
			src="about:blank"
			frameborder="0"
			style="min-height: 100px; border: 0; overflow: hidden; display: block;"
			allowfullscreen="true" aria-hidden="false" tabindex="0">
						</iframe>

						<script>
							<![CDATA[
							// Inyectar una imagen en el iframe
							const iframe = document.querySelector('iframe');
							const doc = iframe.contentDocument || iframe.contentWindow.document;
							doc.open();
							doc.write('<style>html, body { margin: 0; padding: 0; overflow: hidden; height: 100%; } img { width: 100%; height: 100%; object-fit: cover; }</style>');
							doc.write('<img src="img/contact_us.png" alt="Contact Us">');
    doc.close();
							]]>


						</script>

					</div>
					<div class="col-md-6">
						<div class="wow fadeInUp" data-wow-delay="0.2s">
							<p class="mb-4">
								¿Tienes dudas o necesitas agendar una cita para el mantenimiento o reparación de tu vehículo? En nuestro taller mecánico estamos aquí para ayudarte. Completa el siguiente formulario con tus datos y dinos cómo podemos asistirte. Nos pondremos en contacto contigo a la brevedad para ofrecerte la mejor solución y mantener tu auto en excelente estado. ¡Confía en nuestra experiencia para cuidar tu vehículo!
							</p>
							<form>
								<div class="row g-3">
									<div class="col-md-6">
										<div class="form-floating">
											<input type="text" class="form-control" id="name2" placeholder="Your Name"></input>
											<label for="name">Your Name</label>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-floating">
											<input type="email" class="form-control" id="email2" placeholder="Your Email"></input>
											<label for="email">Your Email</label>
										</div>
									</div>
									<div class="col-12">
										<div class="form-floating">
											<input type="text" class="form-control" id="subject" placeholder="Subject"></input>
											<label for="subject">Subject</label>
										</div>
									</div>
									<div class="col-12">
										<div class="form-floating">
											<textarea class="form-control" placeholder="Leave a message here" id="message" style="height: 100px"></textarea>
											<label for="message">Message</label>
										</div>
									</div>
									<div class="col-12">
										<button id="BtnForm2" class="btn btn-primary w-100 py-3" type="button"  onclick= "validacionSweet2(); ">Send Message</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Contact End -->

		<!--Mapa-->
		<div data-aos="fade-up">
			<style>
				#map {
				border:0;
				width: 100%;
				height: 350px;
				}
			</style>
			<div id="google-map">
				<div id="map">

				</div>
			</div>
			<text id="direccion"> esta es una etiqueta de texto </text>
			<div class="col-lg-12 margin-bottom-30" id="street" style="height: 400px; width: 100%;"></div>
		</div>

	</xsl:template>
	<!--GAME-->
	<xsl:template name="Game">

		<html lang="es">
			<head>
				<meta charset="UTF-8"></meta>
				<meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>
				<title>Juego Drag and Drop - Marcas de Autos</title>

				<!-- Agregar Bootstrap desde CDN -->
				<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"></link>

				<!-- Estilos personalizados -->
				<link href="css/style.css" rel="stylesheet"></link>
				<link href="css/dragandrop.css" rel="stylesheet"></link>

				<!-- jQuery y otros scripts -->
				<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
				<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
			</head>
			<body>
				<div class="container mt-5">
					<h1 class="text-center mb-4">Arrastra los logos de los autos a sus nombres correctos</h1>

					<div class="row justify-content-center">
						<!-- Logos (draggable) -->
						<div class="col-md-4">
							<div id="logo1" class="logo" draggable="true" alt="Toyota">
								<img src="" alt="Toyota" class="img-fluid"></img>
							</div>
						</div>
						<div class="col-md-4">
							<div id="logo2" class="logo" draggable="true" alt="Ford">
								<img src="https://upload.wikimedia.org/wikipedia/commons/c/cf/Ford_logo_2017.png" alt="Ford" class="img-fluid"></img>
							</div>
						</div>
						<div class="col-md-4">
							<div id="logo3" class="logo" draggable="true" alt="Volkswagen">
								<img src="https://upload.wikimedia.org/wikipedia/commons/0/0e/Volkswagen_logo_2019.png" alt="Volkswagen" class="img-fluid"></img>
							</div>
						</div>

					</div>

					<div class="row justify-content-center mt-5">
						<!-- Nombres (drop targets) -->
						<div class="col-md-4">
							<div id="name1" class="name p-3" data-name="Toyota">

							</div>
						</div>
						<div class="col-md-4">
							<div id="name2" class="name p-3" data-name="Ford">

							</div>
						</div>
						<div class="col-md-4">
							<div  id="name3" class="name p-3 " data-name="Volkswagen">

							</div>
						</div>
						<div class="col-md-4">
							<!-- Papelera -->
							<div id="trash" class="trash p-3" style="border: 2px #888; background-color: #F9F0F6;">
								<h5>Eliminar Elemento</h5>
							</div>
						</div>

					</div>
				</div>

				<!-- jQuery y Bootstrap JS desde CDN -->
				<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

				<!-- Script personalizado -->
				<script src="js/dragandrop.js"></script>
			</body>
		</html>

	</xsl:template>


</xsl:stylesheet>
