package com.akshay.servlets;

import com.akshay.dao.UserDao;
import com.akshay.entities.User;
import com.akshay.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String userEmail = request.getParameter("user_email");
            String userPassword = request.getParameter("user_password");

            /// validation 
            // Object creation for fetching a data:
            UserDao userDao = new UserDao(FactoryProvider.getFactory());
            User user = userDao.getUserByEmailandPassword(userEmail, userPassword);
//            System.out.println(user);

            HttpSession httpSession = request.getSession();

            if (user == null) {
                /// out.println("<h1> Invalid user </h1>");
                httpSession.setAttribute("message", "Invalid Details! Please try with another one:");
                response.sendRedirect("login.jsp");
                return;
            } else {
                out.println("<h1> Welcome " + user.getUserName() + "</h1>");

                // Login 
                httpSession.setAttribute("current-user", user);    /// in this line CURRENT-USER is a key value user obj.

                if(user.getUserType().equals("admin")) {
                    
                    // admin :- admin.jsp
                    response.sendRedirect("admin.jsp");
                } else if (user.getUserType().equals("normal")) {
                    
                    // normal :- normal.jsp
                    response.sendRedirect("normal.jsp");
                } else {
                            out.println("we have not identified user type!");
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
