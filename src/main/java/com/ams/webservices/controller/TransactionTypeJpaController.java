package com.ams.webservices.controller;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.ams.webservices.entity.TransactionType;
import com.ams.webservices.repository.TransactionTypeJpaRepository;


@CrossOrigin
@RestController
public class TransactionTypeJpaController {

	@Autowired
	TransactionTypeJpaRepository transactionTypeJpaRepository;
	
	@GetMapping("/transactiontypes")
	public List<TransactionType>  GetAllTransactionTypes(){
		return transactionTypeJpaRepository.findAll();
	}
	
	@GetMapping("/transactiontypes/{transactionTypeCd}")
	public Optional<TransactionType> GetTransactionTypeByCode(@PathVariable String transactionTypeCd){
		return transactionTypeJpaRepository.findById(transactionTypeCd);
	}	
	
}
