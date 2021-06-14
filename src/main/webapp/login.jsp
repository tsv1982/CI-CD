 <%
  Class.forName("com.mysql.jdbc.Driver");
  Connection con = DriverManager.getConnection("jdbc:mysql://db:3306/testdb1",
   "testuser", "root");
   Statement st = con.createStatement();
                         
   ResultSet resultSet = st.executeQuery("SELECT * FROM USER");
              
      while(resultSet.next()){
        String firstName = resultSet.getString(1);
        if ((session.getAttribute("userName") == firstName){
        out.println("!!!!!!!!!!!!!!!!! = " + firstName + "<br>");
        }
      }
%>


<%
    if ((session.getAttribute("userName") == null) || (session.getAttribute("userName") == "")) {
%>
You are not logged in<br/>
<a href="index.jsp">Please Login</a>
<%} else {
%>
Welcome <%=session.getAttribute("userid")%>
<a href='logout.jsp'>Log out</a>
<%
    }
%>
