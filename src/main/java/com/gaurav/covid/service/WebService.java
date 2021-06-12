package com.gaurav.covid.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.gaurav.covid.model.Articles;
import com.gaurav.covid.model.CenterModel;
import com.gaurav.covid.model.Centers;
import com.gaurav.covid.model.CovidDetails;
import com.gaurav.covid.model.DataByDistrict;
import com.gaurav.covid.model.District;
import com.gaurav.covid.model.Districts;
import com.gaurav.covid.model.EmailModel;
import com.gaurav.covid.model.News;
import com.gaurav.covid.model.Response;
import com.gaurav.covid.model.Sessions;
import com.gaurav.covid.model.State;
import com.gaurav.covid.model.States;
import com.gaurav.covid.model.Weather;
import com.gaurav.covid.repository.MailRepository;

@Service
public class WebService {

	private final String RAPID_API_KEY = "RAPID_API_KEY";
	private final String NEWS_API_KEY = "NEWS_API_KEY";
	private final String EMAIL_FROM = "YOUR_EMAIL_ID";

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private RestTemplate restTemplate;

	@Autowired
	private MailRepository mailRepository;

	public Weather getWeatherDetails(String location) {
		String URL = "https://weatherapi-com.p.rapidapi.com/current.json?q=" + location;

		HttpHeaders header = new HttpHeaders();
		header.setContentType(MediaType.APPLICATION_JSON);
		header.add("x-rapidapi-key", RAPID_API_KEY);
		header.add("x-rapidapi-host", "weatherapi-com.p.rapidapi.com");

		HttpEntity<String> entity = new HttpEntity<String>("parameters", header);

		ResponseEntity<Weather> response = restTemplate.exchange(URL, HttpMethod.GET, entity, Weather.class);

		return response.getBody();
	}

	public Response getCoronaUpdate(String country) {
		String URL = "https://covid-193.p.rapidapi.com/statistics?country=" + country;

		HttpHeaders header = new HttpHeaders();
		header.setContentType(MediaType.APPLICATION_JSON);
		header.add("x-rapidapi-key", RAPID_API_KEY);
		header.add("x-rapidapi-host", "covid-193.p.rapidapi.com");

		HttpEntity<String> entity = new HttpEntity<String>("parameters", header);

		ResponseEntity<CovidDetails> response = restTemplate.exchange(URL, HttpMethod.GET, entity, CovidDetails.class);

		return response.getBody().getResponse().get(0);
	}

	public News getNewsByApi(String keyword, String date) {
		String URL = "https://newsapi.org/v2/everything?q=" + keyword + "&from=" + date + "&sortBy=publishedAt&apiKey="
				+ NEWS_API_KEY;

		News response = restTemplate.getForObject(URL, News.class);

		return response;
	}

	public Articles getNews(String keywords) {
		LocalDate date = LocalDate.now();
		News news = getNewsByApi(keywords, date.toString());
		List<Articles> articleList = news.getArticles();
		int min = 0;
		int max = articleList.size() - 1;
		int index = (int) Math.floor(Math.random() * (max - min + 1) + min);
		Articles article = articleList.get(index);
		return article;
	}

	public List<State> getStates() {
		String URL = "https://cdn-api.co-vin.in/api/v2/admin/location/states";
		// Setting the headers
		HttpHeaders header = new HttpHeaders();
		header.setContentType(MediaType.APPLICATION_JSON);
		header.add("user-agent",
				"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36");

		HttpEntity<String> entity = new HttpEntity<String>("parameters", header);

		ResponseEntity<States> response = restTemplate.exchange(URL, HttpMethod.GET, entity, States.class);

		States body = response.getBody();
		List<State> states = body.getStates();

		return states;
	}

	public List<District> getDistricts(String stateId) {
		String URL = "https://cdn-api.co-vin.in/api/v2/admin/location/districts/" + stateId;

		HttpHeaders header = new HttpHeaders();
		header.setContentType(MediaType.APPLICATION_JSON);
		header.add("user-agent",
				"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36");

		HttpEntity<String> entity = new HttpEntity<String>("parameters", header);

		ResponseEntity<Districts> response = restTemplate.exchange(URL, HttpMethod.GET, entity, Districts.class);
		List<District> districtList = response.getBody().getDistricts();

		return districtList;
	}

	public List<Centers> getCentersByDistrict(String districtId, String date) {
		String URL = "https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/calendarByDistrict?district_id="
				+ districtId + "&date=" + date;

		HttpHeaders header = new HttpHeaders();
		header.setContentType(MediaType.APPLICATION_JSON);
		header.add("user-agent",
				"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36");

		HttpEntity<String> entity = new HttpEntity<String>("parameters", header);

		ResponseEntity<DataByDistrict> response = restTemplate.exchange(URL, HttpMethod.GET, entity,
				DataByDistrict.class);

		return response.getBody().getCenters();
	}

	public List<Sessions> getSessionsForAgeGroup(String districtId, String date, String centerId, String age) {

		List<Centers> centerList = getCentersByDistrict(districtId, date);
		centerList = centerList.stream().filter(c -> c.getCenter_id() == Long.parseLong(centerId))
				.collect(Collectors.toList());
		Centers center = centerList.get(0);

		List<Sessions> sessionList = center.getSessions();
		sessionList = sessionList.stream().filter(s -> s.getMin_age_limit() == Integer.parseInt(age))
				.collect(Collectors.toList());

		return sessionList;
	}

	public String addMail(EmailModel mail) {
		List<EmailModel> findAll = mailRepository.findAll();
		// System.out.println(findAll.toString());
		for (EmailModel e : findAll) {
			if (e.getEmail().equals(mail.getEmail()) && e.getCenterId().equals(mail.getCenterId())
					&& e.getAge() == mail.getAge()) {
				return "You already sent a Notify request. We'll notify you about the slots.";
			}
		}
		mailRepository.save(mail);
		String centerId = mail.getCenterId();
		String date = LocalDate.now().format(DateTimeFormatter.ofPattern("dd-MM-yyyy"));
		ResponseEntity<CenterModel> response = getCenterDetails(centerId,date);
		Centers centers = response.getBody().getCenters();
		String toEmail = mail.getEmail();
		String subject = "Registered Successfully !!";
		String body = "Hi @"+toEmail+",";
		body = body + "\n\nThank you for registering with us.\n\n We will notify you once the vaccine for your location is available.";
		body = body + "\n Address : "+centers.getAddress() +"\n"+centers.getBlock_name()+"\n"+centers.getDistrict_name()+"\n"+centers.getPincode();
		body = body + "\n\nThanks & Regards,\n"+"Gaurav Raj\n"+"Covid Project";
		sendEmail(toEmail, body, subject);
		return "Email registered Successfully !! You'll get notified about the slots";
	}

	@Scheduled(fixedRate = 5000L)
	public void checkAvailability() {

		List<EmailModel> listMail = mailRepository.findAll();

		if (listMail.size() != 0) {
			for (EmailModel e : listMail) {
				String centerId = e.getCenterId();
				String date = LocalDate.now().format(DateTimeFormatter.ofPattern("dd-MM-yyyy"));
				int flag = e.getFlag();
				int age = e.getAge();
				// System.out.println(centerId);
				
				ResponseEntity<CenterModel> response = getCenterDetails(centerId, date);

				if (response.getBody().getCenters() != null) {
					Centers center_details = response.getBody().getCenters();

					List<Sessions> sessions = center_details.getSessions();
					for (Sessions s : sessions) {
						if (s.getMin_age_limit() == age) {
							if (s.getAvailable_capacity() > 0) {
								if (flag == 0) {
									System.out.println("Date : " + s.getDate() + " Min Age : " + s.getMin_age_limit()
											+ " Dose 1 : " + s.getAvailable_capacity_dose1() + " Dose 2 : "
											+ s.getAvailable_capacity_dose2());
									flag++;
									String toEmail = e.getEmail();
									String body = "Hi @" + toEmail+",";
									body = body + "\n\nYou are being notified about the vaccine availabilty as you are registered with us.";
									body = body +  "\nVACCINE AVAILABLE\n\nDate : " + s.getDate()
											+ " \nMin Age : " + s.getMin_age_limit() + " \nDose 1 : "
											+ s.getAvailable_capacity_dose1() + " \nDose 2 : "
											+ s.getAvailable_capacity_dose2() + "\n Vaccine : " +s.getVaccine() +"\n Address : "+ center_details.getAddress()
											+ " \n" + center_details.getBlock_name() + " "
											+ center_details.getPincode() + "\n "+ center_details.getDistrict_name();
									body = body + "\n\n Note :  We request you to get vaccinated.";
									body = body + "\n\nThanks & Regards,\n"+"Gaurav Raj\n"+"Covid Project";
									String subject = "Vaccine Slot Available ";
									sendEmail(toEmail, body, subject);
									e.setFlag(flag);
									mailRepository.save(e);

								}

							}

							else {
								if (flag == 1) {

									// System.out.println("Date : " + s.getDate() + "All Vaccines booked");
									String toEmail = e.getEmail();
									String body = "Hi @" + toEmail+",";
									body = body + "\nDate : " + s.getDate()
											+ "\nAll Vaccines booked of \n Address : " + center_details.getAddress() + " \n"
											+ center_details.getBlock_name() + " " + center_details.getPincode()+ "\n "+ center_details.getDistrict_name();
									body = body + "\n\nNote :  We request you to get vaccinated once it is available.";
									body = body + "\n\nThanks & Regards,\n"+"Gaurav Raj\n"+"Covid Project";
									String subject = "All Vaccine Slots Booked";
									sendEmail(toEmail, body, subject);
									flag = 0;
									e.setFlag(flag);
									mailRepository.save(e);
								}

							}
						}

					}
				}
			}
		}

	}

	public void sendEmail(String toEmail, String body, String subject) {
		SimpleMailMessage message = new SimpleMailMessage();

		message.setFrom(EMAIL_FROM);
		message.setTo(toEmail);
		message.setText(body);
		message.setSubject(subject);

		mailSender.send(message);
	}
	
	public ResponseEntity<CenterModel> getCenterDetails(String centerId, String date){
		String URL = "https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/calendarByCenter?center_id="
				+ centerId + "&date=" + date;

		HttpHeaders header = new HttpHeaders();
		header.setContentType(MediaType.APPLICATION_JSON);
		header.add("user-agent",
				"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36");

		HttpEntity<String> entity = new HttpEntity<String>("parameters", header);

		ResponseEntity<CenterModel> response = restTemplate.exchange(URL, HttpMethod.GET, entity,
				CenterModel.class);
		
		return response;
	}

}
