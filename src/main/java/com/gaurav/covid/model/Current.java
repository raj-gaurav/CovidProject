package com.gaurav.covid.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Current {
	private long last_updated_epoch;
	private String last_updated;
	private float temp_c;
	private float temp_f;
	private int is_day;
	private Condition condition;
	private int wind_mph;
	private int wind_kph;
	private int wind_degree;
	private String wind_dir;
	private double pressure_mb;
	private double pressure_in;
	private double precip_mm;
	private double precip_in;
	private int humidity;
	private int cloud;
	private double feelslike_c;
	private double feelslike_f;
	private double vis_km;
	private double vis_miles;
	private double uv;
	private double gust_mph;
	private double gust_kph;
}
