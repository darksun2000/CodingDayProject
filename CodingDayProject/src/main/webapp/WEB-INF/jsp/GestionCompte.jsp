<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance"
	prefix="layout"%>
<layout:extends name="layout.jsp">
	<layout:put block="content" type="REPLACE">

		<div class="main-card mb-3 card">
			<div class="card-body">
				<h5 class="card-title">Gestion du compte</h5>
				<form class="" action="/basic/DoModification" method="Post" >


					<div class="form-row">
						<div class="col-md-6">
							<div class="position-relative form-group">
								<label for="annee_academique" class="">Prenom</label><input
									name="prenom" id="prenom" value="${personne.prenom }" oninput="myFunction()"
									 class="form-control" required>
							</div>
						</div>

					

							<div class="col-md-6">
							<div class="position-relative form-group">
								<label for="annee_academique" class="">Nom</label><input
									name="nom" id="nom" value="${personne.nom }" oninput="myFunction()"
									 class="form-control" required>
							</div>
						</div>

					</div>
					
					<div class="form-row">
						
						<div >
							<div >
								<input type="radio"	name="sexe" id="sexe" 
									 value="M" ><label style="margin-left:10px">M</label>
									 <input type="radio"	name="sexe" id="sexe" 
									 value="F" required><label style="margin-left:10px">F</label>
							</div>
						</div>
						
					</div>
					
						
					<button class="mt-2 btn btn-primary col-md-12" type="submit" id="mybutton" >Modifier</button>
				</form>
					<button class="mt-2 btn btn-danger col-md-12" onclick="window.location.href='/basic/DoSuppression'">Supprimer</button>
			</div>
		</div>
	
	<script>
	var radio = document.querySelectorAll('input[name="sexe"]');
	var sexe = "${personne.sexe}";
	if(sexe ==='M'){
		radio[0].checked= true;
	}
	else{
		radio[1].checked = true;
	}

	function myFunction(){
		var rue = document.getElementById('prenom').value;
		var ville = document.getElementById('nom').value;
		var Frue = rue.substring(0,1);
		var Fville = ville.substring(0,1);
		if(rue.length>2 && ville.length>2 && Frue == Frue.toUpperCase() && Fville == Fville.toUpperCase() ){
			 document.getElementById('mybutton').disabled = false;
		}
		else{
			 document.getElementById('mybutton').disabled = true;
		}
	}
	</script>
		
	</layout:put>
</layout:extends>