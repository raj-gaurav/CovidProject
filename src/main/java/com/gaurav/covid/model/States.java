package com.gaurav.covid.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class States {

	private List<State> states;
	private int ttl;

	/*
	 * private int usedId; private int id; private String title; private boolean
	 * completed;
	 */

}
