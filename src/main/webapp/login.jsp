<%@ page import="java.sql.*"%>
<%
  Class.forName("com.mysql.jdbc.Driver");
  Connection con = DriverManager.getConnection("jdbc:mysql://db:3306/testdb1",
   "testuser", "root");
   Statement st = con.createStatement();
                         
   ResultSet resultSet = st.executeQuery("SELECT * FROM USER");
       while(resultSet.next()){
        String firstName = resultSet.getString(1);
        if (session.getAttribute("userName") == firstName){
        out.println("user is registered = " + firstName + "<br>");
        }
      }
      out.println("user is not registered");
%>
