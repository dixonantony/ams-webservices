package com.ams.webservices.repository;

import java.util.Optional;
import javax.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.ams.webservices.entity.Account;

@Repository
public interface AccountJpaRepository extends JpaRepository<Account, String>{
	
	Optional<Account> findByAccountName(String accountName);
	
	@Transactional
	Long deleteByAccountName(String accountName);
}
