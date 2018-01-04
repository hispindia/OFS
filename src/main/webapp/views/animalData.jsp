
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Bootstrap core CSS -->
<script type="text/javascript">
$(document).ready(function(){
    $('[data-toggle="popover"]').popover({ container: 'body',  html: true });   
});
// Function to add thousand separator
		function formatNumber (num) {
		var myNumberAsString = num;           
		var myNumber = Math.round(0.0 + myNumberAsString); 
		parseInt(myNumber);
		return myNumber.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"); 
		}
		
		//Function to round off digits
		function formatNumberRoundOff (num) {
		var myNumberAsString = num;           
		var myNumber = Math.round(0.0 + myNumberAsString); 
		return parseInt(myNumber); 
		}
		
		
	function makeTable(propertyValue,latestYear) {
		$('#table1').empty();
		$('#table2').empty();
		$('#tableData1').empty();
		$('#tableData2').empty();
		var animalData = ${animalRawData};
		var aquacultureData = ${aquacultureData};
		var arrYears = ${yearList};
		var resultArray = [];

					
		var country = "";
		$.each($("#selectCountry option:selected"), function() {
		country = country.concat($(this).val()).toString();
		country = country.concat(",");
		});
		
		var arrCountry;
		arrCountry = country.split(",");
		

//		var listCountry = ('${countryNameList}');
//		listCountry = listCountry.substr(0, listCountry.length - 1);
		var unitIndx = "${unitIndex}";
		//console.log(unitIndx);
//		var arrCountry;
//		arrCountry = listCountry.split(",");
		var propertyName = "${propertyName}";
		var subtitle="";
		if(unitIndx == "Energy")
		{	
			if(propertyValue=="1"){
				subtitle = "(energy requirements in 1000 GJ)";
			}
			else {
			subtitle = "( energy requirements in "+ propertyName+" equivalent 1000 [MT] )";
			}
		}
		else
		{
			if(propertyValue=="1"){
				subtitle = "(protein requirements in 1000 MT)";							
			}
			else{
				subtitle = "( protein requirements in "+ propertyName+" equivalent 1000 [MT] )";
			}

		}
		
	
		var tableCount = arrCountry.length
		if(arrCountry.length > 2){
			tableCount=2;
		}
		for ( var countryIndex = 0; countryIndex <tableCount ; countryIndex++) {
			var countryName = arrCountry[countryIndex];

			for ( var yearIndex = 0; yearIndex <= arrYears.length; yearIndex++) {
				var nutrition = 0;

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
													* animalData[increment].nonForageRate * energyIndex * 35600)/(propertyValue*1000000));
									
								}

							} else {

								var proteinIndex = animalData[increment].proteinUnitIndex;
								if (proteinIndex != null
										&& proteinIndex !== undefined) {
									nutrition = nutrition
											+ formatNumberRoundOff((animalData[increment].animalCount
													* animalData[increment].nonForageRate * proteinIndex *0.319)/(propertyValue*1000));
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
											+ formatNumberRoundOff((aquacultureData[aqua_increment].nutritionEnergy * 1)/(propertyValue*1000));
									}
							} else {
								var proteinIndex = aquacultureData[aqua_increment].nutritionProtein;
								if (proteinIndex != null
										&& proteinIndex !== undefined) {
									nutrition = nutrition
											+ formatNumberRoundOff((aquacultureData[aqua_increment].nutritionProtein * 1)/(propertyValue*1000));
								}

							}
						}
					}
				}
				

				nutrition= formatNumber(nutrition);
				
				if(nutrition!=0){
						if(yearIndex != arrYears.length){
					
							if(latestYear==yearNo){
								$('#table' + (countryIndex + 1))
									.prepend(
											'<tr>'
													+ '<th width="100px">' + "Year" + '</th>'
													+ '<th>' + "Estimated Feed "+ subtitle + '</th>'
													+ '</tr>');
								$('#tableData' + (countryIndex + 1)).prepend(
									'<tr class="collapse" id="demo">' + '<td width="100px" style="color: red;">'
											+ yearNo + '</td>' + '<td style="color: red;"> ' + (nutrition)
											+ '</td>' + '</tr>');
							}
							else{
								$('#tableData' + (countryIndex + 1)).prepend(
									'<tr class="collapse" id="demo">' + '<td width="100px">'
											+ yearNo + '</td>' + '<td>' + (nutrition)
											+ '</td>' + '</tr>');
							}
							
						}
					}	
			}

		}
	}

	function makeProteinJson(propertyValue) {

		var animalData = ${animalRawData};
		var aquacultureData = ${aquacultureData};
		var arrYears = ${yearList};
		var resultArray = [];
		var listCountry = ('${countryNameList}');
		listCountry = listCountry.substr(0, listCountry.length - 1);

		var arrCountry;
		arrCountry = listCountry.split(",");

		for ( var i = 0; i < arrCountry.length; i++) {
			var countryName = arrCountry[i];
			resultArray.push(countryName);
			for ( var j = 0; j < arrYears.length; j++) {
				var nutritionProtein = 0;
				var aquaNutritionProtein = 0;
				var yearNo = arrYears[j];

				for ( var increment in animalData) {
					if (countryName == animalData[increment].countryName) {
						if (yearNo == animalData[increment].year) {
							var proteinIndex = animalData[increment].proteinUnitIndex;
							if (proteinIndex != null
									&& proteinIndex !== undefined) {
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
				var v =nutritionProtein * 1 + aquaNutritionProtein * 1; 
				//v=v / propertyValue;
				//v = v / 1000;
				v = formatNumberRoundOff(v);
				resultArray.push(v);
				
			}

		}

		var tempArray = [];
		tempArray = resultArray; 
		var myarray = [];
		var tempLen = tempArray.length;
		var arrayLen = tempArray.length;
		var yearsLength = arrYears.length;
		for (; arrayLen > 0;) {
			var checkArray = [];
			var checkSlicedData = [];
			var countryName = tempArray.slice(0, 1);
			checkArray = tempArray.slice(1, yearsLength + 1);
			var item = {
				"name" : countryName,
				"data" : checkArray
			};
			checkSlicedData = tempArray.slice(yearsLength + 1, tempLen);
			tempArray = checkSlicedData;
			arrayLen = tempArray.length;
			myarray.push(item);
		}

		return myarray;

	}

	function makeEnergyJson(propertyValue) {

		var animalData = ${animalRawData};
		var aquacultureData = ${aquacultureData};
		var arrYears = ${yearList};
		var resultArray = [];
		var listCountry = ('${countryNameList}');
		listCountry = listCountry.substr(0, listCountry.length - 1);

		var arrCountry;
		arrCountry = listCountry.split(",");

		for ( var i = 0; i < arrCountry.length; i++) {
			var countryName = arrCountry[i];
			resultArray.push(countryName);
			for ( var j = 0; j < arrYears.length; j++) {
				var nutritionEnergy = 0;
				var aquaNutritionEnergy = 0;
				var yearNo = arrYears[j];

				for ( var increment in animalData) {
					if (countryName == animalData[increment].countryName) {
						if (yearNo == animalData[increment].year) {
							var energyIndex = animalData[increment].energyUnitIndex;
							if (energyIndex != null
									&& energyIndex !== undefined) {
								nutritionEnergy = nutritionEnergy
										+ formatNumberRoundOff((animalData[increment].animalCount
												* animalData[increment].nonForageRate * energyIndex * 35600)/(propertyValue*1000000));

							
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
				
			//	v=v / propertyValue;
				
			//	v = v / 1000000;
				
				v = formatNumberRoundOff(v);
				
				resultArray.push(v);
			}

		}

		var tempArray = [];
		tempArray = resultArray;
		var myarray = [];
		var tempLen = tempArray.length;
		var arrayLen = tempArray.length;
		var yearsLength = arrYears.length;
		for (; arrayLen > 0;) {
			var checkArray = [];
			var checkSlicedData = [];
			var countryName = tempArray.slice(0, 1);
		
			checkArray = tempArray.slice(1, yearsLength + 1);
		
			var item = {
				"name" : countryName,
				"data" : checkArray
			};
			checkSlicedData = tempArray.slice(yearsLength + 1, tempLen);
			tempArray = checkSlicedData;
			arrayLen = tempArray.length;
			myarray.push(item);
		}

		return myarray;

	}

	<!--popover-->
	$(document).ready(function(){
    $('[data-toggle="popover"]').popover();   
});

	jQuery(document)
			.ready(
					function() {
					$('#selectYearIndex').selectpicker({
							size : 'auto',
							maxOptions : 1
						});
					$('#selectCountry').selectpicker({
							size : 'auto',
							maxOptions : 2
						});
			
						var unitIndx = "${unitIndex}";
						var propertyValue = "${propertyValue}";
						var propertyName = "${propertyName}";
						var energyType ;
						if(propertyValue == "")
						{
						propertyValue = 1;
						}
						else
						{
						propertyValue = parseFloat(propertyValue);
						}						
						
						var subtitle="";
						var pieChartTooltipTitle="";
						if(unitIndx == "Energy")
						{	
							if(propertyValue=="1"){
								energyType = "1000 GJ";
								subtitle = "(energy requirements in 1000 GJ)";
								pieChartTooltipTitle="(energy requirements in 1000 GJ)";
							}
							else {
							energyType = "1000 MT";
							subtitle = "( energy requirements in "+ propertyName+" equivalent 1000 [MT] )";
							pieChartTooltipTitle = " energy requirements in "+ propertyName+" equivalent 1000 [MT] ";
							}
						}
						else
						{
							energyType = "1000 MT";
							if(propertyValue=="1"){
								subtitle = "(protein requirements in 1000 MT)";							
								pieChartTooltipTitle= "(protein requirements in 1000 MT)";							
							}
							else{
								subtitle = "( protein requirements in "+ propertyName+" equivalent 1000 [MT] )";
								pieChartTooltipTitle= " protein requirements in "+ propertyName+" equivalent 1000 [MT] ";							
							}

						}
						

						var arrYears = ${yearList};
						if (unitIndx == "Energy") {
							var jsonData = makeEnergyJson(propertyValue);
						} else {
							var jsonData = makeProteinJson(propertyValue);
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
									color : '#808080'
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

							series : 
						
							jsonData
						});

						var animalData = ${animalRawData};
						var aquacultureData = ${aquacultureData};

						var listCountry = ('${countryNameList}');
						listCountry = listCountry.substr(0,
								listCountry.length - 1);
						var arrCountry;
						arrCountry = listCountry.split(",");

						var listAnimal = ('${animalList}');
						listAnimal = listAnimal
								.substr(0, listAnimal.length - 1);
						var arrayAnimal;
						arrayAnimal = listAnimal.split(",");

						for ( var countryIndex = 0; countryIndex < arrCountry.length; countryIndex++) {
							var countryName = arrCountry[countryIndex];
							var resultArray = [];
							resultArray.push(countryName);

							var aquaEnergyIndex = 0;
							var aquaProteinIndex = 0;

							var latestYear = arrYears[arrYears.length - 1];
							if (unitIndx == "Energy") {
								for ( var animalIndex = 0; animalIndex < arrayAnimal.length; animalIndex++) {
									var nutritionEnergy = 0;
									resultArray.push(arrayAnimal[animalIndex]);
									for ( var increment in animalData) {
										if (countryName == animalData[increment].countryName) {
											if (arrayAnimal[animalIndex] == animalData[increment].animalName) {
												if (latestYear == animalData[increment].year) {
													var energyIndex = animalData[increment].energyUnitIndex;
													if (energyIndex != null
															&& energyIndex !== undefined) {
														nutritionEnergy =(animalData[increment].animalCount
																		* animalData[increment].nonForageRate * energyIndex)/propertyValue;
															
													}
												}
											}
										}
									}
									
									resultArray.push(formatNumberRoundOff(nutritionEnergy * 35600/1000000));

								}
								for ( var aqua_increment in aquacultureData) {
									if (countryName == aquacultureData[aqua_increment].countryName) {
										if (latestYear == aquacultureData[aqua_increment].year) {
											resultArray.push("Aqua");
											aquaEnergyIndex = (aquacultureData[aqua_increment].nutritionEnergy)/propertyValue;
											
											resultArray.push(formatNumberRoundOff(aquaEnergyIndex * 1/1000));
										}
									}

								}

							} else {
								for ( var animalIndex = 0; animalIndex < arrayAnimal.length; animalIndex++) {
									var nutritionProtein = 0;
									resultArray.push(arrayAnimal[animalIndex]);
									for ( var increment in animalData) {
										if (countryName == animalData[increment].countryName) {
											if (arrayAnimal[animalIndex] == animalData[increment].animalName) {
												if (latestYear == animalData[increment].year) {
													var proteinIndex = animalData[increment].proteinUnitIndex;
													if (proteinIndex != null
															&& proteinIndex !== undefined) {
														nutritionProtein = (animalData[increment].animalCount
																		* animalData[increment].nonForageRate * proteinIndex)/propertyValue;
													}
												}
											}
										}
									}
									resultArray.push(formatNumberRoundOff(nutritionProtein * 0.319/1000));
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
							
							var myarray = [];
							var item = {
								"type" : 'pie',
								"name" : countryName,
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
                       
					   //comma separator   
						 Highcharts.setOptions({
    lang: {
       
        thousandsSep: ','
    }
});
						  
							$('#pieChartDiv' + (countryIndex + 1))
									.highcharts(
											{
												chart : {
													plotBackgroundColor : null,
													plotBorderWidth : null,
													plotShadow : false,
												},
												title : {
													text :  countryName,

												},
												tooltip : {
													pointFormat : 'Share of total: {point.percentage:.1f} % ,<br>'  +pieChartTooltipTitle+': {point.y}</br>'
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
						
						
						var arrYears = ${yearList};
						var latestYear = arrYears[arrYears.length - 1];
					
						//Generate Table
								var animalData = ${animalRawData};
	
		var resultArray = [];
		var listCountry = ('${countryNameList}');
		listCountry = listCountry.substr(0, listCountry.length - 1);
		var unitIndx = "${unitIndex}";
		//console.log(unitIndx);
		var arrCountry;
		arrCountry = listCountry.split(",");
		var energyType ;
		if(unitIndx == "Energy")
		{	if(propertyValue=="1"){
				energyType = "1000 GJ";
			}
			else {
			energyType = "1000 MT";
			}
		}
		else
		{
			energyType = "1000 MT";
		}

		var tableCount = arrCountry.length
		if(arrCountry.length > 2){
			tableCount=2;
		}
		for ( var countryIndex = 0; countryIndex <tableCount ; countryIndex++) {
			var countryName = arrCountry[countryIndex];

			for ( var yearIndex = 0; yearIndex <= arrYears.length; yearIndex++) {
				var nutrition = 0;

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
													* animalData[increment].nonForageRate * energyIndex * 35600)/(propertyValue*1000000));
									
								}

							} else {

								var proteinIndex = animalData[increment].proteinUnitIndex;
								if (proteinIndex != null
										&& proteinIndex !== undefined) {
									nutrition = nutrition
											+ formatNumberRoundOff((animalData[increment].animalCount
													* animalData[increment].nonForageRate * proteinIndex *0.319)/(propertyValue*1000));
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
											+ formatNumberRoundOff((aquacultureData[aqua_increment].nutritionEnergy * 1)/(parseFloat(propertyValue)*1000));
									}
							} else {
								var proteinIndex = aquacultureData[aqua_increment].nutritionProtein;
								if (proteinIndex != null
										&& proteinIndex !== undefined) {
									nutrition = nutrition
											+ formatNumberRoundOff((aquacultureData[aqua_increment].nutritionProtein * 1)/(parseFloat(propertyValue)*1000));
								}

							}
						}
					}
				}
				
			/*	nutrition = nutrition / parseFloat(propertyValue);
				if(unitIndx == "Energy")
				{
				nutrition = nutrition / 1000000;
				}
				else
				{
				nutrition = nutrition / 1000;
				}*/
				nutrition= formatNumber(nutrition);
				

				if (yearIndex == arrYears.length ) {
						$('#table' + (countryIndex + 1))
							.prepend(
									'<tr>'
											+ '<th width="100px">' + "Year" + '</th>'
											+ '<th>' + "Estimated Feed "+ subtitle + '</th>'
											+ '</tr>');
				} else {
					if(latestYear==yearNo){
						$('#tableData' + (countryIndex + 1)).prepend(
							'<tr>' + '<td width="100px" style="color: red;">'
									+ yearNo + '</td>' + '<td style="color: red;"> ' + (nutrition)
									+ '</td>' + '</tr>');
					}
					else{
						$('#tableData' + (countryIndex + 1)).prepend(
							'<tr>' + '<td width="100px">'
									+ yearNo + '</td>' + '<td>' + (nutrition)
									+ '</td>' + '</tr>');
					}
					
				}
			}

		}
					
						if(unitIndx == "Energy")
						{	
							if(propertyValue=="1"){
								energyType = "1000 GJ";
								subtitle = "(energy requirements in 1000 GJ)";
							}
							else {
							energyType = "1000 MT";
							subtitle = "(energy requirements in "+ propertyName+" equivalent 1000 [MT] )";
							}
						}
						else
						{
							energyType = "1000 MT";
							if(propertyValue=="1"){
								subtitle = "(protein requirements in 1000 MT)";
							}
							else{
								subtitle = "(protein requirements in "+ propertyName+" equivalent 1000 [MT]) ";
							}

						}
						
					
					
					 //$("#para").innerHTML('Share of different animal types/species of total estimated feed demand for Year:'+latestYear+' ');
					 document.getElementById("para").innerHTML='Share of different animal types/species of total estimated feed demand for Year: '+latestYear+' ';
					 document.getElementById("para1").innerHTML=subtitle ;
					
					}
					
					);
					
	function getPieData(){
		$('#pieChartDiv1').empty();				
		$('#pieChartDiv2').empty();	
		var unitIndx = "${unitIndex}";
		var propertyValue = "${propertyValue}";
		var propertyName = "${propertyName}";
		var energyType ;
		if(propertyValue == "")
		{
		propertyValue = 1;
		}
		else
		{
		propertyValue = parseFloat(propertyValue);
		}						
		
		var subtitle="";
		if(unitIndx == "Energy")
		{	
			if(propertyValue=="1"){
				energyType = "1000 GJ";
				subtitle = "(energy requirements in 1000 GJ)";
			}
			else {
			energyType = "1000 MT";
			subtitle = "( energy requirements in "+ propertyName+" equivalent 1000 [MT] )";
			}
		}
		else
		{
			energyType = "1000 MT";
			if(propertyValue=="1"){
				subtitle = "(protein requirements in 1000 MT)";							
			}
			else{
				subtitle = "( protein requirements in "+ propertyName+" equivalent 1000 [MT] )";
			}

		}
	
		var yearSelected = $("#selectYearIndex option:selected").val();
		if(yearSelected==""){
			var latestYear = arrYears[arrYears.length - 1];
		}	
		else{
			latestYear=yearSelected;
		}


		if(unitIndx == "Energy")
			{	
				if(propertyValue=="1"){
					energyType = "1000 GJ";
					subtitle = "(energy requirements in 1000 GJ)";
				}
				else {
				energyType = "1000 MT";
				subtitle = "energy requirements in "+ propertyName+" equivalent 1000 [MT] ";
				}
			}
		else
			{
				energyType = "1000 MT";
				if(propertyValue=="1"){
					subtitle = "protein requirements in MT";
				}
				else{
					subtitle = " protein requirements in "+ propertyName+" equivalent 1000 [MT] ";
				}

			}
			 $("#para").empty();
			 $("#para1").empty();
			
			 if($('#selectCountry').val()!=null){
				document.getElementById("para").innerHTML='Share of different animal types/species of total estimated feed demand for Year: '+latestYear+' ';
				 document.getElementById("para1").innerHTML=subtitle ;
			 }
			 
			var animalData = ${animalRawData};
			var aquacultureData = ${aquacultureData};

			var listAnimal = ('${animalList}');
			listAnimal = listAnimal
					.substr(0, listAnimal.length - 1);
			var arrayAnimal;
			arrayAnimal = listAnimal.split(",");
			
			var country = "";
			$.each($("#selectCountry option:selected"), function() {
			country = country.concat($(this).val()).toString();
			country = country.concat(",");
			});
			
			var arrCountry;
			arrCountry = country.split(",");
			
							for ( var countryIndex = 0; countryIndex < arrCountry.length-1; countryIndex++) {
							var countryName = arrCountry[countryIndex];
							var resultArray = [];
							resultArray.push(countryName);

							var aquaEnergyIndex = 0;
							var aquaProteinIndex = 0;

						//	var latestYear = arrYears[arrYears.length - 1];
							if (unitIndx == "Energy") {
								for ( var animalIndex = 0; animalIndex < arrayAnimal.length; animalIndex++) {
									var nutritionEnergy = 0;
									resultArray.push(arrayAnimal[animalIndex]);
									for ( var increment in animalData) {
										if (countryName == animalData[increment].countryName) {
											if (arrayAnimal[animalIndex] == animalData[increment].animalName) {
												if (latestYear == animalData[increment].year) {
													var energyIndex = animalData[increment].energyUnitIndex;
													if (energyIndex != null
															&& energyIndex !== undefined) {
														nutritionEnergy =formatNumberRoundOff((animalData[increment].animalCount
																		* animalData[increment].nonForageRate * energyIndex * 35600)/(propertyValue*1000000));
															
													}
												}
											}
										}
									}
									
									resultArray.push(formatNumberRoundOff(nutritionEnergy));

								}
								for ( var aqua_increment in aquacultureData) {
									if (countryName == aquacultureData[aqua_increment].countryName) {
										if (latestYear == aquacultureData[aqua_increment].year) {
											resultArray.push("Aqua");
											aquaEnergyIndex = (aquacultureData[aqua_increment].nutritionEnergy);
											
											resultArray.push(formatNumberRoundOff((aquaEnergyIndex * 1)/(1000*propertyValue)));
										}
									}

								}

							} else {
								for ( var animalIndex = 0; animalIndex < arrayAnimal.length; animalIndex++) {
									var nutritionProtein = 0;
									resultArray.push(arrayAnimal[animalIndex]);
									for ( var increment in animalData) {
										if (countryName == animalData[increment].countryName) {
											if (arrayAnimal[animalIndex] == animalData[increment].animalName) {
												if (latestYear == animalData[increment].year) {
													var proteinIndex = animalData[increment].proteinUnitIndex;
													if (proteinIndex != null
															&& proteinIndex !== undefined) {
														nutritionProtein = formatNumberRoundOff((animalData[increment].animalCount
																		* animalData[increment].nonForageRate * proteinIndex * 0.319)/(propertyValue*1000));
													}
												}
											}
										}
									}
									resultArray.push(formatNumberRoundOff(nutritionProtein));
								}
								for ( var aqua_increment in aquacultureData) {
									if (countryName == aquacultureData[aqua_increment].countryName) {
										if (latestYear == aquacultureData[aqua_increment].year) {
											resultArray.push("Aqua");
											aquaProteinIndex = aquacultureData[aqua_increment].nutritionProtein;
											resultArray.push(formatNumberRoundOff((aquaProteinIndex * 1)/(1000*propertyValue)));
										}
									}

								}

							}
						
							var myarray = [];
							var item = {
								"type" : 'pie',
								"name" : countryName,
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
						
							$('#pieChartDiv' + (countryIndex + 1))
									.highcharts(
											{
												chart : {
													plotBackgroundColor : null,
													plotBorderWidth : null,
													plotShadow : false,
												},
												title : {
													text :  countryName,

												},
												tooltip : {
													pointFormat : ' share of total: {point.percentage:.1f} % ,<br>' +subtitle+ ': {point.y}</br>'
												
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
			makeTable(propertyValue,latestYear);			
	}				
</script>

<div class="row" style="padding-top: 40px">
	<div class="col-md-12" id="lineChartDiv"></div>
</div>
<!--popover-->
   <style type="text/css">
    .popover{
        max-width:400px;
	
		
    }
	.popover-title{

}
</style>
        <div align="center" style="padding-top: 40px">COMPOSITION OF ESTIMATED FEED DEMAND</div>
		<div id="visualizeDiv">
				<div  class="row">			
						<div class="col-md-3"></div>				<!--new1-->
						<div class="col-md-3" id="formTabOne" align="top" data-toggle="popover"  data-trigger="hover"width="100px" data-placement="left" title="Compare the composition of estimated feed demand in two of the countries you had previously selected. If you want to change a focus country, first deselect that country before activating a new one." >
							<div class="form-group" id="countryIdListSelected" style="margin-top:20px; font-size:16px;">
								<label for="selectPieCountry" style="text-align:left; cursor: pointer;">Select country/ies (up to two) <sub><font color="black">[?]</font></sub></label> 
							</div>
						</div>
						<div class="col-md-3" id="formTabOne" align="top" data-toggle="popover" data-trigger="hover" width="100px" data-placement="right" title="The composition of estimated feed demand varies over time, so please select a year; by default, the latest year is activated. The composition of feed demand in two countries can only be compared for the same year.">
							<div class="form-group" id="eeFormGroup"  style="margin-top:20px; font-size:16px;" >
								<label for="selectYear"  style="cursor: pointer;">Select year  <sub><font color="black">[?]</font></sub> </label> 
							</div>
						</div>	
						<div class="col-md-3"></div>
				</div>
				<div  class="row">
					<div class="col-md-3"></div>				
					<div class="col-md-3" id="formTabOne" align="left" >
						<div class="form-group" id="countryPieList"  >
							<select data-style="btn-success"
								id="selectCountry" multiple="multiple" 
								data-live-search="true" onchange="getPieData();" >
								<c:choose>
								<c:when test="${not empty countryList}">
								<c:set var="count" value="0" scope="page" />
									<c:forEach items="${countryList}" var="country"
										varStatus="varStatus">
												<c:choose>
													<c:when test="${count < 2}">
														<option name="cList" value="${country.countryName}" selected="selected">
															${country.countryName}</option>
													</c:when>
													<c:otherwise>
														<option name="cList" value="${country.countryName}">
															${country.countryName}</option>	
													</c:otherwise>
												</c:choose>
										<c:set var="count" value="${count + 1}" scope="page"/>	
									</c:forEach>
								</c:when>
							</c:choose>
							</select>
						</div>
					</div>

				
					<div class="col-md-3" id="formTabTwo" >
					<div class="form-group" id="eeFormGroup" align="left">
					<select class="selectBox" data-style="btn-success"
										id="selectYearIndex" onchange="getPieData();">
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
				<div class="col-md-3"></div>	

		</div>
<div  style="padding-top: 40px; line-height:70%;" >
	<tr><td><center><TEXT id="para" style="font-family:Arial;color:#333333;font-size:14px;font-weight:bold;text-transform:uppercase;fill:#333333;"></TEXT></center><br />
	<center><TEXT id="para1" style="color:#333333;font-size:12px;fill:#333333;"></TEXT></center></td></tr>
</div>
<div class="row" style="padding-top: 0px">
	<div class="col-md-6" style="display: inline-block;" id="pieChartDiv1"></div>
	<div class="col-md-6" style="display: inline-block;" id="pieChartDiv2"></div>
<!--	<div class="col-md-4" style="display: inline-block;" id="pieChartDiv3"></div>-->
</div>

<div class="row" style="padding-top: 20px; padding-bottom: 20px" >
	<div class="col-md-6" style="display: inline-block;" id="tableDiv1">
		<table  id='table11' data-toggle="collapse" data-target="#collapseTable1" style="cursor:pointer;text-align:center">
		<tr><td> + Click here to expand data table</td></tr>
		</table><br>
		<table class="bordered" id='table1' style="cursor:pointer;">
		</table>
		<div id="collapseTable1" class="collapse">
			<table id='tableData1' class="bordered" >
			</table>
		</div>
	</div>
	<div class="col-md-6" style="display: inline-block;" id="tableDiv2">
		<table  id='table22' data-toggle="collapse" data-target="#collapseTable2" style="cursor:pointer;text-align:center">
		<tr><td> + Click here to expand data table</td></tr>
		</table><br>
		<table class="bordered" id='table2' style="cursor:pointer;">
		</table>
		<div id="collapseTable2" class="collapse">
			<table id='tableData2' class="bordered">
			</table>
		</div>
	</div>
<!--	<div class="col-md-4" style="display: inline-block;" id="tableDiv3">
		<table class="bordered" id='table3'>
		</table>
		<div id="collapseTable3">
			<table id='tableData3' class="bordered">
			</table>
		</div>
	</div> -->
</div>