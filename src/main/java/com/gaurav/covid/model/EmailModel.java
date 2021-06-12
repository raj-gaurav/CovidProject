package com.gaurav.covid.model;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Entity
@Table(name="email")
@ToString
public class EmailModel {
	@Id
	@Column
	String centerId;
	@Column
	String email;
	@Column
	int flag;
	@Column
	int age;
}
