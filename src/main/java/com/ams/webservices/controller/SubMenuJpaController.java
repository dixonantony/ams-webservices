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
import com.ams.webservices.entity.SubMenu;
import com.ams.webservices.repository.SubMenuJpaRepository;

@CrossOrigin
@RestController
public class SubMenuJpaController {
	
	@Autowired
	SubMenuJpaRepository subMenuJpaRepository;
	
	@GetMapping("/submenus")
	public List<SubMenu>  GetAllUsers(){
		return subMenuJpaRepository.findAll();
	}
	
	@GetMapping("/submenus/{code}")
	public Optional<SubMenu> GetRoleByCode(@PathVariable String code){
		return subMenuJpaRepository.findById(code);
	}
	
	@PostMapping("/submenus")
	public ResponseEntity<Void>  CreateRole(@RequestBody SubMenu subMenu){
		SubMenu subMenuCreated = subMenuJpaRepository.save(subMenu);		
		URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("{code}").buildAndExpand(subMenuCreated.getSubMenuCode()).toUri();
			return ResponseEntity.created(uri).build();
	}
	
	@PutMapping("/submenus")
	public ResponseEntity<SubMenu>  UpdateUser(@RequestBody SubMenu subMenu){
		SubMenu subMenuUpdated = subMenuJpaRepository.save(subMenu);
		return new ResponseEntity<SubMenu>(subMenuUpdated,HttpStatus.OK);				
	}
	
	@DeleteMapping("/submenus/{code}")
	public ResponseEntity<Void>  DeleteRole(@PathVariable String code){
		subMenuJpaRepository.deleteById(code);
		return ResponseEntity.noContent().build();	
	}


}
