<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
			<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
			<html>

			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
				<title>Online Feed Simulator</title>
				<!-- Bootstrap core CSS -->
				<link href="views/assets/css/bootstrap.css" rel="stylesheet">
				<!-- Jasny Bootstrap-Extension CSS -->
				<link href="views/assets/css/jasny-bootstrap.css" rel="stylesheet">
				<link href="views/assets/css/bordered.css" rel="stylesheet">
				<link href="views/assets/css/bootstrap-select.css" rel="stylesheet">
				<link href="views/assets/css/bootstrap-datetimepicker.css" rel="stylesheet">
				<!-- Custom styles for this template -->
				<link href="views/assets/css/main.css" rel="stylesheet">
				<link href='https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic' rel='stylesheet' type='text/css'>
				<link href='https://fonts.googleapis.com/css?family=Raleway:400,300,700' rel='stylesheet' type='text/css'>
				<!--popover-->
				<style type="text/css">
					.popover {
						max-width: 400px;
					}
				</style>
				<script type="text/javascript" src="views/assets/js/jquery.min.js"></script>
				<script type="text/javascript" src="views/assets/js/bootstrap.js"></script>
				<script type="text/javascript" src="views/assets/js/jasny-bootstrap.js"></script>
				<script type="text/javascript" src="views/assets/js/bootstrap-select.js"></script>
				<script type="text/javascript" src="views/assets/js/moment.js"></script>
				<script type="text/javascript" src="views/assets/js/highcharts.js"></script>
				<script type="text/javascript" src="views/assets/js/grid-light.js"></script>
				<script type="text/javascript" src="views/assets/js/bootstrap-datetimepicker.min.js"></script>
				<script type="text/javascript">
					var status = "more";

					<!--popover-->
						$(document).ready(function () {
							$('[data-toggle="popover"]').popover();
						});

					function toggleText() {
						var text =
							"<center><h4 style='font-family:Arial;font-size:13px'>Online Feed Calculator</h4></center>"
							+ "<p style='font-family:Arial;font-size:13px;font-weight:normal; line-height: 18px;'>Welcome to the <b>Online Feed Calculator</b> of the Agricultural Market Information System (AMIS). "
							+ "		The tool estimates a country &#039;s feed demand by considering the number of livestock and fish that need to be maintained, their energy and protein requirements, and the share of intensified production. "
							+ "		 Users can visualize default values or test different scenarios by modifying the underlying model parameters.</p>"
							+ "<div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>"
							+ "   <div class='panel-group' id='accordion'>"
							+ "    </div>"
							+ "</div>";

						if (status == "less") {

							document.getElementById("textArea").innerHTML = text;

							var number = 1;

							var $panel = $('<div ></div>');
							var $panelHeader = $('<div ></div>');
							var $panelTitle = $('<h3 class="panel-title" style="font-family:Arial;font-size:13px;display:inline-block;color:#dc3018"><a data-toggle="collapse" data-parent="#accordion" href="#collapse{}" class="panelToggle"><b>More information</b></a></h3>');



							var rand = $('<span style="margin-right : 10px;" class="glyphicon glyphicon-plus"></span>');

							var $panelCollapse = $('<div id="collapse{}" class="panel-collapse collapse"></div>');
							var $panelBody = $('<div class="panel-body"></div>');

							var $sections = $('<ul class="nav nav-tabs nav-justified"></ul>');
							$sections.html(
								'<li class="active"><a href="" style="color: white;background:green;font-family:Arial;font-size:13px;"  data-toggle="tab" class="background" >Background </a></li>' +
								'<li class="active"><a href="" style="font-family:Arial;font-size:13px;" data-toggle="tab" class="details">Why use a model approach?</a></li>' +
								'<li class="active"><a href="" style="font-family:Arial;font-size:13px;" data-toggle="tab" class="model">About the model</a></li>' +
								'<li class="active"><a href="" style="font-family:Arial;font-size:13px;" data-toggle="tab" class="parameters">About the model parameters</a></li>'
							);
							var $panes = $('<div class="tab-content"></div>');
							var $background = $('<div class="background"></div>');
							var $details = $('<div class="details" style="display:none;"></div>');
							var $model = $('<div class="model" style="display:none;"></div>');
							var $parameters = $('<div class="parameters" style="display:none;"></div>');

							// More information

							$background.html(
								'<ul class="list-group">' +
								'<li class="list-group-item list-group-item-info" style="font-family:Arial;font-size:13px;font-weight:normal; line-height: 18px;">' +
								'In order to improve transparency in international commodity markets, AMIS needs high quality information on the supply and demand situation of the AMIS crops: ' +
								'wheat, maize, rice and soybeans. Although a significant (and growing) part of these crops is used for animal feed, knowledge on feed utilization is scarce, ' +
								'with negative implications also on the quality of other elements in supply and demand balances. Against this background, the AMIS Secretariat, in collaboration with FAOs ' +
								'Statistics Division, developed this web application to provide a model-based estimation of feed demand. . An important objective of the tool is to promote debate between ' +
								'commodity analysts and livestock specialists. All those who feel that their scenarios more closely reflect reality are invited to report any proposed changes of the model ' +
								'parameters to the AMIS Secretariat.' +
								'</li>' +
								'</ul>'
							);

							$details.html(
								'<ul class="list-group">' +
								'<li class="list-group-item" style="font-family:Arial;font-size:13px;font-weight:normal; line-height: 18px;"> ' +
								'Feed utilization can essentially be measured in three ways: (i) through <b> surveys</b>, which may provide the most accurate numbers but can be extremely costly, ' +
								'especially when production systems are dispersed and characterized by different and flexible feeding regimes;  ' +
								'(ii) by applying a <b> fixed rate of total supply </b>of a particular feedstuff or by treating feed utilization as the residual variable in this commoditys  ' +
								'supply and demand balance, which is a very cost-effective approach but may divert results from actual requirements; or (iii) by <b>estimating feed demand  </b>' +
								'through a model-based approach, which is both cost effective and accurate provided that the right parameters and underlying assumptions are applied. ' +
								'What is more, estimating feed demand has the important advantage of directly linking feed utilization to the dynamic changes in the ' +
								'livestock and aquaculture sector. This is particularly important in view of rising demand for animal products and the sector continued intensification. ' +

								'</li>' +
								'</ul>'
							);

							$model.html(
								'<ul class="list-group">' +
								'<li class="list-group-item" style="font-family:Arial;font-size:13px;font-weight:normal; line-height: 18px;"> ' +
								'Feed demand is estimated separately for livestock and aquaculture focusing on three parameters: (i) the number of animals (livestock)/production in tonnes (aquaculture); ' +
								'(ii) the share of feed in the overall nutrition of the animal population(as opposed to grass, forages and roughages); and (iii) the biological energy and protein requirements ' +
								'of each animal type. The model distinguishes eight majorlivestock categories and twelve categories of aquaculture. In the present application only the parameters for the ' +
								'livestock categories can be simulated individually, while the aquaculture component is fixed. Energy requirements are expressed in megajoule (MJ) while protein requirements ' +
								'are measured in metric tonnes (MT). In addition, energy and protein requirements can be converted into the weight equivalent of a reference commodity. ' +
								'</li>' +
								'</ul>'
							);

							$parameters.html(

								'<ul class="list-group">' +
								'<li class="list-group-item" style="font-family: Arial;font-size:13px;font-weight:normal; line-height: 18px;"> ' +
								'(i)	<b>Number of animals/ fish production in tonnes: </b>gives an indication of the size of the animal population ' +
								'that needs to be maintained. In the case of livestock, it is a simple headcount of the different species; for aquaculture, annual production volumes are considered.  <br /><br />' +

								'(ii)	<b>Share of feed in the overall nutrition of the animal population:</b> denotes the percentage of the nutritional requirements of an animal and the entire animal ' +
								'population that are met by (processed) agricultural products, rather than through natural forms of feeding such as grazing or the supply of forages and roughages. In this ' +
								'respect, the parameter can be considered a measure of intensification. <br /><br />' +

								'(iii)	<b>Biological energy and protein requirements:</b> capture the amount of feed necessary to maintain a particular animal type. In order to standardize this parameter across animals,' +
								'energy and protein requirements are expressed relative to a reference animal: in this model a mature cow of 500 kg liveweight producing 3,500 kg of milk per year and calving every 13 months.' +
								'This reference animal (or "animal unit") is assumed to require 35,600 MJ of energy and 319 kg of crude protein per year. As can be expected, small animals will have a ' +
								'low value of the so-called "animal unit index" (e.g. chicken at around 0.01, meaning that they need about 1% of the energy or protein required by the reference animal) while the value for cattle ' +
								'will be closer to 1,depending on the specificities in each country.' +
								'</li>' +
								'</ul>'
							);

							$panes.append($background, $details, $model, $parameters);

							$panel.append(
								$panelHeader.append(
									rand,
									$panelTitle

								),
								$panelCollapse.append(
									$panelBody.append(
										$sections,
										$panes
									)
								)
							);

							var item = $panel[0].outerHTML;
							var items = '', newItem;

							for (var i = 0; i < number; i++) {
								newItem = (Math.random() > .5)
									? item
									: item.replace('glyphicon-plus', 'glyphicon-plus');
								items += newItem.replace(/{}/g, i + 1).replace(/{%}/g, Math.round(Math.random() * 100));
							}


							$('#accordion').html(items).on('click', 'a.panelToggle', function () {
								var $el = $(this).closest('.panel');
								setTimeout(function () {
									$('html, body').animate({
										scrollTop: $el.offset().top
									}, 500);
								}, 350);

							});


							$('.nav-tabs').on('click', 'a', function () {
								$(this).css({
									'color': 'white',
									'background': 'green'
								}).closest('li').siblings().find('> a').css({
									'color': '#333333',
									'background': 'white'
								});
								$(this).closest('.panel-body').find('.tab-content').children().slideUp().parent().find('.' + this.className).slideDown();

							});



							$('.glyphicon-align-plus')

							var cellTotal = document.getElementById("toggleButton");
							cellTotal.innerHTML = "See less";;
							status = "more";
						} else if (status == "more") {
							document.getElementById("textArea").innerHTML = "";
							var cellTotal = document.getElementById("toggleButton");
							cellTotal.innerHTML = "See more..";

							status = "less"
						}
					}

				</script>
				<style>
					$(document).ready(function() {
						$('[data-toggle="popover"]').popover( {
							container: 'body', html: true
						}
						);
					}

					);

					<!--setting the tab attributes-->.tabpanel {
						margin: 20px;
						padding: 0;
					}

					.tablist {
						margin: 0 0px;
						padding: 0;
						list-style: none;
					}

					.tab {
						margin: .2em 1px 0 0;
						padding: 10px;
						height: 1em;
						font-weight: bold;
						background-color: #ec9;

						border: 1px solid black;
						-webkit-border-radius-topright: 5px;
						-webkit-border-radius-topleft: 5px;
						-moz-border-radius-topright: 5px;
						-moz-border-radius-topleft: 5px;
						border-radius-topright: 5px;
						border-radius-topleft: 5px;

						float: left;
					}

					.panel {
						clear: both;
						margin: 0 0 0 0;
						padding: 10px;
						width: 600px;
						border: 1px solid black;

						-webkit-border-radius-topright: 10px;
						-webkit-border-radius-bottomleft: 10px;
						-webkit-border-radius-bottomright: 10px;
						-moz-border-radius-topright: 10px;
						-moz-border-radius-bottomleft: 10px;
						-moz-border-radius-bottomright: 10px;
						border-radius-topright: 10px;
						border-radius-bottomleft: 10px;
						border-radius-bottomright: 10px;
					}

					ul.controlList {
						list-style-type: none;
					}

					h3.selected {
						background-color: #fc5;
					}

					.focus {
						color: black;
						border-top: 2px solid black;
						border-bottom: 2px solid black;
						background-color: #fff !important;
						margin-top: 0;
					}

					.accordian {
						margin: 0;
						float: none;
						-webkit-border-radius: 0;
						-moz-border-radius: 0;
						border-radius: 0;
						width: 600px;
					}

					.hidden {
						position: absolute;
						left: -300em;
						top: -30em;
					}
				</style>
				<script type="text/javascript">
					$(document)
						.ready(
						function () {
							$('#selectCountryVD').selectpicker({
								size: 'auto',
								//		maxOptions : 3
							});


							$('#selectCountrySA').selectpicker({
								size: 'auto',
								maxOptions: 1
							});
							$('#selectIndexVD').selectpicker({
								size: 'auto',
								width: '220px'
							});
							$('#selectIndexSA').selectpicker({
								size: 'auto',
								width: '130px'
							});
							$('#selectEnergyEquivalentVD').selectpicker({
								size: 'auto',
								width: '150px'
							});
							$('#selectEnergyEquivalentSA').selectpicker({
								size: 'auto',
								width: '150px'
							});

							getData();


							/***
							*/
							var number = 1;

							var $panel = $('<div ></div>');
							var $panelHeader = $('<div ></div>');
							var $panelTitle = $('<h3 class="panel-title" style="font-family:Arial;font-size:13px;display:inline-block;color:#dc3018"><a data-toggle="collapse" data-parent="#accordion" href="#collapse{}" class="panelToggle"><b>More information</b></a></h3>');



							var rand = $('<span style="margin-right : 10px;" class="glyphicon glyphicon-plus"></span>');

							var $panelCollapse = $('<div id="collapse{}" class="panel-collapse collapse"></div>');
							var $panelBody = $('<div class="panel-body"></div>');

							var $sections = $('<ul class="nav nav-tabs nav-justified"></ul>');
							$sections.html(
								'<li class="active"><a href="" style="color: white;background:green;font-family:Arial;font-size:13px;"  data-toggle="tab" class="background" >Background </a></li>' +
								'<li class="active"><a href="" style="font-family:Arial;font-size:13px;" data-toggle="tab" class="details">Why use a model approach?</a></li>' +
								'<li class="active"><a href="" style="font-family:Arial;font-size:13px;" data-toggle="tab" class="model">About the model</a></li>' +
								'<li class="active"><a href="" style="font-family:Arial;font-size:13px;" data-toggle="tab" class="parameters">About the model parameters</a></li>'
							);
							var $panes = $('<div class="tab-content"></div>');
							var $background = $('<div class="background"></div>');
							var $details = $('<div class="details" style="display:none;"></div>');
							var $model = $('<div class="model" style="display:none;"></div>');
							var $parameters = $('<div class="parameters" style="display:none;"></div>');

							// More information

							$background.html(
								'<ul class="list-group">' +
								'<li class="list-group-item list-group-item-info" style="font-family:Arial;font-size:13px;font-weight:normal; line-height: 18px;">' +
								'In order to improve transparency in international commodity markets, AMIS needs high quality information on the supply and demand situation of the AMIS crops: ' +
								'wheat, maize, rice and soybeans. Although a significant (and growing) part of these crops is used for animal feed, knowledge on feed utilization is scarce, ' +
								'with negative implications also on the quality of other elements in supply and demand balances. Against this background, the AMIS Secretariat, in collaboration with FAO&#039;s ' +
								'Statistics Division, developed this web application to provide a model-based estimation of feed demand. An important objective of the tool is to promote debate between ' +
								'commodity analysts and livestock specialists. All those who feel that their scenarios more closely reflect reality are invited to report any proposed changes of the model ' +
								'parameters to the AMIS Secretariat.' +
								'</li>' +
								'</ul>'
							);

							$details.html(
								'<ul class="list-group">' +
								'<li class="list-group-item" style="font-family:Arial;font-size:13px;font-weight:normal; line-height: 18px;"> ' +
								'Feed utilization can essentially be measured in three ways: (i) through <b> surveys</b>, which may provide the most accurate numbers but can be extremely costly, ' +
								'especially when production systems are dispersed and characterized by different and flexible feeding regimes;  ' +
								'(ii) by applying a <b> fixed rate of total supply </b>of a particular feedstuff or by treating feed utilization as the residual variable in this commodity&#039;s  ' +
								'supply and demand balance, which is a very cost-effective approach but may divert results from actual requirements; or (iii) by <b>estimating feed demand  </b>' +
								'through a model-based approach, which is both cost effective and accurate provided that the right parameters and underlying assumptions are applied. ' +
								'What is more, estimating feed demand has the important advantage of directly linking feed utilization to the dynamic changes in the ' +
								'livestock and aquaculture sector. This is particularly important in view of rising demand for animal products and the sector&#039;s continued intensification. ' +

								'</li>' +
								'</ul>'
							);

							$model.html(
								'<ul class="list-group">' +
								'<li class="list-group-item" style="font-family:Arial;font-size:13px;font-weight:normal; line-height: 18px;"> ' +
								'Feed demand is estimated separately for livestock and aquaculture focusing on three parameters: (i) the number of animals (livestock)/production in tonnes (aquaculture); ' +
								'(ii) the share of feed in the overall nutrition of the animal population (as opposed to grass, forages and roughages); and (iii) the biological energy and protein requirements ' +
								'of each animal type. The model distinguishes eight major livestock categories and twelve categories of aquaculture. In the present application only the parameters for the ' +
								'livestock categories can be simulated individually, while the aquaculture component is fixed. Energy requirements are expressed in megajoule (MJ) while protein requirements ' +
								'aremeasured in metric tonnes (MT). In addition, energy and protein requirements can be converted into the weight equivalent of a reference commodity.' +
								'</li>' +
								'</ul>'
							);


							$parameters.html(

								'<ul class="list-group">' +
								'<li class="list-group-item" style="font-family: Arial;font-size:13px;font-weight:normal; line-height: 18px;"> ' +
								'(i)	<b>Number of animals/ fish production in tonnes: </b>gives an indication of the size of the animal population ' +
								'that needs to be maintained. In the case of livestock, it is a simple headcount of the different species; for aquaculture, annual production volumes are considered.  <br /><br />' +

								'(ii)	<b>Share of feed in the overall nutrition of the animal population:</b> denotes the percentage of the nutritional requirements of an animal and the entire animal ' +
								'population that are met by (processed) agricultural products, rather than through natural forms of feeding such as grazing or the supply of forages and roughages. In this ' +
								'respect, the parameter can be considered a measure of intensification. <br /><br />' +

								'(iii)	<b>Biological energy and protein requirements:</b> capture the amount of feed necessary to maintain a particular animal type. In order to standardize this parameter across animals,' +
								'energy and protein requirements are expressed relative to a reference animal: in this model a mature cow of 500 kg liveweight producing 3,500 kg of milk per year and calving every 13 months.' +
								'This reference animal (or "animal unit") is assumed to require 35,600 MJ of energy and 319 kg of crude protein per year. As can be expected, small animals will have a ' +
								'low value of the so-called "animal unit index" (e.g. chicken at around 0.01, meaning that they need about 1% of the energy or protein required by the reference animal) while the value for cattle ' +
								'will be closer to 1,depending on the specificities in each country.' +
								'</li>' +
								'</ul>'
							);

							$panes.append($background, $details, $model, $parameters);

							$panel.append(
								$panelHeader.append(
									rand,
									$panelTitle

								),
								$panelCollapse.append(
									$panelBody.append(
										$sections,
										$panes
									)
								)
							);

							var item = $panel[0].outerHTML;
							var items = '', newItem;

							for (var i = 0; i < number; i++) {
								newItem = (Math.random() > .5)
									? item
									: item.replace('glyphicon-plus', 'glyphicon-plus');
								items += newItem.replace(/{}/g, i + 1).replace(/{%}/g, Math.round(Math.random() * 100));
							}


							$('#accordion').html(items).on('click', 'a.panelToggle', function () {
								var $el = $(this).closest('.panel');
								setTimeout(function () {
									$('html, body').animate({
										scrollTop: $el.offset().top
									}, 500);
								}, 350);

							});


							$('.nav-tabs').on('click', 'a', function () {
								$(this).css({
									'color': 'white',
									'background': 'green'
								}).closest('li').siblings().find('> a').css({
									'color': '#333333',
									'background': 'white'
								});
								$(this).closest('.panel-body').find('.tab-content').children().slideUp().parent().find('.' + this.className).slideDown();

							});



							$('.glyphicon-align-plus')



						});

				</script>


				<script type="text/javascript">
					function getData() {
						//	console.log($('#selectCountry').val());

						if ($('#selectCountryVD').val() == null) {
							//alert("please select at least one country for Visualize Data");
							$('#animalData').empty();
							return false;
						}
						var country = "";
						$.each($("#selectCountryVD option:selected"), function () {
							country = country.concat($(this).val());
							country = country.concat(",");
						});

						var property = $("#selectIndexVD option:selected").val().trim().toString();
						var unitIndex = $("input[name='selectEnergyEquivalentVD']:checked").val();

						//alert(property);
						//alert(unitIndex);



						jQuery.ajax({
							type: "GET",
							//url: getContextPath() + "/getData.html",
                            url: encodeURI(getContextPath()+"/getData.html"),
							data: ({
								country: country,
								unitIndex: unitIndex,
								property: property

							}),
							success: function (data) {

								jQuery("#animalData").html(data);

							}
						});

					}

					function getContextPath() {
						pn = location.pathname;
						len = pn.indexOf("/", 1);
						cp = pn.substring(0, len);
						return cp;
					}

					function getScenarioData() {
						if ($('#selectCountrySA').val() == null) {
							alert("please select any country for Scenario Analysis");
							return false;
						}
						else if ($('#selectCountrySA').val().length > 1) {
							alert("please select only one country for Scenario Analysis");
							return false;
						}
						else if ($('#selectIndexSA').val() == "") {
							alert("please select at least one commodity for Scenario Analysis");
							return false;
						}
						var country = "";
						$.each($("#selectCountrySA option:selected"), function () {
							country = country.concat($(this).val()).toString();
						});



						var property = $("#selectIndexSA option:selected").val().trim()


						var unitIndex = $("input[name='selectEnergyEquivalentSA']:checked").val();



						window.location.href = getContextPath()
							+ "/showSimulator.html?country=" + country + "&property="
							+ property + "&unitIndex=" + unitIndex;
					}

					function goHome() {

						window.location.href = "http://www.amis-outlook.org/";
					}

					function goVisualize() {
						window.location.href = getContextPath();
					}

					function showScenario() {
						window.location.href = getContextPath()
							+ "/showSimulator.html";

					}

				</script>


			</head>

			<body>

				<body id="pageBody" style="background-color: #D7D6D4">
					<div id="wrapper">
						<div id="navigation" class="banner" style="">
							<div>
								<div class="container">
									<div id="c134044" class="csc-default">
										<p class="bodytext"><a href="http://www.amis-outlook.org/" title="AMIS homepage" class="internal-link"><img
                            alt="AMIS homepage" src="views/assets/img/amis_logo.jpg" height="129" width="260"></a></p>
									</div>
								</div>
							</div>
						</div>
						<ol class="breadcrumb">
							<li>
								<a class="active" style="cursor:pointer; color: #A9A9A9;" onclick="goHome();">
									<!-- Visualize estimated feed demand -->
								</a>
							</li>
							<li>
								<a style="cursor:pointer;" onclick="showScenario();">
									<!-- Scenario Analysis  -->
								</a>
							</li>
							<li style="float: right"><a style="cursor:pointer;" onclick="goHome();">HOME </a></li>
						</ol>

						<div class="container">
							<div id="textArea" class="row" style="padding-left: 80px; padding-right: 70px">
								<center>
									<h4 style="font-family:Arial;font-size:20px">Online Feed Calculator</h4>
								</center>
								<p style="font-family:Arial;font-size:13px;font-weight:normal; line-height: 18px;">Welcome to the <b>Online Feed Calculator</b> of the Agricultural Market Information System (AMIS). The tool estimates
									a country&#039;s feed demand by considering the number of livestock and fish that need to be maintained, their energy
									and protein requirements, and the share of intensified production. Users can visualize default values or test different
									scenarios by modifying the underlying model parameters.</p>

								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
									<div class="panel-group" id="accordion">
									</div>
								</div>
							</div>
<!--
							<div class="row">
								<div align="right" style="padding-left: 80px; padding-right: 70px">
									<a id="toggleButton" onclick="toggleText();" href="javascript:void(0);" style="font-family:Arial;font-size:13px;display:inline-block;color:#dc3018">See less</a>
								</div>
							</div>-->

							<div class="row">
								<div class="col-md-3"></div>
								<div class="col-md-3" id="formTabOne" align="left" data-toggle="tooltip" data-placement="left">
									<div class="form-group" id="visualize" style="margin-top:20px; font-family:Arial;font-size:13px;">
										<button type="button" class="btn btn-danger" style=" width : 180px; text-align: left; " id="regenerateData" onClick="goVisualize();">Visualize default values</button>


									</div>
								</div>
								<div class="col-md-3" id="formTabOne" align="left" data-toggle="tooltip" data-placement="left">
									<div class="form-group" id="scenario" style="margin-top:20px; font-family:Arial;font-size:13px;">
										<button type="button" class="btn btn-default " style=" width : 180px; text-align: left; " id="regenerateData" onClick="showScenario();">Test different scenarios</button>
									</div>
								</div>
								<div class="col-md-3"></div>
							</div>
						</div>


						<div class="container" id="page" style="padding-top: 30px">
							<div id="visualizeDiv">

								<div class="row" style="background-color:CornflowerBlue; ">
									<div class="col-md-4" id="formTabOne" data-toggle="popover" data-trigger="hover" data-placement="top" title="Select as many countries as you want. You can de-activate countries directly in the chart by clicking on its name in the legend.">
										<div class="form-group">
											<label style="color:white;font-size:16px; cursor: pointer;padding:25px 0 0px 20px; font-family:arial">Select country/ies <font color="white">[?]</font><br /></label>
										</div>
									</div>
									<div class="col-md-4" id="formTabThree" data-toggle="popover" data-trigger="hover" data-placement="bottom" title="The model can either estimate energy requirements (measured in megajoule: MJ) or protein requirements (measured in metric tonnes: MT). If you select a base commodity as reference, both energy and protein requirements will be converted into the weight equivalent of that commodity (in MT).">
										<div class="form-group" id="unitFormGroup">
											<label for="selectEnergyEquivalent" style="color:white;font-size:16px; cursor: pointer;font-family:arial">Select whether results should show energy or protein requirements <font color="white">[?]</font></label><br/>
										</div>
									</div>
									<div class="col-md-4" id="formTabTwo" data-toggle="popover" data-trigger="hover" data-placement="top" title="To facilitate the understanding of the model outputs, results can be converted into the weight equivalent of a reference commodity. If a reference commodity is selected, results show how much of that commodity is needed to satisfy estimated energy and protein demand. Cereals generally provide more energy while cakes are rich in protein, so results can vary significantly depending on the specific selection.">
										<div class="form-group" id="eeFormGroup">
											<label for="selectIndex" style="color:white;font-size:16px; cursor: pointer;font-family:arial">Select base commodity as reference<font color="white">[?]</font>(optional)</label>											<br />
										</div>
									</div>

								</div>

								<div class="row" style="background-color:CornflowerBlue; ">
									<div class="col-md-4" id="formTabOne">
										<div class="form-group" id="countryIdList">
											<select id="selectCountryVD" multiple="multiple" title='Choose one or more..' data-live-search="true" onchange="getData();">
						<c:choose>
							<c:when test="${not empty countryList}">
								<c:forEach items="${countryList}" var="country"
									varStatus="varStatus">
											<option name="cList" value="${country.countryId}" >
												${country.countryName}</option>
									</c:forEach>
							</c:when>
						</c:choose>


					</select>
										</div>
									</div>

									<div class="col-md-4" id="formTabThree">
										<div class="form-group" id="unitFormGroup">
											<label style="color:white; float:left; width:100px; cursor:pointer"><input type="radio"  name="selectEnergyEquivalentVD" onchange="getData();" value="Energy" checked="checked" >Energy</label>
											<label style="color:white; float:left; width:100px; cursor:pointer"><input type="radio" name="selectEnergyEquivalentVD" onchange="getData();" value="Protein" >Protein</label>
										</div>
									</div>
									<div class="col-md-4" id="formTabTwo">
										<div class="form-group" id="eeFormGroup">
											<select class="selectBox" id="selectIndexVD" onchange="getData();" title='Choose one or more..'>
						<option selected="selected" value="" >None</option>
						<c:choose>
							<c:when test="${not empty propertyList}">
								<c:forEach items="${propertyList}" var="property"
									varStatus="varStatus">
									<option name="pList" value="${property.propertyName}">
										${property.propertyName}</option>
								</c:forEach>
							</c:when>
						</c:choose>
					</select>
										</div>
									</div>


								</div>
							</div>
							<div name="animalData" id="animalData"></div>
						</div>
					</div>

				</body>
			</body>

			</html>