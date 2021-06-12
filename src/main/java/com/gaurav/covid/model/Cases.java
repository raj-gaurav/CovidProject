package com.gaurav.covid.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Cases {

	private String newCase;
	private int active;
	private int critical;
	private int recovered;
	private String M_pop; 
	private int total;
	
}
