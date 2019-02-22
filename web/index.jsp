

<%@page import="java.util.List"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="ejb.ListElementsRemote"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%! 
   private static ListElementsRemote values;

   public void jspInit() 
    {
        try {
                InitialContext ic = new InitialContext();
                values = (ListElementsRemote) ic.lookup("java:global/DemoEjb/ListElements");
        } catch(Exception ex) {
            System.out.println(ex);
        }
    }
%>
<%
    if(request.getParameter("addNum") != null) {
        int e = Integer.parseInt(request.getParameter("t1"));
        values.addElement(e);
    }
     if(request.getParameter("remNum") != null) {
        int e = Integer.parseInt(request.getParameter("t1"));
        values.removeElement(e);
    }
    %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form name="abc" method="post">
            <input type="text"  name="t1">
            <input type="submit" value="Add" name="addNum">
            <input type="submit" value="Remove" name="remNum">
            
            <%
                if(values != null) {
                    List<Integer> nums = values.getElements();
                    for(int value : nums) {
                        out.println("<br>" + value);
                    }
                }
                %>
        </form>
    </body>
</html>
