package com.ams.webservices.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.ams.webservices.entity.Occupant;

@Repository
public interface OccupantJpaRepository extends JpaRepository<Occupant, Long> {

}
