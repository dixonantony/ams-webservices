package com.ams.webservices.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.ams.webservices.entity.Appartment;

@Repository
public interface AppartmentJpaRepository extends JpaRepository<Appartment, String>{	

}
