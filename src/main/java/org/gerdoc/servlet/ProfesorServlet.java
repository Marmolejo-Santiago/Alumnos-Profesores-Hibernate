package org.gerdoc.servlet;

import org.gerdoc.model.Profesor;
import org.gerdoc.service.ProfesorService;
import org.gerdoc.service.impl.ProfesorServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Serial;

@WebServlet("/ProfesorServlet")
public class ProfesorServlet extends HttpServlet
{
    @Serial
    private static final long serialVersionUID = 1L;
    private final ProfesorService profesorService = new ProfesorServiceImpl( );

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        String accion = req.getParameter("accion");

        if ("delete".equals(accion))
        {
            Long id = Long.parseLong(req.getParameter("id"));
            profesorService.deleteById(id);
            resp.sendRedirect("Profesores.jsp");
            return;
        }

        String nombre = req.getParameter("nombre" );
        String especialidad = req.getParameter("especialidad" );

        String idParam = req.getParameter("id");
        Long id = (idParam != null && !idParam.isEmpty()) ? Long.parseLong( idParam ) : null;

        Profesor profesor = Profesor.builder( )
                .nombre( nombre )
                .especialidad( especialidad )
                .build();

        if( "update".equals(accion) && id != null )
        {
            profesor.setId( id );
            profesorService.update( profesor );
        }
        else
        {
            profesorService.save( profesor );
        }

        resp.sendRedirect("Profesores.jsp");
    }
}