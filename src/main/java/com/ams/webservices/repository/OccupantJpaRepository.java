package com.ams.webservices.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.ams.webservices.entity.Occupant;

@Repository
public interface OccupantJpaRepository extends JpaRepository<Occupant, Long> {
	List<Occupant> findByOccupantcyType(String occupantcyType); 
}
