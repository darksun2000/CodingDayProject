package com.umi.controllers;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.umi.models.Adresse;
import com.umi.models.Personne;
import com.umi.repositories.AdresseRepository;
import com.umi.repositories.PersonneRepository;

@Controller
public class BasicController {
	
	@PersistenceContext
	private EntityManager entityManager;
	private AdresseRepository adresseRepository;
	private PersonneRepository personneRepository;
	
	public BasicController(AdresseRepository adresseRepository,PersonneRepository personneRepository) {
		this.adresseRepository = adresseRepository;
		this.personneRepository = personneRepository;
	}
	
	@RequestMapping("/")
	public ModelAndView helloworld() {
		ModelAndView model = new ModelAndView("index");
		model.addObject("dashboard", "mm-active");
		model.addObject("message", "HELLO WORLD");
		return model;
//		return new ModelAndView("redirect:/student/list");
	}
	
	@RequestMapping("/foobar")
	public ModelAndView foobar() {
		ModelAndView model = new ModelAndView("foo_bar");
		return model;
//		return new ModelAndView("redirect:/student/list");
	}
	
	@RequestMapping("/basic/index")
	public ModelAndView index(
			HttpServletRequest request
			) {
		HttpSession session =request.getSession();
		Personne personne = (Personne) session.getAttribute("personne");
		long totale = adresseRepository.count();
		int asso = adresseRepository.findAdresseByPersonne(personne).size();
		int nonAsso =adresseRepository.RfindAdresseByPersonne().size();
		ModelAndView model = new ModelAndView("index");
		model.addObject("totale", totale);
		model.addObject("asso",asso);
		model.addObject("nonAsso",nonAsso);
		model.addObject("dashboard", "mm-active");
		return model;
	}
	
	
	@RequestMapping("/basic/GestionCompte")
	public ModelAndView gestionCompte() {
		ModelAndView model = new ModelAndView("GestionCompte");
		model.addObject("GestionCompte", "mm-active");
		return model;
	}
	
	@PostMapping("/basic/DoModification")
	public ModelAndView DoSignIn(@RequestParam("prenom")String prenom,
			@RequestParam("nom")String nom,
			@RequestParam("sexe")String sexe,
			HttpServletRequest request
			) {
		HttpSession session =request.getSession();
		Personne personneS = (Personne) session.getAttribute("personne");
		Personne personne = new Personne();
		personne.setId(personneS.getId());
		personne.setNom(nom);
		personne.setPrenom(prenom);
		personne.setSexe(sexe);
		personneRepository.save(personne);
		session.setAttribute("personne", personne);
		
		return new ModelAndView("redirect:/basic/index");
	}
	
	@RequestMapping("/basic/DoSuppression")
	public ModelAndView DoSignIn(
			HttpServletRequest request
			) {
		HttpSession session =request.getSession();
		Personne personne = (Personne) session.getAttribute("personne");
		personneRepository.delete(personne);
		session.removeAttribute("personne");
		session.invalidate();
		
		return new ModelAndView("redirect:/basic/index");
	}
	
	@RequestMapping("/basic/AjouterAdresse")
	public ModelAndView AjouterAdresse(@RequestParam("codePostal")String codePostal,
			@RequestParam("rue")String rue,
			@RequestParam("ville")String ville,
			HttpServletRequest request
			) {
		HttpSession session = request.getSession();
		Personne personne =(Personne)session.getAttribute("personne");
		Adresse adresse = new Adresse();
		adresse.setCodePostal(codePostal);
		adresse.setRue(rue);
		adresse.setVille(ville);
		adresse.setPersonne(personne);
		adresseRepository.save(adresse);
	
		return new ModelAndView("redirect:/basic/ListAdresses");
	}
	
	@RequestMapping("/basic/AjouterAdressePage")
	public ModelAndView AjouterAdressePage(
			) {
		ModelAndView model = new ModelAndView("AjouterAdresse");
		model.addObject("AjouterAdresse","mm-active");

		model.addObject("GestionAdresse2", "mm-active");
		model.addObject("GestionAdresse","true");
		return model;
	}
	
	@RequestMapping("/basic/ModifierAdresse")
	public ModelAndView ModifierAdresse(
			@RequestParam("id")int id_adresse
			) {
		ModelAndView model = new ModelAndView("ModifierAdresse");
		Adresse adresse = adresseRepository.getOne(id_adresse);
		model.addObject("ModifierAdresse", "mm-active");
		model.addObject("adresse",adresse);

		model.addObject("GestionAdresse2", "mm-active");
		model.addObject("GestionAdresse","true");
		return model;
	}
	
	@RequestMapping("/basic/DoModifierAdresse")
	public ModelAndView DoModifierAdresse(
			@RequestParam("id")int id,
			@RequestParam("codePostal")String codePostal,
			@RequestParam("rue")String rue,
			@RequestParam("ville")String ville,
			HttpServletRequest request
			) {
		Adresse adresseS = adresseRepository.getOne(id);
		HttpSession session = request.getSession();
		Personne personne = (Personne)session.getAttribute("personne");
		Adresse adresse = new Adresse(adresseS.getId(),ville,rue,codePostal,personne);
		adresseRepository.save(adresse);
		return new ModelAndView("redirect:/basic/ListAdresses");
	}
	
	@RequestMapping("/basic/ListAdresses")
	public ModelAndView ListAdresses(
			HttpServletRequest request
			) {
		ModelAndView model = new ModelAndView("ListAdresses");
		HttpSession session = request.getSession();
		Personne personne = (Personne)session.getAttribute("personne");
		List<Adresse> adresse = adresseRepository.findAdresseByPersonne(personne);
		model.addObject("adresse",adresse);
		model.addObject("ListAdresses", "mm-active");
		model.addObject("GestionAdresse2", "mm-active");
		model.addObject("GestionAdresse","true");
		return model;
	}
	
	@RequestMapping("/basic/DoSupprimerAdresse")
	public ModelAndView DoSupprimerAdresse(
			@RequestParam("id")int id
			) {
		Adresse adresse = adresseRepository.getOne(id);
		Adresse adresseN = new Adresse();
		adresseN.setId(adresse.getId());
		adresseN.setRue(adresse.getRue());
		adresseN.setCodePostal(adresse.getCodePostal());
		adresseN.setVille(adresse.getVille());
		adresseRepository.save(adresseN);
		return new ModelAndView("redirect:/basic/ListAdresses");
	}
	
	@RequestMapping("/basic/DoSupprimerAdresseDef")
	public ModelAndView DoSupprimerAdresseDef(
			@RequestParam("id")int id
			) {
		Adresse adresse = adresseRepository.getOne(id);
		

		adresseRepository.delete(adresse);
		return new ModelAndView("redirect:/basic/ListAdresses");
	}
	
	@RequestMapping("/basic/RListAdresses")
	public ModelAndView RListAdresses(
			) {
		ModelAndView model = new ModelAndView("RListAdresses");
		List<Adresse> adresse = adresseRepository.RfindAdresseByPersonne();
		model.addObject("adresse",adresse);
		model.addObject("RListAdresses", "mm-active");
		model.addObject("GestionAdresse2", "mm-active");
		model.addObject("GestionAdresse","true");
		//model.addObject("showRListAdresses", "mm-show");
		return model;
	}
	
	@RequestMapping("/basic/AssocierAdresse")
	public ModelAndView AssocierAdresse(
			@RequestParam("id")int id,
			HttpServletRequest request
			) {
		HttpSession session = request.getSession();
		Personne personne = (Personne)session.getAttribute("personne");
		Adresse adresse = adresseRepository.getOne(id);
		adresse.setPersonne(personne);
		adresseRepository.save(adresse);
		return new ModelAndView("redirect:/basic/RListAdresses");
	}
	
}
