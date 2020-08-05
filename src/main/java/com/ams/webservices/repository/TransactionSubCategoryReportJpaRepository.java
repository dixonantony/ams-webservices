package com.ams.webservices.repository;

import java.util.Date;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.ams.webservices.entity.TransactionSubCategoryReport;

@Repository
public interface TransactionSubCategoryReportJpaRepository extends JpaRepository<TransactionSubCategoryReport, String>{
	
	@Query(value= "SELECT tsc.trans_sub_cat_cd,tsc.trans_sub_cat_name,"
			 + "tsc.trans_sub_cat_desc,sum(t.transaction_amount) total "
			 + "FROM transaction_sub_category tsc,"
			 + "transaction t "
			 + "where t.trans_sub_cat_cd=tsc.trans_sub_cat_cd "
			 + "AND t.transaction_date BETWEEN ?1 and ?2 "
			 + "GROUP BY tsc.trans_sub_cat_cd",
		nativeQuery = true)
	List<TransactionSubCategoryReport> findTransactionsSubCategoryReportForAPeriod(Date startDate,Date endDate);
	
	@Query(value= "SELECT tsc.trans_sub_cat_cd,tsc.trans_sub_cat_name,"
			 + "tsc.trans_sub_cat_desc,sum(t.transaction_amount) total "
			 + "FROM transaction_sub_category tsc,"
			 + "transaction t "
			 + "where t.trans_sub_cat_cd=tsc.trans_sub_cat_cd "
			 + "AND tsc.category_cd = ?1 "
			 + "AND t.transaction_date BETWEEN ?2 and ?3 "
			 + "GROUP BY tsc.trans_sub_cat_cd",
		nativeQuery = true)
	List<TransactionSubCategoryReport> findTransactionsSubCategoryReportForACategory(String CategoryCode,Date startDate,Date endDate);
}
