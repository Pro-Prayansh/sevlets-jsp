
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="errorpage.jsp"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
             String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("pass");
            String checkpass = request.getParameter("checkpass");
            if(checkpass.equals(password))
            {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/login";
                String user = "root";
                String pass = "13503";
                Connection con = DriverManager.getConnection(url, user, pass);
                String q;
               
                q = "insert into register(name,email,pass) values (?,?,?) ";
                PreparedStatement pstmt = con.prepareStatement(q);
                pstmt.setString(1,name);
                pstmt.setString(2,email);
                pstmt.setString(3,password);
//                pstmt.setString(4,);
                 pstmt.executeUpdate();
                 out.println("<h1>you are successfully register</h1>");
            } catch (Exception e) {
                
               e.printStackTrace();
            }
         }
         else
         {
         throw new Exception("not match passowrd");
        }
            %>
            
            <h1>Entered Name : <%= name %></h1>
            <h1>Entered Email : <%= email %></h1>
            <h1>Entered Password : <%= password%></h1>
            <h1>Entered checkPass : <%= checkpass %></h1>
        <h1>your Sign up  is completed</h1>
    </body>
</html>
