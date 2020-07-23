package com.ams.webservices.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ams.webservices.entity.FinancialYear;

@Repository
public interface FinancialYearJpaRepository extends JpaRepository<FinancialYear, Integer>{

}
