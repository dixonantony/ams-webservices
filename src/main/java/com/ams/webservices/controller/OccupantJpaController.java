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
import com.ams.webservices.entity.Occupant;
import com.ams.webservices.repository.OccupantJpaRepository;

@CrossOrigin
@RestController
public class OccupantJpaController {
	
	@Autowired
	OccupantJpaRepository occupantJpaRepository;
	
	@GetMapping("/occupants")
	public List<Occupant>  GetAllOccupants(){
		return occupantJpaRepository.findAll();
	}
	
	@GetMapping("/occupants/{occupantId}")
	public Optional<Occupant> GetOccupantById(@PathVariable Long occupantId){
		return occupantJpaRepository.findById(occupantId);
	}
	
	@PostMapping("/occupants")
	public ResponseEntity<Void>  CreateOccupant(@RequestBody Occupant occupant){
		Occupant occupantCreated = occupantJpaRepository.save(occupant);		
		URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("{occupantId}").buildAndExpand(occupantCreated.getOccupantId()).toUri();
			return ResponseEntity.created(uri).build();
	}
	
	@PutMapping("/occupants")
	public ResponseEntity<Occupant>  UpdateOccupant(@RequestBody Occupant occupant){
		Occupant occupantUpdated = occupantJpaRepository.save(occupant);
		return new ResponseEntity<Occupant>(occupantUpdated,HttpStatus.OK);				
	}
	
	@DeleteMapping("/occupants/{occupantId}")
	public ResponseEntity<Void>  DeleteOccupant(@PathVariable Long occupantId){
		occupantJpaRepository.deleteById(occupantId);
		return ResponseEntity.noContent().build();	
	}


}
