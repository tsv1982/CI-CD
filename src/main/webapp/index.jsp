<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Example</title>
    </head>
    <body bgcolor="silver">
        <form method="post" action="login.jsp">
            <center>
            <table border="0" width="30%" cellpadding="3">
                <thead>
                    <tr>
                        <th colspan="2">Login Page</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Username</td>
                        <td><input type="text" name="userName" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" value="" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Login" /></td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr>
                    <tr>
                       <td colspan="2"> New User "userName "  <a href="register.jsp">Register Here</a></td>
                        <td colspan="2"> New User "userName "  <a href="register.jsp">Register Here</a></td>
                    </tr>
                </tbody>
            </table>
                 <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://db:3306/testdb1",
                        "testuser", "root");
                         Statement st = con.createStatement();
                         
                          ResultSet resultSet = st.executeQuery("SELECT * FROM USER");
                          
                      while(resultSet.next()){
                        String firstName = resultSet.getString(1);
                        out.println("User = " + firstName + "<br>");
                      }
                     %>
            </center>
        </form>
        </body>
</html>
