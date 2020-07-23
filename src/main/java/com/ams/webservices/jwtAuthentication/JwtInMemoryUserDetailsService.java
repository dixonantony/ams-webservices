package com.ams.webservices.jwtAuthentication;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.ams.webservices.entity.User;
import com.ams.webservices.repository.UserJpaRepository;

@Service
public class JwtInMemoryUserDetailsService implements UserDetailsService {

  static List<JwtUserDetails> inMemoryUserList = new ArrayList<>();
  private final Logger logger = LoggerFactory.getLogger(this.getClass());
  
  @Autowired
  UserJpaRepository userJpaRepository;

  static {
    inMemoryUserList.add(new JwtUserDetails(1, "admin",
        "$2a$10$3zHzb.Npv1hfZbLEU5qsdOju/tk2je6W6PnNnY.c1ujWPcZh4PL6e", "ROLE_USER_2","Admin"));
  }

  @Override
  public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	  logger.info("loadUserByUsername", username);
	  
//    Optional<JwtUserDetails> findFirst = inMemoryUserList.stream()
//        .filter(user -> user.getUsername().equals(username)).findFirst();
	Optional<User> retrievedUser =  userJpaRepository.findByUsername(username);
	
	if (!retrievedUser.isPresent()) {
	  throw new UsernameNotFoundException(String.format("USER_NOT_FOUND '%s'.", username));
	}
	int Userid =  1;
	
	User loginUser = retrievedUser.get();
	JwtUserDetails findFirst = new JwtUserDetails(Userid,loginUser.getUsername(),
			loginUser.getPassword(),"admin",loginUser.getFirstName()+loginUser.getLastName());
	return findFirst;
	
	
//    if (!findFirst.isPresent()) {
//      throw new UsernameNotFoundException(String.format("USER_NOT_FOUND '%s'.", username));
//    }
//
//    return findFirst.get();
  }

}


