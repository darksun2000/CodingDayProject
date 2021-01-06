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
				<h5 class="card-title">Ajouter Adresse</h5>
				<form class="" action="/basic/AjouterAdresse" method="Post" >


					<div class="form-row">
						<div class="col-md-6">
							<div class="position-relative form-group">
								<label for="annee_academique" class="">Code Postal</label><input
									name="codePostal" id="codePostal" oninput="myFunction()"
									 class="form-control" required>
							</div>
						</div>

					

							<div class="col-md-3">
							<div class="position-relative form-group">
								<label for="annee_academique" class="">Rue</label><input
									name="rue" id="rue" oninput="myFunction()"
									 class="form-control" required>
							</div>
						</div>
						
						<div class="col-md-3">
							<div class="position-relative form-group">
								<label for="annee_academique" class="">Ville</label><input
									name="ville" id="ville" oninput="myFunction()"
									 class="form-control" required>
							</div>
						</div>
						
					</div>
					
					
					
						
					<button class="mt-2 btn btn-primary col-md-12" id="mybutton" type="submit" disabled>Ajouter</button>
				</form>
			</div>
		</div>
	<script src="https://unpkg.com/imask"></script>
	<script>
	var regExpMask = IMask(
			  document.getElementById('codePostal'),
			  {
			    mask: /^[1-9]\d{0,4}$/
			  });
	
	function myFunction(){
		var rue = document.getElementById('rue').value;
		var ville = document.getElementById('ville').value;
		var codepostal = document.getElementById('codePostal').value;
		var Frue = rue.substring(0,1);
		var Fville = ville.substring(0,1);
		if(rue.length>2 && ville.length>2 && Frue == Frue.toUpperCase() && Fville == Fville.toUpperCase() && codepostal.length == 5){
			 document.getElementById('mybutton').disabled = false;
		}
		else{
			 document.getElementById('mybutton').disabled = true;
		}
	}
	</script>
	</layout:put>
</layout:extends>