package com.gaurav.covid.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
public class Response {
	private String continent;
	private String country;
	private int population;
	private Cases cases;
	private Deaths deaths;
	private Tests tests;
	private String day;
	private String time;
	
	
}
