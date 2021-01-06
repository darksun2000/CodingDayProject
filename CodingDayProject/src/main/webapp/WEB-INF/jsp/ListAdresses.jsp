<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance"
	prefix="layout"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<layout:extends name="layout.jsp">
	<layout:put block="content" type="REPLACE">

		<div class="main-card mb-3 card">
			<div class="card-body">
				<h5 class="card-title">Liste des adresses associées à ${personne.prenom}</h5>
				<div class="tab">
				
				</div>
				

	<div id="${f.nom_filiere}" class="tabcontent">
				<table class="mb-0 table table-hover">
					<thead>
						<tr>
							<th class="th-sm">Code Postal</th>
							<th class="th-sm">Rue</th>
							<th class="th-sm">Ville</th>
							<th class="th-sm"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="a" items="${adresse}">
							<tr>
							
								<td><a style="color: black">${a.codePostal}</a></td>
								<td><a style="color: black">${a.rue}</a></td>
								<td><a style="color: black">${a.ville}</a></td>
								
								
								<td> <button class="mb-2 mr-2 btn btn-primary" onclick="window.location.href='/basic/ModifierAdresse?id=${a.id}'">Modifier</button>
								<button type="button" class="btn mr-2 mb-2 btn-danger" data-toggle="modal" data-target="#exampleModal" onclick="window.location.href='/basic/DoSupprimerAdresse?id=${a.id}'">
                                            Dissassoscié
                                        </button>
                               <button type="button" class="btn mr-2 mb-2 btn-danger" data-toggle="modal" data-target="#exampleModal" onclick="window.location.href='/basic/DoSupprimerAdresseDef?id=${a.id}'">
                                     Supprimer
                                  </button>
								</td>
								
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="./assets/scripts/main.js"></script>
		<script>
		function openCity(evt, cityName) {
			  // Declare all variables
			  var i, tabcontent, tablinks;

			  // Get all elements with class="tabcontent" and hide them
			  tabcontent = document.getElementsByClassName("tabcontent");
			  for (i = 0; i < tabcontent.length; i++) {
			    tabcontent[i].style.display = "none";
			  }

			  // Get all elements with class="tablinks" and remove the class "active"
			  tablinks = document.getElementsByClassName("mb-2 mr-2 btn btn-success");
			  for (i = 0; i < tablinks.length; i++) {
			    tablinks[i].className = tablinks[i].className.replace(" active", "");
			  }

			  // Show the current tab, and add an "active" class to the link that opened the tab
			  document.getElementById(cityName).style.display = "block";
			  evt.currentTarget.className += " active";
			}
		</script>
	</layout:put>
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p class="mb-0">Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>
</layout:extends>