package com.ams.webservices.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ams.webservices.entity.User;

@Repository
public interface UserJpaRepository extends JpaRepository<User, String> {

}
