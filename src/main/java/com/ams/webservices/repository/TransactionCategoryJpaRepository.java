package com.ams.webservices.repository;

import java.util.Optional;
import javax.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.ams.webservices.entity.TransactionCategory;

@Repository
public interface TransactionCategoryJpaRepository extends JpaRepository<TransactionCategory, String>{
	
	Optional<TransactionCategory> findByCategoryName(String categoryName);
	
	@Transactional
	Long deleteByCategoryName(String categoryName);
}
