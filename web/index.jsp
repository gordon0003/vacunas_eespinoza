<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.emergentes.modelo.Tarea"%>
<%@page import="com.emergentes.modelo.GestorTareas"%> 
<%
    if (session.getAttribute("agenda") == null) {
        GestorTareas objeto1 = new GestorTareas();

        objeto1.insertarTarea(new Tarea(1,"Brunito Diaz", 25,1.40,"Si"));
        objeto1.insertarTarea(new Tarea(2,"Juancito Pinto",30,1.52,"No"));
        
        session.setAttribute("agenda", objeto1);
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table align="center" border="1" cellspacing="0">
            <tr>
                <th>
                    <h3 align="left">PRIMER PARCIAL TEM-742</h3>
                    <h3 align="left">Nombre: Erwin Espinoza Mamani</h3>
                    <h3 align="left">Carnet: 3528497</h3>
                </th>
            </tr>
        </table >
        <h1 align="center">Registro de vacunas</h1> 
        <a href="Controller?op=nuevo">Nuevo</a> 
        <br>
        <br>
        <table FRAME="border" RULES="cols" > 
            <tr> 
                <th align="left" BGCOLOR="Silver">Id</th> 
                <th align="left" BGCOLOR="Silver">Nombre</th> 
                <th align="left" BGCOLOR="Silver">Peso</th> 
                <th align="left" BGCOLOR="Silver">Talla</th> 
                <th align="left" BGCOLOR="Silver">Vacuna</th> 
                <th BGCOLOR="Silver"></th> 
                <th BGCOLOR="Silver"></th>
            </tr> 
            <c:forEach var="item" items="${sessionScope.agenda.getLista()}"> 
                <tr > 
                   
                    <td>${item.id}</td> 
                    <td>${item.nombre}</td> 
                    <td>${item.peso}</td> 
                    <td>${item.talla}</td>
                    <td>${item.vacuna}</td>
                    <td><a href="Controller?op=modificar&id=${item.id}">Editar</a></td> 
                    <td><a href="Controller?op=eliminar&id=${item.id}">Eliminar</a> </td> 
                </tr>   
            </c:forEach> 
        </table>
    </body>
</html>
