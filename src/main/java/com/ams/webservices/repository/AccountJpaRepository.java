package com.ams.webservices.repository;

import java.util.Optional;
import javax.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.ams.webservices.entity.Account;

@Repository
public interface AccountJpaRepository extends JpaRepository<Account, String>{
	
	Optional<Account> findByAccountName(String accountName);
	
	@Transactional
	Long deleteByAccountName(String accountName);
	
	@Transactional
	@Modifying
	@Query(value = "update accounts a set a.account_balance = a.account_balance + ? where a.account_cd = ?", 
	  		nativeQuery = true)
	int accountCredit(double amount,String accountCd);
	
	@Transactional
	@Modifying
	@Query(value = "update accounts a set a.account_balance = a.account_balance - ? where a.account_cd = ?", 
	  		nativeQuery = true)
	int accountDebit(double amount,String accountCd);
}
