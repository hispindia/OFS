package com.ofs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ofs.model.AnimalData;
import com.ofs.model.AnimalList;
import com.ofs.model.AquacultureData;
import com.ofs.model.CountryDetail;
import com.ofs.model.Property;
import com.ofs.service.AnimalListService;
import com.ofs.service.AnimalService;
import com.ofs.service.AquacultureService;
import com.ofs.service.CountryService;
import com.ofs.service.PropertyService;

/**
 * @author Sagar, Amit
 * 
 */
@Controller
public class ScenarioAnalysis {

	@Autowired
	private AnimalService animalService;

	@Autowired
	private AquacultureService aquacultureService;

	@Autowired
	private CountryService countryService;

	@Autowired
	private AnimalListService animalListService;
	
	@Autowired
	private PropertyService propertyService;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/showSimulator", method = RequestMethod.GET)
	public String getAllData(
			@RequestParam(value = "country", required = false) Integer countryId,
			@RequestParam(value = "unitIndex", required = false) String unitIndex,
			@RequestParam(value = "property", required = false) String propertyName,
			Model model) {

	
		/*
		 * Get Property Value
		 */
		String propertyType = "";
		if (unitIndex.equals("Energy")) {
			propertyType = "ENERGY (MJ/kg)";
		}

		if (unitIndex.equals("Protein")) {
			propertyType = "PROTEIN (%)";
		}
		List<Property> propertyList = propertyService.getPropertyData(
				propertyName, propertyType);
		String propertyValue = "";
		for (Property pdata : propertyList) {
			propertyValue = pdata.getPropertyValue();
		}
		model.addAttribute("propertyValue", propertyValue);
		model.addAttribute("unitIndex", unitIndex);
		model.addAttribute("propertyName", propertyName);
		model.addAttribute("country",countryId);

		List<CountryDetail> allCountryList = countryService.getCountryData();

		List<Property> completePropertyList = propertyService.getPropertyData();
		
		model.addAttribute("propertyList",completePropertyList);
		model.addAttribute("countryList",allCountryList);
		
		List<Property> propertyListValues = propertyService.getAllPropertyData();
		Map<String, String> propMapVal = new HashMap<String, String>();
		String propVal="";
		for (Property propMap : propertyListValues) {
			if(propMap.getPropertyType().equals("PROTEIN (%)")){
				propVal=propMap.getPropertyName().replace(" ","")+"Protein";				
			}
			else{
				propVal=propMap.getPropertyName().replace(" ","")+"Energy";
			}
			propMapVal.put(propVal, propMap.getPropertyValue());
		}
		model.addAttribute("propertyMap", propMapVal);
		
		Map<Integer, String> countryMap = new HashMap<Integer, String>();
		
		for (CountryDetail country : allCountryList) {
			countryMap.put(country.getCountryId(), country.getCountryName());
		}
		model.addAttribute("countryMap", countryMap);
		
		
		
		/*
		 * Get Animal Data for selected countries
		 */
		List<AnimalData> animalData = animalService.getAnimalData();
		/*
		 * Get list of countries
		 */
		
		List<CountryDetail> countryList = countryService.getCountryData(countryId);
		for(CountryDetail cData :countryList){
			model.addAttribute("countryName", cData.getCountryName());
		}
		
		/*
		 * Get Year List
		 */
		List<Integer> yearList = animalService.getYearList();
		model.addAttribute("yearList", yearList);
		/*
		 * Get Animal List
		 */
		List<AnimalList> animalList = animalListService.getAnimalList();
		model.addAttribute("animalList", animalList);
		model.addAttribute("animalListSize", animalList.size());
		
		/*
		 * Get Animal Name list
		 */
		List<String> animalNameList = animalListService.getAnimalNameList();
		model.addAttribute("animalNameList", animalNameList);
		/*
		 * Convert data in json format
		 */
		JSONObject responseDetailsJson = new JSONObject();
		JSONArray jsonArray = new JSONArray();

		for (AnimalData anmd : animalData) {
			JSONObject formDetailsJson = new JSONObject();
			formDetailsJson.put("animalName", anmd.getAnimalList()
					.getAnimalName().toString());
			formDetailsJson.put("animalType", anmd.getAnimalList()
					.getAnimalType().getAnimalTypeName().toString());
			formDetailsJson.put("countryName", anmd.getCountryDetail()
					.getCountryName().toString());
			formDetailsJson.put("year", anmd.getYear());
			formDetailsJson.put("animalCount", anmd.getAnimalCount());
			formDetailsJson.put("energyUnitIndex", anmd.getEnergyUnitIndex()
					.toString());
			formDetailsJson.put("nonForageRate", anmd.getNonForageRate()
					.toString());
			formDetailsJson.put("proteinUnitIndex", anmd.getProteinUnitIndex()
					.toString());
			jsonArray.add(formDetailsJson);
		}

		// Here you can see the data in json format
		responseDetailsJson.put("animalRawData", jsonArray);
		model.addAttribute("animalRawData", jsonArray);

		/*
		 * Get Aquaculture Data for selected countries
		 */
		List<AquacultureData> aquacultureData = aquacultureService
				.getAquacultureData();

		/*
		 * Convert Data in Json Format
		 */
		JSONObject responseAquaDetailsJson = new JSONObject();
		JSONArray jsonArrayAquaData = new JSONArray();

		for (AquacultureData aqmd : aquacultureData) {
			JSONObject formDetailsJson = new JSONObject();
			formDetailsJson.put("countryName", aqmd.getCountryDetail()
					.getCountryName().toString());
			formDetailsJson.put("year", aqmd.getYear());
			formDetailsJson.put("nutritionEnergy", aqmd.getNutritionEnergy()
					.toString());
			formDetailsJson.put("nutritionProtein", aqmd.getNutritionProtein()
					.toString());
			jsonArrayAquaData.add(formDetailsJson);
		}

		// Here you can see the data in json format
		responseAquaDetailsJson.put("aquacultureData", jsonArrayAquaData);
		model.addAttribute("aquacultureData", jsonArrayAquaData);

		return "showSimulator";
	}

}
