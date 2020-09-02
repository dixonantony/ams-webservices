package com.ams.webservices.controller;

import java.net.URI;
import java.util.List;
import java.util.Optional;

//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
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
import com.ams.webservices.entity.TransactionCategory;
import com.ams.webservices.repository.TransactionCategoryJpaRepository;
import com.ams.webservices.repository.TransactionSubCategoryJpaRepository;

@CrossOrigin
@RestController
public class TransactionCategoryJpaController {
	
	
	@Autowired
	TransactionCategoryJpaRepository transactionCategoryJpaRepository;
	@Autowired
	TransactionSubCategoryJpaRepository transactionSubCategoryJpaRepository;
	
//	private final Logger logger = LoggerFactory.getLogger(TransactionCategoryJpaController.class);
	
	@GetMapping("/transactioncategory")
	public List<TransactionCategory>  GetAllAccounts(){
		return transactionCategoryJpaRepository.findAll();
	}
	
	@GetMapping("/transactioncategory/{code}")
	public Optional<TransactionCategory> GetCategoryByCode(@PathVariable String code){
		return transactionCategoryJpaRepository.findById(code);
	}
	
	@PostMapping("/transactioncategory")
	public ResponseEntity<Void>  CreateTransactionCategory(@RequestBody TransactionCategory transactionCategory){
		TransactionCategory categoryCreated = transactionCategoryJpaRepository.save(transactionCategory);		
		URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("{name}").buildAndExpand(categoryCreated.getCategory_name()).toUri();
			return ResponseEntity.created(uri).build();
	}
	
	@PutMapping("/transactioncategory")
	public ResponseEntity<TransactionCategory>  UpdateTransactionCategory(@RequestBody TransactionCategory category){
		TransactionCategory categoryUpdated = transactionCategoryJpaRepository.save(category);
		return new ResponseEntity<TransactionCategory>(categoryUpdated,HttpStatus.OK);				
	}
	
	@DeleteMapping("/transactioncategory/name/{name}")
	public ResponseEntity<Void>  DeleteTransactionCategoryByName(@PathVariable String categoryName){
		transactionCategoryJpaRepository.deleteByCategoryName(categoryName);
		return ResponseEntity.noContent().build();	
	}
	
	@DeleteMapping("/transactioncategory/{code}")
	public ResponseEntity<Void>  DeleteTransactionCategory(@PathVariable String code){
		Optional<TransactionCategory> categoryDeleted = transactionCategoryJpaRepository.findById(code);
		if(categoryDeleted.isPresent()){
			categoryDeleted.get().getTransactionSubCategory()
				.forEach(transactionSubCategory -> 
				 transactionSubCategoryJpaRepository.deleteById(transactionSubCategory.getTrans_sub_cat_cd()));
		}
		transactionCategoryJpaRepository.deleteById(code);		
		return ResponseEntity.noContent().build();	
	}

}
