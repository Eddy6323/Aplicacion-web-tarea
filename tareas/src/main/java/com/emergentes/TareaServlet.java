package com.emergentes;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "TareaServlet", urlPatterns = {"/TareaServlet"})
public class TareaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = request.getParameter("op");

        if (op.equals("vaciar")) {
            HttpSession ses = request.getSession();

            ses.invalidate();

            response.sendRedirect("index.jsp");
        }
        if (op.equals("eliminar")) {
            int pos=-1;
            int buscado=-1;
          int id =Integer.parseInt(request.getParameter("id"));
          
          HttpSession ses=request.getSession();
          ArrayList<Session> lista =(ArrayList<Session>)ses.getAttribute("almacen");
          
            for (Session s: lista) {
                pos++;
                if (s.getId() == id) {
                    buscado=pos;
                }
                
            }
            lista.remove(buscado);
            response.sendRedirect("index.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String tarea = request.getParameter("tarea");

        Session se = new Session();
        se.setId(id);
        se.setTarea(tarea);

        HttpSession ses = request.getSession();

        ArrayList<Session> lista = (ArrayList<Session>) ses.getAttribute("almacen");

        lista.add(se);

        response.sendRedirect("index.jsp");
    }

}
