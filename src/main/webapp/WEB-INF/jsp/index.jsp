<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<body onload="todo()">

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
			<div class="col-sm-12 card col-lg-8 pt-2">
				<h5>Vaccination Slots</h5>
				<br><br>
				<form action="/district" method="post" modelAttribute="state">
				<div class="h6 alert-primary" style="padding:15px; border-radius:20px;">Select Your State</div>
					<select name="stateId" style=" padding: 15px; border-radius:20px; width:100%;">
						<c:forEach items="${stateList }" var="stateList">
							<option value="${stateList.state_id }">${ stateList.state_name }</option>
						</c:forEach>
						
					</select><br>
					<input type="submit" value="Next" class="mt-2 btn btn-primary"/>
				</form>
				
			</div>
			<div class="col-sm-12 col-lg-4 ">
				<div class="embed-responsive embed-responsive-16by9 mb-1">



					<iframe src="https://www.youtube.com/embed/5DGwOJXSxqg"
						title="YouTube video player" frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>

				</div>
				<div class="row mb-1">

					<div class="col">
						<div class="card">
							<img class="card-img-top" src="${article.urlToImage }"
								alt="Card image cap">
							<div class="card-body">
								<div class="card-title">
									<b>${article.title }</b>
								</div>
								<div class="card-text">
									${article.description }<br> <br> <span
										class="h6 text-secondary text-small">Published by :
										${article.source.name }</span> <br> <span
										class="h6 text-small text-secondary">Published At
										:${article.publishedAt }</span><br> <br> <span>Know
										more :</span><br> <a href="${article.url }" target="_blank">${article.url }</a>
								</div>
							</div>
						</div>

					</div>

				</div>
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


	<!-- Footer -->
	<footer class="bg-dark text-center text-white">
		<!-- Grid container -->
		<div class="container p-4">
			<!-- Section: Social media -->

			<!-- Section: Social media -->

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