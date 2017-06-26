<%@page import="kr.co.bit.project.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
	content="">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://www.gstatic.com/firebasejs/4.1.3/firebase.js"></script>
<script>
      
      function testLogin(){
    	  
    	//Initialize Firebase
  		var config = {
  		  apiKey: "",
  		  authDomain: "webproject1-a5aaf.firebaseapp.com",
  		  databaseURL: "https://webproject1-a5aaf.firebaseio.com",
  		  projectId: "webproject1-a5aaf",
  		  storageBucket: "",
  		  messagingSenderId: "493262486597"
  		};
  		
  		firebase.initializeApp(config);
  		var provider = new firebase.auth.GoogleAuthProvider();
  		
  		firebase.auth().signInWithPopup(provider).then(function(result) {
  			// This gives you a Google Access Token. You can use it to access the Google API.
  			var token = result.credential.accessToken;
  			// The signed-in user info.
  			var user = result.user;
  			// ...
  			console.log(token);
  				alert(token);
  			console.log(user);
  			console.log(user.displayName);
  			console.log(user.email);
  			
  			var memberId = user.email;
  			var memberName = user.displayName;
  			
  			document.getElementById("memberId").value = memberId;
  			document.getElementById("memberName").value = memberName;
  			
  			document.form.submit();
  		
  		}).catch(function(error) {
  		  	  // Handle Errors here.
  		  	  var errorCode = error.code;
  		  	  var errorMessage = error.message;
  		  	  // The email of the user's account used.
  		  	  var email = error.email;
  		  	  // The firebase.auth.AuthCredential type that was used.
  		  	  var credential = error.credential;
  		  	  // ...
  		  	  console.log(error);
  	  	});
    	 
      // firebase.auth().signInWithRedirect(provider);
	}
</script>
</head>
<body>
	<img src="/WebProject1/images/google.png" width="30px" height="30px" onclick="testLogin()"/>
	<form action="<%=request.getContextPath()%>/apiLogin.do" name="form" method="post">
		<input type="hidden" name="memberId" id="memberId"/>
		<input type="hidden" name="memberName" id="memberName"/>
	</form>
</body>
</html>