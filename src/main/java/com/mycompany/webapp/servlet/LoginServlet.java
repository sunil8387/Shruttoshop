/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.webapp.servlet;

import com.mycompany.webapp.dao.UserDao;
import com.mycompany.webapp.entities.User;
import com.mycompany.webapp.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author sunil
 */
public class LoginServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           //coding 
           String email = request.getParameter("email");
           String password = request.getParameter("password");
           
           //authenticationg 
           
           UserDao userDao=new UserDao(FactoryProvider.getFactory());
           User user = userDao.getUserByEmailAndPassword(email,password);
           HttpSession httpSession =request.getSession();
           if(user==null){
               httpSession.setAttribute("message","Invalid details ! Try with Another one ");
               response.sendRedirect("login.jsp");
               return;
           }
           else{
//               out.println("<h1> Welcome" + user.getUsername()+"</h1>");
               httpSession.setAttribute("current-user", user);
               
               if(user.getUserType().equals("admin")){
                   response.sendRedirect("admin.jsp");
               }else if(user.getUserType().equals("normal")){
                   response.sendRedirect("index.jsp");
               }else{
                   out.println("We have not identified user type");
               }               
           }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
