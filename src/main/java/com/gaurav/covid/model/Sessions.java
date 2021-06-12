package com.gaurav.covid.model;

import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter 
public class Sessions {
	private String session_id;
	private String date;
	private int available_capacity;
	private int min_age_limit;
	private String vaccine;
	private TreeSet<String> slots;
	private int available_capacity_dose1;
	private int available_capacity_dose2;
	
}
