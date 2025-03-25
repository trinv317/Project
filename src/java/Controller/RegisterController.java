/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import User.UserDAO;
import User.UserDTO;
import User.UserError;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author lienm
 */
public class RegisterController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ERROR = "register.jsp";
    private static final String SUCCESS = "register.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        UserDAO dao = new UserDAO();
        UserError userError = new UserError();
        try {
            String userID = request.getParameter("userID");
            String fullName = request.getParameter("fullName");
            String Password = request.getParameter("Password");
            String roleID = request.getParameter("roleID");
            String Phone =request.getParameter("Phone");
            String Gmail = request.getParameter("Gmail");
            String Address = request.getParameter("Address");
            String Confirm = request.getParameter("Confirm");
            HttpSession session = request.getSession();
            boolean checkValidation = true;
            if (userID.length() > 50 || userID.length() < 2) {
                userError.setUserID("User ID must [2,50]");
                checkValidation = false;
            }
            boolean checkDuplicate = dao.checkDuplicate(userID);
            if (checkDuplicate) {
                userError.setUserID("Duplicate userID!");
                checkValidation = false;
            }
            if (fullName.length() > 50 || fullName.length() < 5) {
                userError.setFullName("fullName  must [5,50]");
                checkValidation = false;
            }
            if (!Password.equals(Confirm)) {
                userError.setConfirm("hai Password khong giong nhau");
                checkValidation = false;
            }
            if (checkValidation) {
                UserDTO user = new UserDTO(userID, fullName, Password, roleID,Phone,Gmail, Address);
                boolean checkInsert = dao.insertV2(user);
                if (checkInsert) {
                    url = SUCCESS;
                    session.setAttribute("MESSAGE", "You added successfully " + fullName);
                } else {
                    session.setAttribute("ERROR", "Update fail!");
                }
            } else {
                session.setAttribute("USER_ERROR", userError);
            }
        } catch (Exception e) {
            log("Error at RegisterController: " + e.toString());

        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
