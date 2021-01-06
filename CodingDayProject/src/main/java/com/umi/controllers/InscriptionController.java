package com.umi.controllers;


import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;


import java.io.IOException;

import javax.servlet.http.HttpServletRequest;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpSession;

import org.hibernate.Hibernate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.umi.models.Personne;
import com.umi.repositories.AdresseRepository;
import com.umi.repositories.PersonneRepository;

@Controller
public class InscriptionController {
	
	@PersistenceContext
	private EntityManager entityManager;
	private AdresseRepository adresseRepository;
	private PersonneRepository personneRepository;
	
	public InscriptionController(AdresseRepository adresseRepository,PersonneRepository personneRepository) {
		this.adresseRepository = adresseRepository;
		this.personneRepository = personneRepository;
	}
	
	
	
							//-------+++++++++-----------------++++++++------------++++++++----------++++++++-------//
//+*+*+*+*+*+*+*+*+*++*+*+*+*+*+**+*+*+*+*+*+*+*+*+*+/ PARTIE INSCRIPTION ADMINISTRATIVE /*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+**+*+*+//
							//-------+++++++++-----------------++++++++------------++++++++----------++++++++-------//

	
	
//---------------------------------------aller à page Login Sign in----------------------------------//
	
	@GetMapping("/inscription/login")
	public ModelAndView Login() {
		ModelAndView model = new ModelAndView("Login");
		
		return model;
	}
	
	@GetMapping("/inscription/loginSignIn")
	public ModelAndView loginSignIn() {
		ModelAndView model = new ModelAndView("loginSignIn");
		
		return model;
	}
	
	@GetMapping("/inscription/signin")
	public ModelAndView Signin() {
		ModelAndView model = new ModelAndView("Signin");
		
		return model;
	}
	
	@PostMapping("/inscription/DoSignIn")
	public ModelAndView DoSignIn(@RequestParam("prenom")String prenom,
			@RequestParam("nom")String nom,
			@RequestParam("sexe")String sexe
			) {
		Personne personne = new Personne();
		personne.setNom(nom);
		personne.setPrenom(prenom);
		personne.setSexe(sexe);
		personneRepository.save(personne);
		
		return new ModelAndView("redirect:/inscription/login");
	}
	
	@PostMapping("/inscription/DoLogIn")
	public ModelAndView DoLogIn(@RequestParam("prenom")String prenom,
			@RequestParam("nom")String nom,
			HttpServletRequest request
			) {
		String idS = personneRepository.findByNomPrenom(nom, prenom);
		if(idS != null) {
		
			
			Personne personne = personneRepository.getOne(Integer.parseInt(idS));
			Hibernate.initialize(personne);
			HttpSession session = request.getSession();
			session.setAttribute("personne", personne);
			return new ModelAndView("redirect:/basic/index");
			}
		
		
		else {
			 return new ModelAndView("redirect:/inscription/login");}
		}
		

	
	@GetMapping("/inscription/DoLogOut")
	public ModelAndView DoLogOut(
			HttpServletRequest request
			) {
		
			HttpSession session = request.getSession();
			session.invalidate();
		
		return new ModelAndView("redirect:/inscription/login");
		}
	
	
//---------------------------------action :création d'une nouvelle inscription administrative-----------------------------//
	
	@PostMapping("/inscription/createANewInscriptionAdministrative")
	public ModelAndView createANewInscriptionAdministrative(
			@RequestParam("annee_academique")String annee_academique,
			@RequestParam("id_etudiant")int id_etudiant,
			@RequestParam("filiere")int id_filiere,
			@RequestParam("operateur")String operateur,
			@RequestParam("photo") MultipartFile photo,
			@RequestParam("document1") MultipartFile document1
			) throws IOException {
		
		return new ModelAndView("redirect:/student/list");
	}
	
	
		
}