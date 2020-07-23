package com.ams.webservices.repository;

import java.util.Optional;
import javax.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.ams.webservices.entity.TransactionSubCategory;

@Repository
public interface TransactionSubCategoryJpaRepository extends JpaRepository<TransactionSubCategory, String>{
	
	Optional<TransactionSubCategory> findByTransSubCatName(String transSubCatName);
	
	@Transactional
	Long deleteByTransSubCatName(String transSubCatName);
}
