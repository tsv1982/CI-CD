<%@ page import="java.sql.*"%>
<%
  Class.forName("com.mysql.jdbc.Driver");
  Connection con = DriverManager.getConnection("jdbc:mysql://db:3306/testdb1",
   "testuser", "root");
   Statement st = con.createStatement();
                         
   ResultSet resultSet = st.executeQuery("SELECT * FROM USER");
        String firstName;   
      while(resultSet.next()){
        firstName = resultSet.getString(1);
        if (session.getAttribute("userName") == firstName){
        out.println("!!!!!!!!!!!!!!!!! = " + firstName + "<br>");
        }
      }
      out.println(firstName + " = is not registered" + "<br>");
%>
