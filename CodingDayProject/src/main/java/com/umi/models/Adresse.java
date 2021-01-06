package com.umi.models;



import javax.persistence.*;


@Entity
@Table(name="Adresse")
public class Adresse {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id")
	private int id;
	
	@Column(name="rue")
	private String rue;
	
	@Column(name="ville")
	private String ville;
	
	@Column(name="codePostal")
	private String codePostal;
	
	@ManyToOne
	@JoinColumn(name = "personne", foreignKey = @ForeignKey(name = "fk_personne"))
	private Personne personne;

	public Adresse(int id, String rue, String ville, String codePostal, Personne personne) {
		super();
		this.id = id;
		this.rue = rue;
		this.ville = ville;
		this.codePostal = codePostal;
		this.personne = personne;
	}

	public Adresse() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRue() {
		return rue;
	}

	public void setRue(String rue) {
		this.rue = rue;
	}

	public String getVille() {
		return ville;
	}

	public void setVille(String ville) {
		this.ville = ville;
	}

	public String getCodePostal() {
		return codePostal;
	}

	public void setCodePostal(String codePostal) {
		this.codePostal = codePostal;
	}

	public Personne getPersonne() {
		return personne;
	}

	public void setPersonne(Personne personne) {
		this.personne = personne;
	}
	
	

}