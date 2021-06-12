package com.gaurav.covid.model;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CovidDetails {
	private String get;
	private Parameters parameters;
	List<Errors> errors;
	private int results;
	List<Response> response;
}
