<%@page import="com.emergentes.Session"%>
<%@page import="java.util.ArrayList"%>
<%
    if (session.getAttribute("almacen") == null) {
            ArrayList<Session> listaux =new ArrayList<Session>();
            session.setAttribute("almacen", listaux);
        }
    ArrayList<Session> almacen=(ArrayList<Session>)session.getAttribute("almacen");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Gestion de listas de tareas</h1>
        <form action="TareaServlet" method="POST">
            <table>
                <tr>
                    <td>Id</td>
                    <td><input type="number" name="id" value="0" ></td> 
                </tr>
                <tr>
                    <td>Tarea</td>
                    <td><input type="text" name="tarea" value="" ></td> 
                </tr>
                <tr> <td><input type="submit" value="Siguiente" ></td>
            </tr>
            </table>
        </form>
       
         <h1>Tareas pendientes!</h1>
       
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Tarea</th>
                <th>Completado</th>
                <th> </th>
            </tr>
            <%
            if (almacen != null) {
               for (Session m : almacen) {
                    
            %>
            <tr>
                <td><%= m.getId() %></td>
                <td><%= m.getTarea()%></td>
                <td><input type="checkbox" name="" value="ON" /></td>
                <td><a href="TareaServlet?op=eliminar&id=<%= m.getId()%>">Eliminar</a></td>
            </tr>
            <%
             }
    }
            %> 
            
        </table>
    <tr> <a href="TareaServlet?op=vaciar">Eliminar tareas</a> </tr>
    </body>
</html>
