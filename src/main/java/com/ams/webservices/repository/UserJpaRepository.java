package com.ams.webservices.repository;

import java.util.Optional;
import javax.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.ams.webservices.entity.User;

@Repository
public interface UserJpaRepository extends JpaRepository<User, Integer> {
	
	Optional<User> findByUsername(String username);
	
	@Transactional
	Long deleteByUsername(String username);

}
