package com.umi.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.umi.models.Adresse;
import com.umi.models.Personne;

@Repository
public interface AdresseRepository extends JpaRepository<Adresse, Integer>{

	@Query("select s from Adresse s where personne = :a")
	List<Adresse> findAdresseByPersonne(@Param("a")Personne personne); 
	
	@Query("select s from Adresse s where personne is null")
	List<Adresse> RfindAdresseByPersonne(); 
}
