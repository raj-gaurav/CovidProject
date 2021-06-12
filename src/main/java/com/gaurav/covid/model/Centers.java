package com.gaurav.covid.model;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Centers {
	private long center_id;
	private String name;
	private String address;
	private String state_name;
	private String district_name;
	private String block_name;
	private long pincode;
	private int lat;
	private int Long;
	private String from;
	private String to;
	private String fee_type;
	private List<Sessions> sessions;
	
}
