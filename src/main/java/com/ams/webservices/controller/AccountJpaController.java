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
import com.ams.webservices.entity.Account;
import com.ams.webservices.repository.AccountJpaRepository;

@CrossOrigin
@RestController
public class AccountJpaController {
	
	@Autowired
	AccountJpaRepository accountJpaRepository;
	
	@GetMapping("/accounts")
	public List<Account>  GetAllAccounts(){
		return accountJpaRepository.findAll();
	}
	
	@GetMapping("/accounts/{code}")
	public Optional<Account> GetAccountByCode(@PathVariable String code){
		return accountJpaRepository.findById(code);
	}
	
	@PostMapping("/accounts")
	public ResponseEntity<Void>  CreateAccount(@RequestBody Account account){
		Account accountCreated = accountJpaRepository.save(account);		
		URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("{name}").buildAndExpand(accountCreated.getAccount_name()).toUri();
			return ResponseEntity.created(uri).build();
	}
	
	@PutMapping("/accounts")
	public ResponseEntity<Account>  UpdateAccount(@RequestBody Account account){
		Account accountUpdated = accountJpaRepository.save(account);
		return new ResponseEntity<Account>(accountUpdated,HttpStatus.OK);				
	}
	
	@DeleteMapping("/accounts/{code}")
	public ResponseEntity<Void>  DeleteAccount(@PathVariable String code){
		accountJpaRepository.deleteById(code);
		return ResponseEntity.noContent().build();	
	}
	
	@PutMapping("/accounts/credit/{code}/{amount}")
	public ResponseEntity<Void>  creditAccount(@PathVariable String code,@PathVariable double amount){
		accountJpaRepository.accountCredit(amount, code);
		return ResponseEntity.noContent().build();				
	}
	
	@PutMapping("/accounts/debit/{code}/{amount}")
	public ResponseEntity<Void>  debitAccount(@PathVariable String code,@PathVariable double amount){
		accountJpaRepository.accountDebit(amount, code);
		return ResponseEntity.noContent().build();				
	}

}
