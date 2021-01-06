package com.umi.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.umi.models.Personne;

@Repository
public interface PersonneRepository extends JpaRepository<Personne, Integer>{

	@Query("select id from Personne s where nom = :a and prenom = :b")
	String findByNomPrenom(@Param("a")String nom,@Param("b")String prenom); 
}
