<%@ page import="java.util.ArrayList" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    //HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("usuario") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    // Manejo de tareas en sesión
    ArrayList<String> tareas = (ArrayList<String>) session.getAttribute("tareas");
    if (tareas == null) {
        tareas = new ArrayList<>();
    }

    String nuevaTarea = request.getParameter("tarea");
    if (nuevaTarea != null && !nuevaTarea.trim().isEmpty()) {
        tareas.add(nuevaTarea.trim());
        session.setAttribute("tareas", tareas);
    }

    String eliminarTarea = request.getParameter("eliminar");
    if (eliminarTarea != null) {
        tareas.remove(eliminarTarea);
        session.setAttribute("tareas", tareas);
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Tareas</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS y Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">To-Do List</a>
        <div class="d-flex">
            <a href="logout" class="btn btn-outline-danger">
                <i class="bi bi-box-arrow-right"></i> Cerrar Sesión
            </a>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <h2>Hola, <%= session.getAttribute("usuario") %>!</h2>
    <form method="GET" action="todo.jsp" class="d-flex mb-3">
        <input type="text" name="tarea" class="form-control me-2" placeholder="Nueva tarea" required>
        <button type="submit" class="btn btn-success">
            <i class="bi bi-plus-circle"></i> Agregar
        </button>
    </form>

    <ul class="list-group">
        <% for (String tarea : tareas) { %>
        <li class="list-group-item d-flex justify-content-between align-items-center">
            <%= tarea %>
            <a href="todo.jsp?eliminar=<%= tarea %>" class="btn btn-danger btn-sm">
                <i class="bi bi-trash"></i>
            </a>
        </li>
        <% } %>
    </ul>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>