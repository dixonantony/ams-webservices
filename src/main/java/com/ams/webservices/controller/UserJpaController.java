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

import com.ams.webservices.entity.User;
import com.ams.webservices.repository.UserJpaRepository;

@CrossOrigin
@RestController
public class UserJpaController {
	
	@Autowired
	UserJpaRepository userJpaRepository;
	
	@GetMapping("/users")
	public List<User>  GetAllUsers(){
		return userJpaRepository.findAll();
	}
	
	@GetMapping("/users/{username}")
	public Optional<User> GetUserByUsername(@PathVariable String username){
		return userJpaRepository.findById(username);
	}
	
	@PostMapping("/users")
	public ResponseEntity<Void>  CreateUser(@RequestBody User user){
		User userCreated = userJpaRepository.save(user);		
		URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("{username}").buildAndExpand(userCreated.getUsername()).toUri();
			return ResponseEntity.created(uri).build();
	}
	
	@PutMapping("/users")
	public ResponseEntity<User>  UpdateUser(@RequestBody User user){
		User userUpdated = userJpaRepository.save(user);
		return new ResponseEntity<User>(userUpdated,HttpStatus.OK);				
	}
	
	@DeleteMapping("/users/{username}")
	public ResponseEntity<Void>  DeleteUser(@PathVariable String username){
		userJpaRepository.deleteById(username);
		return ResponseEntity.noContent().build();	
	}


}
