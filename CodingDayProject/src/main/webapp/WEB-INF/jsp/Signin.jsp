<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance"
	prefix="layout"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">

<head>


<!-- head -->
<jsp:include page="head.jsp"></jsp:include>
</head>
<style>
* {
  box-sizing:border-box;
}
$font-stack: 14px Helvetica, sans-serif;
$primary-color: #666;

main {
  width:50em;
  margin:0 auto;
}

form {
  z-index:999;
  font: $font-stack;
  color: $primary-color;
  margin:20px auto;
  width: 400px;
  height: 400px;
  border: 1px solid #cecece;
  border-radius: 50%;
  padding:20px;
  display:grid;
  box-shadow:0px 0px 4px #cecece;
  justify-items:center;
  position:relative;
  background:#fff;
  top:-27em;
} 


label {
  margin:0 0 10px 0;
}

input[type="text"], input[type="password"], {
  height:45px;
  width:100%;
  padding:5px;
  border:0;
  border-bottom:1px solid #ccc;
  outline:none;
}

.forgot-text, 
a, 
a:link,
a:hover,
a:active {
  font:11px sans-serif;
  color:#71def2;
  margin:7px 0 15px 3px;
  text-decoration:none;
}

a:hover {
  transition:color .25s ease-in-out;
  text-decoration:underline;
  color:#3d828e;
}

input:focus {
  background: #e8f9fc;
  transition: all .15s ease-in-out;
}


.keep-logged-in {
  width:100%;
  text-align:center;
}


input[type="submit"] {
  width: 70px;
  height:70px; 
  border-radius:100px;
  border:1px solid #3d828e;
  background:#54b7c9;
  margin:0 auto;
  color: #fff;
  text-transform:uppercase;
  margin-top: 20px;
  padding:0;
  justify-items:center; 
}

input[type="submit"]:hover {
  background:#71def2;
  transition:all .15s ease-in-out;
  cursor: pointer;
}

input[type="submit"]:focus {
  font-weight:bold;
  background:#71def2;
  width: 90px;
  transition: all .25s ease-in; 
}

form div {
  width:90%;
  margin:10px 0;
  
}
.circle {
  width: 400px;
  height: 400px;
  border: 1px solid #cecece;
  border-radius: 50%;
  padding:20px;
  display:grid-inline;
  box-shadow:0px 0px 4px #cecece;
  position:relative;
}

.circle-lime {
  margin-left:200px;
  z-index:1;
  background:#A8F781;
  top:.6em;
  left:11em;
  filter: opacity(70%);
}

.circle-aqua {
  margin-left:400px;
  margin-top:-155px;
  z-index:2;
  background:#71def2;
  left:14.4em;
  top:-48em;
  filter: opacity(70%);
}
.circle-gris {
  margin-left:271px;
  margin-top:-220px;
  z-index:2;
  background:#7E8388;
  left:14.4em;
  top:-48em;
  filter: opacity(70%);
}
</style>

<body>
<main>
<div class="circle circle-lime"></div>
<form action="/inscription/DoSignIn" method="Post">
    <h1>Sign in</h1>
    <div>
      <label for="username"></label>
      <input type="text" name="prenom" id="prenom" placeholder="prenom (required)" style="margin-left:80px; margin-top:50px;" oninput="myFunction()" autofocus required>
    </div>
    <div>
      <label for="username"></label>
      <input type="text" name="nom" id="nom" placeholder="nom (required)" style="margin-left:80px;" oninput="myFunction()" autofocus required>
    </div>
    <div>
      <label for="username"></label>
      <input type="radio" name="sexe" id="M" value="M" style="margin-left:80px; " autofocus required><label> M </label>
      <input type="radio" name="sexe" id="F" value="F" style="margin-left:80px; " autofocus required><label> F </label>
      
    </div>
     <div>
      <label for=""></label>
       <p class="forgot-text" style="margin-top:-30px;margin-left:85px;"><a href="login" >vous avez deja un compte ?</a></p> 
    </div>
   
  <input type="submit" style="margin-top:-25px" value="Go!" id="mybutton" disabled></input>
  </form>
<div class="circle circle-aqua"></div>
<div class="circle circle-gris"></div>

</main>
<script>
	

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
</body>