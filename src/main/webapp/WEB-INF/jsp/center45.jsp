<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<title>Covid Details</title>

</head>
<body>


	<%
	int z = 0;
	%>

	<script>
		function set(x){
			
			var centerName = document.getElementsByName("centerName")[x].innerHTML;
			var centerAddress = document.getElementsByName("centerAddress")[x].innerHTML;
			var centerBlock = document.getElementsByName("centerBlock")[x].innerHTML;
			var centerPin = document.getElementsByName("centerPin")[x].innerHTML;
			var centerId = document.getElementsByName("centerId")[x].innerHTML;
			
			//alert();
			
			document.getElementById("modalCenterName").innerHTML = centerName;
			document.getElementById("modalCenterAddress").innerHTML = centerAddress;
			document.getElementById("modalCenterBlock").innerHTML = centerBlock;
			document.getElementById("modalCenterPin").innerHTML = centerPin;
			document.getElementById("modalCenterid").value = centerId;
		}
	</script>

	<!-- Navbar start -->

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
		<a class="navbar-brand" href="#">Covid19 </a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">

		</div>
	</nav>


	<!-- Navbar End -->



	<div class="container card" style="margin-top: 15px;">
		<div class="row card-body">
			<div class="col-sm-12 col-lg-4">
				<table class="">
					<thead>
						<tr>
							<td colspan="2"></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="p-2"><b>Location :</b></td>
							<td class="p-2">${weather.location.name }</td>
						</tr>
						<tr>
							<td class="p-2"><b>Temp. :</b></td>
							<td class="p-2">${weather.current.temp_c }°C</td>
						</tr>
						<tr>
							<td class="p-2"><b>Weather :</b></td>
							<td class="p-2">${weather.current.condition.text }</td>
						</tr>
						<tr>
							<td class="p-2"></td>
							<td class="p-2"></td>
						</tr>
					</tbody>
				</table>

			</div>
			<div class="col-sm-12 col-lg-3 text-center"></div>
			<div class="col-sm-12 col-lg-5">
				<table class="table table-bordered border-primary">
					<thead>
						<tr>
							<td colspan="2" class="text-center"><b>Covid Updates
									(India)</b></td>
						</tr>
					</thead>
					<tbody>
						<tr class="alert-secondary">
							<td class="p-2"><b>Total :</b></td>
							<td class="p-2">${response.cases.total }</td>
						</tr>
						<tr class="alert-primary">
							<td class="p-2"><b>Active :</b></td>
							<td class="p-2">${response.cases.active }</td>
						</tr>
						<tr class="alert-success">
							<td class="p-2"><b>Recovered :</b></td>
							<td class="p-2"><b>${response.cases.recovered }</b></td>
						</tr>
						<tr class="alert-danger">
							<td class="p-2"><b>Death :</b></td>
							<td class="p-2">${response.deaths.total }</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<div class="container mt-2 mb-2">
		<div class="row">
			<div class="col-sm-12 card ">
				<br>

				<div class="h5" style="float: left;">Vaccination Slots</div>
				<div>
					<form action="/centers" method="post" modelAttribute="district">

						<input type="text" name="districtId" value="${dist }"
							style="display: none;" /> <input type="number" name="age"
							value="18" style="display: none;" /> <input class="form-control"
							type="hidden" name="mcenterId" value="district"
							id="modalCenterId" readonly="readonly" /> <input
							class="form-control" name="mail" placeholder="Enter you email"
							type="hidden" /> <input class="form-control" type="hidden"
							name="flag" value="0" /> <input type="submit" value="Age 18+"
							class="btn btn-light" /> <a class="btn btn-primary active">Age
							45+</a>
					</form>
				</div>


				<div class="alert alert-warning" role="alert">${message }</div>

				<br>
				<c:set var="today" value="<%=new Date()%>" />
				<c:set var="today1"
					value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000)%>" />
				<c:set var="today2"
					value="<%=new Date(new Date().getTime() + 2 * 60 * 60 * 24 * 1000)%>" />
				<c:set var="today3"
					value="<%=new Date(new Date().getTime() + 3 * 60 * 60 * 24 * 1000)%>" />
				<c:set var="today4"
					value="<%=new Date(new Date().getTime() + 4 * 60 * 60 * 24 * 1000)%>" />
				<c:set var="today5"
					value="<%=new Date(new Date().getTime() + 5 * 60 * 60 * 24 * 1000)%>" />
				<c:set var="today6"
					value="<%=new Date(new Date().getTime() + 6 * 60 * 60 * 24 * 1000)%>" />
				<c:set var="filterAge" value="45" />

				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<th class="alert-primary" style="width: 20%">Center Details</th>
								<th class="alert-secondary">${t }</th>
								<th class="alert-secondary">${t1 }</th>
								<th class="alert-secondary">${t2 }</th>
								<th class="alert-secondary">${t3 }</th>
								<th class="alert-secondary">${t4 }</th>
								<th class="alert-secondary">${t5 }</th>
								<th class="alert-secondary">${t6 }</th>
								<th class="alert-secondary"></th>

							</tr>
						</thead>
						<tbody>


							<c:forEach items="${centerList}" var="centerList">
								<c:forEach items="${centerList.sessions }" var="sessionList">
									<tr>
										<td><a
											href="/ageFilter?center_id=${centerList.center_id }"><span
												name="centerName">${ centerList.name }</span></a><br> <span
											style="font-size: 12px;" name="centerAddress">${centerList.address }
										</span><br> <span style="font-size: 10px;" name="centerBlock">${centerList.block_name }</span>
											<span name="centerPin"> ${centerList.pincode }</span> <label
											name="centerId" style="display: none;">${centerList.center_id }</label>
										</td>
										<td><c:choose>
												<c:when test="${sessionList.date==t }">
													<c:choose>
														<c:when test="${sessionList.min_age_limit==filterAge }">
															<c:choose>
																<c:when test="${sessionList.available_capacity==0 }">
																	<span class="alert-danger"
																		style="padding: 5px; border: 1px solid red; border-radius: 5%;">Booked</span>
																	<br>
																	<span style="font-size: 12px;" class="text-success">${sessionList.vaccine }</span>
																	<br>
																	<span style="font-size: 10px;" class="text-secondary">Dose
																		1 : ${sessionList.available_capacity_dose1 } | Dose 2
																		: ${sessionList.available_capacity_dose2 }</span>
																</c:when>
																<c:otherwise>
																	<span class="alert-success"
																		style="padding: 5px; border: 1px solid green; border-radius: 5%;">${sessionList.available_capacity }
																		available</span>
																	<br>
																	<span style="font-size: 12px;" class="text-success">${sessionList.vaccine }</span>
																	<br>
																	<span style="font-size: 10px;" class="text-secondary">Dose
																		1 : ${sessionList.available_capacity_dose1 } | Dose 2
																		: ${sessionList.available_capacity_dose2 }</span>


																</c:otherwise>
															</c:choose>
														</c:when>
														<c:otherwise>
															<div class="alert-secondary"
																style="float: left; padding: 5px; border: 1px solid gray; border-radius: 5%;">NA</div>
														</c:otherwise>
													</c:choose>

												</c:when>
												<c:otherwise>
													<div class="alert-secondary"
														style="float: left; padding: 5px; border: 1px solid gray; border-radius: 5%;">NA</div>
												</c:otherwise>
											</c:choose></td>

										<td><c:choose>
												<c:when test="${sessionList.date==t1 }">
													<c:choose>
														<c:when test="${sessionList.min_age_limit==filterAge }">
															<c:choose>
																<c:when test="${sessionList.available_capacity==0 }">
																	<span class="alert-danger"
																		style="padding: 5px; border: 1px solid red; border-radius: 5%;">Booked</span>
																	<br>
																	<span style="font-size: 12px;" class="text-success">${sessionList.vaccine }</span>
																	<br>
																	<span style="font-size: 10px;" class="text-secondary">Dose
																		1 : ${sessionList.available_capacity_dose1 } | Dose 2
																		: ${sessionList.available_capacity_dose2 }</span>
																</c:when>
																<c:otherwise>
																	<span class="alert-success"
																		style="padding: 5px; border: 1px solid green; border-radius: 5%;">${sessionList.available_capacity }
																		available</span>
																	<br>
																	<span style="font-size: 12px;" class="text-success">${sessionList.vaccine }</span>
																	<br>
																	<span style="font-size: 10px;" class="text-secondary">Dose
																		1 : ${sessionList.available_capacity_dose1 } | Dose 2
																		: ${sessionList.available_capacity_dose2 }</span>


																</c:otherwise>
															</c:choose>
														</c:when>
														<c:otherwise>
															<div class="alert-secondary"
																style="float: left; padding: 5px; border: 1px solid gray; border-radius: 5%;">NA</div>
														</c:otherwise>
													</c:choose>

												</c:when>
												<c:otherwise>
													<div class="alert-secondary"
														style="float: left; padding: 5px; border: 1px solid gray; border-radius: 5%;">NA</div>
												</c:otherwise>
											</c:choose></td>

										<td><c:choose>
												<c:when test="${sessionList.date==t2 }">
													<c:choose>
														<c:when test="${sessionList.min_age_limit==filterAge }">
															<c:choose>
																<c:when test="${sessionList.available_capacity==0 }">
																	<span class="alert-danger"
																		style="padding: 5px; border: 1px solid red; border-radius: 5%;">Booked</span>
																	<br>
																	<span style="font-size: 12px;" class="text-success">${sessionList.vaccine }</span>
																	<br>
																	<span style="font-size: 10px;" class="text-secondary">Dose
																		1 : ${sessionList.available_capacity_dose1 } | Dose 2
																		: ${sessionList.available_capacity_dose2 }</span>
																</c:when>
																<c:otherwise>
																	<span class="alert-success"
																		style="padding: 5px; border: 1px solid green; border-radius: 5%;">${sessionList.available_capacity }
																		available</span>
																	<br>
																	<span style="font-size: 12px;" class="text-success">${sessionList.vaccine }</span>
																	<br>
																	<span style="font-size: 10px;" class="text-secondary">Dose
																		1 : ${sessionList.available_capacity_dose1 } | Dose 2
																		: ${sessionList.available_capacity_dose2 }</span>


																</c:otherwise>
															</c:choose>
														</c:when>
														<c:otherwise>
															<div class="alert-secondary"
																style="float: left; padding: 5px; border: 1px solid gray; border-radius: 5%;">NA</div>
														</c:otherwise>
													</c:choose>

												</c:when>
												<c:otherwise>
													<div class="alert-secondary"
														style="float: left; padding: 5px; border: 1px solid gray; border-radius: 5%;">NA</div>
												</c:otherwise>
											</c:choose></td>

										<td><c:choose>
												<c:when test="${sessionList.date==t3 }">
													<c:choose>
														<c:when test="${sessionList.min_age_limit==filterAge }">
															<c:choose>
																<c:when test="${sessionList.available_capacity==0 }">
																	<span class="alert-danger"
																		style="padding: 5px; border: 1px solid red; border-radius: 5%;">Booked</span>
																	<br>
																	<span style="font-size: 12px;" class="text-success">${sessionList.vaccine }</span>
																	<br>
																	<span style="font-size: 10px;" class="text-secondary">Dose
																		1 : ${sessionList.available_capacity_dose1 } | Dose 2
																		: ${sessionList.available_capacity_dose2 }</span>
																</c:when>
																<c:otherwise>
																	<span class="alert-success"
																		style="padding: 5px; border: 1px solid green; border-radius: 5%;">${sessionList.available_capacity }
																		available</span>
																	<br>
																	<span style="font-size: 12px;" class="text-success">${sessionList.vaccine }</span>
																	<br>
																	<span style="font-size: 10px;" class="text-secondary">Dose
																		1 : ${sessionList.available_capacity_dose1 } | Dose 2
																		: ${sessionList.available_capacity_dose2 }</span>


																</c:otherwise>
															</c:choose>
														</c:when>
														<c:otherwise>
															<div class="alert-secondary"
																style="float: left; padding: 5px; border: 1px solid gray; border-radius: 5%;">NA</div>
														</c:otherwise>
													</c:choose>

												</c:when>
												<c:otherwise>
													<div class="alert-secondary"
														style="float: left; padding: 5px; border: 1px solid gray; border-radius: 5%;">NA</div>
												</c:otherwise>
											</c:choose></td>

										<td><c:choose>
												<c:when test="${sessionList.date==t4 }">
													<c:choose>
														<c:when test="${sessionList.min_age_limit==filterAge }">
															<c:choose>
																<c:when test="${sessionList.available_capacity==0 }">
																	<span class="alert-danger"
																		style="padding: 5px; border: 1px solid red; border-radius: 5%;">Booked</span>
																	<br>
																	<span style="font-size: 12px;" class="text-success">${sessionList.vaccine }</span>
																	<br>
																	<span style="font-size: 10px;" class="text-secondary">Dose
																		1 : ${sessionList.available_capacity_dose1 } | Dose 2
																		: ${sessionList.available_capacity_dose2 }</span>
																</c:when>
																<c:otherwise>
																	<span class="alert-success"
																		style="padding: 5px; border: 1px solid green; border-radius: 5%;">${sessionList.available_capacity }
																		available</span>
																	<br>
																	<span style="font-size: 12px;" class="text-success">${sessionList.vaccine }</span>
																	<br>
																	<span style="font-size: 10px;" class="text-secondary">Dose
																		1 : ${sessionList.available_capacity_dose1 } | Dose 2
																		: ${sessionList.available_capacity_dose2 }</span>


																</c:otherwise>
															</c:choose>
														</c:when>
														<c:otherwise>
															<div class="alert-secondary"
																style="float: left; padding: 5px; border: 1px solid gray; border-radius: 5%;">NA</div>
														</c:otherwise>
													</c:choose>

												</c:when>
												<c:otherwise>
													<div class="alert-secondary"
														style="float: left; padding: 5px; border: 1px solid gray; border-radius: 5%;">NA</div>
												</c:otherwise>
											</c:choose></td>

										<td><c:choose>
												<c:when test="${sessionList.date==t5 }">
													<c:choose>
														<c:when test="${sessionList.min_age_limit==filterAge }">
															<c:choose>
																<c:when test="${sessionList.available_capacity==0 }">
																	<span class="alert-danger"
																		style="padding: 5px; border: 1px solid red; border-radius: 5%;">Booked</span>
																	<br>
																	<span style="font-size: 12px;" class="text-success">${sessionList.vaccine }</span>
																	<br>
																	<span style="font-size: 10px;" class="text-secondary">Dose
																		1 : ${sessionList.available_capacity_dose1 } | Dose 2
																		: ${sessionList.available_capacity_dose2 }</span>
																</c:when>
																<c:otherwise>
																	<span class="alert-success"
																		style="padding: 5px; border: 1px solid green; border-radius: 5%;">${sessionList.available_capacity }
																		available</span>
																	<br>
																	<span style="font-size: 12px;" class="text-success">${sessionList.vaccine }</span>
																	<br>
																	<span style="font-size: 10px;" class="text-secondary">Dose
																		1 : ${sessionList.available_capacity_dose1 } | Dose 2
																		: ${sessionList.available_capacity_dose2 }</span>


																</c:otherwise>
															</c:choose>
														</c:when>
														<c:otherwise>
															<div class="alert-secondary"
																style="float: left; padding: 5px; border: 1px solid gray; border-radius: 5%;">NA</div>
														</c:otherwise>
													</c:choose>

												</c:when>
												<c:otherwise>
													<div class="alert-secondary"
														style="float: left; padding: 5px; border: 1px solid gray; border-radius: 5%;">NA</div>
												</c:otherwise>
											</c:choose></td>

										<td><c:choose>
												<c:when test="${sessionList.date==t6 }">
													<c:choose>
														<c:when test="${sessionList.min_age_limit==filterAge }">
															<c:choose>
																<c:when test="${sessionList.available_capacity==0 }">
																	<span class="alert-danger"
																		style="padding: 5px; border: 1px solid red; border-radius: 5%;">Booked</span>
																	<br>
																	<span style="font-size: 12px;" class="text-success">${sessionList.vaccine }</span>
																	<br>
																	<span style="font-size: 10px;" class="text-secondary">Dose
																		1 : ${sessionList.available_capacity_dose1 } | Dose 2
																		: ${sessionList.available_capacity_dose2 }</span>
																</c:when>
																<c:otherwise>
																	<span class="alert-success"
																		style="padding: 5px; border: 1px solid green; border-radius: 5%;">${sessionList.available_capacity }
																		available</span>
																	<br>
																	<span style="font-size: 12px;" class="text-success">${sessionList.vaccine }</span>
																	<br>
																	<span style="font-size: 10px;" class="text-secondary">Dose
																		1 : ${sessionList.available_capacity_dose1 } | Dose 2
																		: ${sessionList.available_capacity_dose2 }</span>


																</c:otherwise>
															</c:choose>
														</c:when>
														<c:otherwise>
															<div class="alert-secondary"
																style="float: left; padding: 5px; border: 1px solid gray; border-radius: 5%;">NA</div>
														</c:otherwise>
													</c:choose>

												</c:when>
												<c:otherwise>
													<div class="alert-secondary"
														style="float: left; padding: 5px; border: 1px solid gray; border-radius: 5%;">NA</div>
												</c:otherwise>
											</c:choose></td>

										<td>
											<!-- Button trigger modal -->
											<button type="button" class="btn btn-danger"
												data-toggle="modal" data-target="#exampleModalLong"
												onclick="set(<%=z++%>)">Notify</button>
										</td>











									</tr>
								</c:forEach>
							</c:forEach>



						</tbody>
					</table>
				</div>


				<!-- Modal -->
				<div class="modal fade" id="exampleModalLong" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLongTitle"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLongTitle">Subscribe
									with Us</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<form action="/centers" method="post" modelAttribute="district">
								<div class="modal-body">
									<div class="form-group">
										<b><label id="modalCenterName"></label></b>&nbsp;&nbsp; <label
											id="modalCenterAddress" style="font-size: 15px;"></label><br>
										<label id="modalCenterBlock" style="font-size: 12px;"></label>
										&nbsp;&nbsp; <label id="modalCenterPin"
											style="font-size: 10px;"></label> <br> <input
											class="form-control" type="hidden" name="mcenterId"
											id="modalCenterid" readonly="readonly" />
									</div>
									<input class="form-control" name="mail"
										placeholder="Enter you email" type="email" required="required" />
									<input class="form-control" type="hidden" name="flag" value="0" />
									<input class="form-control" type="hidden" name="age" value="45" />
									<input class="form-control" type="hidden" name="districtId"
										value="${dist }" />

								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
									<input type="submit" value="Subscribe" class="btn btn-danger" />
								</div>
							</form>
						</div>
					</div>
				</div>

				<!-- Modal -->



				<%-- <table class="table table-bordered table-hover">
					<thead class="alert-primary">
						<tr>
							<th>Center name</th>
							<th>Center Address</th>
							<th>Block</th>
						</tr>
					</thead>
					<tbody>


						<c:forEach items="${centerList}" var="centerList">
							<tr>
								<td><a href="/ageFilter?center_id=${centerList.center_id }">${ centerList.name }</a></td>
								<td>${centerList.address }</td>
								<td>${centerList.block_name }</td>
							</tr>
						</c:forEach>



					</tbody>
				</table> --%>
			</div>
			<div class="col mt-2">
				<div class="row">
					<div class="col-sm-12 col-lg-4">
						<div class="embed-responsive embed-responsive-16by9 mb-1">



							<iframe src="https://www.youtube.com/embed/5DGwOJXSxqg"
								title="YouTube video player" frameborder="0"
								allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
								allowfullscreen></iframe>

						</div>
					</div>
					<div class="col-sm-12 col-lg-4">
						<div class="card">
							<img class="card-img-top" src="${article.urlToImage }"
								alt="Card image cap">
							<div class="card-body">
								<div class="card-title">
									<a href="${article.url }"><b>${article.title }</b></a>
								</div>
								<%-- <div class="card-text">
									${article.description }<br> <br> <span
										class="h6 text-secondary text-small">Published by :
										${article.source.name }</span> <br> <span
										class="h6 text-small text-secondary">Published At
										:${article.publishedAt }</span><br> <br> <span>Know
										more :</span><br> <a href="${article.url }" target="_blank">${article.url }</a>
								</div> --%>
							</div>
						</div>
					</div>
					<div class="col-sm-12 col-lg-4">
						<div class="embed-responsive embed-responsive-16by9">

							<iframe src="https://www.youtube.com/embed/W4HDj2CcPAM"
								title="YouTube video player" frameborder="0"
								allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
								allowfullscreen></iframe>
							<br>


						</div>
					</div>
				</div>



			</div>
		</div>
	</div>


	<!-- Footer -->
	<footer class="bg-dark text-center text-white">
		<!-- Grid container -->
		<div class="container p-4">

			<!-- Section: Form -->
			<section class="">
				<form action="">
					<!--Grid row-->
					<div class="row d-flex justify-content-center">
						<!--Grid column-->
						<div class="col-auto">
							<p class="pt-2">
								<strong>Sign up for our newsletter</strong>
							</p>
						</div>
						<!--Grid column-->

						<!--Grid column-->
						<div class="col-md-5 col-12">
							<!-- Email input -->
							<div class="form-outline form-white mb-4">
								<input type="email" id="form5Example2" class="form-control" />
								<label class="form-label" for="form5Example2">Email
									address</label>
							</div>
						</div>
						<!--Grid column-->

						<!--Grid column-->
						<div class="col-auto">
							<!-- Submit button -->
							<button type="submit" class="btn btn-outline-light mb-4">
								Subscribe</button>
						</div>
						<!--Grid column-->
					</div>
					<!--Grid row-->
				</form>
			</section>
			<!-- Section: Form -->


		</div>
		<!-- Grid container -->

		<!-- Copyright -->
		<div class="text-center p-3"
			style="background-color: rgba(0, 0, 0, 0.2);">
			© 2020 Copyright | <a class="text-white"
				href="https://mdbootstrap.com/">Gaurav Raj</a>
		</div>
		<!-- Copyright -->
	</footer>
	<!-- Footer -->



</body>
</html>