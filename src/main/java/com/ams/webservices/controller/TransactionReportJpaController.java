package com.ams.webservices.controller;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import com.ams.webservices.entity.TransactionCategoryReport;
import com.ams.webservices.entity.TransactionReport;
import com.ams.webservices.entity.TransactionSubCategoryReport;
import com.ams.webservices.repository.TransactionCategoryReportJpaRepository;
import com.ams.webservices.repository.TransactionReportJpaRepository;
import com.ams.webservices.repository.TransactionSubCategoryReportJpaRepository;

@CrossOrigin
@RestController
public class TransactionReportJpaController {	

	@Autowired
	TransactionCategoryReportJpaRepository transactionCategoryReportJpaRepository;
	
	@Autowired
	TransactionSubCategoryReportJpaRepository transactionSubCategoryReportJpaRepository;
	
	@Autowired
	TransactionReportJpaRepository transactionReportJpaRepository;	
	

	@GetMapping("/transactionscategoryreport/start/{startDate}/end/{endDate}")
	public List<TransactionCategoryReport>  GetTransactionsCategoryReportForAPeriod(
			@PathVariable @DateTimeFormat(pattern = "ddMMyyyy") Date startDate,
			@PathVariable @DateTimeFormat(pattern = "ddMMyyyy") Date endDate){
		return transactionCategoryReportJpaRepository.findTransactionsCategoryReportForAPeriod(startDate, endDate);
	}
	
	@GetMapping("/transactionssubcategoryreport/start/{startDate}/end/{endDate}")
	public List<TransactionSubCategoryReport>  GetTransactionsSubCategoryReportForAPeriod(
			@PathVariable @DateTimeFormat(pattern = "ddMMyyyy") Date startDate,
			@PathVariable @DateTimeFormat(pattern = "ddMMyyyy") Date endDate){
		return transactionSubCategoryReportJpaRepository.findTransactionsSubCategoryReportForAPeriod(startDate, endDate);
	}
	
	@GetMapping("/transactionssubcategoryreport/category/{categoryCode}/start/{startDate}/end/{endDate}")
	public List<TransactionSubCategoryReport>  GetTransactionsSubCategoryReportForACategory(
			@PathVariable String categoryCode,
			@PathVariable @DateTimeFormat(pattern = "ddMMyyyy") Date startDate,
			@PathVariable @DateTimeFormat(pattern = "ddMMyyyy") Date endDate){
		return transactionSubCategoryReportJpaRepository.findTransactionsSubCategoryReportForACategory(categoryCode,startDate, endDate);
	}
	
	@GetMapping("/transactionsreport/start/{startDate}/end/{endDate}")
	public List<TransactionReport>  GetTransactionsReportForAPeriod(
			@PathVariable @DateTimeFormat(pattern = "ddMMyyyy") Date startDate,
			@PathVariable @DateTimeFormat(pattern = "ddMMyyyy") Date endDate){
		return transactionReportJpaRepository.findTransactionsReportForAPeriod(startDate, endDate);
	}
	
	@GetMapping("/transactionsreport/subcategory/{subCategoryCode}/start/{startDate}/end/{endDate}")
	public List<TransactionReport>  GetTransactionsReportForASubCategory(
			@PathVariable String subCategoryCode,
			@PathVariable @DateTimeFormat(pattern = "ddMMyyyy") Date startDate,
			@PathVariable @DateTimeFormat(pattern = "ddMMyyyy") Date endDate){
		return transactionReportJpaRepository.findTransactionsReportForASubCategory(subCategoryCode,startDate, endDate);
	}
}
