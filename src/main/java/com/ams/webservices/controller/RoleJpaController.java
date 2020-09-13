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
import com.ams.webservices.entity.Role;
import com.ams.webservices.entity.RoleMenuId;
import com.ams.webservices.repository.RoleJpaRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@CrossOrigin
@RestController
public class RoleJpaController {
	
	@Autowired
	RoleJpaRepository roleJpaRepository;
	
	private final Logger logger = LoggerFactory.getLogger(RoleJpaController.class);
	
	@GetMapping("/roles")
	public List<Role>  GetAllUsers(){
		return roleJpaRepository.findAll();
	}
	
	@GetMapping("/roles/{code}")
	public Optional<Role> GetRoleByCode(@PathVariable String code){
		return roleJpaRepository.findById(code);
	}
	
	@PostMapping("/roles")
	public ResponseEntity<Void>  CreateRole(@RequestBody Role role){
//		role.getSubMenus()
//			.forEach(sm -> sm.setRole(new Role(role.getRoleCode(),null,null,null,null)));
		
		role.getSubMenus()
		.forEach(sm -> sm.setId(new RoleMenuId(role.getRoleCode(),sm.getSubMenu().getSubMenuCode())));
		
		logger.info("info dixon======================================");
		role.getSubMenus().forEach(a -> logger.info(a.getId().getRoleCode()));	
		role.getSubMenus().forEach(a -> logger.info(a.getId().getSubMenuCode()));	
//		role.getSubMenus().forEach(a -> logger.info(a.getSubMenu().getSubMenuCode()));
		logger.info("info dixon======================================");
		Role roleCreated = roleJpaRepository.save(role);		
		URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("{code}").buildAndExpand(roleCreated.getRoleCode()).toUri();
			return ResponseEntity.created(uri).build();
	}
	
	@PutMapping("/roles")
	public ResponseEntity<Role>  UpdateUser(@RequestBody Role role){
		Role roleUpdated = roleJpaRepository.save(role);
		return new ResponseEntity<Role>(roleUpdated,HttpStatus.OK);				
	}
	
	@DeleteMapping("/roles/{code}")
	public ResponseEntity<Void>  DeleteRole(@PathVariable String code){
		roleJpaRepository.deleteById(code);
		return ResponseEntity.noContent().build();	
	}


}
