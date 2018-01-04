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
<link href="views/assets/css/bootstrap-select.css" rel="stylesheet">
<link href="views/assets/css/bordered.css" rel="stylesheet">
<link href="views/assets/css/bootstrap-datetimepicker.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="views/assets/css/main.css" rel="stylesheet">
<link
	href='https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Raleway:400,300,700'
	rel='stylesheet' type='text/css'>
<!--popover-->
   <style type="text/css">
    .popover{
        max-width:300px;
	
		
    }
	.popover-title{
   
}
</style>
<script type="text/javascript" src="views/assets/js/jquery.min.js"></script>
<script type="text/javascript" src="views/assets/js/bootstrap.js"></script>
<script type="text/javascript" src="views/assets/js/bootbox.js"></script>
<script type="text/javascript" src="views/assets/js/jasny-bootstrap.js"></script>
<script type="text/javascript" src="views/assets/js/bootstrap-select.js"></script>
<script type="text/javascript" src="views/assets/js/moment.js"></script>
<script type="text/javascript" src="views/assets/js/highcharts.js"></script>
<script type="text/javascript" src="views/assets/js/grid-light.js"></script>
<script type="text/javascript" src="views/assets/js/bootstrap-datetimepicker.min.js"></script>
<!--<script type="text/javascript" src="views/assets/js/bootstrap-modal.js"></script>
<script type="text/javascript" src="views/assets/js/bootstrap-modalmanager.js"></script>
-->
<script type="text/javascript">
var status = "more";
function toggleText()
{
    var text=
		"<center><h4 style='font-family:Arial;font-size:13px'>Online Feed Calculator</h4></center>"
							+ "<p style='font-family:Arial;font-size:13px;font-weight:normal; line-height: 18px;'>Welcome to the <b>Online Feed Calculator</b> of the Agricultural Market Information System (AMIS). "
							+ "		The tool estimates a country &#039; s feed demand by considering the number of livestock and fish that need to be maintained, their energy and protein requirements, and the share of intensified production. "
							+ "		 Users can visualize default values or test different scenarios by modifying the underlying model parameters.</p>"
							+ "<div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>"
							+ "   <div class='panel-group' id='accordion'>"
							+ "    </div>"
							+ "</div>";
    if (status == "less") {
        document.getElementById("textArea").innerHTML=text;
							  var number = 1;
  
  var $panel = $('<div ></div>');
  var $panelHeader = $('<div ></div>');
  var $panelTitle = $('<h3 class="panel-title" style="font-family:Open Sans;font-size:13px;display:inline-block;color:#dc3018"><a data-toggle="collapse" data-parent="#accordion" href="#collapse{}" class="panelToggle"><b>More information</b></a></h3>');
 
  
  
  var rand = $('<span style="margin-right : 10px;" class="glyphicon glyphicon-plus"></span>');
  
  var $panelCollapse = $('<div id="collapse{}" class="panel-collapse collapse"></div>');
  var $panelBody = $('<div class="panel-body"></div>');
  
  var $sections = $('<ul class="nav nav-tabs nav-justified"></ul>');
  $sections.html(
 	'<li class="active"><a href="" style="color: white;background:green;font-family:Open Sans;font-size:13px;"  data-toggle="tab" class="background" >Background </a></li>' +
  	'<li class="active"><a href="" style="font-family:Open Sans;font-size:13px;" data-toggle="tab" class="details">Why use a model approach?</a></li>' +
  	'<li class="active"><a href="" style="font-family:Open Sans;font-size:13px;" data-toggle="tab" class="model">About the model</a></li>'+
	'<li class="active"><a href="" style="font-family:Open Sans;font-size:13px;" data-toggle="tab" class="parameters">About the model parameters</a></li>'
  );
  var $panes = $('<div class="tab-content"></div>');
  var $background = $('<div class="background"></div>');
  var $details = $('<div class="details" style="display:none;"></div>');
  var $model = $('<div class="model" style="display:none;"></div>');
  var $parameters = $('<div class="parameters" style="display:none;"></div>');
  
  // More information
  
  $background.html(
    '<ul class="list-group">' +
    	'<li class="list-group-item list-group-item-info" style="font-family:Open Sans;font-size:13px;font-weight:normal; line-height: 18px;">'+
		'In order to improve transparency in international commodity markets, AMIS needs high quality information on the supply and demand situation of the AMIS crops: '+
		'wheat, maize, rice and soybeans. Although a significant (and growing) part of these crops is used for animal feed, knowledge on feed utilization is scarce, '+
		'with negative implications also on the quality of other elements in supply and demand balances. Against this background, the AMIS Secretariat, in collaboration with FAOs '+
		'Statistics Division, developed this web application to provide a model-based estimation of feed demand. . An important objective of the tool is to promote debate between '+
		'commodity analysts and livestock specialists. All those who feel that their scenarios more closely reflect reality are invited to report any proposed changes of the model '+
		'parameters to the AMIS Secretariat.'+
		'</li>' +
 	'</ul>'
  );
  
  $details.html(
    		'<ul class="list-group">' +
    			'<li class="list-group-item" style="font-family:Open Sans;font-size:13px;font-weight:normal; line-height: 18px;"> ' +
				'Feed utilization can essentially be measured in three ways: (i) through <b> surveys</b>, which may provide the most accurate numbers but can be extremely costly, ' +
				'especially when production systems are dispersed and characterized by different and flexible feeding regimes;  ' +
				"(ii) by applying a <b> fixed rate of total supply </b>of a particular feedstuff or by treating feed utilization as the residual variable in this commodity's  " +
				'supply and demand balance, which is a very cost-effective approach but may divert results from actual requirements; or (iii) by <b>estimating feed demand  </b>' +
				'through a model-based approach, which is both cost effective and accurate provided that the right parameters and underlying assumptions are applied. ' +
				'What is more, estimating feed demand has the important advantage of directly linking feed utilization to the dynamic changes in the ' +
				"livestock and aquaculture sector. This is particularly important in view of rising demand for animal products and the sector's continued intensification. " +
				
				'</li>' +
   			'</ul>' 
  );
  
  $model.html(
      		'<ul class="list-group">' +
    			'<li class="list-group-item" style="font-family:Open Sans;font-size:13px;font-weight:normal; line-height: 18px;"> ' +
				'Feed demand is estimated separately for livestock and aquaculture focusing on three parameters: (i) the number of animals (livestock)/production in tonnes (aquaculture); ' +
				'(ii) the share of feed in the overall nutrition of the animal population(as opposed to grass, forages and roughages); and (iii) the biological energy and protein requirements ' +
				'of each animal type. The model distinguishes eight majorlivestock categories and twelve categories of aquaculture. In the present application only the parameters for the ' +
				'livestock categories can be simulated individually, while the aquaculture component is fixed. Energy requirements are expressed in megajoule (MJ) while protein requirements ' +
				'aremeasured in metric tonnes (MT). In addition, energy and protein requirements can be converted into the weight equivalent of a reference commodity.' +
				'</li>' +
   			'</ul>' 
  );
  
   $parameters.html(
		
      		'<ul class="list-group">' +
    			'<li class="list-group-item" style="font-family: Open Sans;font-size:13px;font-weight:normal; line-height: 18px;"> ' +
				'(i)	<b>Number of animals/ fish production in tonnes: </b>gives an indication of the size of the animal population ' +
				'that needs to be maintained. In the case of livestock, it is a simple headcount of the different species; for aquaculture, annual production volumes are considered.  <br /><br />' +
				
				'(ii)	<b>Share of feed in the overall nutrition of the animal population:</b> denotes the percentage of the nutritional requirements of an animal – and the entire animal ' +
				'population – that are met by (processed) agricultural products, rather than through natural forms of feeding such as grazing or the supply of forages and roughages. In this '+
				'respect, the parameter can be considered a measure of intensification. <br /><br />' +
			
				'(iii)	<b>Biological energy and protein requirements:</b> capture the amount of feed necessary to maintain a particular animal type. In order to standardize this parameter across animals,'+
				'energy and protein requirements are expressed relative to a reference animal: in this model a mature cow of 500 kg liveweight producing 3,500 kg of milk per year and calving every 13 months.'+
				'This reference animal (or "animal unit") is assumed to require 35,600 MJ of energy and 319 kg of crude protein per year. As can be expected, small animals will have a '+
				'low value of the so-called "animal unit index" (e.g. chicken at around 0.01, meaning that they need about 1% of the energy or protein required by the reference animal) while the value for cattle '+
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
  
  for (var i = 0; i < number; i++ ) {
    newItem = (Math.random() > .5) 
    	? item
    	: item.replace('glyphicon-plus', 'glyphicon-plus');
    items += newItem.replace(/{}/g, i + 1).replace(/{%}/g, Math.round(Math.random() * 100));
  }
  
  
  $('#accordion').html(items).on('click', 'a.panelToggle', function() {
    var $el = $(this).closest('.panel');
    setTimeout(function() {
      $('html, body').animate({
          scrollTop: $el.offset().top
      }, 500);
    }, 350);
	
  });


  $('.nav-tabs').on('click', 'a', function() {
	$(this).css({
        'color': 'white',
		'background':'green'
    }).closest('li').siblings().find('> a').css({
        'color': '#333333',
		'background':'white'
    });
    $(this).closest('.panel-body').find('.tab-content').children().slideUp().parent().find('.' + this.className).slideDown();

  });
  

	
  $('.glyphicon-align-plus')
		var cellTotal = document.getElementById("toggleButton");
		cellTotal.innerHTML =  "See less";;
        status = "more";
    } else if (status == "more") {
        document.getElementById("textArea").innerHTML = "";
		var cellTotal = document.getElementById("toggleButton");
		cellTotal.innerHTML =  "See more..";

        status = "less"
    }
}
</script>
<script type="text/javascript">
var previousYear=0;
var initialYear=0;
var lastYearValue =0;

$(document).ready(function(){
    $('[data-toggle="popover"]').popover({ container: 'body', html: true });   
});

function regerateData() {
		var animalData = ${animalRawData};
		var listAnimalName = "${animalNameList}";
		var listAnimalName = listAnimalName.replace("[", ""); 
		var listAnimalName = listAnimalName.replace("]", ""); 
		var arrayAnimalName;
		arrayAnimalName = listAnimalName.split(",");
		
		var propertySelectedKey="";
		var propertyValueMap = new Array();
		<c:forEach var="entry" items="${propertyMap}">
			propertyValueMap["${entry.key}"] = "${entry.value}";
		</c:forEach>

		var propertySelected =  $("#selectIndex option:selected").val().trim().replace(/\s/g,'');
		var unitIndexSelected =$("input[name='selectEnergyEquivalent']:checked").val();
		
		if(unitIndexSelected=="Energy"){
			propertySelectedKey=propertySelected+"Energy";
		}
		else{
			propertySelectedKey=propertySelected+"Protein";
		}	
		var propertyValue = propertyValueMap[propertySelectedKey];
		if(propertySelected=="None"){
			propertyValue=1;
		}
		
		var countryNameMap = new Array();
		<c:forEach var="entry" items="${countryMap}">
				countryNameMap[${entry.key}] = "${entry.value}";
		</c:forEach>
		var countrySelected =  $("#selectCountry option:selected").val().trim();		
		var countryName = countryNameMap[countrySelected];
		var unitIndx =$("input[name='selectEnergyEquivalent']:checked").val();
		
		if(countrySelected!="None"){
		
		var resultArray = [];
		var arrYears = ${yearList};
		var yearSelected = $("#selectYear option:selected").val();
		if(yearSelected==""){
			var latestYear = arrYears[arrYears.length - 1];
		}	
		else{
			latestYear=yearSelected;
		}
		var myarray = [];
		for ( var dataType = 0; dataType < 2; dataType++) {
			resultArray.push(latestYear);
			
				if (unitIndx == "Energy") {
					for ( var animalIndex = 0; animalIndex < arrayAnimalName.length; animalIndex++) {
						var animalName=arrayAnimalName[animalIndex].trim();
						var nutritionEnergy = 0;
						for ( var increment in animalData) {
							if (countryName == animalData[increment].countryName) {
								if (animalName == animalData[increment].animalName) {
									
										if (latestYear == animalData[increment].year) {
											var energyIndex = animalData[increment].energyUnitIndex;
											if(dataType==0){
												var AnimalIdNfg=(animalIndex+1).toString()+"animalNfg";
												var animalNfg;
												if(document.getElementById(AnimalIdNfg).value == "N.A."){
													animalNfg=0;
												}
												else{
													animalNfg=document.getElementById(AnimalIdNfg).value;
												}
												var AnimalIdCount=(animalIndex+1).toString()+"animalCount";
												var anmCount;
												if(document.getElementById(AnimalIdCount).value == "N.A."){
													anmCount=0;
												}
												else{
													anmCount=document.getElementById(AnimalIdCount).value.replace(/\,/g,'');
												}

												var AnimalIdEnergy=(animalIndex+1).toString()+"animalEnergy";
												var energyUI;
												if(document.getElementById(AnimalIdEnergy).value == "N.A."){
													energyUI=0;
												}
												else{
													energyUI=document.getElementById(AnimalIdEnergy).value;
												}
												
												nutritionEnergy = nutritionEnergy
														+ (anmCount * (animalNfg/100) * energyUI);
												}
											
											else{
												var energyIndex = animalData[increment].energyUnitIndex;
												if (energyIndex != null
														&& energyIndex !== undefined) {
													nutritionEnergy = nutritionEnergy
															+ (animalData[increment].animalCount
																	* animalData[increment].nonForageRate * energyIndex);					
												
											}
										}
									}
									
								}
							}
						}
						resultArray.push(formatNumberRoundOff((nutritionEnergy * 35600 ) / (propertyValue*1000000)));
					}
				} else {
					for ( var animalIndex = 0; animalIndex < arrayAnimalName.length; animalIndex++) {
							var animalName=arrayAnimalName[animalIndex].trim();
						var nutritionProtein = 0;
						for ( var increment in animalData) {
							if (countryName == animalData[increment].countryName) {
								if (animalName == animalData[increment].animalName) {
									
										if (latestYear == animalData[increment].year) {
											if(dataType==0){
												var AnimalIdNfg=(animalIndex+1).toString()+"animalNfg";
												var AnimalIdCount=(animalIndex+1).toString()+"animalCount";
												var AnimalIdProtein=(animalIndex+1).toString()+"animalProtein";
												var anmCount;
												if(document.getElementById(AnimalIdCount).value == "N.A."){
													anmCount=0;
												}
												else{
													anmCount=document.getElementById(AnimalIdCount).value.replace(/\,/g,'');
												}
												
												var animalNfg;
												if(document.getElementById(AnimalIdNfg).value == "N.A."){
													animalNfg=0;
												}
												else{
													animalNfg=document.getElementById(AnimalIdNfg).value;
												}
												
												var proteinUI;
												if(document.getElementById(AnimalIdProtein).value == "N.A."){
													proteinUI=0;
												}
												else{
													proteinUI=document.getElementById(AnimalIdProtein).value;
												}
												
												
													nutritionProtein = nutritionProtein
															+ (anmCount	* (animalNfg/100) * proteinUI);

												}
											else{
												var proteinIndex = animalData[increment].proteinUnitIndex;
												if (proteinIndex != null
														&& proteinIndex !== undefined) {
													nutritionProtein = nutritionProtein
															+ (animalData[increment].animalCount
																	* animalData[increment].nonForageRate * proteinIndex);
													}
														
												}
											}
									
											
								}
							}
						}
						resultArray.push(formatNumberRoundOff((nutritionProtein * 0.319) /(propertyValue*1000)));
					}
				}
			
				if(dataType==0){
				var item = {
				name : "New estimate",
				data : [ resultArray[1], resultArray[2],
						 resultArray[3], resultArray[4],
						 resultArray[5], resultArray[6],
						 resultArray[7], resultArray[8]]
					};
				myarray.push(item);
				}
				else{
					var item = {
					name : "Initial estimate",
					data : [ resultArray[10], resultArray[11],
						 resultArray[12], resultArray[13],
						 resultArray[14], resultArray[15],
						 resultArray[16], resultArray[17]]
					};
				myarray.push(item);	
				}	
			}
			
			var resultJson = JSON.stringify(myarray);
			
		var energyType ;
						var subtitle="";
						if(unitIndx == "Energy")
						{	
							if(propertyValue=="1"){
								energyType = "1000 GJ";
								subtitle = " (energy requirements in GJ)";
							}
							else {
							energyType = "1000 MT";
							subtitle = "( energy requirements in "+ propertySelected+" equivalent [MT] )";
							}
						}
						else
						{
							energyType = "1000 MT";
							if(propertyValue=="1"){
								subtitle = " (protein requirements in MT)";							
							}
							else{
								subtitle = " ( protein requirements in "+ propertySelected+" equivalent [MT] )";
							}

						}
							
			$(function () {
    Highcharts.setOptions({
        global: {
            useUTC: false,
            
        },
        lang: {
          thousandsSep: ','
        }
    });						
			
		$('#barGraph').highcharts({
		

			chart: {
				
				type: 'column',
				thousandseparator: ','
			},
			title: {
				text: countryName
			},
			subtitle: {
				text: subtitle
			},
			xAxis: {
				categories: arrayAnimalName,
				crosshair: true
			},
			yAxis: {
				min: 0,
				allowDecimals: false,
				title: {
					text: energyType
				},
		
			},
			credits : {
				enabled : false
			},
			tooltip: {
			pointFormat: '{point.key} <br>{series.name}:{point.y}',
			shared: true
			},
			plotOptions: {
				column: {
					pointPadding: 0.2,
					borderWidth: 0
				}
			},
			series: myarray
		});
	});
	

		var total=0;
		for ( var increment in animalData) {
			if (countryName == animalData[increment].countryName) {
				for ( var animalIndex = 0; animalIndex < arrayAnimalName.length; animalIndex++) {
					var animalName=arrayAnimalName[animalIndex].trim();
					if (animalName == animalData[increment].animalName) {
						var AnimalIdNfg=(animalIndex+1).toString()+"animalNfg";
						var AnimalIdCount=(animalIndex+1).toString()+"animalCount";
						var AnimalIdProtein=(animalIndex+1).toString()+"animalProtein";
						var AnimalIdEnergy=(animalIndex+1).toString()+"animalEnergy";
						var FeedDemand=(animalIndex+1).toString()+"feedDemand";
						
						//var ProteinValue = document.getElementById(AnimalIdProtein).value;		
						var ProteinValue;
						if(document.getElementById(AnimalIdProtein).value == "N.A."){
							ProteinValue=0;
						}
						else{
							ProteinValue=document.getElementById(AnimalIdProtein).value;
						}		
						
						// var NfgValue = document.getElementById(AnimalIdNfg).value;
						var NfgValue;
						if(document.getElementById(AnimalIdNfg).value == "N.A."){
							NfgValue=0;
						}
						else{
							NfgValue=document.getElementById(AnimalIdNfg).value;
						}
						
						// var EnergyValue = document.getElementById(AnimalIdEnergy).value;
						var EnergyValue;
						if(document.getElementById(AnimalIdEnergy).value == "N.A."){
							EnergyValue=0;
						}
						else{
							EnergyValue=document.getElementById(AnimalIdEnergy).value;
						}
						
						
						var anmCount;
						if(document.getElementById(AnimalIdCount).value == "N.A."){
							anmCount=0;
						}
						else{
							anmCount=document.getElementById(AnimalIdCount).value.replace(/\,/g,'');
						}						
						
						
						
							if (latestYear == animalData[increment].year) {
									var nutritionEnergy = 0;
									var nutritionProtein = 0;
									
							if(anmCount!=animalData[increment].animalCount){
								var x = document.getElementById(AnimalIdCount);
								x.style.color = '#E66C2C';
							}
							if(NfgValue!=(animalData[increment].nonForageRate)*100){
								var x = document.getElementById(AnimalIdNfg);
								x.style.color = '#E66C2C';
							}	
							if(unitIndx=="Energy"){		
								if(EnergyValue!=animalData[increment].energyUnitIndex){
									var x = document.getElementById(AnimalIdEnergy);
									x.style.color = '#E66C2C';
								}		
							}
							else{							
								if(ProteinValue!=animalData[increment].proteinUnitIndex){
									var x = document.getElementById(AnimalIdProtein);
									x.style.color = '#E66C2C';
								}		
							}				
								if(unitIndx=="Energy"){
									
									nutritionEnergy = nutritionEnergy
												+ ((NfgValue * anmCount * EnergyValue * 35600) / (propertyValue*1000000));
						
									total=total+ formatNumberRoundOff(nutritionEnergy/100);
									
									nutritionEnergy = formatNumber(	formatNumberRoundOff(nutritionEnergy/100));	
									
									var cell = document.getElementById(FeedDemand);
									cell.innerHTML = nutritionEnergy;					
								//	document.getElementById(FeedDemand).value=nutritionEnergy;
										
								}
								else{
					
								nutritionProtein = nutritionProtein
												+ ((NfgValue * anmCount * ProteinValue * 0.319) / (propertyValue*1000) );
									total=total+formatNumberRoundOff(nutritionProtein/100);			
									nutritionProtein = formatNumber(formatNumberRoundOff(nutritionProtein/100));	
									
									var cell = document.getElementById(FeedDemand);
									cell.innerHTML = nutritionProtein;					
								//	document.getElementById(FeedDemand).value=nutritionProtein;
								}
							}
						

					}
				}
			}
		}
		
		var aquaValue = document.getElementById("aquaId").innerHTML;
		aquaValue.innerHTML=formatNumberRoundOff(aquaValue);
		aquaValue = aquaValue.replace(/\,/g,'');
		total=parseInt(aquaValue) + total;
		total = formatNumber(total);
		var cellTotal = document.getElementById("totalValueNew");
		cellTotal.innerHTML = total;			


			$('#collapseTable').empty();
			
			$('#collapseChangeInfoTable').empty();
			
		var resultArray = [];

		var subtitle="";
		if(unitIndx == "Energy")
		{	
			if(propertyValue=="1"){
				energyType = "1000 GJ";
				subtitle = " (energy requirements in GJ)";
			}
			else {
			energyType = "1000 MT";
			subtitle = " ( energy requirements in "+ propertySelected+" equivalent [MT] )";
			}
		}
		else
		{
			energyType = "1000 MT";
			if(propertyValue=="1"){
				subtitle = " (protein requirements in MT)";							
			}
			else{
				subtitle = " ( protein requirements in "+ propertySelected +" equivalent [MT] )";
			}

		}
				
		var arrYears = ${yearList};
		
		if (unitIndx == "Energy") {
			var jsonData = makeEnergyJson(propertyValue);
		} else {
			var jsonData = makeProteinJson(propertyValue);
		}

						var pieChartTooltipTitle = "";
						if(unitIndx == "Energy")
						{	
							if(propertyValue=="1"){
								energyType = "1000 GJ";
						
								pieChartTooltipTitle = "energy requirements in GJ";
							}
							else {
							energyType = "1000 MT";
						
							pieChartTooltipTitle ="energy requirements in "+ propertySelected+" equivalent [MT] ";
							}
						}
						else
						{
							energyType = "1000 MT";
							if(propertyValue=="1"){
						
								pieChartTooltipTitle = "protein requirements in MT";
							}
							else{
						
								pieChartTooltipTitle = "protein requirements in "+ propertySelected+" equivalent [MT]";
							}

						}
		
		$('#lineChartDiv').highcharts({
			title : {
				text : 'Estimated Feed Demand',
				x : -20
			//center
			},
			subtitle : {
				text : subtitle,
				x : -20
			},
			xAxis : {
				categories : arrYears,
				 title: {
									text: 'YEAR'
								}
			},
			yAxis : {
				plotLines : [ {
					value : 0,
					width : 1,
					color : '#808080',
				} ],
				min : 0,
				title: {
                        text: energyType
                       }
			},
			credits : {
				enabled : false
			},
			legend : {
				layout : 'vertical',
				align : 'right',
				verticalAlign : 'middle',
				borderWidth : 0
			},
			tooltip: {
				formatter: function() {
				return this.series.name +'<br>' + pieChartTooltipTitle  +":"  +formatNumber(this.y) ;
				}
			},
			series : jsonData
		});	
			
		getPieChart();	
	}
		else{
			$('#barGraph').empty();
			$('#lineChartDiv').empty();
		}

	var x = document.getElementById('regenerateData');
	x.style.background = '#428bca';
	x.style.color = '#ffffff';	
}



	function getContextPath() {
		pn = location.pathname;
		len = pn.indexOf("/", 1);
		cp = pn.substring(0, len);
		return cp;
	}
	
	function generateScenario(latestYear) {
		var animalData = ${animalRawData};
		var listAnimalName = "${animalNameList}";
		var listAnimalName = listAnimalName.replace("[", ""); 
		var listAnimalName = listAnimalName.replace("]", ""); 
		var arrayAnimalName;
		arrayAnimalName = listAnimalName.split(",");
		//var propertyValue=${propertyValue};
		
		var propertySelectedKey="";
		var propertyValueMap = new Array();
		<c:forEach var="entry" items="${propertyMap}">
			propertyValueMap["${entry.key}"] = "${entry.value}";
		</c:forEach>

		var propertySelected =  $("#selectIndex option:selected").val().trim().replace(/\s/g,'');
		var unitIndexSelected =$("input[name='selectEnergyEquivalent']:checked").val();
		
		if(unitIndexSelected=="Energy"){
			propertySelectedKey=propertySelected+"Energy";
		}
		else{
			propertySelectedKey=propertySelected+"Protein";
		}	
		var propertyValue = propertyValueMap[propertySelectedKey];
		
		if(propertySelected=="None"){
			propertyValue=1;
		}
		
		
		var countryNameMap = new Array();
		<c:forEach var="entry" items="${countryMap}">
				countryNameMap[${entry.key}] = "${entry.value}";
		</c:forEach>
		var countrySelected =  $("#selectCountry option:selected").val().trim();		
		var countryName = countryNameMap[countrySelected];
		
		if(countrySelected!="None")	{
	
		var unitIndx =$("input[name='selectEnergyEquivalent']:checked").val();

		var resultArray = [];
		resultArray.push(latestYear);

			if (unitIndx == "Energy") {
				for ( var animalIndex = 0; animalIndex < arrayAnimalName.length; animalIndex++) {
					
					var animalName=arrayAnimalName[animalIndex].trim();
					var nutritionEnergy = 0;
					for ( var increment in animalData) {
					
						if (countryName == animalData[increment].countryName) {
					
							if (animalName == animalData[increment].animalName) {
						
							if (latestYear == animalData[increment].year) {
								var energyIndex = animalData[increment].energyUnitIndex;
								if (energyIndex != null
										&& energyIndex !== undefined) {
										
									nutritionEnergy = nutritionEnergy
											+ (animalData[increment].animalCount
													* animalData[increment].nonForageRate * energyIndex);
								}
							}
							}
						}
					}
					resultArray.push(formatNumberRoundOff((nutritionEnergy * 35600 )/ (propertyValue*1000000)));	
				}
			} else {
				for ( var animalIndex = 0; animalIndex < arrayAnimalName.length; animalIndex++) {
						var animalName=arrayAnimalName[animalIndex].trim();
					var nutritionProtein = 0;
					for ( var increment in animalData) {
						if (countryName == animalData[increment].countryName) {
							if (animalName == animalData[increment].animalName) {
							
							if (latestYear == animalData[increment].year) {
								var proteinIndex = animalData[increment].proteinUnitIndex;
								if (proteinIndex != null
										&& proteinIndex !== undefined) {
									nutritionProtein = nutritionProtein
											+ (animalData[increment].animalCount
													* animalData[increment].nonForageRate * proteinIndex);
								}
							}
							}
						}
					}
					resultArray.push( formatNumberRoundOff((nutritionProtein * 0.319) / (propertyValue*1000)));		
				}
			}

			var myarray = [];
			var item = {
				name : "Initial estimate",
				data : [ resultArray[1], resultArray[2],
						 resultArray[3], resultArray[4],
						 resultArray[5], resultArray[6],
						 resultArray[7], resultArray[8]]
			};
			myarray.push(item);

			var resultJson = JSON.stringify(myarray);
						var energyType="";
						var subtitle="";
						
						if(unitIndx == "Energy")
						{	
							if(propertyValue=="1"){
								energyType = "1000 GJ";
								subtitle = "Estimated feed demand by animal type/species (energy requirements in GJ)";
						
							}
							else {
							energyType = "1000 MT";
							subtitle = "Estimated feed demand by animal type/species ( energy requirements in "+ propertySelected+" equivalent [MT] )";
						
							}
						}
						else
						{
							energyType = "1000 MT";
							if(propertyValue=="1"){
								subtitle = "Estimated feed demand by animal type/species (protein requirements in MT)";							
						
							}
							else{
								subtitle = "Estimated feed demand by animal type/species( protein requirements in "+ propertySelected+" equivalent [MT] )";
						
							}

						}
						
		$(function () {
    Highcharts.setOptions({
        global: {
            useUTC: false,
            
        },
        lang: {
          thousandsSep: ','
        }
    });	
		$('#barGraph').highcharts({
			chart: {
				type: 'column'
			},
			title: {
				text: countryName
			},
			subtitle: {
				text: subtitle
			},
			xAxis: {
				categories: arrayAnimalName,
				crosshair: true
			},
			credits : {
				enabled : false
			},
			yAxis: {
				min: 0,
			    allowDecimals: false,
				title: {
					text: energyType
				}
			},
			
			 lang: {
         
          thousandsSep: ','
        },
			tooltip: {
			pointFormat: '{point.key} <br>{series.name}:{point.y}',
			shared: true

			},
			plotOptions: {
				column: {
					pointPadding: 0.2,
					borderWidth: 0
				}
			},
			series: myarray
		});
		});
		}
		else{
			$('#barGraph').empty();
			$('#lineChartDiv').empty();
		}

	}
/*
formatter: function() {
					return (this.key) +'<br>' + (this.series.name) +' :'+formatNumber(this.y);
				}
				headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
				pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
					'<td style="padding:0"><b>{point.y:,1f} </b></td></tr>',
				footerFormat: '</table>',
				shared: true,
				useHTML: true
				
				

*/	
	
$(document).ready(function(){

						$('#selectCountry').selectpicker({
							size : 'auto',
							maxOptions : 1
						});
						$('#selectIndex').selectpicker({
							size : 'auto',
							width : '220px'
						});
						$('#selectEnergyEquivalent').selectpicker({
							size : 'auto',
							width : '150px'
						});
						$('#selectYear').selectpicker({
							size : 'auto',
							width : '130px'
						});
						
						
						var number = 1;
					
  
  var $panel = $('<div ></div>');
  var $panelHeader = $('<div ></div>');
  var $panelTitle = $('<h3 class="panel-title" style="font-family:Open Sans;font-size:13px;display:inline-block;color:#dc3018"><a data-toggle="collapse" data-parent="#accordion" href="#collapse{}" class="panelToggle"><b>More information</b></a></h3>');
 
  
  
  var rand = $('<span style="margin-right : 10px;" class="glyphicon glyphicon-plus"></span>');
  
  var $panelCollapse = $('<div id="collapse{}" class="panel-collapse collapse"></div>');
  var $panelBody = $('<div class="panel-body"></div>');
  
  <!--Setting Up the tabs-->
  
  var $sections = $('<ul class="nav nav-tabs nav-justified"></ul>');
  $sections.html(
 	'<li class="active" ><a href="" role="tab" style="color: white;background:green;font-family:Open Sans;font-size:13px;" data-toggle="tab" class="background" >Background</a></li>' +
  	'<li class="active"><a href="" role="tab" style="font-family:Open Sans;font-size:13px;" data-toggle="tab" class="details">Why use a model approach?</a></li>' +
  	'<li class="active"><a href="" role="tab" style="font-family:Open Sans;font-size:13px;" data-toggle="tab" class="model">About the model</a></li>'+
	'<li class="active"><a href="" role="tab" style="font-family:Open Sans;font-size:13px;" data-toggle="tab" class="parameters">About the model parameters</a></li>'
  );
  var $panes = $('<div class="tab-content"></div>');
  var $background = $('<div class="background"></div>');
  var $details = $('<div class="details" style="display:none;"></div>');
  var $model = $('<div class="model" style="display:none;"></div>');
  var $parameters = $('<div class="parameters" style="display:none;"></div>');
  $background.html(
    '<ul class="list-group">' +
    	'<li class="list-group-item list-group-item-info" style="font-family:Open Sans;font-size:13px;font-weight:normal; line-height: 18px;">'+
		'In order to improve transparency in international commodity markets, AMIS needs high quality information on the supply and demand situation of the AMIS crops: '+
		'wheat, maize, rice and soybeans. Although a significant (and growing) part of these crops is used for animal feed, knowledge on feed utilization is scarce, '+
		'with negative implications also on the quality of other elements in supply and demand balances. Against this background, the AMIS Secretariat, in collaboration with FAOs '+
		'Statistics Division, developed this web application to provide a model-based estimation of feed demand. . An important objective of the tool is to promote debate between '+
		'commodity analysts and livestock specialists. All those who feel that their scenarios more closely reflect reality are invited to report any proposed changes of the model '+
		'parameters to the AMIS Secretariat.'+
		'</li>' +
 	'</ul>'
  );
  
  $details.html(
    		'<ul class="list-group">' +
    			'<li class="list-group-item" style="font-family:Open Sans;font-size:13px;font-weight:normal; line-height: 18px;"> ' +
				'Feed utilization can essentially be measured in three ways: (i) through <b> surveys</b>, which may provide the most accurate numbers but can be extremely costly, ' +
				'especially when production systems are dispersed and characterized by different and flexible feeding regimes;  ' +
				"(ii) by applying a <b> fixed rate of total supply </b>of a particular feedstuff or by treating feed utilization as the residual variable in this commodity's  " +
				'supply and demand balance, which is a very cost-effective approach but may divert results from actual requirements; or (iii) by <b>estimating feed demand  </b>' +
				'through a model-based approach, which is both cost effective and accurate provided that the right parameters and underlying assumptions are applied. ' +
				'What is more, estimating feed demand has the important advantage of directly linking feed utilization to the dynamic changes in the ' +
				"livestock and aquaculture sector. This is particularly important in view of rising demand for animal products and the sector's continued intensification. " +
				
				'</li>' +
   			'</ul>' 
  );
  
   $model.html(
      		'<ul class="list-group">' +
    			'<li class="list-group-item" style="font-family:Open Sans;font-size:13px;font-weight:normal; line-height: 18px;"> ' +
				'Feed demand is estimated separately for livestock and aquaculture focusing on three parameters: (i) the number of animals (livestock)/production in tonnes (aquaculture); ' +
				'(ii) the share of feed in the overall nutrition of the animal population(as opposed to grass, forages and roughages); and (iii) the biological energy and protein requirements ' +
				'of each animal type. The model distinguishes eight majorlivestock categories and twelve categories of aquaculture. In the present application only the parameters for the ' +
				'livestock categories can be simulated individually, while the aquaculture component is fixed. Energy requirements are expressed in megajoule (MJ) while protein requirements ' +
				'aremeasured in metric tonnes (MT). In addition, energy and protein requirements can be converted into the weight equivalent of a reference commodity.' +
				'</li>' +
   			'</ul>' 
  );
  
   $parameters.html(
		
      		'<ul class="list-group">' +
    			'<li class="list-group-item" style="font-family: Open Sans;font-size:13px;font-weight:normal; line-height: 18px;"> ' +
				'(i)	<b>Number of animals/ fish production in tonnes: </b>gives an indication of the size of the animal population ' +
				'that needs to be maintained. In the case of livestock, it is a simple headcount of the different species; for aquaculture, annual production volumes are considered.  <br /><br />' +
				
				'(ii)	<b>Share of feed in the overall nutrition of the animal population:</b> denotes the percentage of the nutritional requirements of an animal - and the entire animal ' +
				'population - that are met by (processed) agricultural products, rather than through natural forms of feeding such as grazing or the supply of forages and roughages. In this '+
				'respect, the parameter can be considered a measure of intensification. <br /><br />' +
			
				'(iii)	<b>Biological energy and protein requirements:</b> capture the amount of feed necessary to maintain a particular animal type. In order to standardize this parameter across animals,'+
				'energy and protein requirements are expressed relative to a reference animal: in this model a mature cow of 500 kg liveweight producing 3,500 kg of milk per year and calving every 13 months.'+
				'This reference animal (or "animal unit") is assumed to require 35,600 MJ of energy and 319 kg of crude protein per year. As can be expected, small animals will have a '+
				'low value of the so-called "animal unit index" (e.g. chicken at around 0.01, meaning that they need about 1% of the energy or protein required by the reference animal) while the value for cattle '+
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
  
  for (var i = 0; i < number; i++ ) {
    newItem = (Math.random() > .5) 
    	? item
    	: item.replace('glyphicon-plus', 'glyphicon-plus');
    items += newItem.replace(/{}/g, i + 1).replace(/{%}/g, Math.round(Math.random() * 100));
  }
  
  
  $('#accordion').html(items).on('click', 'a.panelToggle', function() {
    var $el = $(this).closest('.panel');
    setTimeout(function() {
      $('html, body').animate({
          scrollTop: $el.offset().top
      }, 500);
    }, 350);
	
  });


  $('.nav-tabs').on('click', 'a', function() {
	$(this).css({
          'color': 'white',
		'background':'green'
    }).closest('li').siblings().find('> a').css({
         'color': '#333333',
		'background':'white'
    });
    $(this).closest('.panel-body').find('.tab-content').children().slideUp().parent().find('.' + this.className).slideDown();

  });
  

	
  $('.glyphicon-align-plus')
	
						
						
						
						document.getElementById("generateChartDiv").hidden = true;
						document.getElementById("applyAllYears").hidden = true;
						document.getElementById("reportChangeDiv").hidden = true;
						document.getElementById("pieChartDiv").hidden = true;
						document.getElementById("paraDiv").hidden = true;
						document.getElementById("changeType").hidden= true;
						
							document.getElementById("allYears").checked = false;
	var latestYear="";
	var yearSelected = $("#selectYear option:selected").val();
	if(yearSelected==""){
		var arrYears = ${yearList};
		latestYear = arrYears[arrYears.length - 1];
	}
	else{
		latestYear = yearSelected;
	}	
		generateScenario(latestYear);
		showTable(latestYear,latestYear);
//		regerateData();		
		document.getElementById("collapseDiv").hidden = true;
		document.getElementById("changeType").hidden= true;
		/*				
						var arrYears = ${yearList};
						var latestYear = arrYears[arrYears.length - 1];
						
						generateScenario(latestYear);
						showTable(0,latestYear);*/
					});

function unitIndexChange(){
	BootstrapDialog.confirm('Please note that by switching between energy and protein requirements, parameters will return to their default value', function(result){
            if(result) {
				document.getElementById("allYears").checked = false;
				var arrYears = ${yearList};
				var latestYear = arrYears[arrYears.length - 1];

				var latestYear="";
				var yearSelected = $("#selectYear option:selected").val();
				if(yearSelected==""){
					var arrYears = ${yearList};
					latestYear = arrYears[arrYears.length - 1];
				}
				else{
					latestYear = yearSelected;
				}	
				
								
				generateScenario(latestYear);
				showTable(latestYear,latestYear);	
				regerateData();		
				document.getElementById("collapseDiv").hidden = true;
				document.getElementById("changeType").hidden= true;
            }else {
                var unitIndx =$("input[name='selectEnergyEquivalent']:checked").val();
				$('#unitIndex').empty();
				if(unitIndx=="Protein"){
					$('#unitIndex').append(
					'<label style="color:white; float:left; width:130px; cursor:pointer"><input type="radio" name="selectEnergyEquivalent" onchange="unitIndexChange();" value="Energy" checked="checked" >Energy</label> '
					+'<label style="color:white; float:left; width:130px; cursor:pointer"><input type="radio" name="selectEnergyEquivalent" onchange="unitIndexChange();" value="Protein" >Protein</label>'
					);
				}
				else{
					$('#unitIndex').append(
					'<label style="color:white; float:left; width:130px; cursor:pointer"><input type="radio" name="selectEnergyEquivalent" onchange="unitIndexChange();" value="Energy" >Energy</label> '
					+'<label style="color:white; float:left; width:130px; cursor:pointer"><input type="radio" name="selectEnergyEquivalent" onchange="unitIndexChange();" value="Protein"  checked="checked" >Protein</label>'
					);
				}
            }
        });

}				
	

function resetCountryValue(last){
		var lastValue;
		if(last.oldvalue==undefined){
			lastValue = 1;
		}
		else {
			lastValue = last.oldvalue;
		}
		
        BootstrapDialog.confirm('Please note that by changing a country, parameters will return to their default value', function(result){
            if(result) {
					document.getElementById("allYears").checked = false;
					var latestYear="";
					var yearSelected = $("#selectYear option:selected").val();
					if(yearSelected==""){
						var arrYears = ${yearList};
						latestYear = arrYears[arrYears.length - 1];
					}
					else{
						latestYear = yearSelected;
					}	
						generateScenario(latestYear);
						showTable(latestYear,latestYear);
						regerateData();		
						document.getElementById("collapseDiv").hidden = true;
						document.getElementById("changeType").hidden= true;
            }else {
 				$('#countryIdList').empty();
				$('#countryIdList').append(
					'<select id="selectCountry" class="selectBox" onfocus="this.oldvalue = this.value;" title="Choose one" '
					+ 'data-live-search="true" onchange="resetCountryValue(this); this.oldvalue=this.value;"> ' );
								<c:forEach items='${countryList}' var='country' varStatus='varStatus'> 
								 var countryKey = "<c:out value="${country.countryId}"/>";
								if(countryKey==lastValue){
									$('#selectCountry').append(' <option name="cList" value="${country.countryId}" selected="selected"> ${country.countryName}</option>');
									}
								else{
									$('#selectCountry').append( '<option name="cList" value="${country.countryId}"> ${country.countryName}</option>');
								}
								</c:forEach>
					$('#selectCountry').append(	'</select>');

					$('#selectCountry').selectpicker({
									size : 'auto',
									maxOptions : 1
								});
            }
        }); 

}

function resetPropertyValue(last){

		var lastValue;
		if(last.oldvalue==undefined){
			lastValue = "None";
		}
		else {
			lastValue = last.oldvalue;
		}
		

     BootstrapDialog.confirm('Please note that by changing the base commodity, parameters will return to their default value.', function(result){
            if(result) {
					document.getElementById("allYears").checked = false;
					var arrYears = ${yearList};
					var latestYear = arrYears[arrYears.length - 1];
					
					var latestYear="";
					var yearSelected = $("#selectYear option:selected").val();
					if(yearSelected==""){
						var arrYears = ${yearList};
						latestYear = arrYears[arrYears.length - 1];
					}
					else{
						latestYear = yearSelected;
					}	

					generateScenario(latestYear);
					showTable(latestYear,latestYear);
					regerateData();	
					document.getElementById("collapseDiv").hidden = true;	
					document.getElementById("changeType").hidden= true;
            }else {
                $('#baseComodity').empty();
				$('#baseComodity').append(
					'<select id="selectIndex" class="selectBox" onfocus="this.oldvalue = this.value;" title="Choose one" '
					+ 'data-live-search="true" onchange="resetPropertyValue(this); this.oldvalue=this.value;"> ' );
								if(lastValue == "None"){
									$('#selectIndex').append(' <option value="None" selected="selected"> None </option>');
									
									<c:forEach items='${propertyList}' var='property' varStatus='varStatus'> 
										$('#selectIndex').append( '<option name="pList" value="${property.propertyName}"> ${property.propertyName}</option>');
									</c:forEach>
								}
								else{
									$('#selectIndex').append(' <option value="None"> None </option>');
									<c:forEach items='${propertyList}' var='property' varStatus='varStatus'> 
										var propertyKey = "<c:out value="${property.propertyName}"/>";
										if (propertyKey==lastValue){
											$('#selectIndex').append( '<option name="pList" value="${property.propertyName}" selected="selected">${property.propertyName}</option>');
										}	
										else{
											$('#selectIndex').append( '<option name="pList" value="${property.propertyName}"> ${property.propertyName}</option>');
										}
									</c:forEach>
								}
					$('#selectIndex').append(	'</select>');

					$('#selectIndex').selectpicker({
									size : 'auto',
									width : '220px'
								});
            }
        });

}	


function restoreValue(){
	document.getElementById("allYears").checked = false;
	var latestYear="";
	var yearSelected = $("#selectYear option:selected").val();
	if(yearSelected==""){
		var arrYears = ${yearList};
		latestYear = arrYears[arrYears.length - 1];
	}
	else{
		latestYear = yearSelected;
	}	
		generateScenario(latestYear);
		showTable(latestYear,latestYear);
		regerateData();		
		document.getElementById("collapseDiv").hidden = true;
		document.getElementById("changeType").hidden= true;
		var x = document.getElementById('regenerateData');
	x.style.background = '#428bca';
	x.style.color = '#ffffff';	
}

function highLightChange(){
	var x = document.getElementById('regenerateData');
	x.style.background = '#d43f3a';
	x.style.color = '#ffffff';
}

				
function showTable(previousYear,latestYear){
		var animalData = ${animalRawData};
		var aquacultureData = ${aquacultureData};
		//var propertyValue = ${propertyValue};
		var propertySelectedKey="";
		var propertyValueMap = new Array();
		<c:forEach var="entry" items="${propertyMap}">
			propertyValueMap["${entry.key}"] = "${entry.value}";
		</c:forEach>

		var propertySelected =  $("#selectIndex option:selected").val().trim().replace(/\s/g,'');
		var unitIndexSelected =$("input[name='selectEnergyEquivalent']:checked").val();
		
		if(unitIndexSelected=="Energy"){
			propertySelectedKey=propertySelected+"Energy";
		}
		else{ 
			propertySelectedKey=propertySelected+"Protein";
		}	
		

		var propertyValue = propertyValueMap[propertySelectedKey];
		if(propertySelected=="None"){
			propertyValue=1;
			propertySelected = "";
		}
		else{
			propertySelected = "in " + propertySelected + " equivalent";
		}
			
		var countryNameMap = new Array();
		<c:forEach var="entry" items="${countryMap}">
				countryNameMap[${entry.key}] = "${entry.value}";
		</c:forEach>
		var countrySelected =  $("#selectCountry option:selected").val().trim();		
		var countryName = countryNameMap[countrySelected];
	//	var countryName = "${countryName}";
//		var unitIndx = "${unitIndex}";

		var unitIndx =$("input[name='selectEnergyEquivalent']:checked").val();
		
		var listAnimalName = "${animalNameList}";
		var listAnimalName = listAnimalName.replace("[", ""); 
		var listAnimalName = listAnimalName.replace("]", ""); 
		
		var arrayAnimalName;
		arrayAnimalName = listAnimalName.split(",");
		$('#tableAqua').empty();
		
		if(countrySelected!="None"){
			
				document.getElementById("generateChartDiv").hidden = false;
				document.getElementById("applyAllYears").hidden = false;
				document.getElementById("reportChangeDiv").hidden = false;
				document.getElementById("pieChartDiv").hidden = false;
				document.getElementById("paraDiv").hidden = false;
				
				var headingTable= "Estimated feed demand: "+countryName;
			if(document.getElementById("allYears").checked != true){
			
			
				if(unitIndx=="Energy"){
					if(propertyValue==1){
					unitIndexWithUnit = "Energy in 1000 GJ";
					headTablePart = " in 1000 GJ";
					}
					else {
						unitIndexWithUnit = "Energy in 1000 MT";
						headTablePart = " in 1000 MT";
					}
					
				}
				else{
					unitIndexWithUnit = "Protein in 1000 MT";
					headTablePart = " in 1000 MT";
				}
				
				$('#tableAnimal').empty();
				$('#tableAnimalLast').empty();
				initialYear=previousYear;
			
				headingTable = headingTable+", " + latestYear + " ( " + unitIndx + " requirements "+ propertySelected +" "+ headTablePart+")";
                        
						<!--Creating Table-->
						
				$('#tableAnimal')
				.append(
							'<tr><th style="text-align:center;background:red ;  color:white" colspan="8" >'+headingTable	+'</th></tr>' 
								+'<tr>' 
								+ '<th style="text-align: center;" rowspan="2" data-toggle="popover" data-placement="bottom" title="The model distinguishes eight major livestock categories and twelve categories of aquaculture. For the time being, only the livestock categories can be estimated individually while the aquaculture component is fixed.">Species<sub style="cursor:pointer"><font color="black">[?]</font></sub></th>' 
								+ '<th style="text-align: center; width:200px;" rowspan="2" data-toggle="popover" data-placement="top"  title="For livestock categories, this parameter represents the headcount of each species; for aquaculture (not editable), the weight of annual production is considered">Number of animals<sub  style="cursor:pointer"><font color="black">[?]</font></sub></th>'
								+ '<th style="text-align: center; width:100px;" rowspan="2" data-toggle="popover" data-placement="bottom"  title="This parameter captures the share of the respective animal population that is not fed through grazing etc. but receives direct supplementation of nutrients in a concentrated and controlled form (which is typical for intensified production systems)">Intensification rate (in %)<sub  style="cursor:pointer"><font color="black">[?]</font></sub></th>'
								+ '<th style="text-align: center; width:110px;" colspan="2" data-toggle="popover" data-placement="bottom"  title="The AUI measures energy and protein requirements of a particular species relative to a reference animal: in this model a mature cow of 500 kg live weight producing 3,500 kg of milk per year and calving every 13 months. This reference animal (or animal unit) is assumed to require 35,600 MJ of energy and 319 kg of crude protein per year. Obviously, the AUI is lower for small animals (e.g. chicken) while the value for cattle will be closer to or above 1, depending on the specificities in each country. ">Animal Unit Index<sub  style="cursor:pointer"><font color="black">[?]</font></sub></th>'
								+ '<th style="text-align: center; width:170px;" colspan="2" data-toggle="popover" data-placement="right"  title="In order to show new estimates using changed parameters, please click on Recalculate results. Results of the calculation using default parameters are shown under initial.">Estimated feed demand<sub  style="cursor:pointer"><font color="black">[?]</font></sub></th>'
								+ '</tr>'
								+'<tr>' 
								+ '<th style="text-align: center; width:150px;"><i>Energy</i></th>'
								+ '<th style="text-align: center; width:150px;"><i>Protein</i></th>'
								+ '<th style="text-align: center; width:150px;"><i>New</i></th>'
								+ '<th style="text-align: center; width:150px;"><i>Initial</i></th>'
								+ '</tr>');
								
				$('[data-toggle="popover"]').popover({ container: 'body', html: true });   				
				var total=0;
				for ( var increment in animalData) {
				if (countryName == animalData[increment].countryName) {
					
					for ( var animalIndex = 0; animalIndex < arrayAnimalName.length; animalIndex++) {
						var animalName=arrayAnimalName[animalIndex].trim();
						if (animalName == animalData[increment].animalName) {
								previousYear=latestYear;
								if (latestYear == animalData[increment].year) {
									
									
									if(unitIndx=="Energy"){
										var nutritionEnergy = 0;
										nutritionEnergy = ( (animalData[increment].animalCount
															* animalData[increment].nonForageRate * animalData[increment].energyUnitIndex * 35600) /( propertyValue*1000000));
										
										nutritionEnergy = formatNumberRoundOff(nutritionEnergy);
										total=total+nutritionEnergy	;
										
										nutritionEnergy = formatNumber(nutritionEnergy);
									
										$('#tableAnimal')
										.append(
											
											<!--inserting data into table-->
											
											'<tr>' + '<td style="text-align: center;">' +animalData[increment].animalName + '</td>'  
												+ '<td style="text-align: center;">'
												+ '<input type="text" onkeypress="return validate(event)" id="'+(animalIndex+1)+'animalCount" onchange="highLightChange();" name="'+(animalIndex+1)+'animalCount" size="8"'
												+ 'maxlength="20" class="form-control" style="font-weight:bold ;text-align: right;background-color: #e2ffdc"'
												+ ' value="'+checkForZero(formatNumber(animalData[increment].animalCount))+'"> </td>'
												+ '<td style="text-align: right;">'
												+ '<input type="text" onkeypress="return validate(event)" id="'+(animalIndex+1)+'animalNfg" name="'+(animalIndex+1)+'animalNfg" size="6" onchange="highLightChange();"'
												+ 'maxlength="20" class="form-control" style="font-weight:bold ;text-align: right; background-color: #e2ffdc"'
												+ ' value="'+checkForZero((animalData[increment].nonForageRate)*100)+'"> </td>' 
												+'<td style="text-align: center;">'
												+ '<input type="text" onkeypress="return validate(event)" id="'+(animalIndex+1)+'animalEnergy" name="'+(animalIndex+1)+'animalEnergy" size="6" onchange="highLightChange();"'
												+ 'maxlength="20" class="form-control" style="font-weight:bold ;text-align: right; background-color: #e2ffdc"'
												+ ' value="'+checkForZero(animalData[increment].energyUnitIndex)+'"> </td>' +	 '<td style="text-align: right;background-color: #ffeae9" id="'+(animalIndex+1)+'animalProtein" name="'+(animalIndex+1)+'animalProtein">'
												+ animalData[increment].proteinUnitIndex + '</td>' 
												+ '<td style="text-align: right; background-color: #D0E3FF" id="'+(animalIndex+1)+'feedDemand">'
												+nutritionEnergy+'</td>' 
												+  '<td style="text-align: right; background-color: #D0E3FF" id="'+(animalIndex+1)+'initialFeedDemand">'
												+nutritionEnergy+'</td>' 
												+ '</tr>');		
									}
									else{
																	
									var nutritionProtein = 0;
									nutritionProtein =  ((animalData[increment].animalCount
															* animalData[increment].nonForageRate * animalData[increment].proteinUnitIndex * 0.319) /( propertyValue*1000));
															
										
										//total = formatNumberRoundOff(total);
										
										nutritionProtein = formatNumberRoundOff(nutritionProtein);	
										total=total+nutritionProtein;
										nutritionProtein = formatNumber(nutritionProtein);		
																				
										$('#tableAnimal')
										.append(
												'<tr>' + '<td style="text-align: center;">' + animalData[increment].animalName + '</td>'  
												+ '<td style="text-align: center;">'
												+ '<input type="text" onkeypress="return validate(event)" id="'+(animalIndex+1)+'animalCount" name="'+(animalIndex+1)+'animalCount" size="8" onchange="highLightChange();"'
												+ 'maxlength="20" class="form-control" style="font-weight:bold ;text-align: right; background-color: #e2ffdc"'
												+ ' value="'+checkForZero(formatNumber(animalData[increment].animalCount))+'"> </td>'
												+ '<td style="text-align: right;">'
												+ '<input type="text" onkeypress="return validate(event)" id="'+(animalIndex+1)+'animalNfg" name="'+(animalIndex+1)+'animalNfg" size="6" onchange="highLightChange();"'
												+ 'maxlength="20" class="form-control" style="font-weight:bold ;text-align: right; background-color: #e2ffdc"'
												+ ' value="'+checkForZero((animalData[increment].nonForageRate)*100)+'"> </td>' + '<td style="text-align:right; background-color: #ffeae9" id="'+(animalIndex+1)+'animalEnergy" name="'+(animalIndex+1)+'animalEnergy">'
												+ animalData[increment].energyUnitIndex + '</td>' 
												+ '<td style="text-align: right; ">'
												+ '<input type="text" onkeypress="return validate(event)" id="'+(animalIndex+1)+'animalProtein" name="'+(animalIndex+1)+'animalProtein" size="6" onchange="highLightChange();"'
												+ 'maxlength="20" class="form-control" style="font-weight:bold ;text-align: right; background-color: #e2ffdc"'
												+ ' value="'+checkForZero(animalData[increment].proteinUnitIndex)+'"> </td>' 
												+ '<td style="text-align: right; background-color: #D0E3FF" id="'+(animalIndex+1)+'feedDemand">'
												+nutritionProtein+'</td>' 
												+ '<td style="text-align: right; background-color: #D0E3FF" id="'+(animalIndex+1)+'initialFeedDemand">'
												+nutritionProtein+'</td>' 
												+ '</tr>');		
									}
								}
							}
						}
					}
				}
				for ( var increment in aquacultureData) {
							if (countryName == aquacultureData[increment].countryName) {
								if (latestYear == aquacultureData[increment].year) {
									if(unitIndx=="Energy"){
										var nutritionEnergy = (aquacultureData[increment].nutritionEnergy/1000)/propertyValue ;
										nutritionIndexValue = formatNumberRoundOff(nutritionEnergy);	
									}
									else{
									var nutritionProtein = (aquacultureData[increment].nutritionProtein/1000)/propertyValue;
									nutritionIndexValue = formatNumberRoundOff(nutritionProtein);	
									}	
									
								$('#tableAnimal')
								.append(
								
								'<tr>' 
								+ '<td style="text-align: center; background-color:#D3D3D3">Aquaculture</td>' 
								+ '<td style="text-align: center; background-color:#D3D3D3">--</td>'
								+ '<td style="text-align: center; background-color:#D3D3D3">--</td>'
								+ '<td style="text-align: center; background-color:#D3D3D3">--</td>'
								+ '<td style="text-align: center; background-color:#D3D3D3">--</td>'
								+ '<td style="text-align: right; background-color:#D3D3D3" id="aquaId">'+formatNumber(nutritionIndexValue)+'</td>'
								+ '<td style="text-align: right; background-color:#D3D3D3" >'+formatNumber(nutritionIndexValue)+'</td>'
								+ '</tr>');

								}
							}
						}
						total =total +nutritionIndexValue;
						
						total = formatNumberRoundOff(total);
						total = formatNumber(total);
						$('#tableAnimal')
								.append(
								
								'<tr>' 
								+ '<td style="text-align: right;" colspan="4"></td>'
								+ '<td style="text-align: right; background-color:red;color:white">Total</td>'
								+ '<td style="text-align: right; width:150px; background-color:red; color:white" id="totalValueNew">'+ total+'</td>'
								+ '<td style="text-align: right; width:150px; background-color:red; color:white" id="totalValue">'+ total+'</td>'
								+ '</tr>');
			}
			else{
			
					var animalCountArray=[];
					var nonForageRateArray=[];
					var energyUnitIndexArray=[];
					var proteinUnitIndexArray=[];
					
					var perChngAnmCountArray=[];
					var perChngNonForgRatArray=[];
					var perChngEnrgUtIdxArray=[];
					var perChngProtUtIdxArray=[];
					
					for ( var animalIndex = 0; animalIndex < arrayAnimalName.length; animalIndex++) {
							var AnimalIdCount=(animalIndex+1).toString()+"animalCount";
							var AnimalIdNfg=(animalIndex+1).toString()+"animalNfg";
							var AnimalIdEnergy=(animalIndex+1).toString()+"animalEnergy";
							var AnimalIdProtein=(animalIndex+1).toString()+"animalProtein";
							var anmCount;
							if(document.getElementById(AnimalIdCount).value == "N.A."){
								anmCount=0;
							}
							else{
								anmCount=document.getElementById(AnimalIdCount).value.replace(/\,/g,'');
							}
							//var anmCount=document.getElementById(AnimalIdCount).value.replace(/\,/g,'');
							
							//var nfg=document.getElementById(AnimalIdNfg).value;
							//var energy=document.getElementById(AnimalIdEnergy).value;
							//var protein=document.getElementById(AnimalIdProtein).value; 
							
							var nfg;
							if(document.getElementById(AnimalIdNfg).value == "N.A."){
								nfg=0;
							}
							else{
								nfg=document.getElementById(AnimalIdNfg).value;
							}

							var energy;
							if(document.getElementById(AnimalIdEnergy).value == "N.A."){
								energy=0;
							}
							else{
								energy=document.getElementById(AnimalIdEnergy).value;
							}
							
							
							var protein;
							if(document.getElementById(AnimalIdProtein).value == "N.A."){
								protein=0;
							}
							else{
								protein=document.getElementById(AnimalIdProtein).value;
							}
							animalCountArray.push(anmCount);
							nonForageRateArray.push(nfg);
							energyUnitIndexArray.push(energy);
							proteinUnitIndexArray.push(protein);
							
				}
				
				
				$('#tableAnimalLast').empty();
		
		for ( var increment in animalData) {
				if (countryName == animalData[increment].countryName) {
					for ( var animalIndex = 0; animalIndex < arrayAnimalName.length; animalIndex++) {
					
						var animalName=arrayAnimalName[animalIndex].trim();
						if (animalName == animalData[increment].animalName) {
						if (previousYear == animalData[increment].year) {
							var changeValueType =$("input[name='changeValueType']:checked").val();
							if(changeValueType=="Relative"){
										if(animalData[increment].animalCount==animalCountArray[animalIndex]){
										perChngAnmCountArray.push(0);
										}
										else{
											if(animalData[increment].animalCount==0){
												perChngAnmCountArray.push(0);
											}
											else{
												var change=parseFloat(animalCountArray[animalIndex])-parseFloat(animalData[increment].animalCount);
												var perChange=(change/parseFloat(animalData[increment].animalCount))*100;
												perChngAnmCountArray.push(perChange);
											}
										}
										
										if(animalData[increment].nonForageRate==nonForageRateArray[animalIndex]){
										perChngNonForgRatArray.push(0);
										}
										else{
											if(animalData[increment].nonForageRate==0){
												perChngNonForgRatArray.push(0);
											}
											else{
												var change=parseFloat(nonForageRateArray[animalIndex])-parseFloat(animalData[increment].nonForageRate);
												var perChange=(change/parseFloat(animalData[increment].nonForageRate))*100;
												perChngNonForgRatArray.push(perChange);
											}
										}
									
									if(unitIndx=="Energy"){
									

										
										if(animalData[increment].energyUnitIndex==energyUnitIndexArray[animalIndex]){
										perChngEnrgUtIdxArray.push(0);
										}
										else{
											if(animalData[increment].energyUnitIndex ==0){
												perChngEnrgUtIdxArray.push(0);
											}	
											else{
												var change=parseFloat(energyUnitIndexArray[animalIndex])-parseFloat(animalData[increment].energyUnitIndex);
												var perChange=(change/parseFloat(animalData[increment].energyUnitIndex))*100;
												perChngEnrgUtIdxArray.push(perChange);
											}
										}

									  }
									  else{

										
										if(animalData[increment].proteinUnitIndex==proteinUnitIndexArray[animalIndex]){
										perChngProtUtIdxArray.push(0);
										}
										else{
											if(animalData[increment].proteinUnitIndex==0){
												perChngProtUtIdxArray.push(0);	
											}
											else{
												var change=parseFloat(proteinUnitIndexArray[animalIndex])-parseFloat(animalData[increment].proteinUnitIndex);
												var perChange=(change/parseFloat(animalData[increment].proteinUnitIndex))*100;
												perChngProtUtIdxArray.push(perChange);	
											}
										
										}									
									  }	
									  
							}
							else{
											if(animalData[increment].animalCount==animalCountArray[animalIndex]){
												perChngAnmCountArray.push(0);
												}
												else{
														var change=parseFloat(animalCountArray[animalIndex])-parseFloat(animalData[increment].animalCount);
														perChngAnmCountArray.push(change);
												}
												
												var nfgValue = parseFloat(animalData[increment].nonForageRate)*100;
												if(nfgValue==nonForageRateArray[animalIndex]){
												perChngNonForgRatArray.push(0);
												}
												else{
														var change=parseFloat(nonForageRateArray[animalIndex]/100) - parseFloat(animalData[increment].nonForageRate);
														
														perChngNonForgRatArray.push(change*100);
												}
											
											if(unitIndx=="Energy"){
												if(animalData[increment].energyUnitIndex==energyUnitIndexArray[animalIndex]){
												perChngEnrgUtIdxArray.push(0);
												}
												else{
														var change=parseFloat(energyUnitIndexArray[animalIndex])-parseFloat(animalData[increment].energyUnitIndex);
														perChngEnrgUtIdxArray.push(change);
												}
											  }
											  else{
												if(animalData[increment].proteinUnitIndex==proteinUnitIndexArray[animalIndex]){
												perChngProtUtIdxArray.push(0);
												}
												else{
														var change=parseFloat(proteinUnitIndexArray[animalIndex])-parseFloat(animalData[increment].proteinUnitIndex);
														perChngProtUtIdxArray.push(change);	
													}
												}		
							}

									

									}
					
				}
			  }
			}
		  }
			
			initialYear=latestYear;
			if(unitIndx=="Energy"){
				if(propertyValue==1){
					unitIndexWithUnit = "Energy in 1000 GJ";
					headTablePart = " in 1000 GJ";
					}
				else {
						unitIndexWithUnit = "Energy in 1000 MT";
						headTablePart = " in 1000 MT";
					}
				}
				else{
					unitIndexWithUnit = "Protein in 1000 MT";
					headTablePart = " in 1000 MT";
				}
				
				headingTable = headingTable+", " + latestYear + " ( " + unitIndx + " requirements "+ propertySelected +" "+ headTablePart+")";
				//headingTable = headingTable+", " + latestYear + " ( " + unitIndx + " requirements in "+ propertySelected + " + headTablePart+")";
		//		headingTable = headingTable+", " + latestYear + "( " + unitIndx + " requirements"+ headTablePart+")";
			
			$('#tableAnimalLast')
				.append(
				
			

								'<tr><th style="text-align:center;background:red ;  color:white" colspan="8" >'+headingTable	+'</th></tr>' 
								+'<tr>' 
								+ '<th style="text-align: center;" rowspan="2" data-toggle="popover" data-placement="bottom" title="The model distinguishes eight major livestock categories and twelve categories of aquaculture. For the time being, only the livestock categories can be estimated individually while the aquaculture component is fixed.">Species<sub style="cursor:pointer"><font color="black">[?]</font></sub></th>' 
								+ '<th style="text-align: center; width:200px;" rowspan="2" data-toggle="popover" data-placement="top"  title="For livestock categories, this parameter represents the headcount of each species; for aquaculture (not editable), the weight of annual production is considered">Number of animals<sub  style="cursor:pointer"><font color="black">[?]</font></sub></th>'
								+ '<th style="text-align: center; width:100px;" rowspan="2" data-toggle="popover" data-placement="bottom"  title="This parameter captures the share of the respective animal population that is not fed through grazing etc. but receives direct supplementation of nutrients in a concentrated and controlled form (which is typical for intensified production systems)">Intensification rate (in %)<sub  style="cursor:pointer"><font color="black">[?]</font></sub></th>'
								+ '<th style="text-align: center; width:110px;" colspan="2" data-toggle="popover" data-placement="bottom"  title="The AUI measures energy and protein requirements of a particular species relative to a reference animal: in this model a mature cow of 500 kg live weight producing 3,500 kg of milk per year and calving every 13 months. This reference animal (or animal unit) is assumed to require 35,600 MJ of energy and 319 kg of crude protein per year. Obviously, the AUI is lower for small animals (e.g. chicken) while the value for cattle will be closer to or above 1, depending on the specificities in each country. ">Animal Unit Index<sub  style="cursor:pointer"><font color="black">[?]</font></sub></th>'
								+ '<th style="text-align: center; width:170px;" colspan="2" data-toggle="popover" data-placement="right"  title="In order to show new estimates using changed parameters, please click on Recalculate results. Results of the calculation using default parameters are shown under initial.">Estimated feed demand<sub  style="cursor:pointer"><font color="black">[?]</font></sub></th>'
								+ '</tr>'
								+'<tr>' 
								+ '<th style="text-align: center; width:150px;"><i>Energy</i></th>'
								+ '<th style="text-align: center; width:150px;"><i>Protein</i></th>'
								+ '<th style="text-align: center; width:150px;"><i>New</i></th>'
								+ '<th style="text-align: center; width:150px;"><i>Initial</i></th>'
								+ '</tr>');
			$('[data-toggle="popover"]').popover({ container: 'body', html: true });   			
			var total=0;
			initialTotal =0;
			for ( var increment in animalData) {
				if (countryName == animalData[increment].countryName) {
					for ( var animalIndex = 0; animalIndex < arrayAnimalName.length; animalIndex++) {
					
						var animalName=arrayAnimalName[animalIndex].trim();
						if (animalName == animalData[increment].animalName) {
							
								if (latestYear == animalData[increment].year) {
										previousYear=latestYear;
										var nutritionEnergy = 0;
										var nutritionProtein = 0;
										
								
										var changedAnimalCount=0;
										var changedNonForageRate=0;
										var changedEnergyUnitIndex=0;
										var changedProteinUnitIndex=0;
										var changeValueType =$("input[name='changeValueType']:checked").val();
										if(changeValueType=="Relative"){
											changedAnimalCount=parseInt(animalData[increment].animalCount)+((parseInt(animalData[increment].animalCount))*parseFloat(perChngAnmCountArray[animalIndex])/100);
											changedAnimalCount=changedAnimalCount.toFixed(0);
											changedNonForageRate=parseFloat(animalData[increment].nonForageRate)+((parseFloat(animalData[increment].nonForageRate))*parseFloat(perChngNonForgRatArray[animalIndex])/100);
											changedNonForageRate=changedNonForageRate.toFixed(0);
											changedEnergyUnitIndex=parseFloat(animalData[increment].energyUnitIndex)+((parseFloat(animalData[increment].energyUnitIndex))*parseFloat(perChngEnrgUtIdxArray[animalIndex])/100);
											changedEnergyUnitIndex=changedEnergyUnitIndex.toFixed(2);
											changedProteinUnitIndex=parseFloat(animalData[increment].proteinUnitIndex)+((parseFloat(animalData[increment].proteinUnitIndex))*parseFloat(perChngProtUtIdxArray[animalIndex])/100);
											changedProteinUnitIndex=changedProteinUnitIndex.toFixed(2);
										}
										else{
											changedAnimalCount=parseInt(animalData[increment].animalCount)+parseInt(perChngAnmCountArray[animalIndex]);
											changedAnimalCount=changedAnimalCount.toFixed(0);
											
											changedNonForageRate=parseFloat(animalData[increment].nonForageRate *100)+parseFloat(perChngNonForgRatArray[animalIndex]);
											changedNonForageRate=changedNonForageRate.toFixed(0);
											changedEnergyUnitIndex=parseFloat(animalData[increment].energyUnitIndex)+parseFloat(perChngEnrgUtIdxArray[animalIndex]);
											changedEnergyUnitIndex=changedEnergyUnitIndex.toFixed(2);
											changedProteinUnitIndex=parseFloat(animalData[increment].proteinUnitIndex)+parseFloat(perChngProtUtIdxArray[animalIndex]);
											changedProteinUnitIndex=changedProteinUnitIndex.toFixed(2);
										
										}
									
									if(unitIndx=="Energy"){
									
										nutritionEnergy = ( (changedAnimalCount * changedNonForageRate * changedEnergyUnitIndex * 35600) / (propertyValue*1000000))/100;
										
										initlaNutritionEnergy = ( (parseInt(animalData[increment].animalCount) * parseFloat(animalData[increment].nonForageRate) * 
																parseFloat(animalData[increment].energyUnitIndex) * 35600) / (propertyValue*1000000));
										
										
										
										
										nutritionEnergy = formatNumberRoundOff(nutritionEnergy);		
										total=total+nutritionEnergy	;										
										nutritionEnergy = formatNumber(nutritionEnergy);
										
										initlaNutritionEnergy = formatNumberRoundOff(initlaNutritionEnergy);
										initialTotal = initialTotal + initlaNutritionEnergy;										
										initlaNutritionEnergy = formatNumber(initlaNutritionEnergy);
										
										$('#tableAnimalLast')
										.append(
										
											'<tr>' + '<td style="text-align: center;">' +animalData[increment].animalName + '</td>'  
												+ '<td style="text-align: center;">'
												+ '<input type="text" onkeypress="return validate(event)" id="'+(animalIndex+1)+'animalCount" name="'+(animalIndex+1)+'animalCount" size="8" onchange="highLightChange();"'
												+ 'maxlength="20" class="form-control" style="font-weight:bold ;text-align: right;background-color: #e2ffdc"'
												+ ' value="'+formatNumber(changedAnimalCount)+'"> </td>'
												+ '<td style="text-align: right;">'
												+ '<input type="text" onkeypress="return validate(event)" id="'+(animalIndex+1)+'animalNfg" name="'+(animalIndex+1)+'animalNfg" size="6" onchange="highLightChange();"'
												+ 'maxlength="20" class="form-control" style="font-weight:bold ;text-align: right; background-color: #e2ffdc"'
												+ ' value="'+changedNonForageRate+'"> </td>' 
												+'<td style="text-align: center;">'
												+ '<input type="text" onkeypress="return validate(event)" id="'+(animalIndex+1)+'animalEnergy" name="'+(animalIndex+1)+'animalEnergy" size="6" onchange="highLightChange();"'
												+ 'maxlength="20" class="form-control" style="font-weight:bold ;text-align: right; background-color: #e2ffdc"'
												+ ' value="'+changedEnergyUnitIndex+'"> </td>' +	 '<td style="text-align: right;background-color: #ffeae9" id="'+(animalIndex+1)+'animalProtein" name="'+(animalIndex+1)+'animalProtein">'
												+ animalData[increment].proteinUnitIndex + '</td>' 
												+ '<td style="text-align: right; background-color: #D0E3FF" id="'+(animalIndex+1)+'feedDemand">'
												+nutritionEnergy+'</td>' 
												+  '<td style="text-align: right; background-color: #D0E3FF" id="'+(animalIndex+1)+'initialFeedDemand">'
												+initlaNutritionEnergy+'</td>' 
												+ '</tr>');		
										
									}
									else{
									nutritionProtein = ((changedAnimalCount * changedNonForageRate * changedProteinUnitIndex * 0.319) / (propertyValue*1000))/100;
									initlaNutritionProtein = ( (parseInt(animalData[increment].animalCount) * parseFloat(animalData[increment].nonForageRate) * 
																parseFloat(animalData[increment].proteinUnitIndex) *  0.319) / (propertyValue*1000));
																
										
										
										
										initlaNutritionProtein = formatNumberRoundOff(initlaNutritionProtein);	
										initialTotal=initialTotal+initlaNutritionProtein;
										initlaNutritionProtein = formatNumber(initlaNutritionProtein);
										
										nutritionProtein = formatNumberRoundOff(nutritionProtein);					
										total=total+nutritionProtein;										
										nutritionProtein = formatNumber(nutritionProtein);
										$('#tableAnimalLast')
										.append(
												'<tr>' + '<td style="text-align: center;">' + animalData[increment].animalName + '</td>'  
												+ '<td style="text-align: center;">'
												+ '<input type="text" onkeypress="return validate(event)" id="'+(animalIndex+1)+'animalCount" name="'+(animalIndex+1)+'animalCount" size="8" onchange="highLightChange();"'
												+ 'maxlength="20" class="form-control" style="font-weight:bold ;text-align: right; background-color: #e2ffdc"'
												+ ' value="'+formatNumber(changedAnimalCount)+'"> </td>'
												+ '<td style="text-align: right;">'
												+ '<input type="text" onkeypress="return validate(event)" id="'+(animalIndex+1)+'animalNfg" name="'+(animalIndex+1)+'animalNfg" size="6" onchange="highLightChange();"'
												+ 'maxlength="20" class="form-control" style="font-weight:bold ;text-align: right; background-color: #e2ffdc"'
												+ ' value="'+changedNonForageRate+'"> </td>' + '<td style="text-align:right; background-color: #ffeae9" id="'+(animalIndex+1)+'animalEnergy" name="'+(animalIndex+1)+'animalEnergy">'
												+ animalData[increment].energyUnitIndex + '</td>' 
												+ '<td style="text-align: right; ">'
												+ '<input type="text" onkeypress="return validate(event)" id="'+(animalIndex+1)+'animalProtein" name="'+(animalIndex+1)+'animalProtein" size="6" onchange="highLightChange();"'
												+ 'maxlength="20" class="form-control" style="font-weight:bold ;text-align: right; background-color: #e2ffdc"'
												+ ' value="'+changedProteinUnitIndex+'"> </td>' 
												+ '<td style="text-align: right; background-color: #D0E3FF" id="'+(animalIndex+1)+'feedDemand">'
												+nutritionProtein+'</td>' 
												+ '<td style="text-align: right; background-color: #D0E3FF" id="'+(animalIndex+1)+'initialFeedDemand">'
												+initlaNutritionProtein+'</td>' 
												+ '</tr>');		
											
									}
								}
							
							
							
							
							
							}
						}
					}
				}
					for ( var increment in aquacultureData) {
							if (countryName == aquacultureData[increment].countryName) {
								if (latestYear == aquacultureData[increment].year) {
									if(unitIndx=="Energy"){
										var nutritionEnergy = (aquacultureData[increment].nutritionEnergy/1000)/propertyValue ;
										nutritionIndexValue = formatNumber(formatNumberRoundOff(nutritionEnergy));	
									}
									else{
									var nutritionProtein = (aquacultureData[increment].nutritionProtein/1000)/propertyValue;
									nutritionIndexValue = formatNumber(formatNumberRoundOff(nutritionProtein));	
									}	
									
								$('#tableAnimalLast')
								.append(
								
								'<tr>' 
								+ '<td style="text-align: center; background-color:#D3D3D3">Aquaculture</td>' 
								+ '<td style="text-align: center; background-color:#D3D3D3">--</td>'
								+ '<td style="text-align: center; background-color:#D3D3D3">--</td>'
								+ '<td style="text-align: center; background-color:#D3D3D3">--</td>'
								+ '<td style="text-align: center; background-color:#D3D3D3">--</td>'
								+ '<td style="text-align: right; background-color:#D3D3D3" id="aquaId">'+nutritionIndexValue+'</td>'
								+ '<td style="text-align: right; background-color:#D3D3D3" >'+nutritionIndexValue+'</td>'
								+ '</tr>');
		
								}
							}
						}
							nutritionIndexValue = nutritionIndexValue.replace(/\,/g,'');
							total =parseInt(total) +parseInt(nutritionIndexValue);
							initialTotal = initialTotal + parseInt(nutritionIndexValue);
							total= formatNumberRoundOff(total);
							total = formatNumber(total);
							initialTotal= formatNumberRoundOff(initialTotal);
							initialTotal = formatNumber(initialTotal);

							$('#tableAnimalLast')
								.append(
									'<tr>' 
								+ '<td style="text-align: right;" colspan="4"></td>'
								+ '<td style="text-align: right; background-color:red;color:white">Total</td>'
								+ '<td style="text-align: right; width:150px; background-color:red; color:white" id="totalValueNew">'+ total+'</td>'
								+ '<td style="text-align: right; width:150px; background-color:red; color:white" id="totalValue">'+ initialTotal+'</td>'
								+ '</tr>');
			$('#tableAnimal').empty();
			regerateData();
			}
		

				}
				else{
					$('#tableAnimal').empty();
					$('#tableAqua').empty();
					$('#tableAnimalLast').empty();
					document.getElementById("generateChartDiv").hidden = true;
					document.getElementById("applyAllYears").hidden = true;
					document.getElementById("reportChangeDiv").hidden = true;
					document.getElementById("pieChartDiv").hidden = true;
					document.getElementById("paraDiv").hidden = true;
				}
}	

function validate(evt) {
   var charCode = (evt.which) ? evt.which : event.keyCode
         if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

         return true;
}


function resetValue(last) {

	var arrYears = ${yearList};
	latestYear = arrYears[arrYears.length - 1];
		if(last.oldvalue==undefined){
				if(lastYearValue==0){
				lastYearValue = latestYear;
				}
		}
		else {
			lastYearValue = last.oldvalue;
		}

	if(document.getElementById("allYears").checked == true){
		var yearSelected = $("#selectYear option:selected").val();
						$('#tableAqua').empty();
						$('#lineChartDiv').empty();
						$('#pieChartNew').empty();
						$('#pieChartOld').empty();
						$('#para').empty();
						showTable(lastYearValue,yearSelected);
						generateScenario(yearSelected);
						lastYearValue = $("#selectYear option:selected").val();
						
	}
	else{
	  BootstrapDialog.confirm('Please note that by switching to a different year, parameters will return to their default value (unless you applied changes to all years).', function(result){
            if(result) {
						var yearSelected = $("#selectYear option:selected").val();
						$('#tableAqua').empty();
						$('#lineChartDiv').empty();
						$('#pieChartNew').empty();
						$('#pieChartOld').empty();
						$('#para').empty();
						generateScenario(yearSelected);
						showTable(lastYearValue,yearSelected);
						lastYearValue = $("#selectYear option:selected").val();
            }else {
                $('#yearSelectList').empty();
				$('#yearSelectList').append(
					'<select id="selectYear" class="selectBox" onfocus="this.oldvalue = this.value;" title="Choose one" '
					+ 'data-live-search="true" onchange="resetValue(this); this.oldvalue=this.value;"> ' );
							<c:forEach items='${yearListReverse}' var='year' varStatus='varStatus'> 
								var yearKey = "<c:out value="${year}"/>";
								if (yearKey==lastYearValue){
									$('#selectYear').append( '<option name="yearValue" value="${year}" selected="selected">${year}</option>');
								}	
								else{
									$('#selectYear').append( '<option name="yearValue" value="${year}"> ${year}</option>');
								}
							</c:forEach>
								
					$('#selectYear').append(	'</select>');

					$('#selectYear').selectpicker({
									size : 'auto',
									width : '130px'
								});
				lastYearValue = $("#selectYear option:selected").val();	
            }
        });
	
	}	
}				


function goHome() {

window.location.href ="http://www.amis-outlook.org/";
}

function goVisualize(){
window.location.href = getContextPath();
}

function formatNumber (num) {
		var myNumberAsString = num;           
		var myNumber = Math.round(0.0 + myNumberAsString); 
		parseInt(myNumber);
		return myNumber.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"); 
		}
		
function checkForZero(num){
	if(num==0){
		return 'N.A.';
	}
	else{
		return num;
	}
}		
		
		function formatNumberRoundOff (num) {
		var myNumberAsString = num;           
		var myNumber = Math.round(0.0 + myNumberAsString); 
		return parseInt(myNumber); 
		}

	function validateNameAndEmail() {
	
	reporterName = document.getElementById('reporterName').value;
	var filter = /^[a-zA-Z ]{2,30}$/;
	 if(!(filter.test(reporterName)))
	 {
	 alert("Please enter reporter name");
		return false;
	 } 
	
	reporterEmail = document.getElementById('reporterEmail').value;
	var filter = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    if (!(filter.test(reporterEmail)))
	{
	alert("Please enter a valid email address");
	return false;
	}
	else
	{
		sendMail();
	}
	}
		
	function getPieChart() {
	
		var animalData = ${animalRawData};
		var aquacultureData = ${aquacultureData};
		var arrYears = ${yearList};
		var unitIndx =$("input[name='selectEnergyEquivalent']:checked").val();
		
		var countryNameMap = new Array();
		<c:forEach var="entry" items="${countryMap}">
				countryNameMap[${entry.key}] = "${entry.value}";
		</c:forEach>
		var country =  $("#selectCountry option:selected").val().trim();		
		var countryName = countryNameMap[country];
		
		var latestYear="";
		var yearSelected = $("#selectYear option:selected").val();
		if(yearSelected==""){
			var arrYears = ${yearList};
			latestYear = arrYears[arrYears.length - 1];
		}
		else{
			latestYear = yearSelected;
		}			
		
		
		var propertySelectedKey="";
		var propertyValueMap = new Array();
		<c:forEach var="entry" items="${propertyMap}">
			propertyValueMap["${entry.key}"] = "${entry.value}";
		</c:forEach>

		var propertySelected =  $("#selectIndex option:selected").val().trim().replace(/\s/g,'');
		var unitIndexSelected =$("input[name='selectEnergyEquivalent']:checked").val();
		
		if(unitIndexSelected=="Energy"){
			propertySelectedKey=propertySelected+"Energy";
		}
		else{
			propertySelectedKey=propertySelected+"Protein";
		}	
		var propertyValue = propertyValueMap[propertySelectedKey];
		if(propertySelected=="None"){
			propertyValue=1;
		}
		
		var listAnimalName = "${animalNameList}";
		var listAnimalName = listAnimalName.replace("[", ""); 
		var listAnimalName = listAnimalName.replace("]", ""); 
		var arrayAnimal;
		arrayAnimal = listAnimalName.split(",");
		
		var animalCountArray=[];
		var nonForageRateArray=[];
		var energyUnitIndexArray=[];
		var proteinUnitIndexArray=[];
		
		var perChngAnmCount="";
		var perChngNonForgRat="";
		var perChngUtIdx="";
		
		for ( var animalIndex = 0; animalIndex < arrayAnimal.length; animalIndex++) {
				var AnimalIdCount=(animalIndex+1).toString()+"animalCount";
				var AnimalIdNfg=(animalIndex+1).toString()+"animalNfg";
				var AnimalIdEnergy=(animalIndex+1).toString()+"animalEnergy";
				var AnimalIdProtein=(animalIndex+1).toString()+"animalProtein";
			//	var anmCount=document.getElementById(AnimalIdCount).value.replace(/\,/g,'');
				var anmCount;
				if(document.getElementById(AnimalIdCount).value == "N.A."){
					anmCount=0;
				}
				else{
					anmCount=document.getElementById(AnimalIdCount).value.replace(/\,/g,'');
				}				
				
				
				//var nfg=document.getElementById(AnimalIdNfg).value;
				//var energy=document.getElementById(AnimalIdEnergy).value;
				//var protein=document.getElementById(AnimalIdProtein).value;
				
				var nfg;
				if(document.getElementById(AnimalIdNfg).value == "N.A."){
					nfg=0;
				}
				else{
					nfg=document.getElementById(AnimalIdNfg).value;
				}

				var energy;
				if(document.getElementById(AnimalIdEnergy).value == "N.A."){
					energy=0;
				}
				else{
					energy=document.getElementById(AnimalIdEnergy).value;
				}
				
				var protein;
				if(document.getElementById(AnimalIdProtein).value == "N.A."){
					protein=0;
				}
				else{
					protein=document.getElementById(AnimalIdProtein).value;
				}
				
				animalCountArray.push(anmCount);
				nonForageRateArray.push(nfg);
				energyUnitIndexArray.push(energy);
				proteinUnitIndexArray.push(protein);
			}
			
		for ( var increment in animalData) {
			if (countryName == animalData[increment].countryName) {
				for ( var animalIndex = 0; animalIndex < arrayAnimal.length; animalIndex++) {
				
					var animalName=arrayAnimal[animalIndex].trim();
					if (animalName == animalData[increment].animalName) {
					
					if (latestYear == animalData[increment].year) {
							var changeValueType =$("input[name='changeValueType']:checked").val();
							if(changeValueType=="Relative"){
								    if(animalData[increment].animalCount==animalCountArray[animalIndex]){
									perChngAnmCount=perChngAnmCount.concat("0");
									perChngAnmCount=perChngAnmCount.concat(":");
									}
									else{
									var change=parseFloat(animalCountArray[animalIndex])-parseFloat(animalData[increment].animalCount);
									if(animalData[increment].animalCount=="0"){			
										perChngAnmCount=perChngAnmCount.concat("0");
										}
									else{
										var perChange=(change/parseFloat(animalData[increment].animalCount))*100;
										perChngAnmCount=perChngAnmCount.concat(perChange);
									}	
									
									perChngAnmCount=perChngAnmCount.concat(":");
									}
									
									if((animalData[increment].nonForageRate*100)==nonForageRateArray[animalIndex]){
									perChngNonForgRat=perChngNonForgRat.concat("0");
									perChngNonForgRat=perChngNonForgRat.concat(":");
									}
									else{
										if(animalData[increment].nonForageRate=="0"){	
										perChngNonForgRat=perChngNonForgRat.concat("0");
										}
										else{
										var change=parseFloat(nonForageRateArray[animalIndex])-parseFloat(animalData[increment].nonForageRate*100);
										var perChange=(change/(parseFloat(animalData[increment].nonForageRate)*100))*100;
										perChngNonForgRat=perChngNonForgRat.concat(perChange);
										}
									perChngNonForgRat=perChngNonForgRat.concat(":");
									}
								
								if(unitIndx=="Energy"){
									
									if(animalData[increment].energyUnitIndex==energyUnitIndexArray[animalIndex]){
										perChngUtIdx=perChngUtIdx.concat("0");
										perChngUtIdx=perChngUtIdx.concat(":");
									}
									else{
										if(animalData[increment].energyUnitIndex=="0"){
												perChngUtIdx=perChngUtIdx.concat("0");
										}
										else{
											var change=parseFloat(energyUnitIndexArray[animalIndex])-parseFloat(animalData[increment].energyUnitIndex);
											var perChange=(change/parseFloat(animalData[increment].energyUnitIndex))*100;
											perChngUtIdx=perChngUtIdx.concat(perChange);
										}
									perChngUtIdx=perChngUtIdx.concat(":");
									}

									}
								  else{
                                    
                                    if(animalData[increment].proteinUnitIndex==proteinUnitIndexArray[animalIndex]){
                                    	perChngUtIdx=perChngUtIdx.concat("0");
                                    	perChngUtIdx=perChngUtIdx.concat(":");
									}
									else{
										if(animalData[increment].proteinUnitIndex=="0"){
											perChngUtIdx=perChngUtIdx.concat("0");
										}	
										else{
											var change=parseFloat(proteinUnitIndexArray[animalIndex])-parseFloat(animalData[increment].proteinUnitIndex);
											var perChange=(change/parseFloat(animalData[increment].proteinUnitIndex))*100;
											perChngUtIdx=perChngUtIdx.concat(perChange);
										}
									perChngUtIdx=perChngUtIdx.concat(":");
									}									
								  }
								}
								else{
									if(animalData[increment].animalCount==animalCountArray[animalIndex]){
									perChngAnmCount=perChngAnmCount.concat("0");
									perChngAnmCount=perChngAnmCount.concat(":");
									}
									else{
									var change=parseFloat(animalCountArray[animalIndex])-parseFloat(animalData[increment].animalCount);
									perChngAnmCount=perChngAnmCount.concat(change);
									perChngAnmCount=perChngAnmCount.concat(":");
									}
									
									if((animalData[increment].nonForageRate*100)==nonForageRateArray[animalIndex]){
									perChngNonForgRat=perChngNonForgRat.concat("0");
									perChngNonForgRat=perChngNonForgRat.concat(":");
									}
									else{
										var change=parseFloat(nonForageRateArray[animalIndex])-parseFloat(animalData[increment].nonForageRate*100);
										perChngNonForgRat=perChngNonForgRat.concat(change);
										perChngNonForgRat=perChngNonForgRat.concat(":");
									}
									
									if(unitIndx=="Energy"){
									
									if(animalData[increment].energyUnitIndex==energyUnitIndexArray[animalIndex]){
										perChngUtIdx=perChngUtIdx.concat("0");
										perChngUtIdx=perChngUtIdx.concat(":");
									}
									else{
										
											var change=parseFloat(energyUnitIndexArray[animalIndex])-parseFloat(animalData[increment].energyUnitIndex);
											perChngUtIdx=perChngUtIdx.concat(change);
											perChngUtIdx=perChngUtIdx.concat(":");
										}

									}
								  else{
                                    
                                    if(animalData[increment].proteinUnitIndex==proteinUnitIndexArray[animalIndex]){
                                    	perChngUtIdx=perChngUtIdx.concat("0");
                                    	perChngUtIdx=perChngUtIdx.concat(":");
									}
									else{
										
											var change=parseFloat(proteinUnitIndexArray[animalIndex])-parseFloat(animalData[increment].proteinUnitIndex);
											perChngUtIdx=perChngUtIdx.concat(change);
											perChngUtIdx=perChngUtIdx.concat(":");
									}									
								  }
								
								}
								
								}
		        
			}
		  }
		}
	  }		
		
		
		var perChngAnmCountList;
		perChngAnmCountList=perChngAnmCount.split(":");
		
		var perChngNonForgRatList;
		perChngNonForgRatList=perChngNonForgRat.split(":");
		
		var perChngUtIdxList;
		perChngUtIdxList=perChngUtIdx.split(":");
		
		var type = "";
		var typeName="";

		// var resultArray= [];
		for ( var dataType = 0; dataType < 2; dataType++) {
			var resultArray = [];
			if (dataType == 0) {
				 type = "Old";
				 typeName="initial estimate";
				resultArray.push(countryName + "(initial estimate)");
			} else {
				var type = "New";
				 typeName="new estimate";
				resultArray.push(countryName + "(new estimate)");
			}
			
	
			var aquaEnergyIndex = 0;
			var aquaProteinIndex = 0;

				if (unitIndx == "Energy") {
				if (dataType == 0) {
					for ( var animalIndex = 0; animalIndex < arrayAnimal.length; animalIndex++) {
						var nutritionEnergy = 0;
						resultArray.push(arrayAnimal[animalIndex]);
						for ( var increment in animalData) {
							if (countryName == animalData[increment].countryName) {
								var animalName=arrayAnimal[animalIndex].trim();
								if (animalName == animalData[increment].animalName) {
									if (latestYear == animalData[increment].year) {
										var energyIndex = animalData[increment].energyUnitIndex;
										if (energyIndex != null
												&& energyIndex !== undefined) {
											nutritionEnergy = (animalData[increment].animalCount
															* animalData[increment].nonForageRate * energyIndex)/propertyValue;
										}
									}
								}
							}
						}
						resultArray.push(formatNumberRoundOff(nutritionEnergy * 35600/1000000));
					}
				} else {
					for ( var animalIndex = 0; animalIndex < arrayAnimal.length; animalIndex++) {
						resultArray.push(arrayAnimal[animalIndex]);
						var nutritionEnergy = 0;
						for ( var increment in animalData) {
							if (countryName == animalData[increment].countryName) {
								var animalName=arrayAnimal[animalIndex].trim();
								if (animalName == animalData[increment].animalName) {
									if (latestYear == animalData[increment].year) {
										var energyIndex = animalData[increment].energyUnitIndex;
										if (energyIndex != null
												&& energyIndex !== undefined) {
												var changeValueType =$("input[name='changeValueType']:checked").val();
												if(changeValueType=="Relative"){
													var animalCountPer=parseInt(animalData[increment].animalCount)+((parseInt(animalData[increment].animalCount))*parseFloat(perChngAnmCountList[animalIndex])/100);
													animalCountPer=animalCountPer.toFixed(0);
													var nfgPer=parseFloat(animalData[increment].nonForageRate)+((parseFloat(animalData[increment].nonForageRate))*parseFloat(perChngNonForgRatList[animalIndex])/100);
													nfgPer=nfgPer.toFixed(2);
													var unitPer=parseFloat(animalData[increment].energyUnitIndex)+((parseFloat(animalData[increment].energyUnitIndex))*parseFloat(perChngUtIdxList[animalIndex])/100);
													unitPer=unitPer.toFixed(2);
												}
												else{
													var animalCountPer=parseInt(animalData[increment].animalCount)+parseInt(perChngAnmCountList[animalIndex]);
													animalCountPer=animalCountPer.toFixed(0);
													var nfgPer=parseFloat(animalData[increment].nonForageRate)+parseFloat(perChngNonForgRatList[animalIndex]/100);
													nfgPer=nfgPer.toFixed(2);
													var unitPer=parseFloat(animalData[increment].energyUnitIndex)+parseFloat(perChngUtIdxList[animalIndex]);
													unitPer=unitPer.toFixed(2);
												}		
											nutritionEnergy = ( animalCountPer * nfgPer * unitPer)/propertyValue;
										}
									}
								}
							}
						}
						resultArray.push(formatNumberRoundOff(nutritionEnergy * 35600/1000000));
					}
				}
				for ( var aqua_increment in aquacultureData) {
					if (countryName == aquacultureData[aqua_increment].countryName) {
						if (latestYear == aquacultureData[aqua_increment].year) {
							resultArray.push("Aqua");
							aquaEnergyIndex = aquacultureData[aqua_increment].nutritionEnergy/propertyValue;
							resultArray.push(formatNumberRoundOff(aquaEnergyIndex * 1/1000));
						}
					}

				}

			} else {
				if (dataType == 0) {
					for ( var animalIndex = 0; animalIndex < arrayAnimal.length; animalIndex++) {
						var nutritionProtein = 0;
						resultArray.push(arrayAnimal[animalIndex]);
						for ( var increment in animalData) {
							if (countryName == animalData[increment].countryName) {
								var animalName=arrayAnimal[animalIndex].trim();
								if (animalName == animalData[increment].animalName) {
									if (latestYear == animalData[increment].year) {
										var proteinIndex = animalData[increment].proteinUnitIndex;
										if (proteinIndex != null
												&& proteinIndex !== undefined) {
											nutritionProtein = 
													(animalData[increment].animalCount
															* animalData[increment].nonForageRate * proteinIndex)/propertyValue;
										}
									}
								}
							}
						}
						resultArray.push(formatNumberRoundOff(nutritionProtein * 0.319/1000));
					}
				} else {
					for ( var animalIndex = 0; animalIndex < arrayAnimal.length; animalIndex++) {
						resultArray.push(arrayAnimal[animalIndex]);
						var nutritionProtein = 0;
						for ( var increment in animalData) {
							if (countryName == animalData[increment].countryName) {
								var animalName=arrayAnimal[animalIndex].trim();
								if (animalName == animalData[increment].animalName) {
									if (latestYear == animalData[increment].year) {
										var proteinIndex = animalData[increment].proteinUnitIndex;
										if (proteinIndex != null
												&& proteinIndex !== undefined) {
												var changeValueType =$("input[name='changeValueType']:checked").val();
												if(changeValueType=="Relative"){
													var animalCountPer=parseInt(animalData[increment].animalCount)+((parseInt(animalData[increment].animalCount))*parseFloat(perChngAnmCountList[animalIndex])/100);
													animalCountPer=animalCountPer.toFixed(0);
													var nfgPer=parseFloat(animalData[increment].nonForageRate)+((parseFloat(animalData[increment].nonForageRate))*parseFloat(perChngNonForgRatList[animalIndex])/100);
													nfgPer=nfgPer.toFixed(2);
													var unitPer=parseFloat(animalData[increment].proteinUnitIndex)+((parseFloat(animalData[increment].proteinUnitIndex))*parseFloat(perChngUtIdxList[animalIndex])/100);
													unitPer=unitPer.toFixed(2);
													}
												else{
													var animalCountPer=parseInt(animalData[increment].animalCount)+parseInt(perChngAnmCountList[animalIndex]);
													animalCountPer=animalCountPer.toFixed(0);
													var nfgPer=parseFloat(animalData[increment].nonForageRate)+parseFloat(perChngNonForgRatList[animalIndex]/100);
													nfgPer=nfgPer.toFixed(2);
													var unitPer=parseFloat(animalData[increment].proteinUnitIndex)+parseFloat(perChngUtIdxList[animalIndex]);
													unitPer=unitPer.toFixed(2);
												}			
											nutritionProtein =  (animalCountPer * nfgPer * unitPer)/propertyValue;
										}
									}
								}
							}
						}
						resultArray.push(formatNumberRoundOff(nutritionProtein * 0.319/1000));
					}
				}
				for ( var aqua_increment in aquacultureData) {
					if (countryName == aquacultureData[aqua_increment].countryName) {
						if (latestYear == aquacultureData[aqua_increment].year) {
							resultArray.push("Aqua");
							aquaProteinIndex = aquacultureData[aqua_increment].nutritionProtein/propertyValue;
							resultArray.push(formatNumberRoundOff(aquaProteinIndex * 1/1000));
						}
					}

				}

			}
			//alert(resultArray);
			// console.log(resultArray);

			var myarray = [];
			//alert(resultArray.length);
			var item = {
				"type" : 'pie',
				"name" : countryName + " (" + typeName + ")",
				"data" : [ [ resultArray[1], resultArray[2] ],
						[ resultArray[3], resultArray[4] ],
						[ resultArray[5], resultArray[6] ],
						[ resultArray[7], resultArray[8] ],
						[ resultArray[9], resultArray[10] ],
						[ resultArray[11], resultArray[12] ],
						[ resultArray[13], resultArray[14] ],
						[ resultArray[15], resultArray[16] ],
						[ resultArray[17], resultArray[18] ] ]
			};
			myarray.push(item);

			var resultJson = JSON.stringify(myarray);
			// alert(resultJson);

			//console.log(resultJson);

		
						var energyType="";
						
						var pieChartTooltipTitle = "";
						if(unitIndx == "Energy")
						{	
							if(propertyValue=="1"){
								energyType = "1000 GJ";
						
								pieChartTooltipTitle = "energy requirements in GJ";
							}
							else {
							energyType = "1000 MT";
						
							pieChartTooltipTitle ="energy requirements in "+ propertySelected+" equivalent [MT] ";
							}
						}
						else
						{
							energyType = "1000 MT";
							if(propertyValue=="1"){
						
								pieChartTooltipTitle = "protein requirements in MT";
							}
							else{
						
								pieChartTooltipTitle = "protein requirements in "+ propertySelected+" equivalent [MT]";
							}

						}
			
			
			$('#pieChart' + type)
					.highcharts(
							{
								chart : {
									plotBackgroundColor : null,
									plotBorderWidth : null,
									plotShadow : false
								},
								title : {
									text : countryName + " (" + typeName + ")",

								},
								tooltip : {
								formatter: function() {
										
										return (this.point.name) +'<br>' +'Share of total :'+ formatNumber(this.percentage,1)+' % ,<br>'  +pieChartTooltipTitle +':'+formatNumber(this.y)+'</br>';

									}

								},
								plotOptions : {
									pie : {
										size : 210,
										allowPointSelect : true,
										cursor : 'pointer',
										dataLabels : {
															enabled: true,
															format: '{point.name} </br>{point.percentage:.1f} % '
														},
										showInLegend : false
									}
								},
								credits : {
									enabled : false
								},
								series : myarray
							});
		}
		
		var latestYear="";
		var yearSelected = $("#selectYear option:selected").val();
		if(yearSelected==""){
			var arrYears = ${yearList};
			latestYear = arrYears[arrYears.length - 1];
		}
		else{
			latestYear = yearSelected;
		}
		
		var propertySelectedKey="";
		var propertyValueMap = new Array();
		<c:forEach var="entry" items="${propertyMap}">
			propertyValueMap["${entry.key}"] = "${entry.value}";
		</c:forEach>

		var propertySelected =  $("#selectIndex option:selected").val().trim().replace(/\s/g,'');
		var propertyName = $("#selectIndex option:selected").val().trim().replace(/\s/g,'');
		
		if(unitIndx=="Energy"){
			propertySelectedKey=propertySelected+"Energy";
		}
		else{
			propertySelectedKey=propertySelected+"Protein";
		}	
		var propertyValue = propertyValueMap[propertySelectedKey];
		if(propertySelected=="None"){
			propertyValue=1;
		}
		
		if(unitIndx == "Energy")
		{	
			if(propertyValue=="1"){
				energyType = "1000 GJ";
				subtitle = "(energy requirements in GJ";
			}
			else {
			energyType = "1000 MT";
			subtitle = " ( energy requirements in "+ propertyName+" equivalent [MT] ";
			}
		}
		else
		{
			energyType = "1000 MT";
			if(propertyValue=="1"){
				subtitle = "(protein requirements in MT";
			}
			else{
				subtitle = " ( protein requirements in "+ propertyName+" equivalent [MT] ";
			}

		}
		
	
	
		$("#para").text('Share of different animal types/species of total estimated feed demand ' + subtitle + ' for Year: '+latestYear+')' );


	}

	function makeProteinJson(propertyValue) {
		var animalData = ${animalRawData};
		var aquacultureData = ${aquacultureData};
		var arrYears = ${yearList};

		var listAnimalName = "${animalNameList}";
		var listAnimalName = listAnimalName.replace("[", "");
		var listAnimalName = listAnimalName.replace("]", "");
		var arrayAnimalName;
		arrayAnimalName = listAnimalName.split(",");

		var resultArray = [];
		//var countryName = "${countryName}";
		
		var countryNameMap = new Array();
		<c:forEach var="entry" items="${countryMap}">
				countryNameMap[${entry.key}] = "${entry.value}";
		</c:forEach>
		var countrySelected =  $("#selectCountry option:selected").val().trim();		
		var countryName = countryNameMap[countrySelected];
		
		var animalCountArray=[];
		var nonForageRateArray=[];
		var proteinUnitIndexArray=[];
		
		var perChngAnmCount="";
		var perChngNonForgRat="";
		var perChngUtIdx="";
		
		var initialYear="";
		var yearSelected = $("#selectYear option:selected").val();
		if(yearSelected==""){
			var arrYears = ${yearList};
			initialYear = arrYears[arrYears.length - 1];
		}
		else{
			initialYear = yearSelected;
		}
		
		for ( var animalIndex = 0; animalIndex < arrayAnimalName.length; animalIndex++) {
				var AnimalIdCount=(animalIndex+1).toString()+"animalCount";
				var AnimalIdNfg=(animalIndex+1).toString()+"animalNfg";
				var AnimalIdProtein=(animalIndex+1).toString()+"animalProtein";
			//	var anmCount=document.getElementById(AnimalIdCount).value.replace(/\,/g,'');
				var anmCount;
				if(document.getElementById(AnimalIdCount).value == "N.A."){
					anmCount=0;
				}
				else{
					anmCount=document.getElementById(AnimalIdCount).value.replace(/\,/g,'');
				}				
				
				//var nfg=document.getElementById(AnimalIdNfg).value;
				//var protein=document.getElementById(AnimalIdProtein).value;
				
				var nfg;
				if(document.getElementById(AnimalIdNfg).value == "N.A."){
					nfg=0;
				}
				else{
					nfg=document.getElementById(AnimalIdNfg).value;
				}

				var protein;
				if(document.getElementById(AnimalIdProtein).value == "N.A."){
					protein=0;
				}
				else{
					protein=document.getElementById(AnimalIdProtein).value;
				}
				
				animalCountArray.push(anmCount);
				nonForageRateArray.push(nfg);
				proteinUnitIndexArray.push(protein);
			}
			
		for ( var increment in animalData) {
			if (countryName == animalData[increment].countryName) {
				for ( var animalIndex = 0; animalIndex < arrayAnimalName.length; animalIndex++) {
				
					var animalName=arrayAnimalName[animalIndex].trim();
					if (animalName == animalData[increment].animalName) {
					
					if (initialYear == animalData[increment].year) {
								var changeValueType =$("input[name='changeValueType']:checked").val();
								
								if(document.getElementById("allYears").checked == true){
								if(changeValueType=="Relative"){								
								    if(animalData[increment].animalCount==animalCountArray[animalIndex]){
									perChngAnmCount=perChngAnmCount.concat("0");
									perChngAnmCount=perChngAnmCount.concat(":");
									}
									else{
									var change=parseFloat(animalCountArray[animalIndex])-parseFloat(animalData[increment].animalCount);
									if(animalData[increment].animalCount=="0"){			
										perChngAnmCount=perChngAnmCount.concat("0");
										}
									else{
										var perChange=(change/parseFloat(animalData[increment].animalCount))*100;
										perChngAnmCount=perChngAnmCount.concat(perChange);
									}	
									
									perChngAnmCount=perChngAnmCount.concat(":");
									}
									
									if((animalData[increment].nonForageRate*100)==nonForageRateArray[animalIndex]){
									perChngNonForgRat=perChngNonForgRat.concat("0");
									perChngNonForgRat=perChngNonForgRat.concat(":");
									}
									else{
										if(animalData[increment].nonForageRate=="0"){	
										perChngNonForgRat=perChngNonForgRat.concat("0");
										}
										else{
										var change=parseFloat(nonForageRateArray[animalIndex])-parseFloat(animalData[increment].nonForageRate*100);
										var perChange=(change/(parseFloat(animalData[increment].nonForageRate)*100))*100;
										perChngNonForgRat=perChngNonForgRat.concat(perChange);
										}
									perChngNonForgRat=perChngNonForgRat.concat(":");
									}


                                    if(animalData[increment].proteinUnitIndex==proteinUnitIndexArray[animalIndex]){
                                    	perChngUtIdx=perChngUtIdx.concat("0");
                                    	perChngUtIdx=perChngUtIdx.concat(":");
									}
									else{
										if(animalData[increment].proteinUnitIndex=="0"){
											perChngUtIdx=perChngUtIdx.concat("0");
										}	
										else{
											var change=parseFloat(proteinUnitIndexArray[animalIndex])-parseFloat(animalData[increment].proteinUnitIndex);
											var perChange=(change/parseFloat(animalData[increment].proteinUnitIndex))*100;
											perChngUtIdx=perChngUtIdx.concat(perChange);
										}
									perChngUtIdx=perChngUtIdx.concat(":");
									}									
								}
								else{
									if(animalData[increment].animalCount==animalCountArray[animalIndex]){
									perChngAnmCount=perChngAnmCount.concat("0");
									perChngAnmCount=perChngAnmCount.concat(":");
									}
									else{
									var change=parseFloat(animalCountArray[animalIndex])-parseFloat(animalData[increment].animalCount);
									perChngAnmCount=perChngAnmCount.concat(change);
									perChngAnmCount=perChngAnmCount.concat(":");
									}
									
									if((animalData[increment].nonForageRate*100)==nonForageRateArray[animalIndex]){
									perChngNonForgRat=perChngNonForgRat.concat("0");
									perChngNonForgRat=perChngNonForgRat.concat(":");
									}
									else{
										var change=parseFloat(nonForageRateArray[animalIndex])-parseFloat(animalData[increment].nonForageRate*100);
										perChngNonForgRat=perChngNonForgRat.concat(change);
										perChngNonForgRat=perChngNonForgRat.concat(":");
									}


									if(animalData[increment].proteinUnitIndex==proteinUnitIndexArray[animalIndex]){
                                    	perChngUtIdx=perChngUtIdx.concat("0");
                                    	perChngUtIdx=perChngUtIdx.concat(":");
									}
									else{
											var change=parseFloat(proteinUnitIndexArray[animalIndex])-parseFloat(animalData[increment].proteinUnitIndex);
											perChngUtIdx=perChngUtIdx.concat(change);
											perChngUtIdx=perChngUtIdx.concat(":");
										}					
								
								}
								}
								else{
														    if(animalData[increment].animalCount==animalCountArray[animalIndex]){
									perChngAnmCount=perChngAnmCount.concat("0");
									perChngAnmCount=perChngAnmCount.concat(":");
									}
									else{
									var change=parseFloat(animalCountArray[animalIndex])-parseFloat(animalData[increment].animalCount);
									if(animalData[increment].animalCount=="0"){			
										perChngAnmCount=perChngAnmCount.concat("0");
										}
									else{
										var perChange=(change/parseFloat(animalData[increment].animalCount))*100;
										perChngAnmCount=perChngAnmCount.concat(perChange);
									}	
									
									perChngAnmCount=perChngAnmCount.concat(":");
									}
									
									if((animalData[increment].nonForageRate*100)==nonForageRateArray[animalIndex]){
									perChngNonForgRat=perChngNonForgRat.concat("0");
									perChngNonForgRat=perChngNonForgRat.concat(":");
									}
									else{
										if(animalData[increment].nonForageRate=="0"){	
										perChngNonForgRat=perChngNonForgRat.concat("0");
										}
										else{
										var change=parseFloat(nonForageRateArray[animalIndex])-parseFloat(animalData[increment].nonForageRate*100);
										var perChange=(change/(parseFloat(animalData[increment].nonForageRate)*100))*100;
										perChngNonForgRat=perChngNonForgRat.concat(perChange);
										}
									perChngNonForgRat=perChngNonForgRat.concat(":");
									}


                                    if(animalData[increment].proteinUnitIndex==proteinUnitIndexArray[animalIndex]){
                                    	perChngUtIdx=perChngUtIdx.concat("0");
                                    	perChngUtIdx=perChngUtIdx.concat(":");
									}
									else{
										if(animalData[increment].proteinUnitIndex=="0"){
											perChngUtIdx=perChngUtIdx.concat("0");
										}	
										else{
											var change=parseFloat(proteinUnitIndexArray[animalIndex])-parseFloat(animalData[increment].proteinUnitIndex);
											var perChange=(change/parseFloat(animalData[increment].proteinUnitIndex))*100;
											perChngUtIdx=perChngUtIdx.concat(perChange);
										}
									perChngUtIdx=perChngUtIdx.concat(":");
									}
								}
							}
		        
			}
		  }
		}
	  }


		var perChngAnmCountList;
		perChngAnmCountList=perChngAnmCount.split(":");

		var perChngNonForgRatList;
		perChngNonForgRatList=perChngNonForgRat.split(":");

		var perChngUtIdxList;
		perChngUtIdxList=perChngUtIdx.split(":");



		var selectedYearChange="";
		var yearSelected = $("#selectYear option:selected").val();
		if(yearSelected==""){
			var arrYears = ${yearList};
			selectedYearChange = arrYears[arrYears.length - 1];
		}
		else{
			selectedYearChange = yearSelected;
			}
		//New Data with updated changed values 
		resultArray.push(countryName + "(new estimate)");
		for ( var yearIndex = 0; yearIndex < arrYears.length; yearIndex++) {
			var nutritionProtein = 0;
			var aquaNutritionProtein = 0;
			var yearNo = arrYears[yearIndex];
			for ( var animalIndex = 0; animalIndex < arrayAnimalName.length; animalIndex++) {
				var animalName = arrayAnimalName[animalIndex].trim();
				for ( var increment in animalData) {
					if (countryName == animalData[increment].countryName) {
						if (animalName == animalData[increment].animalName) {
						
							if (yearNo == animalData[increment].year) {
								var proteinIndex = animalData[increment].proteinUnitIndex;
								if (proteinIndex != null
										&& proteinIndex !== undefined) {
										if(document.getElementById("allYears").checked == true){
											var changeValueType =$("input[name='changeValueType']:checked").val();
											if(changeValueType=="Relative"){
													var animalCountPer=parseInt(animalData[increment].animalCount)+((parseInt(animalData[increment].animalCount))*parseFloat(perChngAnmCountList[animalIndex])/100);
													animalCountPer=animalCountPer.toFixed(0);
													var nfgPer=parseFloat(animalData[increment].nonForageRate)+((parseFloat(animalData[increment].nonForageRate))*parseFloat(perChngNonForgRatList[animalIndex])/100);
													nfgPer=nfgPer.toFixed(2);
													var unitPer=parseFloat(animalData[increment].proteinUnitIndex)+((parseFloat(animalData[increment].proteinUnitIndex))*parseFloat(perChngUtIdxList[animalIndex])/100);
													unitPer=unitPer.toFixed(2);
												}
												else{
													var animalCountPer=parseInt(animalData[increment].animalCount)+parseInt(perChngAnmCountList[animalIndex]);
													animalCountPer=animalCountPer.toFixed(0);
													var nfgPer=parseFloat(animalData[increment].nonForageRate)+parseFloat(perChngNonForgRatList[animalIndex]/100);
													nfgPer=nfgPer.toFixed(2);
													var unitPer=parseFloat(animalData[increment].proteinUnitIndex)+parseFloat(perChngUtIdxList[animalIndex]);
													unitPer=unitPer.toFixed(2);
												}
											}	
										else{
											if(selectedYearChange==yearNo){
													var animalCountPer=parseInt(animalData[increment].animalCount)+((parseInt(animalData[increment].animalCount))*parseFloat(perChngAnmCountList[animalIndex])/100);
													animalCountPer=animalCountPer.toFixed(0);
													var nfgPer=parseFloat(animalData[increment].nonForageRate)+((parseFloat(animalData[increment].nonForageRate))*parseFloat(perChngNonForgRatList[animalIndex])/100);
													nfgPer=nfgPer.toFixed(2);
													var unitPer=parseFloat(animalData[increment].proteinUnitIndex)+((parseFloat(animalData[increment].proteinUnitIndex))*parseFloat(perChngUtIdxList[animalIndex])/100);
													unitPer=unitPer.toFixed(2);
												}
												else{
													var animalCountPer=parseInt(animalData[increment].animalCount);
													animalCountPer=animalCountPer.toFixed(0);
													var nfgPer=parseFloat(animalData[increment].nonForageRate);
													nfgPer=nfgPer.toFixed(2);
													var unitPer=parseFloat(animalData[increment].proteinUnitIndex);
													unitPer=unitPer.toFixed(2);
												}
											
										}		
									nutritionProtein = nutritionProtein
											+ formatNumberRoundOff((animalCountPer*nfgPer* unitPer * 0.319)/(propertyValue*1000));
									//console.log(nutritionProtein);				
								}
							}
						}
					}
				}
			}
			for ( var aqua_increment in aquacultureData) {
				if (countryName == aquacultureData[aqua_increment].countryName) {
					if (yearNo == aquacultureData[aqua_increment].year) {
						var aquaProteinIndex = aquacultureData[aqua_increment].nutritionProtein;
						if (aquaProteinIndex != null
								&& aquaProteinIndex !== undefined) {
							aquaNutritionProtein = aquaNutritionProtein
									+ formatNumberRoundOff((aquacultureData[aqua_increment].nutritionProtein)/(propertyValue*1000));
						}
					}
				}
			}
					var v =nutritionProtein * 1 + aquaNutritionProtein * 1; 

				v = formatNumberRoundOff(v);
				resultArray.push(v);
		}

		//Old Data
		resultArray.push(countryName + "(initial estimate)");
		for ( var yearIndex = 0; yearIndex < arrYears.length; yearIndex++) {
			var nutritionProtein = 0;
			var aquaNutritionProtein = 0;
			var yearNo = arrYears[yearIndex];

			for ( var increment in animalData) {
				if (countryName == animalData[increment].countryName) {
					if (yearNo == animalData[increment].year) {
						var proteinIndex = animalData[increment].proteinUnitIndex;
						if (proteinIndex != null && proteinIndex !== undefined) {
							nutritionProtein = nutritionProtein
									+ formatNumberRoundOff((animalData[increment].animalCount
											* animalData[increment].nonForageRate * proteinIndex * 0.319)/(propertyValue*1000));
						}
					}

				}
			}

			for ( var aqua_increment in aquacultureData) {
				if (countryName == aquacultureData[aqua_increment].countryName) {
					if (yearNo == aquacultureData[aqua_increment].year) {
						var aquaProteinIndex = aquacultureData[aqua_increment].nutritionProtein;
						if (aquaProteinIndex != null
								&& aquaProteinIndex !== undefined) {
							aquaNutritionProtein = aquaNutritionProtein
									+ formatNumberRoundOff((aquacultureData[aqua_increment].nutritionProtein)/(propertyValue*1000));
						}
					}
				}
			}
				var v =nutritionProtein*1  + aquaNutritionProtein * 1; 
				v = formatNumberRoundOff(v);
				resultArray.push(v);
		}

		var myarray = [];
		var arrayLen = resultArray.length;
		for ( var i = 0; i < arrayLen; i = i + 26) {

			var item = {
				"name" : resultArray[i],
				"data" : [ resultArray[i + 1], resultArray[i + 2],
						resultArray[i + 3], resultArray[i + 4] ,
						resultArray[i + 5], resultArray[i + 6] ,
						resultArray[i + 7], resultArray[i + 8] ,
						resultArray[i + 9], resultArray[i + 10] ,
						resultArray[i + 11], resultArray[i + 12] ,
						resultArray[i + 13], resultArray[i + 14] ,
						resultArray[i + 15], resultArray[i + 16] ,
						resultArray[i + 17], resultArray[i + 18] ,
						resultArray[i + 19], resultArray[i + 20] ,
						resultArray[i + 21], resultArray[i + 22] ,
						resultArray[i + 23], resultArray[i + 24] ,
						resultArray[i + 25]
						]

			};

			myarray.push(item);
		}
		return myarray;

	}

	function makeEnergyJson(propertyValue) {

		var animalData = ${animalRawData};
		var aquacultureData = ${aquacultureData};
		var arrYears = ${yearList};

		var listAnimalName = "${animalNameList}";
		var listAnimalName = listAnimalName.replace("[", "");
		var listAnimalName = listAnimalName.replace("]", "");
		var arrayAnimalName;
		arrayAnimalName = listAnimalName.split(",");

		var resultArray = [];
		//var countryName = "${countryName}";

		var countryNameMap = new Array();
		<c:forEach var="entry" items="${countryMap}">
				countryNameMap[${entry.key}] = "${entry.value}";
		</c:forEach>
		var countrySelected =  $("#selectCountry option:selected").val().trim();		
		var countryName = countryNameMap[countrySelected];
		
		var initialYear="";
		var yearSelected = $("#selectYear option:selected").val();
		if(yearSelected==""){
			var arrYears = ${yearList};
			initialYear = arrYears[arrYears.length - 1];
		}
		else{
			initialYear = yearSelected;
		}
				
		
		var animalCountArray=[];
		var nonForageRateArray=[];
		var energyUnitIndexArray=[];
	
		var perChngAnmCount="";
		var perChngNonForgRat="";
		var perChngUtIdx="";
		
		for ( var animalIndex = 0; animalIndex < arrayAnimalName.length; animalIndex++) {
				var AnimalIdCount=(animalIndex+1).toString()+"animalCount";
				var AnimalIdNfg=(animalIndex+1).toString()+"animalNfg";
				var AnimalIdEnergy=(animalIndex+1).toString()+"animalEnergy";
				//var anmCount=document.getElementById(AnimalIdCount).value.replace(/\,/g,'');
				var anmCount;
				if(document.getElementById(AnimalIdCount).value == "N.A."){
					anmCount=0;
				}
				else{
					anmCount=document.getElementById(AnimalIdCount).value.replace(/\,/g,'');
				}
				//var nfg=document.getElementById(AnimalIdNfg).value;
				//var energy=document.getElementById(AnimalIdEnergy).value;
				
				var nfg;
				if(document.getElementById(AnimalIdNfg).value == "N.A."){
					nfg=0;
				}
				else{
					nfg=document.getElementById(AnimalIdNfg).value;
				}

				var energy;
				if(document.getElementById(AnimalIdEnergy).value == "N.A."){
					energy=0;
				}
				else{
					energy=document.getElementById(AnimalIdEnergy).value;
				}
				
				animalCountArray.push(anmCount);
				nonForageRateArray.push(nfg);
				energyUnitIndexArray.push(energy);
			}
			
		for ( var increment in animalData) {
			if (countryName == animalData[increment].countryName) {
				for ( var animalIndex = 0; animalIndex < arrayAnimalName.length; animalIndex++) {
				
					var animalName=arrayAnimalName[animalIndex].trim();
					if (animalName == animalData[increment].animalName) {
					
					if (initialYear == animalData[increment].year) {
							var changeValueType =$("input[name='changeValueType']:checked").val();
							if(document.getElementById("allYears").checked == true){
							
								if(changeValueType=="Relative"){
									if(animalData[increment].animalCount==animalCountArray[animalIndex]){
									perChngAnmCount=perChngAnmCount.concat("0");
									perChngAnmCount=perChngAnmCount.concat(":");
									}
									else{
									var change=parseFloat(animalCountArray[animalIndex])-parseFloat(animalData[increment].animalCount);
									if(animalData[increment].animalCount=="0"){			
										perChngAnmCount=perChngAnmCount.concat("0");
										}
									else{
										var perChange=(change/parseFloat(animalData[increment].animalCount))*100;
										perChngAnmCount=perChngAnmCount.concat(perChange);
									}	
									
									perChngAnmCount=perChngAnmCount.concat(":");
									}
									
									if((animalData[increment].nonForageRate*100)==nonForageRateArray[animalIndex]){
									perChngNonForgRat=perChngNonForgRat.concat("0");
									perChngNonForgRat=perChngNonForgRat.concat(":");
									}
									else{
										if(animalData[increment].nonForageRate=="0"){	
										perChngNonForgRat=perChngNonForgRat.concat("0");
										}
										else{
										var change=parseFloat(nonForageRateArray[animalIndex])-parseFloat(animalData[increment].nonForageRate*100);
										var perChange=(change/(parseFloat(animalData[increment].nonForageRate)*100))*100;
										perChngNonForgRat=perChngNonForgRat.concat(perChange);
										}
									perChngNonForgRat=perChngNonForgRat.concat(":");
									}
								
									
									if(animalData[increment].energyUnitIndex==energyUnitIndexArray[animalIndex]){
										perChngUtIdx=perChngUtIdx.concat("0");
										perChngUtIdx=perChngUtIdx.concat(":");
									}
									else{
										if(animalData[increment].energyUnitIndex=="0"){
												perChngUtIdx=perChngUtIdx.concat("0");
										}
										else{
											var change=parseFloat(energyUnitIndexArray[animalIndex])-parseFloat(animalData[increment].energyUnitIndex);
											var perChange=(change/parseFloat(animalData[increment].energyUnitIndex))*100;
											perChngUtIdx=perChngUtIdx.concat(perChange);
										}
									perChngUtIdx=perChngUtIdx.concat(":");
									}
								}
								else{
									if(animalData[increment].animalCount==animalCountArray[animalIndex]){
									perChngAnmCount=perChngAnmCount.concat("0");
									perChngAnmCount=perChngAnmCount.concat(":");
									}
									else{
									var change=parseFloat(animalCountArray[animalIndex])-parseFloat(animalData[increment].animalCount);
									perChngAnmCount=perChngAnmCount.concat(change);
									perChngAnmCount=perChngAnmCount.concat(":");
									}
									
									if((animalData[increment].nonForageRate*100)==nonForageRateArray[animalIndex]){
									perChngNonForgRat=perChngNonForgRat.concat("0");
									perChngNonForgRat=perChngNonForgRat.concat(":");
									}
									else{
										var change=parseFloat(nonForageRateArray[animalIndex])-parseFloat(animalData[increment].nonForageRate*100);
										perChngNonForgRat=perChngNonForgRat.concat(change);
										perChngNonForgRat=perChngNonForgRat.concat(":");
									}
								
									
									if(animalData[increment].energyUnitIndex==energyUnitIndexArray[animalIndex]){
										perChngUtIdx=perChngUtIdx.concat("0");
										perChngUtIdx=perChngUtIdx.concat(":");
									}
									else{
									
											var change=parseFloat(energyUnitIndexArray[animalIndex])-parseFloat(animalData[increment].energyUnitIndex);
											perChngUtIdx=perChngUtIdx.concat(change);
											perChngUtIdx=perChngUtIdx.concat(":");
									}	
								}
								}
								else{ 
										if(animalData[increment].animalCount==animalCountArray[animalIndex]){
									perChngAnmCount=perChngAnmCount.concat("0");
									perChngAnmCount=perChngAnmCount.concat(":");
									}
									else{
									var change=parseFloat(animalCountArray[animalIndex])-parseFloat(animalData[increment].animalCount);
									if(animalData[increment].animalCount=="0"){			
										perChngAnmCount=perChngAnmCount.concat("0");
										}
									else{
										var perChange=(change/parseFloat(animalData[increment].animalCount))*100;
										perChngAnmCount=perChngAnmCount.concat(perChange);
									}	
									
									perChngAnmCount=perChngAnmCount.concat(":");
									}
									
									if((animalData[increment].nonForageRate*100)==nonForageRateArray[animalIndex]){
									perChngNonForgRat=perChngNonForgRat.concat("0");
									perChngNonForgRat=perChngNonForgRat.concat(":");
									}
									else{
										if(animalData[increment].nonForageRate=="0"){	
										perChngNonForgRat=perChngNonForgRat.concat("0");
										}
										else{
										var change=parseFloat(nonForageRateArray[animalIndex])-parseFloat(animalData[increment].nonForageRate*100);
										var perChange=(change/(parseFloat(animalData[increment].nonForageRate)*100))*100;
										perChngNonForgRat=perChngNonForgRat.concat(perChange);
										}
									perChngNonForgRat=perChngNonForgRat.concat(":");
									}
								
									
									if(animalData[increment].energyUnitIndex==energyUnitIndexArray[animalIndex]){
										perChngUtIdx=perChngUtIdx.concat("0");
										perChngUtIdx=perChngUtIdx.concat(":");
									}
									else{
										if(animalData[increment].energyUnitIndex=="0"){
												perChngUtIdx=perChngUtIdx.concat("0");
										}
										else{
											var change=parseFloat(energyUnitIndexArray[animalIndex])-parseFloat(animalData[increment].energyUnitIndex);
											var perChange=(change/parseFloat(animalData[increment].energyUnitIndex))*100;
											perChngUtIdx=perChngUtIdx.concat(perChange);
										}
									perChngUtIdx=perChngUtIdx.concat(":");
									}
									}
								 

								}
		        
			}
		  }
		}
	  }
		
		
		
		
		
		
		
		var perChngAnmCountList;
		perChngAnmCountList=perChngAnmCount.split(":");

		var perChngNonForgRatList;
		perChngNonForgRatList=perChngNonForgRat.split(":");

		var perChngUtIdxList;
		perChngUtIdxList=perChngUtIdx.split(":");



			var selectedYearChange="";
			var yearSelected = $("#selectYear option:selected").val();
			if(yearSelected==""){
				var arrYears = ${yearList};
				selectedYearChange = arrYears[arrYears.length - 1];
			}
			else{
				selectedYearChange = yearSelected;
				}
			//New Data with updated nfg
			resultArray.push(countryName + "(new estimate)");
			for ( var yearIndex = 0; yearIndex < arrYears.length; yearIndex++) {
				var nutritionEnergy = 0;
				var aquaNutritionEnergy = 0;
				var yearNo = arrYears[yearIndex];
				for ( var animalIndex = 0; animalIndex < arrayAnimalName.length; animalIndex++) {
					var animalName = arrayAnimalName[animalIndex].trim();
					
					for ( var increment in animalData) {
						if (countryName == animalData[increment].countryName) {
							if (animalName == animalData[increment].animalName) {
								if (yearNo == animalData[increment].year) {
									var energyIndex = animalData[increment].energyUnitIndex;
									if (energyIndex != null
											&& energyIndex !== undefined) {
											
										if(document.getElementById("allYears").checked == true){
												var changeValueType =$("input[name='changeValueType']:checked").val();
												if(changeValueType=="Relative"){	
													var animalCountPer=parseInt(animalData[increment].animalCount)+((parseInt(animalData[increment].animalCount))*parseFloat(perChngAnmCountList[animalIndex])/100);
													animalCountPer=animalCountPer.toFixed(0);
													var nfgPer=parseFloat(animalData[increment].nonForageRate)+((parseFloat(animalData[increment].nonForageRate))*parseFloat(perChngNonForgRatList[animalIndex])/100);
													nfgPer=nfgPer.toFixed(2);
													var unitPer=parseFloat(animalData[increment].energyUnitIndex)+((parseFloat(animalData[increment].energyUnitIndex))*parseFloat(perChngUtIdxList[animalIndex])/100);
													unitPer=unitPer.toFixed(2);
												}
											else{
													var animalCountPer=parseInt(animalData[increment].animalCount)+parseInt(perChngAnmCountList[animalIndex]);
													animalCountPer=animalCountPer.toFixed(0);
													var nfgPer=parseFloat(animalData[increment].nonForageRate)+parseFloat(perChngNonForgRatList[animalIndex]/100);
													nfgPer=nfgPer.toFixed(2);
													var unitPer=parseFloat(animalData[increment].energyUnitIndex)+parseFloat(perChngUtIdxList[animalIndex]);
													unitPer=unitPer.toFixed(2);
											}	
										
										}
										else{
												if(selectedYearChange==yearNo){
													var animalCountPer=parseInt(animalData[increment].animalCount)+((parseInt(animalData[increment].animalCount))*parseFloat(perChngAnmCountList[animalIndex])/100);
													animalCountPer=animalCountPer.toFixed(0);
													var nfgPer=parseFloat(animalData[increment].nonForageRate)+((parseFloat(animalData[increment].nonForageRate))*parseFloat(perChngNonForgRatList[animalIndex])/100);
													nfgPer=nfgPer.toFixed(2);
													var unitPer=parseFloat(animalData[increment].energyUnitIndex)+((parseFloat(animalData[increment].energyUnitIndex))*parseFloat(perChngUtIdxList[animalIndex])/100);
													unitPer=unitPer.toFixed(2);
												}
												else{
													var animalCountPer=parseInt(animalData[increment].animalCount);
													animalCountPer=animalCountPer.toFixed(0);
													var nfgPer=parseFloat(animalData[increment].nonForageRate);
													nfgPer=nfgPer.toFixed(2);
													var unitPer=parseFloat(animalData[increment].energyUnitIndex);
													unitPer=unitPer.toFixed(2);
												}
												
									
										}
											
										nutritionEnergy = nutritionEnergy
												+ formatNumberRoundOff((animalCountPer*nfgPer* unitPer*35600)/(propertyValue*1000000));
										//console.log(nutritionEnergy);				
									}
								}
							}
						}
					}
				}
				for ( var aqua_increment in aquacultureData) {
					if (countryName == aquacultureData[aqua_increment].countryName) {
						if (yearNo == aquacultureData[aqua_increment].year) {
							var aquaEnergyIndex = aquacultureData[aqua_increment].nutritionEnergy;
							if (aquaEnergyIndex != null
									&& aquaEnergyIndex !== undefined) {
								aquaNutritionEnergy = aquaNutritionEnergy
										+ formatNumberRoundOff((aquacultureData[aqua_increment].nutritionEnergy)/(propertyValue*1000));
							}
						}
					}
				}
				var v = nutritionEnergy  + aquaNutritionEnergy * 1;
				v = formatNumberRoundOff(v);
				
				resultArray.push(v);
			}
		

		//Old Data
		resultArray.push(countryName + "(initial estimate)");
		for ( var yearIndex = 0; yearIndex < arrYears.length; yearIndex++) {
			var nutritionEnergy = 0;
			var aquaNutritionEnergy = 0;
			var yearNo = arrYears[yearIndex];
			
			

			for ( var increment in animalData) {
				if (countryName == animalData[increment].countryName) {
					if (yearNo == animalData[increment].year) {
							var energyIndex = animalData[increment].energyUnitIndex;
								if (energyIndex != null && energyIndex !== undefined) {
									nutritionEnergy = nutritionEnergy
											+ formatNumberRoundOff((animalData[increment].animalCount
													* animalData[increment].nonForageRate * energyIndex * 35600)/(propertyValue* 1000000));
								}

					}

				}
			}

			for ( var aqua_increment in aquacultureData) {
				if (countryName == aquacultureData[aqua_increment].countryName) {
					if (yearNo == aquacultureData[aqua_increment].year) {
						var aquaEnergyIndex = aquacultureData[aqua_increment].nutritionEnergy;
						if (aquaEnergyIndex != null
								&& aquaEnergyIndex !== undefined) {
							aquaNutritionEnergy = aquaNutritionEnergy
									+ formatNumberRoundOff((aquacultureData[aqua_increment].nutritionEnergy)/(propertyValue*1000));
						}
					}
				}
			}
			var v = nutritionEnergy * 1 + aquaNutritionEnergy * 1;
			v = formatNumberRoundOff(v);
		
			resultArray.push(v);
		}
		
		

		var myarray = [];
		var arrayLen = resultArray.length;
		for ( var i = 0; i < arrayLen; i = i + 26) {

			var item = {
				"name" : resultArray[i],
				"data" : [ resultArray[i + 1], resultArray[i + 2],
						resultArray[i + 3], resultArray[i + 4] ,
						resultArray[i + 5], resultArray[i + 6] ,
						resultArray[i + 7], resultArray[i + 8] ,
						resultArray[i + 9], resultArray[i + 10] ,
						resultArray[i + 11], resultArray[i + 12] ,
						resultArray[i + 13], resultArray[i + 14] ,
						resultArray[i + 15], resultArray[i + 16] ,
						resultArray[i + 17], resultArray[i + 18] ,
						resultArray[i + 19], resultArray[i + 20] ,
						resultArray[i + 21], resultArray[i + 22] ,
						resultArray[i + 23], resultArray[i + 24],
						resultArray[i + 25]
						]

			};

			myarray.push(item);
		}
		var resultJson = JSON.stringify(myarray);
//		console.log(resultJson);
		return myarray;

	}


	function reportChanges() {
			$('#collapseTable').empty();
			$('#collapseChangeInfoTable').empty();
				$('#getReporterDetails').modal('show');
			}
		
		function sendMail() {
				reporterName = document.getElementById('reporterName').value;
				reporterEmail = document.getElementById('reporterEmail').value;
				reporterComments = document.getElementById('reporterComments').value;

					
				var countryNameMap = new Array();
				<c:forEach var="entry" items="${countryMap}">
						countryNameMap[${entry.key}] = "${entry.value}";
				</c:forEach>
				var country =  $("#selectCountry option:selected").val().trim();		
				var countryName = countryNameMap[country];
			
				var unitIndx =$("input[name='selectEnergyEquivalent']:checked").val();
				
				var property =  $("#selectIndex option:selected").val().trim();
				
				var animalData = ${animalRawData};
				var aquacultureData = ${aquacultureData};
				
				
				var listAnimalName = "${animalNameList}";
				var listAnimalName = listAnimalName.replace("[", "");
				var listAnimalName = listAnimalName.replace("]", "");
				var arrayAnimal;
				arrayAnimal = listAnimalName.split(",");

				var latestYear="";
				var yearSelected = $("#selectYear option:selected").val();
				if(yearSelected==""){
					var arrYears = ${yearList};
					latestYear = arrYears[arrYears.length - 1];
				}
				else{
					latestYear = yearSelected;
				}			
				
				var animalCountArray=[];
				var nonForageRateArray=[];
				var energyUnitIndexArray=[];
				var proteinUnitIndexArray=[];
				
				var perChngAnmCount="";
				var perChngNonForgRat="";
				var perChngUtIdx="";
				
		for ( var animalIndex = 0; animalIndex < arrayAnimal.length; animalIndex++) {
				var AnimalIdCount=(animalIndex+1).toString()+"animalCount";
				var AnimalIdNfg=(animalIndex+1).toString()+"animalNfg";
				var AnimalIdEnergy=(animalIndex+1).toString()+"animalEnergy";
				var AnimalIdProtein=(animalIndex+1).toString()+"animalProtein";
//				var anmCount=document.getElementById(AnimalIdCount).value.replace(/\,/g,'');
				var anmCount;
				if(document.getElementById(AnimalIdCount).value == "N.A."){
					anmCount=0;
				}
				else{
					anmCount=document.getElementById(AnimalIdCount).value.replace(/\,/g,'');
				}				
				//var nfg=document.getElementById(AnimalIdNfg).value;
				//var energy=document.getElementById(AnimalIdEnergy).value;
				//var protein=document.getElementById(AnimalIdProtein).value;
				
				var nfg;
				if(document.getElementById(AnimalIdNfg).value == "N.A."){
					nfg=0;
				}
				else{
					nfg=document.getElementById(AnimalIdNfg).value;
				}

				var energy;
				if(document.getElementById(AnimalIdEnergy).value == "N.A."){
					energy=0;
				}
				else{
					energy=document.getElementById(AnimalIdEnergy).value;
				}
				
				var protein;
				if(document.getElementById(AnimalIdProtein).value == "N.A."){
					protein=0;
				}
				else{
					protein=document.getElementById(AnimalIdProtein).value;
				}
				
				
				animalCountArray.push(anmCount);
				nonForageRateArray.push(nfg);
				energyUnitIndexArray.push(energy);
				proteinUnitIndexArray.push(protein);
			}
		for ( var increment in animalData) {
		
			if (countryName == animalData[increment].countryName) {
				for ( var animalIndex = 0; animalIndex < arrayAnimal.length; animalIndex++) {
				
					var animalName=arrayAnimal[animalIndex].trim();
					if (animalName == animalData[increment].animalName) {
					
					if (initialYear == animalData[increment].year) {
						changeValueType =$("input[name='changeValueType']:checked").val();
						if(changeValueType=="Relative"){
									if(animalData[increment].animalCount==animalCountArray[animalIndex]){
									
									perChngAnmCount=perChngAnmCount.concat("0");
									perChngAnmCount=perChngAnmCount.concat(":");
									
									}
									else{
									var change=parseFloat(animalCountArray[animalIndex])-parseFloat(animalData[increment].animalCount);
									if(animalData[increment].animalCount=="0"){			
										perChngAnmCount=perChngAnmCount.concat("0");
										}
									else{
										var perChange=(change/parseFloat(animalData[increment].animalCount))*100;
										perChngAnmCount=perChngAnmCount.concat(perChange);
									}	
									
									perChngAnmCount=perChngAnmCount.concat(":");
									}
									
									if((animalData[increment].nonForageRate*100)==nonForageRateArray[animalIndex]){
									perChngNonForgRat=perChngNonForgRat.concat("0");
									perChngNonForgRat=perChngNonForgRat.concat(":");
									}
									else{
										if(animalData[increment].nonForageRate=="0"){	
										perChngNonForgRat=perChngNonForgRat.concat("0");
										}
										else{
										var change=parseFloat(nonForageRateArray[animalIndex])-parseFloat(animalData[increment].nonForageRate*100);
										var perChange=(change/(parseFloat(animalData[increment].nonForageRate)*100))*100;
										perChngNonForgRat=perChngNonForgRat.concat(perChange);
										}
									perChngNonForgRat=perChngNonForgRat.concat(":");
									}
								if(unitIndx=="Energy"){
									
									if(animalData[increment].energyUnitIndex==energyUnitIndexArray[animalIndex]){
										perChngUtIdx=perChngUtIdx.concat("0");
										perChngUtIdx=perChngUtIdx.concat(":");
									}
									else{
										if(animalData[increment].energyUnitIndex=="0"){
												perChngUtIdx=perChngUtIdx.concat("0");
										}
										else{
											var change=parseFloat(energyUnitIndexArray[animalIndex])-parseFloat(animalData[increment].energyUnitIndex);
											var perChange=(change/parseFloat(animalData[increment].energyUnitIndex))*100;
											perChngUtIdx=perChngUtIdx.concat(perChange);
										}
									perChngUtIdx=perChngUtIdx.concat(":");
									}

								  }
								  else{
                                    
                                    if(animalData[increment].proteinUnitIndex==proteinUnitIndexArray[animalIndex]){
                                    	perChngUtIdx=perChngUtIdx.concat("0");
                                    	perChngUtIdx=perChngUtIdx.concat(":");
									}
									else{
										if(animalData[increment].proteinUnitIndex=="0"){
											perChngUtIdx=perChngUtIdx.concat("0");
										}	
										else{
											var change=parseFloat(proteinUnitIndexArray[animalIndex])-parseFloat(animalData[increment].proteinUnitIndex);
											var perChange=(change/parseFloat(animalData[increment].proteinUnitIndex))*100;
											perChngUtIdx=perChngUtIdx.concat(perChange);
										}
									perChngUtIdx=perChngUtIdx.concat(":");
									}									
								  }
						}
						else{
								if(animalData[increment].animalCount==animalCountArray[animalIndex]){
									
									perChngAnmCount=perChngAnmCount.concat("0");
									perChngAnmCount=perChngAnmCount.concat(":");
									
									}
									else{
									var change=parseFloat(animalCountArray[animalIndex])-parseFloat(animalData[increment].animalCount);
									perChngAnmCount=perChngAnmCount.concat(change);
									perChngAnmCount=perChngAnmCount.concat(":");
									}
									
									if((animalData[increment].nonForageRate*100)==nonForageRateArray[animalIndex]){
									perChngNonForgRat=perChngNonForgRat.concat("0");
									perChngNonForgRat=perChngNonForgRat.concat(":");
									}
									else{
										var change=parseFloat(nonForageRateArray[animalIndex])-parseFloat(animalData[increment].nonForageRate*100);
										perChngNonForgRat=perChngNonForgRat.concat(change);
										perChngNonForgRat=perChngNonForgRat.concat(":");
									}
								if(unitIndx=="Energy"){
									
									if(animalData[increment].energyUnitIndex==energyUnitIndexArray[animalIndex]){
										perChngUtIdx=perChngUtIdx.concat("0");
										perChngUtIdx=perChngUtIdx.concat(":");
									}
									else{
											var change=parseFloat(energyUnitIndexArray[animalIndex])-parseFloat(animalData[increment].energyUnitIndex);
											perChngUtIdx=perChngUtIdx.concat(change);
											perChngUtIdx=perChngUtIdx.concat(":");
									}
								  }
								  else{
                                    
                                    if(animalData[increment].proteinUnitIndex==proteinUnitIndexArray[animalIndex]){
                                    	perChngUtIdx=perChngUtIdx.concat("0");
                                    	perChngUtIdx=perChngUtIdx.concat(":");
									}
									else{
											var change=parseFloat(proteinUnitIndexArray[animalIndex])-parseFloat(animalData[increment].proteinUnitIndex);
											perChngUtIdx=perChngUtIdx.concat(change);
											perChngUtIdx=perChngUtIdx.concat(":");
									}									
								  }
						}		
						
					}
		        
			}
		  }
		}
	  }	
		var	allYear;
		if(document.getElementById("allYears").checked == true){
			allYear =1;
		}
		else {
			allYear =0;
		}
		
				
				jQuery.ajax({
					type : "POST",
					url : getContextPath() + "/reportChanges.html",
					data : ({
						country : country,
						unitIndex :unitIndx,
						property : property,
						perChngAnmCount : perChngAnmCount,
						 perChngNonForgRat : perChngNonForgRat,
						 perChngUtIdx : perChngUtIdx,
						name : reporterName,
						email : reporterEmail,
						commnet : reporterComments,
						changeValueType : changeValueType,
						yearSelected : yearSelected,
						allYear : allYear
					}),
					success : function(data) {
						alert("Thanks for submitting your analysis. Mail has been sent successfully.");
						jQuery("#animalData").html(data);
						window.location.href = getContextPath()
						+ "/index.html";
					}
				});
		 }


function showChangeTypeOptions(){
	if(document.getElementById("allYears").checked != true){
		document.getElementById("changeType").hidden= true;
		var x = document.getElementById('regenerateData');
		x.style.background = '#428bca';
		x.style.color = '#ffffff';	

	}
	else{
		document.getElementById("changeType").hidden= false;
		var x = document.getElementById('regenerateData');
		x.style.background = '#d43f3a';
		x.style.color = '#ffffff';
	}
	
}


function goBack() {

window.history.back();
}

function showScenario() {
window.location.href = getContextPath()
				+ "/showSimulator.html";

}


	function showChanges() {
				$('#collapseTable').empty();
				
				$('#collapseChangeInfoTable').empty();
				document.getElementById("collapseDiv").hidden = false;
		

	
		var animalData = ${animalRawData};
		var aquacultureData = ${aquacultureData};
		var arrYears = ${yearList};
		
		var listAnimalName = "${animalNameList}";
		var listAnimalName = listAnimalName.replace("[", "");
		var listAnimalName = listAnimalName.replace("]", "");
		var arrayAnimalName;
		arrayAnimalName = listAnimalName.split(",");

		var resultArray = [];
		//var countryName = "${countryName}";

		var countryNameMap = new Array();
		<c:forEach var="entry" items="${countryMap}">
				countryNameMap[${entry.key}] = "${entry.value}";
		</c:forEach>
		var countrySelected =  $("#selectCountry option:selected").val().trim();		
		var countryName = countryNameMap[countrySelected];
		
		var initialYear="";
		var yearSelected = $("#selectYear option:selected").val();
		if(yearSelected==""){
			var arrYears = ${yearList};
			initialYear = arrYears[arrYears.length - 1];
		}
		else{
			initialYear = yearSelected;
		}
				
		var unitIndx =$("input[name='selectEnergyEquivalent']:checked").val();
		var animalCountArray=[];
		var nonForageRateArray=[];
		var energyUnitIndexArray=[];
		var proteinUnitIndexArray=[];
	
		var perChngAnmCount="";
		var perChngNonForgRat="";
		var perChngUtIdx="";
		
		var noChange=0;
		
		for ( var animalIndex = 0; animalIndex < arrayAnimalName.length; animalIndex++) {
				var AnimalIdCount=(animalIndex+1).toString()+"animalCount";
				var AnimalIdNfg=(animalIndex+1).toString()+"animalNfg";
				var AnimalIdEnergy=(animalIndex+1).toString()+"animalEnergy";
				var AnimalIdProtein=(animalIndex+1).toString()+"animalProtein";
//				var anmCount=document.getElementById(AnimalIdCount).value.replace(/\,/g,'');
				var anmCount;
				if(document.getElementById(AnimalIdCount).value == "N.A."){
					anmCount=0;
				}
				else{
					anmCount=document.getElementById(AnimalIdCount).value.replace(/\,/g,'');
				}
				//var nfg=document.getElementById(AnimalIdNfg).value;
				//var energy=document.getElementById(AnimalIdEnergy).value;
				//var protein=document.getElementById(AnimalIdProtein).value;
				
				var nfg;
				if(document.getElementById(AnimalIdNfg).value == "N.A."){
					nfg=0;
				}
				else{
					nfg=document.getElementById(AnimalIdNfg).value;
				}

				var energy;
				if(document.getElementById(AnimalIdEnergy).value == "N.A."){
					energy=0;
				}
				else{
					energy=document.getElementById(AnimalIdEnergy).value;
				}
				
				var protein;
				if(document.getElementById(AnimalIdProtein).value == "N.A."){
					protein=0;
				}
				else{
					protein=document.getElementById(AnimalIdProtein).value;
				}
				
				
				animalCountArray.push(anmCount);
				nonForageRateArray.push(nfg);
				energyUnitIndexArray.push(energy);
				proteinUnitIndexArray.push(protein);
			}
			
		for ( var increment in animalData) {
			if (countryName == animalData[increment].countryName) {
				for ( var animalIndex = 0; animalIndex < arrayAnimalName.length; animalIndex++) {
				
					var animalName=arrayAnimalName[animalIndex].trim();
					if (animalName == animalData[increment].animalName) {
					
					if (initialYear == animalData[increment].year) {
							var changeValueType =$("input[name='changeValueType']:checked").val();
							if(document.getElementById("allYears").checked == true) {
								if(changeValueType=="Relative"){
									if(animalData[increment].animalCount==animalCountArray[animalIndex]){
									perChngAnmCount=perChngAnmCount.concat("0");
									perChngAnmCount=perChngAnmCount.concat(":");
									}
									else{
									var change=parseFloat(animalCountArray[animalIndex])-parseFloat(animalData[increment].animalCount);
									if(animalData[increment].animalCount=="0"){			
										perChngAnmCount=perChngAnmCount.concat("0");
										}
									else{
										var perChange=(change/parseFloat(animalData[increment].animalCount))*100;
										perChngAnmCount=perChngAnmCount.concat(perChange);
										noChange=1;
									}	
									
									perChngAnmCount=perChngAnmCount.concat(":");
									}
									
									if((animalData[increment].nonForageRate*100)==nonForageRateArray[animalIndex]){
									perChngNonForgRat=perChngNonForgRat.concat("0");
									perChngNonForgRat=perChngNonForgRat.concat(":");
									}
									else{
										if(animalData[increment].nonForageRate=="0"){	
										perChngNonForgRat=perChngNonForgRat.concat("0");
										}
										else{
										var change=parseFloat(nonForageRateArray[animalIndex])-parseFloat(animalData[increment].nonForageRate*100);
										var perChange=(change/(parseFloat(animalData[increment].nonForageRate)*100))*100;
										perChngNonForgRat=perChngNonForgRat.concat(perChange);
										noChange=1;
										}
									perChngNonForgRat=perChngNonForgRat.concat(":");
									}
								
									if(unitIndx=="Energy"){
											if(animalData[increment].energyUnitIndex==energyUnitIndexArray[animalIndex]){
												perChngUtIdx=perChngUtIdx.concat("0");
												perChngUtIdx=perChngUtIdx.concat(":");
											}
											else{
												if(animalData[increment].energyUnitIndex=="0"){
														perChngUtIdx=perChngUtIdx.concat("0");
												}
												else{
													var change=parseFloat(energyUnitIndexArray[animalIndex])-parseFloat(animalData[increment].energyUnitIndex);
													var perChange=(change/parseFloat(animalData[increment].energyUnitIndex))*100;
													perChngUtIdx=perChngUtIdx.concat(perChange);
													noChange=1;
												}
											perChngUtIdx=perChngUtIdx.concat(":");
											}
										}
									else{
											if(animalData[increment].proteinUnitIndex==proteinUnitIndexArray[animalIndex]){
												perChngUtIdx=perChngUtIdx.concat("0");
												perChngUtIdx=perChngUtIdx.concat(":");
											}
											else{
												if(animalData[increment].proteinUnitIndex=="0"){
														perChngUtIdx=perChngUtIdx.concat("0");
												}
												else{
													var change=parseFloat(proteinUnitIndexArray[animalIndex])-parseFloat(animalData[increment].proteinUnitIndex);
													var perChange=(change/parseFloat(animalData[increment].proteinUnitIndex))*100;
													perChngUtIdx=perChngUtIdx.concat(perChange);
													noChange=1;
												}
											perChngUtIdx=perChngUtIdx.concat(":");
											}
									
									
									}	
								}
								else{
									if(animalData[increment].animalCount==animalCountArray[animalIndex]){
									perChngAnmCount=perChngAnmCount.concat("0");
									perChngAnmCount=perChngAnmCount.concat(":");
									}
									else{
									var change=parseFloat(animalCountArray[animalIndex])-parseFloat(animalData[increment].animalCount);
									perChngAnmCount=perChngAnmCount.concat(change);
									perChngAnmCount=perChngAnmCount.concat(":");
									noChange=1;
									}
									
									if((animalData[increment].nonForageRate*100)==nonForageRateArray[animalIndex]){
									perChngNonForgRat=perChngNonForgRat.concat("0");
									perChngNonForgRat=perChngNonForgRat.concat(":");
									}
									else{
										var change=parseFloat(nonForageRateArray[animalIndex])-parseFloat(animalData[increment].nonForageRate*100);
										perChngNonForgRat=perChngNonForgRat.concat(change);
										perChngNonForgRat=perChngNonForgRat.concat(":");
										noChange=1;
									}
								
									if(unitIndx=="Energy"){
										if(animalData[increment].energyUnitIndex==energyUnitIndexArray[animalIndex]){
											perChngUtIdx=perChngUtIdx.concat("0");
											perChngUtIdx=perChngUtIdx.concat(":");
										}
										else{
										
												var change=parseFloat(energyUnitIndexArray[animalIndex])-parseFloat(animalData[increment].energyUnitIndex);
												perChngUtIdx=perChngUtIdx.concat(change);
												perChngUtIdx=perChngUtIdx.concat(":");
												noChange=1;
										}
									}
									else{
										if(animalData[increment].proteinUnitIndex==proteinUnitIndexArray[animalIndex]){
											perChngUtIdx=perChngUtIdx.concat("0");
											perChngUtIdx=perChngUtIdx.concat(":");
										}
										else{
										
												var change=parseFloat(proteinUnitIndexArray[animalIndex])-parseFloat(animalData[increment].proteinUnitIndex);
												perChngUtIdx=perChngUtIdx.concat(change);
												perChngUtIdx=perChngUtIdx.concat(":");
												noChange=1;
										}
									}		
								}
								}
								else{
									if(animalData[increment].animalCount==animalCountArray[animalIndex]){
									perChngAnmCount=perChngAnmCount.concat("0");
									perChngAnmCount=perChngAnmCount.concat(":");
									}
									else{
									var change=parseFloat(animalCountArray[animalIndex])-parseFloat(animalData[increment].animalCount);
									if(animalData[increment].animalCount=="0"){			
										perChngAnmCount=perChngAnmCount.concat("0");
										}
									else{
										var perChange=(change/parseFloat(animalData[increment].animalCount))*100;
										perChngAnmCount=perChngAnmCount.concat(perChange);
										noChange=1;
									}	
									
									perChngAnmCount=perChngAnmCount.concat(":");
									}
									
									if((animalData[increment].nonForageRate*100)==nonForageRateArray[animalIndex]){
									perChngNonForgRat=perChngNonForgRat.concat("0");
									perChngNonForgRat=perChngNonForgRat.concat(":");
									}
									else{
										if(animalData[increment].nonForageRate=="0"){	
										perChngNonForgRat=perChngNonForgRat.concat("0");
										}
										else{
										var change=parseFloat(nonForageRateArray[animalIndex])-parseFloat(animalData[increment].nonForageRate*100);
										var perChange=(change/(parseFloat(animalData[increment].nonForageRate)*100))*100;
										perChngNonForgRat=perChngNonForgRat.concat(perChange);
										noChange=1;
										}
									perChngNonForgRat=perChngNonForgRat.concat(":");
									}
								
									if(unitIndx=="Energy"){
											if(animalData[increment].energyUnitIndex==energyUnitIndexArray[animalIndex]){
												perChngUtIdx=perChngUtIdx.concat("0");
												perChngUtIdx=perChngUtIdx.concat(":");
											}
											else{
												if(animalData[increment].energyUnitIndex=="0"){
														perChngUtIdx=perChngUtIdx.concat("0");
												}
												else{
													var change=parseFloat(energyUnitIndexArray[animalIndex])-parseFloat(animalData[increment].energyUnitIndex);
													var perChange=(change/parseFloat(animalData[increment].energyUnitIndex))*100;
													perChngUtIdx=perChngUtIdx.concat(perChange);
													noChange=1;
												}
											perChngUtIdx=perChngUtIdx.concat(":");
											}
										}
									else{
											if(animalData[increment].proteinUnitIndex==proteinUnitIndexArray[animalIndex]){
												perChngUtIdx=perChngUtIdx.concat("0");
												perChngUtIdx=perChngUtIdx.concat(":");
											}
											else{
												if(animalData[increment].proteinUnitIndex=="0"){
														perChngUtIdx=perChngUtIdx.concat("0");
												}
												else{
													var change=parseFloat(proteinUnitIndexArray[animalIndex])-parseFloat(animalData[increment].proteinUnitIndex);
													var perChange=(change/parseFloat(animalData[increment].proteinUnitIndex))*100;
													perChngUtIdx=perChngUtIdx.concat(perChange);
													noChange=1;
												}
											perChngUtIdx=perChngUtIdx.concat(":");
											}
									
									
									}
								}
								    

								}
		        
			}
		  }
		}
	  }
		
		

		var perChngAnmCountList;
		perChngAnmCountList=perChngAnmCount.split(":");
		
		var perChngNonForgRatList;
		perChngNonForgRatList=perChngNonForgRat.split(":");


		var perChngUtIdxList;
		perChngUtIdxList=perChngUtIdx.split(":");

		

		var propertySelectedKey="";
		var propertyValueMap = new Array();
		<c:forEach var="entry" items="${propertyMap}">
			propertyValueMap["${entry.key}"] = "${entry.value}";
		</c:forEach>

		var propertySelected =  $("#selectIndex option:selected").val().trim().replace(/\s/g,'');
		var unitIndexSelected =$("input[name='selectEnergyEquivalent']:checked").val();
		
		if(unitIndexSelected=="Energy"){
			propertySelectedKey=propertySelected+"Energy";
		}
		else{
			propertySelectedKey=propertySelected+"Protein";
		}	
		var propertyValue = propertyValueMap[propertySelectedKey];
		if(propertySelected=="None"){
			propertyValue=1;
		}

				var resultArray = [];
				var countryNameMap = new Array();
				<c:forEach var="entry" items="${countryMap}">
						countryNameMap[${entry.key}] = "${entry.value}";
				</c:forEach>
				
				var unitIndx = $("input[name='selectEnergyEquivalent']:checked").val();
					
				if(document.getElementById("allYears").checked != true) {
					
						var nutrition = 0;
						var nutritionNew = 0;
						var yearNo = yearSelected;
							
						for ( var increment in animalData) {
							if (countryName == animalData[increment].countryName) {
								if (yearNo == animalData[increment].year) {
									if (unitIndx == "Energy") {
										var energyIndex = animalData[increment].energyUnitIndex;
										if (energyIndex != null
												&& energyIndex !== undefined) {
											nutrition = nutrition
													+ formatNumberRoundOff((animalData[increment].animalCount
															* animalData[increment].nonForageRate * energyIndex*35600)/(1000000*propertyValue));
										}

									} else {

										var proteinIndex = animalData[increment].proteinUnitIndex;
										if (proteinIndex != null
												&& proteinIndex !== undefined) {
											nutrition = nutrition
													+ formatNumberRoundOff((animalData[increment].animalCount
															* animalData[increment].nonForageRate * proteinIndex*0.319)/(1000*propertyValue));
										}

									}

								}
							}
						}
						
						for ( var animalIndex = 0; animalIndex < arrayAnimalName.length; animalIndex++) {
							var animalName = arrayAnimalName[animalIndex].trim();
							
							for ( var increment in animalData) {
								if (countryName == animalData[increment].countryName) {					
									if(animalName == animalData[increment].animalName){
												
										if (yearNo == animalData[increment].year) {
										if (unitIndx == "Energy") {
											var energyIndex = animalData[increment].energyUnitIndex;
											if (energyIndex != null
													&& energyIndex !== undefined) {
												var changeValueType =$("input[name='changeValueType']:checked").val();
												
														var animalCountPer=parseInt(animalData[increment].animalCount)+((parseInt(animalData[increment].animalCount))*parseFloat(perChngAnmCountList[animalIndex])/100);
														animalCountPer=animalCountPer.toFixed(0);
														var nfgPer=parseFloat(animalData[increment].nonForageRate)+((parseFloat(animalData[increment].nonForageRate))*parseFloat(perChngNonForgRatList[animalIndex])/100);
														nfgPer=nfgPer.toFixed(2);
														var unitPer=parseFloat(animalData[increment].energyUnitIndex)+((parseFloat(animalData[increment].energyUnitIndex))*parseFloat(perChngUtIdxList[animalIndex])/100);
														unitPer=unitPer.toFixed(2);
													
												nutritionNew = nutritionNew
														+ formatNumberRoundOff(( animalCountPer*nfgPer*unitPer*35600)/(1000000*propertyValue));
											}

										} else {

											var proteinIndex = animalData[increment].proteinUnitIndex;
											
											if (proteinIndex != null
													&& proteinIndex !== undefined) {
											var changeValueType =$("input[name='changeValueType']:checked").val();
									
												var animalCountPer=parseInt(animalData[increment].animalCount)+((parseInt(animalData[increment].animalCount))*parseFloat(perChngAnmCountList[animalIndex])/100);
												animalCountPer=animalCountPer.toFixed(0);
												var nfgPer=parseFloat(animalData[increment].nonForageRate)+((parseFloat(animalData[increment].nonForageRate))*parseFloat(perChngNonForgRatList[animalIndex])/100);
												nfgPer=nfgPer.toFixed(2);
												var unitPer=parseFloat(animalData[increment].proteinUnitIndex)+((parseFloat(animalData[increment].proteinUnitIndex))*parseFloat(perChngUtIdxList[animalIndex])/100);
												
												unitPer=unitPer.toFixed(2);
												
												nutritionNew = nutritionNew
														+ formatNumberRoundOff((animalCountPer*nfgPer*unitPer*0.319)/(1000*propertyValue));
												
											}

										}

									}
									
									}
									
									
								}

							}
						
						}	

						//aqua
						for ( var aqua_increment in aquacultureData) {
							if (countryName == aquacultureData[aqua_increment].countryName) {
								if (yearNo == aquacultureData[aqua_increment].year) {
									if (unitIndx == "Energy") {
										var energyIndex = aquacultureData[aqua_increment].nutritionEnergy;
										if (energyIndex != null
												&& energyIndex !== undefined) {
											nutrition = nutrition
													+ formatNumberRoundOff((aquacultureData[aqua_increment].nutritionEnergy * 1)/(propertyValue *1000));
													
											nutritionNew = nutritionNew
													+ formatNumberRoundOff((aquacultureData[aqua_increment].nutritionEnergy * 1)/(propertyValue *1000));
													
													
										//	nutrition = nutrition / (propertyValue *1000);
										//	nutritionNew = nutritionNew / (propertyValue *1000);		
										}
									} else {
										var proteinIndex = aquacultureData[aqua_increment].nutritionProtein;
										if (proteinIndex != null
												&& proteinIndex !== undefined) {
											nutrition = nutrition
													+  formatNumberRoundOff((aquacultureData[aqua_increment].nutritionProtein * 1)/(propertyValue *1000));
											nutritionNew = nutritionNew
													+  formatNumberRoundOff((aquacultureData[aqua_increment].nutritionProtein * 1)/(propertyValue *1000));
											//nutrition = nutrition / (propertyValue *1000);
											//nutritionNew = nutritionNew / (propertyValue *1000);														
										}

									}
								}
							}
						}

							if(noChange == 1){
								$('#collapseTable').prepend(
									'<tr><td style="text-align: center;">' + yearNo + '</td>' + '<td style="text-align: center;">'
											+ formatNumber(formatNumberRoundOff(nutritionNew)) + '</td>' + '<td style="text-align: center;">' + formatNumber(formatNumberRoundOff(nutrition))
											+ '</td></tr>');
							}
							
					
				
				}
				else {
				
					for ( var yearIndex = 0; yearIndex < arrYears.length; yearIndex++) {
						
						var nutrition = 0;
						var nutritionNew = 0;
						var yearNo = arrYears[yearIndex];
						
						for ( var increment in animalData) {
							if (countryName == animalData[increment].countryName) {
								if (yearNo == animalData[increment].year) {
									if (unitIndx == "Energy") {
										var energyIndex = animalData[increment].energyUnitIndex;
										if (energyIndex != null
												&& energyIndex !== undefined) {
											nutrition = nutrition
													+ formatNumberRoundOff((animalData[increment].animalCount
															* animalData[increment].nonForageRate * energyIndex*35600)/(propertyValue*1000000));
										}

									} else {

										var proteinIndex = animalData[increment].proteinUnitIndex;
										if (proteinIndex != null
												&& proteinIndex !== undefined) {
											nutrition = nutrition
													+ formatNumberRoundOff((animalData[increment].animalCount
															* animalData[increment].nonForageRate * proteinIndex*0.319)/(propertyValue*1000));
										}

									}

								}
							}
						}
						
						for ( var animalIndex = 0; animalIndex < arrayAnimalName.length; animalIndex++) {
							var animalName = arrayAnimalName[animalIndex].trim();
							
							for ( var increment in animalData) {
								if (countryName == animalData[increment].countryName) {					
									if(animalName == animalData[increment].animalName){
												
										if (yearNo == animalData[increment].year) {
										if (unitIndx == "Energy") {
											var energyIndex = animalData[increment].energyUnitIndex;
											if (energyIndex != null
													&& energyIndex !== undefined) {
												var changeValueType =$("input[name='changeValueType']:checked").val();
													if(changeValueType=="Relative"){
														var animalCountPer=parseInt(animalData[increment].animalCount)+((parseInt(animalData[increment].animalCount))*parseFloat(perChngAnmCountList[animalIndex])/100);
														animalCountPer=animalCountPer.toFixed(7);
														var nfgPer=parseFloat(animalData[increment].nonForageRate)+((parseFloat(animalData[increment].nonForageRate))*parseFloat(perChngNonForgRatList[animalIndex])/100);
														nfgPer=nfgPer.toFixed(2);
														var unitPer=parseFloat(animalData[increment].energyUnitIndex)+((parseFloat(animalData[increment].energyUnitIndex))*parseFloat(perChngUtIdxList[animalIndex])/100);
														unitPer=unitPer.toFixed(2);
													}
													else{
														var animalCountPer=parseInt(animalData[increment].animalCount)+parseInt(perChngAnmCountList[animalIndex]);
														animalCountPer=animalCountPer.toFixed(0);
														var nfgPer=parseFloat(animalData[increment].nonForageRate)+parseFloat(perChngNonForgRatList[animalIndex]/100);
														nfgPer=nfgPer.toFixed(2);
														var unitPer=parseFloat(animalData[increment].energyUnitIndex)+parseFloat(perChngUtIdxList[animalIndex]);
														unitPer=unitPer.toFixed(2);
													}
												nutritionNew = nutritionNew
														+ formatNumberRoundOff((animalCountPer*nfgPer*unitPer*35600)/(1000000*propertyValue));
												
											}

										} else {

											var proteinIndex = animalData[increment].proteinUnitIndex;
											if (proteinIndex != null
													&& proteinIndex !== undefined) {
											var changeValueType =$("input[name='changeValueType']:checked").val();
											if(changeValueType=="Relative"){	
												var animalCountPer=parseInt(animalData[increment].animalCount)+((parseInt(animalData[increment].animalCount))*parseFloat(perChngAnmCountList[animalIndex])/100);
												animalCountPer=animalCountPer.toFixed(7);
												var nfgPer=parseFloat(animalData[increment].nonForageRate)+((parseFloat(animalData[increment].nonForageRate))*parseFloat(perChngNonForgRatList[animalIndex])/100);
												nfgPer=nfgPer.toFixed(2);
												var unitPer=parseFloat(animalData[increment].proteinUnitIndex)+((parseFloat(animalData[increment].proteinUnitIndex))*parseFloat(perChngUtIdxList[animalIndex])/100);
												unitPer=unitPer.toFixed(2);
												}
											else{
												var animalCountPer=parseInt(animalData[increment].animalCount)+parseInt(perChngAnmCountList[animalIndex]);
												animalCountPer=animalCountPer.toFixed(0);
												var nfgPer=parseFloat(animalData[increment].nonForageRate)+parseFloat(perChngNonForgRatList[animalIndex]/100);
												nfgPer=nfgPer.toFixed(2);
												var unitPer=parseFloat(animalData[increment].proteinUnitIndex)+parseFloat(perChngUtIdxList[animalIndex]);
												unitPer=unitPer.toFixed(2);
											}			
												nutritionNew = nutritionNew
														+ formatNumberRoundOff((animalCountPer*nfgPer*unitPer*0.319)/(1000*propertyValue));
											}

										}

									}
									
									}
									
									
								}

							}
						
						}	
	
						//aqua
						for ( var aqua_increment in aquacultureData) {
							if (countryName == aquacultureData[aqua_increment].countryName) {
								if (yearNo == aquacultureData[aqua_increment].year) {
									if (unitIndx == "Energy") {
										var energyIndex = aquacultureData[aqua_increment].nutritionEnergy;
										if (energyIndex != null
												&& energyIndex !== undefined) {
											nutrition = nutrition
													+ formatNumberRoundOff((aquacultureData[aqua_increment].nutritionEnergy * 1)/(propertyValue *1000));
														
											nutritionNew = nutritionNew
													+ formatNumberRoundOff((aquacultureData[aqua_increment].nutritionEnergy * 1)/(propertyValue *1000));
													
											//nutrition = nutrition / (propertyValue *1000);
											//nutritionNew = nutritionNew / (propertyValue *1000);		
										}
									} else {
										var proteinIndex = aquacultureData[aqua_increment].nutritionProtein;
										if (proteinIndex != null
												&& proteinIndex !== undefined) {
											nutrition = nutrition
													+  formatNumberRoundOff((aquacultureData[aqua_increment].nutritionProtein * 1)/(propertyValue *1000));
											nutritionNew = nutritionNew
													+  formatNumberRoundOff((aquacultureData[aqua_increment].nutritionProtein * 1)/(propertyValue *1000));
											//nutrition = nutrition / (propertyValue *1000);
											//nutritionNew = nutritionNew / (propertyValue *1000);														
										}

									}
								}
							}
						}

							if(noChange ==1 ){
								$('#collapseTable').prepend(
									'<tr><td style="text-align: center;">' + yearNo + '</td>' + '<td style="text-align: center;">'
											+ formatNumber(formatNumberRoundOff(nutritionNew)) + '</td>' + '<td style="text-align: center;">' + formatNumber(formatNumberRoundOff(nutrition))
											+ '</td></tr>');			
							}
					}
				
				}	

				if(noChange==1)
				{
					if (unitIndx == "Energy") {
							if(propertyValue==1){
								$('#collapseTable').prepend(
								'<tr><th style="text-align: center;" colspan="5" style="color: lightseagreen">'+countryName+'</th></tr>'
								+'<tr><th style="text-align: center;"> Year </th><th style="text-align: center;"> New Estimate (1000 GJ) </th><th style="text-align: center;"> Inital Estimate (1000 GJ) </th></tr>');
								}
							else{
								$('#collapseTable').prepend(
								'<tr><th style="text-align: center;" colspan="5" style="color: lightseagreen">'+countryName+'</th></tr>'
								+'<tr><th style="text-align: center;"> Year </th><th style="text-align: center;"> New Estimate (1000 MT) </th><th style="text-align: center;"> Inital Estimate (1000 MT) </th></tr>');
							}	
						}
					else{
					$('#collapseTable').prepend(
							'<tr><th style="text-align: center;" colspan="5" style="color: lightseagreen">'+countryName+'</th></tr>'
							+'<tr><th style="text-align: center;"> Year </th><th style="text-align: center;"> New Estimate (1000 MT) </th><th style="text-align: center;"> Inital Estimate (1000 MT)</th></tr>');
					}
					
					var changeValueType =$("input[name='changeValueType']:checked").val();
					var title="";
					var appliedTo ="";
					
	
					
					if(document.getElementById("allYears").checked == true) {	
						if(changeValueType=="Relative"){
							collapseChangeInfoTableTitle = "Percentage Change in Values";
							appliedTo =  "(applied to all years)";
						}
						else{
							collapseChangeInfoTableTitle = "Absolute Change in Values";
							appliedTo =  "(applied to all years)";
						}
					}
					else{
							collapseChangeInfoTableTitle = "Percentage Change in Values";
							appliedTo = "(applied to year "+ initialYear +")" ;
					}
						if(unitIndx=="Energy"){
						$('#collapseChangeInfoTable')
						.append(
							<!--new-->
										'<tr><th style="text-align: center;" colspan="4">'+"Proposed "+collapseChangeInfoTableTitle +" for "+countryName+ appliedTo +'</th></tr>' 
										+'<tr>' 
										+ '<th style="text-align: center;">Species</th>' 
										+ '<th style="text-align: center; width:120px;">Animal number</th>'
										+ '<th style="text-align: center;">Intensification rate (share of animal population that is not fed through grazing, in %)</th>'
										+ '<th style="text-align: center;">Animal Unit Index (energy)</th>'
										+ '</tr>');
					}
					else{
						
						$('#collapseChangeInfoTable')
						.append(
										'<tr><th style="text-align: center;" colspan="4">'+"Proposed "+collapseChangeInfoTableTitle+" for "+countryName+ appliedTo +'</th></tr>' 
										+'<tr>' 
										+ '<th style="text-align: center;">Species</th>' 
										+ '<th style="text-align: center; width:120px;">Animal number</th>'
										+ '<th style="text-align: center;">Intensification rate (share of animal population that is not fed through grazing, in %)</th>'
										+ '<th style="text-align: center;">Animal Unit Index (protein)</th>'
										+ '</tr>');

					}

							
							var perChngAnmCountList;
							
							perChngAnmCountList=perChngAnmCount.split(":");
							var perChngNonForgRatList;
							perChngNonForgRatList=perChngNonForgRat.split(":");
							
							var perChngUtIdxList;
							perChngUtIdxList=perChngUtIdx.split(":");
							
							for ( var animalIndex = 0; animalIndex < arrayAnimalName.length; animalIndex++) {
									
									if( perChngAnmCountList[animalIndex] != 0 ||
										perChngNonForgRatList[animalIndex] != 0 ||
										perChngUtIdxList[animalIndex] != 0
										){
											var changeValue;
										if(perChngAnmCountList[animalIndex] == 0){
                                            changeValue="No Change";
										}
										
									/*	else if(perChngAnmCountList[animalIndex] < 1 && perChngAnmCountList[animalIndex] > 0 ) {
                                            changeValue="No significant Change";
										}
										
										*/
										else if(perChngAnmCountList[animalIndex] > 0){
                                            changeValue= 'Increase by '+perChngAnmCountList[animalIndex];
                                        
										}
										
										 else if(perChngAnmCountList[animalIndex] <0){
										changeValue= 'Decrease by '+(-1)*perChngAnmCountList[animalIndex];
                                        
										}
										
										
								         var changeValue1;
										
										if(perChngNonForgRatList[animalIndex] == 0){
											changeValue1="No change" ;
										}
										
										/*else if( perChngNonForgRatList[animalIndex] <1 && perChngNonForgRatList[animalIndex] > 0 ){
											changeValue1="No significant change" ;
										}*/
                                          else if(perChngNonForgRatList[animalIndex]>0 )
										  {changeValue1='Increase by '+ perChngNonForgRatList[animalIndex];
										  }
										  else if(perChngNonForgRatList[animalIndex] < 0 ){
											  changeValue1='Decrease by '+(-1)*perChngNonForgRatList[animalIndex];
										  }
										  
										 
										 var changeValue2;
										  if(perChngUtIdxList[animalIndex] ==0){
											   changeValue2="No change" ;
										  }
										  /*
										  else if(perChngUtIdxList[animalIndex] >0 && perChngUtIdxList[animalIndex] <1 ){
											   changeValue2="No significant change" ;
										  }
										  */
										  else if(perChngUtIdxList[animalIndex]>0) {
											  changeValue2='Increase by '+perChngUtIdxList[animalIndex];
										  }
										  else if(perChngUtIdxList[animalIndex]<0){
											  changeValue2='Decrease by '+(-1)*perChngUtIdxList[animalIndex];
										  }
										  
										  
											$('#collapseChangeInfoTable')
											.append(
												'<tr>' + '<td style="text-align: center;">' + arrayAnimalName[animalIndex] + '</td>'  
													+'<td style="text-align: center;">' + changeValue + '</td>'
													+'<td style="text-align: center;">' + changeValue1+ '</td>'
													+'<td style="text-align: center;">' + changeValue2+ '</td>'
													+ '</tr>');		
										
										noChange=1;
									}
							}
							
				}
				else{
					$('#collapseTable').prepend(
							'<tr><th style="text-align: center;" colspan="5" style="color: lightseagreen">No change proposed for '+countryName+'</th></tr>');
				}	

			}
		
</script>

</head>
<body>
<body id="pageBody" style="background-color: #D7D6D4">
	<div id="wrapper">
		<div>
			<div id="navigation" class="banner">
				<div>
					<div class="container">
						<div id="c134044" class="csc-default">
							<p class="bodytext">
								<a href="http://www.amis-outlook.org/" title="AMIS homepage"
									class="internal-link"><img alt="AMIS homepage"
									src="views/assets/img/amis_logo.jpg" height="129" width="260"></a>
							</p>
						</div>
					</div>
				</div>
			</div>
			<ol  class="breadcrumb" >
				<li><a style="cursor:pointer;"  onclick="goHome();"><!-- Visualize estimated feed demand --></a></li>
				<li><a class="active"  style="cursor:pointer; color: #A9A9A9;" onclick="showScenario();"><!-- Scenario Analysis --> </a></li>
			<!--	<li style="float: right"><a onclick="goBack();">BACK </a></li>-->
				<li style="float: right"><a onclick="goHome();">HOME </a></li>
			</ol>

			<div class="container">
				<div id="textArea" class="row" style="padding-left: 80px; padding-right: 70px" >
					<center><h4 style="font-family:Open Sans;font-size:13px">Online Feed Calculator</h4></center>
					 <p style="font-family:Open Sans;font-size:13px;font-weight:normal; line-height: 18px;">Welcome to the <b>Online Feed Calculator</b> of the Agricultural Market Information System (AMIS). 
				The tool estimates a country&#039;s feed demand by considering the number of livestock and fish that need to be maintained, their energy and protein requirements, and the share of intensified 
				production. Users can visualize default values or test different scenarios by modifying the underlying model parameters.</p>

					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<div class="panel-group" id="accordion">
						</div>
					</div>
				</div>

				<div class="row">
					<div align="right" style="padding-left: 80px; padding-right: 70px" >
						<a id="toggleButton" onclick="toggleText();" href="javascript:void(0);" style="font-family:Open Sans;font-size:13px;display:inline-block;color:#dc3018">See less</a>
					</div>
				</div>
	
				
				<div  class="row">			
					<div class="col-md-3"></div>				
					<div class="col-md-3" id="formTabOne" align="left"  data-toggle="tooltip" data-placement="left" >
						<div class="form-group" id="visualize" style="margin-top:20px; font-family:Open Sans;font-size:13px;">
							 <button type="button" class="btn btn-default" style=" width : 180px; text-align: left; " id="visualize" 
										onClick="goVisualize();" >Visualize default values</button>
										
						</div>
					</div>
					<div class="col-md-3" id="formTabOne" align="left"  data-toggle="tooltip" data-placement="left" >
						<div class="form-group" id="scenario" style="margin-top:20px; font-family:Open Sans;font-size:13px;">
							 <button type="button" class="btn btn-danger" style=" width : 180px; text-align: left; " id="scenario" 
										onClick="showScenario();" >Test different scenarios</button>
						</div>
					</div>
					<div class="col-md-3"></div>
				</div>
			</div>	
			
			<div class="container" id="page" style="padding-top: 30px">

             <div class="row" style="background-color:CornflowerBlue; ">
					<div class="col-md-3" id="formTabOne">             
						<div class="form-group" id="countryIdListTitle" data-toggle="popover" data-placement="top" title="Select one country and test different scenarios by modifying the underlying model parameters.">
							<label for="selectCountry" style="color:white;cursor: pointer;">Select country <br /> (only one)<sub><font color="white">[?]</font></sub></label>
						</div>
					</div>
					<div class="col-md-4" id="formTabThree">
						<div class="form-group" id="unitIndexTitle" data-toggle="popover"  data-placement="bottom" title="The model can either estimate energy requirements (measured in megajoule: MJ) or protein requirements (measured in metric tonnes: MT). If you select a base commodity as reference, both energy and protein requirements will be converted into the weight equivalent of that commodity (in MT).">
							<label for="selectEnergyEquivalent" style="color:white;cursor: pointer;">Select whether results should show energy or protein requirements<sub><font color="white">[?]</font></sub> </label><br/>
						</div>
					</div>
					<div class="col-md-3" id="formTabTwo">
						<div class="form-group" id="baseComodityTitle" data-toggle="popover" data-placement="top" title="To facilitate the understanding of the model outputs, results can be converted into the weight equivalent of a reference commodity. If a reference commodity is selected, results show how much of that commodity is needed to satisfy estimated energy and protein demand. Cereals generally provide more energy while cakes are rich in protein, so results can vary significantly depending on the specific selection.">
							<label for="selectIndex" style="color:white;cursor: pointer;">Select base commodity as reference<sub><font color="white">[?]</font></sub></label> <br />
						</div>
					</div>
					<div class="col-md-2" id="formTabTwo" data-toggle="popover" data-placement="bottom" title="Parameters and thus model outputs change over time so please select a year; by default, the latest year is activated.">
						 <br /><label for="selectYear" style="color:white;cursor: pointer;">Select year<sub><font color="white">[?]</font></sub></label>
					</div>	
                </div>			
			
			
			
             <div class="row" style="background-color:CornflowerBlue;">
					<div class="col-md-3" id="formTabOne">
						<div class="form-group" id="countryIdList">
							<select
								id="selectCountry" class="selectBox"
								onfocus="this.oldvalue = this.value;"
								title='Choose one' data-live-search="true" onchange="resetCountryValue(this); this.oldvalue=this.value;">
								<c:choose>
									<c:when test="${not empty countryList}">
										<c:forEach items="${countryList}" var="country"
											varStatus="varStatus">
											<c:choose>	
											<c:when test="${country.countryId==1}">
												<option name="cList" value="${country.countryId}" selected="selected">
												${country.countryName}</option>
											</c:when>
											<c:otherwise>
												<option name="cList" value="${country.countryId}">
												${country.countryName}</option>	
											</c:otherwise>											
											</c:choose>
										</c:forEach>
									</c:when>
								</c:choose>
							</select>
						</div>
					</div>
					<div class="col-md-4" id="formTabThree">
						<div class="form-group" id="unitIndex"  >
							<label style="color:white; float:left; width:130px; cursor:pointer"><input type="radio" name="selectEnergyEquivalent" onchange="unitIndexChange();" value="Energy" checked="checked" >Energy</label> 
							<label style="color:white; float:left; width:130px; cursor:pointer"><input type="radio" name="selectEnergyEquivalent" onchange="unitIndexChange();" value="Protein" >Protein</label>
						</div>
					</div>
					<div class="col-md-3" id="formTabTwo">
						<div class="form-group" id="baseComodity">
							<select class="selectBox"
								id="selectIndex" title='Choose one' 
								onfocus="this.oldvalue = this.value;" onchange="resetPropertyValue(this);this.oldvalue=this.value;">
								<option selected="selected" value="None">None</option>
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
					
					
					<div class="col-md-2" id="formTabTwo">
								<div class="form-group" id="yearSelectList">
									<select 
										id="selectYear" class="selectBox" onfocus="this.oldvalue = this.value;" title="Choose one"
										onchange="resetValue(this);this.oldvalue=this.value; " data-live-search="true">
										<c:choose>
											<c:when test="${not empty yearListReverse}">
												<c:forEach items="${yearListReverse}" var="year"
													varStatus="varStatus">
													<c:choose>	
													<c:when test="${varStatus.count ==1}">
														<option name="yearValue" value="${year}" selected="selected">
														${year}</option>
													</c:when>
													<c:otherwise>
														<option name="yearValue" value="${year}">
														${year}</option>	
													</c:otherwise>											
													</c:choose>
													
												</c:forEach>
											</c:when>
										</c:choose>
									</select>
								</div>
							</div>	
                </div>

				 <div class="row" style="background-color:CornflowerBlue; ">
					<div class="col-md-9"></div>
					<div class="col-md-3">
						<div class="form-group" align="right">
							
						</div>
					</div>
                </div>	
				
				<div class="row" style="padding-top: 20px">
					<div class="col-md-9" id="tableDiv">
						<table class="bordered" id='tableAnimal' align="left" border="1">
						</table>
						<table class="bordered" id='tableAnimalLast' align="left" border="1">
						</table>
						<table class="bordered" id='tableAqua' align="left" style="margin-top:20px" border="1">
						</table>
					</div>
                    <div class="col-md-3">
                                                                                                                
						<div class="form-group" id="applyAllYears">
							<input type="checkbox" onclick="showChangeTypeOptions();" id="allYears" name="allYears" style="cursor: pointer;"/> Apply changes to all years <sub data-toggle="popover"  class="red-tooltip" title="By ticking this box, changes in the parameter table are applied to all the years in the database. You can decide whether to apply the changes in percentage terms or in absolute values. Lets assume you increased the herd size from 30,000 to 33,000 in a given year. Depending on your selection, either 10% (percentage terms) or 3,000 (absolute value) will be added to the herd size of the other years."  style="cursor:pointer"><font color="black">[?]</font></sub>
						</div>
                        <div class="form-group" id="changeType" >
							<label><input type="radio" name="changeValueType" value="Relative" checked="checked" >in percentage terms</label> <br />
							<label><input type="radio" name="changeValueType" value="Absolute" >absolute values</label>
						</div> <br />
						<div align="left" id="generateChartDiv"  >
                            <button type="button" class="btn btn-primary" style="text-align: left; width:80%; " id="regenerateData" 
                            onClick="regerateData();" data-toggle="tooltip" title="Hit this button to visualize the impact of your parameter changes on total estimated feed demand. Apart from the parameter table, also the charts will be updated.">Recalculate results</button>
                        </div><br />
						<div align="left" id="generateChartDiv" >
                            <button type="button" class="btn btn-primary" style="text-align: left;width:80%; " id="regenerateData" 
                            onClick="restoreValue();" data-toggle="tooltip" title="Hit this button to return to the default values in the parameter table.">Restore default values</button>
                        </div><br />
						<div align="left">
						<button type="button" class="btn btn-primary" style="text-align: left;width:80%; "  
							data-toggle="modal" onclick="reportChanges();" data-toggle="tooltip" title="If you believe your changed parameters more accurately reflect reality in a given country, click this button to inform the AMIS Secretariat. Please provide your name and email address as well as a justification of the proposed change; we will be in touch soon."
							>Report changes</button> 
						</div>
						<br />

						<div align="left">
						 <table>
						   <tbody>
								<tr>
						      <td bgcolor="#e2ffdc" style="width:20%; height:20px;"> </td>
							  <td style="font-family:Open Sans;font-size:13px;"> &nbsp;&nbsp; 	Parameter can be changed</td>
						   </tr>
						 </tbody></table><br />
                         <table>						
							<tbody><tr>
						      <td bgcolor="#ffeae9" style="width:20%; height:20px"> </td>
							  <td  style="font-family:Open Sans;font-size:13px;">&nbsp;&nbsp; Parameter is fixed</td>
							</tr>
						 </tbody></table><br />
							<table>
							<tbody><tr>
						      <td bgcolor="#D0E3FF" style="width:20%; height:20px"> </td>
							  <td  style="font-family:Open Sans;font-size:13px;"> &nbsp;&nbsp; Calculated Value</td>
							</tr>
                         </tbody></table>	<br />
						 <table>	
							<tbody><tr>
						      <td bgcolor="#D3D3D3"" style="width:20%; height:20px"> </td>
							  <td  style="font-family:Open Sans;font-size:13px;"> &nbsp;&nbsp; Aqua component is fixed</td>
							</tr>
                         </tbody></table>						
						</div>
                    </div>
				</div>
				
             <div class="row">
                    <div class="col-md-12">
                    <div id="barGraph"
                    style="min-width: 310px; height: 400px; margin: 0 auto"></div>
                    </div>
                </div>
			<div style="padding-top: 10px;"  id="reportChangeDiv">	

			</div>
                <div class="row" style="margin-top: 30px">
                    <div class="col-md-4">
                        <div name="scenarioRegenerateData" id="scenarioRegenerateData"></div>
                    </div>
                </div>
			<div>
			<div class="row" style="padding-top: 40px">
				<div class="col-md-12" id="lineChartDiv"></div>
			</div>
			<div  style="padding-top: 40px" id="paraDiv">
				<P id="para" ALIGN="CENTER"></P>
			</div>
			<div class="row" style="padding-top: 0px" id="pieChartDiv">
				<div class="col-md-6" style="display: inline-block;"
					id="pieChartNew"></div>
				<div class="col-md-6" style="display: inline-block;"
					id="pieChartOld"></div>
			</div>
			
		</div>
       
		</div>
	</div>
<!-- Modal -->
<div id="getReporterDetails" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Report Changes</h4>
      </div>
      <div class="modal-body">
			<tr>
				<td>Name: </td>
				<td><input type="text" id="reporterName" name="reporterName" 
					class="form-control" style="font-weight:bold ;text-align: left;"></td>
			</tr><br />
			<tr>
				<td>Email: </td>
				<td><input type="text" id="reporterEmail" name="reporterEmail" 
						 class="form-control" style="font-weight:bold ;text-align: left;"></td>
			</tr><br />
			<tr>
				<td>Comments:</td>
				<td><TEXTAREA   id="reporterComments" name="reporterComments" 
					class="form-control" style="font-weight:bold ;"></TEXTAREA >
			</tr>
      </div>
	  <div style="margin-top: 10px; text-align:center;">
		<button type="button" class="btn btn-success" align="center"
			data-toggle="collapse" onclick="showChanges();"
			data-target="#collapseDiv" aria-expanded="false"
			aria-controls="collapseDiv">View Changes</button>
      </div>
	  <div id="collapseDiv" >
					<table id="collapseTable" class="bordered">
					</table>
					<table id="collapseChangeInfoTable" class="bordered" style="margin-top:20px">
					</table>
	  </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="validateNameAndEmail();">Report</button>
      </div>
    </div>
  </div>
</div>
</body>
</body>
</html>