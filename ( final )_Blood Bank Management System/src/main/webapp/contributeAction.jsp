




<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%


String name=request.getParameter("name");
String address=request.getParameter("address");
String email=request.getParameter("email");
Date date= new Date();
long time = date.getTime();
Timestamp ts = new Timestamp(time);
String contactnumber=request.getParameter("contactnumber"); 
String d= ts+"";
String city=request.getParameter("city");
String state=request.getParameter("state");
String amount1=request.getParameter("amount1");

try{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps = con.prepareStatement("INSERT INTO contribution (name,address,email,contactnumber,stamp,city,state,amount) VALUES (?,?,?,?,?,?,?,?)");	
	ps.setString(1,name);
    ps.setString(2,address);
    ps.setString(3,email);
    ps.setString(4,contactnumber);
    ps.setString(5,d);//long set to string
    ps.setString(6,city);
    ps.setString(7,state);
    ps.setString(8,amount1);
    ps.executeUpdate(); 
    ps.close(); 
	response.sendRedirect("contribute.jsp?msg=valid");
}
catch(Exception e)
{
	response.sendRedirect("contribute.jsp?msg=invalid");	
}
%>
