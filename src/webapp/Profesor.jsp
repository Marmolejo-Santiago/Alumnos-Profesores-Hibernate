<%@ page import="org.gerdoc.service.ProfesorService" %>
<%@ page import="org.gerdoc.service.impl.ProfesorServiceImpl" %>
<%@ page import="org.gerdoc.model.Profesor" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Detalle de Profesor</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body>
<div class="container mt-4">
    <h1>Información del Profesor</h1>
    <%
        String profesorId = request.getParameter( "id" );

        ProfesorService profesorService = null;
        Long id = null;
        Profesor profesor = null;
        if( profesorId != null )
        {
            id = Long.parseLong( profesorId );
            profesorService = new ProfesorServiceImpl( );
            profesor = profesorService.findById( id );
        }
    %>
    <table class="table mt-3">
        <thead>
        <tr class="table-dark" align="center">
            <th scope="col" colspan="2" >Detalles</th>
        </tr>
        </thead>
        <%
        if( profesor != null )
        {
        %>
            <tbody>
                <tr>
                    <td>Nombre</td>
                    <td><%= profesor.getNombre( )%></td>
                </tr>
                <tr>
                    <td>Especialidad</td>
                    <td><%= profesor.getEspecialidad( )%></td>
                </tr>
            </tbody>
        <%
        }
        else
        {
        %>
            <tbody>
                <tr>
                    <td colspan="2" class="text-center text-danger">No se encontró información del profesor.</td>
                </tr>
            </tbody>
        <%
        }
        %>
    </table>
    <a href="Profesores.jsp" class="btn btn-secondary">
        Regresar
    </a>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>