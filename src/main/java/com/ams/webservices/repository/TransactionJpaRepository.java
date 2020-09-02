package com.ams.webservices.repository;

import java.util.Date;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.ams.webservices.entity.Transaction;

@Repository
public interface TransactionJpaRepository extends JpaRepository<Transaction, Long>{
	
	@Query("SELECT t FROM Transaction t WHERE t.transactionDate BETWEEN ?1 and ?2 +1 ORDER BY t.voucherNo")
	List<Transaction> findTransactionsForAPeriod(Date startDate,Date endDate);

}
