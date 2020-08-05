package com.ams.webservices.controller;

import java.net.URI;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
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
import com.ams.webservices.entity.Transaction;
import com.ams.webservices.repository.TransactionJpaRepository;

@CrossOrigin
@RestController
public class TransactionJpaController {
	
	@Autowired
	TransactionJpaRepository transactionJpaRepository;

		
	@GetMapping("/transactions/start/{startDate}/end/{endDate}")
	public List<Transaction>  GetTransactionsForAPeriod(
			@PathVariable @DateTimeFormat(pattern = "ddMMyyyy") Date startDate,
			@PathVariable @DateTimeFormat(pattern = "ddMMyyyy") Date endDate){
		return transactionJpaRepository.findTransactionsForAPeriod(startDate, endDate);
	}	
	
	@GetMapping("/transactions/{id}")
	public Optional<Transaction> GetCategoryByCode(@PathVariable long id){
		return transactionJpaRepository.findById(id);
	}
	
	@PostMapping("/transactions")
	public ResponseEntity<Void>  CreateTransactionCategory(@RequestBody Transaction transaction){
		Transaction transactionCreated = transactionJpaRepository.save(transaction);		
		URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("{id}").buildAndExpand(transactionCreated.getTransactionId()).toUri();
			return ResponseEntity.created(uri).build();
	}
	
	@PutMapping("/transactions")
	public ResponseEntity<Transaction>  UpdateTransactionCategory(@RequestBody Transaction transaction){
		Transaction transactionUpdated = transactionJpaRepository.save(transaction);
		return new ResponseEntity<Transaction>(transactionUpdated,HttpStatus.OK);				
	}
	
	@DeleteMapping("/transactions/id/{id}")
	public ResponseEntity<Void>  DeleteTransactionCategoryByName(@PathVariable long id){
		transactionJpaRepository.deleteById(id);
		return ResponseEntity.noContent().build();	
	}

}
