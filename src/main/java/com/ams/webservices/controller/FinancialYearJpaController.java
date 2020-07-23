package com.ams.webservices.controller;

import java.net.URI;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.ams.webservices.entity.FinancialYear;
import com.ams.webservices.repository.FinancialYearJpaRepository;

@CrossOrigin
@RestController
public class FinancialYearJpaController {
	
	@Autowired
	FinancialYearJpaRepository financialYearJpaRepository;
	
	@GetMapping("/financial_years")
	public List<FinancialYear>  GetAllFinancialYears(){
		return financialYearJpaRepository.findAll();
	}
	
	@GetMapping("/financial_years/{year}")
	public Optional<FinancialYear> GetFinancialYearByYear(@PathVariable int year){
		return financialYearJpaRepository.findById(year);
	}
	
	@PostMapping("/financial_years")
	public ResponseEntity<Void>  CreateFinancialYear(@RequestBody FinancialYear financialYear){
		FinancialYear yearCreated = financialYearJpaRepository.save(financialYear);		
		URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("{year}").buildAndExpand(yearCreated.getYear()).toUri();
			return ResponseEntity.created(uri).build();
	}
	
	@PutMapping("/financial_years")
	public ResponseEntity<FinancialYear>  UpdateYear(@RequestBody FinancialYear financialYear){
		FinancialYear yearUpdated = financialYearJpaRepository.save(financialYear);
		return new ResponseEntity<FinancialYear>(yearUpdated,HttpStatus.OK);				
	}
	
	@DeleteMapping("/financial_years/{year}")
	public ResponseEntity<Void>  DeleteYear(@PathVariable int year){
		financialYearJpaRepository.deleteById(year);
		return ResponseEntity.noContent().build();	
	}

}
