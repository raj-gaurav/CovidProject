package com.gaurav.covid.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gaurav.covid.model.EmailModel;

@Repository
public interface MailRepository extends JpaRepository<EmailModel, String> {
	
}
