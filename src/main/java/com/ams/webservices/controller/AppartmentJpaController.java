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
import com.ams.webservices.entity.Appartment;
import com.ams.webservices.repository.AppartmentJpaRepository;

@CrossOrigin
@RestController
public class AppartmentJpaController {
	
	@Autowired
	AppartmentJpaRepository appartmentJpaRepository;
	
	@GetMapping("/appartments")
	public List<Appartment>  GetAllAppartments(){
		return appartmentJpaRepository.findAll();
	}
	
	@GetMapping("/appartments/{code}")
	public Optional<Appartment> GetAppartmentByCode(@PathVariable String code){
		return appartmentJpaRepository.findById(code);
	}
	
	@PostMapping("/appartments")
	public ResponseEntity<Void>  CreateAppartment(@RequestBody Appartment appartment){
		Appartment appartmentCreated = appartmentJpaRepository.save(appartment);		
		URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("{name}").buildAndExpand(appartmentCreated.getAppartmentCode()).toUri();
			return ResponseEntity.created(uri).build();
	}
	
	@PutMapping("/appartments")
	public ResponseEntity<Appartment>  UpdateAppartment(@RequestBody Appartment appartment){
		Appartment appartmentUpdated = appartmentJpaRepository.save(appartment);
		return new ResponseEntity<Appartment>(appartmentUpdated,HttpStatus.OK);				
	}
	
	@DeleteMapping("/appartments/{code}")
	public ResponseEntity<Void>  DeleteAppartment(@PathVariable String code){
		appartmentJpaRepository.deleteById(code);
		return ResponseEntity.noContent().build();	
	}

}
