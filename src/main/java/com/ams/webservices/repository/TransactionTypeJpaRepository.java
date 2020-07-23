package com.ams.webservices.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ams.webservices.entity.TransactionType;

@Repository
public interface TransactionTypeJpaRepository extends JpaRepository<TransactionType, String>{

}
