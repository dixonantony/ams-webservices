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
import com.ams.webservices.entity.TransactionSubCategory;
import com.ams.webservices.repository.TransactionSubCategoryJpaRepository;

@CrossOrigin
@RestController
public class TransactionSubCategoryJpaController {
	
	@Autowired
	TransactionSubCategoryJpaRepository transactionSubCategoryJpaRepository;
	
	@GetMapping("/transactionsubcategory")
	public List<TransactionSubCategory>  GetAllTransactionSubCategory(){
		return transactionSubCategoryJpaRepository.findAll();
	}
	
	@GetMapping("/transactionsubcategory/{code}")
	public Optional<TransactionSubCategory> GetTransactionSubCategory(@PathVariable String code){
		return transactionSubCategoryJpaRepository.findById(code);
	}
	
	@PostMapping("/transactionsubcategory")
	public ResponseEntity<Void>  CreateTransactionSubCategory(@RequestBody TransactionSubCategory transactionSubCategory){
		TransactionSubCategory transSubCatCreated = transactionSubCategoryJpaRepository.save(transactionSubCategory);		
		URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("{name}").buildAndExpand(transSubCatCreated.getTrans_sub_cat_name()).toUri();
			return ResponseEntity.created(uri).build();
	}
	
	@PutMapping("/transactionsubcategory")
	public ResponseEntity<TransactionSubCategory>  UpdateAccount(@RequestBody TransactionSubCategory transactionSubCategory){
		TransactionSubCategory transSubCatUpdated = transactionSubCategoryJpaRepository.save(transactionSubCategory);
		return new ResponseEntity<TransactionSubCategory>(transSubCatUpdated,HttpStatus.OK);				
	}
	
	@DeleteMapping("/transactionsubcategory/{transSubCatName}")
	public ResponseEntity<Void>  DeleteAccount(@PathVariable String transSubCatName){
		transactionSubCategoryJpaRepository.deleteByTransSubCatName(transSubCatName);
		return ResponseEntity.noContent().build();	
	}

}
