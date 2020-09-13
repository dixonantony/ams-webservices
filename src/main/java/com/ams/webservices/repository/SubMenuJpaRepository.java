package com.ams.webservices.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.ams.webservices.entity.SubMenu;

@Repository
public interface SubMenuJpaRepository extends JpaRepository<SubMenu, String> {

}
