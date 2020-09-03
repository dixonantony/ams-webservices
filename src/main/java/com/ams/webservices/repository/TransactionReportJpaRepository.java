package com.ams.webservices.repository;

import java.util.Date;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.ams.webservices.entity.TransactionReport;

@Repository
public interface TransactionReportJpaRepository extends JpaRepository<TransactionReport, Long>{
	
	@Query(value= "SELECT t.transaction_id,tsc.trans_sub_cat_name,t.transaction_date,"
				 + "t.transaction_amount,t.transaction_desc,t.credit_debit,"
				 + "t.transaction_ref_no,a.account_name,pt.name payment_type,"
				 + "t.last_updated,t.username,t.voucher_no "
				 + "FROM transaction t,"
				 + "transaction_sub_category tsc,"
				 + "accounts a,"
				 + "payment_type pt "
				 + "WHERE t.trans_sub_cat_cd = tsc.trans_sub_cat_cd "
				 + "AND a.account_cd = t.account_cd "
				 + "AND pt.code = t.payment_type "
				 + "AND DATE(t.transaction_date) BETWEEN ?1 and ?2 ORDER BY t.transaction_date,t.voucher_no",
			nativeQuery = true)
	List<TransactionReport> findTransactionsReportForAPeriod(Date startDate,Date endDate);
	
	@Query(value= "SELECT t.transaction_id,tsc.trans_sub_cat_name,t.transaction_date,"
			 + "t.transaction_amount,t.transaction_desc,t.credit_debit,"
			 + "t.transaction_ref_no,a.account_name,pt.name payment_type,"
			 + "t.last_updated,t.username,t.voucher_no "
			 + "FROM transaction t,"
			 + "transaction_sub_category tsc,"
			 + "accounts a,"
			 + "payment_type pt "
			 + "WHERE t.trans_sub_cat_cd = tsc.trans_sub_cat_cd "
			 + "AND a.account_cd = t.account_cd "
			 + "AND pt.code = t.payment_type "
			 + "AND tsc.trans_sub_cat_cd = ?1 "
			 + "AND DATE(t.transaction_date) BETWEEN ?2 and ?3 ORDER BY t.transaction_date,t.voucher_no",
		nativeQuery = true)
	 List<TransactionReport> findTransactionsReportForASubCategory(String SubCategoryCode,Date startDate,Date endDate);

}
