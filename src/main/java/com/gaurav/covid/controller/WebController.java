package com.gaurav.covid.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.gaurav.covid.model.Articles;
import com.gaurav.covid.model.Centers;
import com.gaurav.covid.model.District;
import com.gaurav.covid.model.DistrictModelAttribute;
import com.gaurav.covid.model.EmailModel;
import com.gaurav.covid.model.Response;
import com.gaurav.covid.model.Sessions;
import com.gaurav.covid.model.State;
import com.gaurav.covid.model.StateModelAttribute;
import com.gaurav.covid.model.Weather;
import com.gaurav.covid.service.WebService;

@Controller
public class WebController {

	private String stateId, districtId, centerId;
	private DistrictModelAttribute districtModelAttribute;
	@Autowired
	private WebService webService;

	public WebController(WebService webService) {
		this.webService = webService;
	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String getIndexPage(ModelMap model) {

		List<State> states = webService.getStates();
		Weather weather = webService.getWeatherDetails("Munger");
		Response response = webService.getCoronaUpdate("India");
		Articles article = webService.getNews("corona, india, covid");
		model.addAttribute("article", article);
		model.addAttribute("weather", weather);
		model.addAttribute("response", response);
		model.addAttribute("stateList", states);
		
		
		model.addAttribute("state", new StateModelAttribute());
		return "index";
	}

	@RequestMapping(value = "/district", method = RequestMethod.POST)
	public String getDistrict(ModelMap model, @ModelAttribute StateModelAttribute state) {

		stateId = state.getStateId();

		List<State> states = webService.getStates();
		states = states.stream().filter(s -> s.getState_id() == Integer.parseInt(stateId)).collect(Collectors.toList());

		Weather weather = webService.getWeatherDetails(states.get(0).getState_name());

		Response response = webService.getCoronaUpdate("India");

		Articles article = webService.getNews("corona, india, covid");

		List<District> districtList = webService.getDistricts(stateId);

		model.addAttribute("article", article);
		model.addAttribute("weather", weather);
		model.addAttribute("response", response);
		model.addAttribute("districtList", districtList);
		
		model.addAttribute("district", new DistrictModelAttribute());
		
		return "district";
	}

	@RequestMapping(value = "/centers", method = RequestMethod.POST)
	public String getCenters(ModelMap model, @ModelAttribute DistrictModelAttribute district) {

		
		if(!district.getMcenterId().equals("district")) {
			//System.out.println(district.getMcenterId());
			EmailModel emailModel = new EmailModel();
			emailModel.setCenterId(district.getMcenterId());
			emailModel.setEmail(district.getMail());
			emailModel.setFlag(district.getFlag());
			emailModel.setAge(district.getAge());
			//System.out.println(emailModel);
			String message = webService.addMail(emailModel);
			
			model.addAttribute("message", message);
		}
		
		
		districtModelAttribute = district;
		districtId = district.getDistrictId();

		Date da = new Date();

		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
		String date = formatter.format(da);

		List<District> districtList = webService.getDistricts(stateId);
		districtList = districtList.stream().filter(d -> d.getDistrict_id() == Integer.parseInt(districtId))
				.collect(Collectors.toList());

		Weather weather = webService.getWeatherDetails(districtList.get(0).getDistrict_name());

		Response response = webService.getCoronaUpdate("India");

		Articles article = webService.getNews("corona, india, covid");

		List<Centers> centerList = webService.getCentersByDistrict(districtId, date);
 
		model.addAttribute("article", article);
		model.addAttribute("weather", weather);
		model.addAttribute("response", response);
		model.addAttribute("centerList", centerList);
		
		
		Date d = new Date();
		Calendar c = Calendar.getInstance();
		c.setTime(d); // Using today's date
		
		
		SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		String t = format.format(c.getTime());
		c.add(Calendar.DATE,1);
		String t1 = format.format(c.getTime());
		c.add(Calendar.DATE,1);
		String t2 = format.format(c.getTime());
		c.add(Calendar.DATE,1);
		String t3 = format.format(c.getTime());
		c.add(Calendar.DATE,1);
		String t4 = format.format(c.getTime());
		c.add(Calendar.DATE,1);
		String t5 = format.format(c.getTime());
		c.add(Calendar.DATE,1);
		String t6 = format.format(c.getTime());
		
		model.addAttribute("t",t);
		model.addAttribute("t1",t1);
		model.addAttribute("t2",t2);
		model.addAttribute("t3",t3);
		model.addAttribute("t4",t4);
		model.addAttribute("t5",t5);
		model.addAttribute("t6",t6);
		
		if(district.getAge()==18) {
			model.addAttribute("dist", districtId);
			return "centers";
		}
		else {
			model.addAttribute("dist", districtId);
			return "center45";
		}
			
		
	}
	
	
	
	

	@RequestMapping(value = "/ageFilter", method = RequestMethod.GET)
	public String getAgeFilter(ModelMap model, @RequestParam("center_id") String id) {

		centerId = id;

		Date da = new Date();

		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
		String date = formatter.format(da);

		Response response = webService.getCoronaUpdate("India");

		Articles article = webService.getNews("corona, india, covid");

		List<Centers> centerList = webService.getCentersByDistrict(districtId, date);
		centerList = centerList.stream().filter(c -> c.getCenter_id() == Integer.parseInt(id))
				.collect(Collectors.toList());
		Weather weather = webService.getWeatherDetails(centerList.get(0).getDistrict_name());
		Centers center = centerList.get(0);
		model.addAttribute("article", article);
		model.addAttribute("weather", weather);
		model.addAttribute("response", response);
		model.addAttribute("center", center);

		return "ageFilter";
	}

	@RequestMapping(value = "/slots", method = RequestMethod.GET)
	public String getSlotsByAgeGroup(ModelMap model, @RequestParam("age") String age) {

		Date da = new Date();

		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
		String date = formatter.format(da);

		Response response = webService.getCoronaUpdate("India");

		Articles article = webService.getNews("corona, india, covid");

		List<Centers> centerList = webService.getCentersByDistrict(districtId, date);
		centerList = centerList.stream().filter(c -> c.getCenter_id() == Integer.parseInt(centerId))
				.collect(Collectors.toList());
		Weather weather = webService.getWeatherDetails(centerList.get(0).getDistrict_name());
		Centers center = centerList.get(0);

		List<Sessions> sessionList = webService.getSessionsForAgeGroup(districtId, date, centerId, age);

		model.addAttribute("article", article);
		model.addAttribute("weather", weather);
		model.addAttribute("response", response);
		model.addAttribute("center", center);
		model.addAttribute("sessionList", sessionList);
		model.addAttribute("age", age);

		return "slots";
	}
	
	
	
	

}
