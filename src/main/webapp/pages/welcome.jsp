
	<%
		String userSession = (String) session.getAttribute("email");
		String cookieUsername = request.getParameter("email");
		String cookieSessionID = null;
		
		Cookie[] cookies = request.getCookies();
		
		if(cookies!=null) {
			for (Cookie cookie: cookies) {
				if (cookie.getName().equals("adminemail")) cookieUsername = cookie.getValue();
				
			}
		}
	%>
	
	<div class="container mt-5">
		<h1>Hello <%=cookieUsername %>. Welcome to our page!</h1>
		<h3>Cookie Session ID is <%= cookieSessionID %></h3>
		
		<script>
  if (document.cookie.indexOf("email=;") !== -1) {
    // Cookie deleted, refresh the page
    window.location.reload();
  }
</script>
	</div>