/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Product.ProductDAO;
import Product.ProductDTO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class UpdateProductController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ERROR = "AdminProduct.jsp";
    private static final String SUCCESS = "AdminProduct.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        ProductDAO dao = new ProductDAO();
        try {
            String idGlasses = request.getParameter("idGlasses");
            String Brand = request.getParameter("Brand");
            String Name = request.getParameter("Name");
            String Description = request.getParameter("Description");
            String Type = request.getParameter("Type");
            String Image = request.getParameter("Image");
            String PriceSTR = request.getParameter("Price");
            String QuantitySTR = request.getParameter("Quantity");
            String StatusSTR = request.getParameter("Status");
            HttpSession session = request.getSession();
            float Price = Float.parseFloat(PriceSTR);
            int Quantity = Integer.parseInt(QuantitySTR);
            int Status = Integer.parseInt(StatusSTR);
            boolean checkValidation = true;
            boolean check2 = true;
            if (!PriceSTR.matches("\\d+(\\.\\d+)?$")) {
                session.setAttribute("ERROR", "Invalid Price format!");
                checkValidation = false;
            }
            if (!QuantitySTR.matches("\\d+$")) {
                session.setAttribute("ERROR", "Invalid Quantity format!");
                checkValidation = false;
            }

            if (Description.length() > 100 || Description.length() < 2) {
                session.setAttribute("ERROR", "Description length must be between 2 and 100 characters!");
                checkValidation = false;
            }
            if (checkValidation) {
                Price = Float.parseFloat(PriceSTR);
                Quantity = Integer.parseInt(QuantitySTR);
                if (Price <= 0 || Price > 10000) {
                    session.setAttribute("ERROR", "Price must be between 0 and 10000!");
                    check2 = false;
                }
                if (Quantity <= 0) {
                    session.setAttribute("ERROR", "Quantity must be greater than 0!");
                    check2 = false;
                }
            }
            if (checkValidation && check2) {
                boolean checkUpdate = dao.update(new ProductDTO(idGlasses, Brand, Name, Description, Type, Image, Quantity, Price, Status));
                if (checkUpdate) {
                    url = SUCCESS;
                    session.setAttribute("ERROR", "Update successfully!");
                } else {
                    session.setAttribute("ERROR", "Update fail!");
                }
            } else {
                session.setAttribute("ERROR", "Update fail!");
            }

        } catch (Exception e) {
            log("Error at UpdateController: " + e.toString());
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
