package com.ams.webservices.repository;

import java.util.Date;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.ams.webservices.entity.TransactionCategoryReport;

@Repository
public interface TransactionCategoryReportJpaRepository extends JpaRepository<TransactionCategoryReport, String>{
	
	@Query(value= "SELECT tc.category_cd,tc.category_name,tc.category_desc,sum(t.transaction_amount) total "
				 + "FROM transaction_category tc,"
				 + "transaction_sub_category tsc,"
				 + "transaction t "
				 + "WHERE tc.category_cd = tsc.category_cd "
				 + "AND t.trans_sub_cat_cd=tsc.trans_sub_cat_cd "
				 + "AND DATE(t.transaction_date) BETWEEN ?1 and ?2 "
				 + "GROUP BY tc.category_cd,tc.category_name,tc.category_desc",
			nativeQuery = true)
	List<TransactionCategoryReport> findTransactionsCategoryReportForAPeriod(Date startDate,Date endDate);

}
