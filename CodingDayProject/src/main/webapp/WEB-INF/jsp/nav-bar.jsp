<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="app-sidebar sidebar-shadow">
	<div class="app-header__logo">
		<div class="logo-src"></div>
		<div class="header__pane ml-auto">
			<div>
				<button type="button"
					class="hamburger close-sidebar-btn hamburger--elastic"
					data-class="closed-sidebar">
					<span class="hamburger-box"> <span class="hamburger-inner"></span>
					</span>
				</button>
			</div>
		</div>
	</div>
	<div class="app-header__mobile-menu">
		<div>
			<button type="button"
				class="hamburger hamburger--elastic mobile-toggle-nav">
				<span class="hamburger-box"> <span class="hamburger-inner"></span>
				</span>
			</button>
		</div>
	</div>
	<div class="app-header__menu">
		<span>
			<button type="button"
				class="btn-icon btn-icon-only btn btn-primary btn-sm mobile-toggle-header-nav">
				<span class="btn-icon-wrapper"> <i
					class="fa fa-ellipsis-v fa-w-6"></i>
				</span>
			</button>
		</span>
	</div>
	<div class="scrollbar-sidebar">
		<div class="app-sidebar__inner">
			<ul class="vertical-nav-menu">
				<li class="app-sidebar__heading">Accueil</li>
				<li><a href="/basic/index" class="${dashboard}"> <i
						class="metismenu-icon pe-7s-rocket"></i> Tableau de bords
				</a></li>

				
				<li><a href="/basic/GestionCompte" aria-expanded="false" class="${GestionCompte }"> <i
						class="metismenu-icon pe-7s-id"></i> Gestion du compte 
				</a>
					

				<li class="${GestionAdresse2 }"><a href="#" aria-expanded="${GestionAdresse}"> <i
						class="metismenu-icon pe-7s-id"></i> Gestion des adresses<i
						class="metismenu-state-icon pe-7s-angle-down caret-left"></i>
				</a>
					<ul class="mm-collapse ${GestionAdresse}" style="height: 7.04px;">

						<li><a href="/basic/AjouterAdressePage"
							class="${AjouterAdresse}"> <i
								class="metismenu-icon pe-7s-add-user"></i>Ajouter Adresse
						</a></li>
						<li><a href="/basic/ListAdresses"
							class="${ListAdresses}"> <i
								class="metismenu-icon pe-7s-menu"></i> Liste Adresses
						</a></li>
						<li><a href="/basic/RListAdresses"
							class="${RListAdresses}"> <i
								class="metismenu-icon pe-7s-menu"></i> Adresses non assoscie
						</a></li>
					</ul></li>

				
			</ul>
		</div>
	</div>
</div>