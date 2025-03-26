/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Product.ProductDAO;
import Product.ProductDTO;
import Product.ProductError;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;


/**
 *
 * @author lienm
 */
public class InsertNewProductController extends HttpServlet {

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
        ProductError productError = new ProductError();
        try {
            String idGlasses = request.getParameter("idGlasses");
            String Brand = request.getParameter("Brand");
            String Name = request.getParameter("Name");
            String Description = request.getParameter("Description");
            String PriceSTR = request.getParameter("Price");
            String Type = request.getParameter("Type");
            String QuantitySTR = request.getParameter("Quantity");
            String StatusSTR = request.getParameter("Status");
            String Image =request.getParameter("Image");
            int Status = 0;
            float Price = 0;
            int Quantity = 0;
            HttpSession session = request.getSession();
            boolean checkValidation = true;
            boolean check2 = true;
            if (!PriceSTR.matches("\\d+$")) {
                productError.setPrice("Price must be digit");
                checkValidation = false;
            }
            if (!QuantitySTR.matches("\\d+$")) {
                productError.setQuantity("Quantity must be digit");
                checkValidation = false;
            }
            if (!StatusSTR.matches("[0-1]+$")) {
                productError.setStatus("Status must be from 0 to 1");
                checkValidation = false;
            }
            if (!idGlasses.matches("^K\\d{3}$")) {
                productError.setIdGlasses("ID Glasses must have form [Mxxx]");
                checkValidation = false;
            }
            boolean checkDuplicate = dao.checkDuplicate(idGlasses);
            if (checkDuplicate) {
                productError.setIdGlasses("Duplicate ID Glasses!");
                checkValidation = false;
            }
            if (Description.length() > 100 || Description.length() < 2) {
                productError.setDescription("Description must have length [2,100]");
                checkValidation = false;
            }
            if (Name.length() > 100 || Name.length() < 5) {
                productError.setName("Glasses Name  must [5,100]");
                checkValidation = false;
            }
            if (checkValidation) {
                Price = Float.parseFloat(PriceSTR);
                Quantity = Integer.parseInt(QuantitySTR);
                Status = Integer.parseInt(StatusSTR);
                if (Price <= 0) {
                    productError.setPrice("Price must positive!!!");
                    check2 = false;
                }
                if (Quantity <= 0) {
                    productError.setQuantity("Quantity must positive!!!");
                    check2 = false;
                }
            }
            if (checkValidation && check2) {
                boolean checkInsert = dao.insert(new ProductDTO(idGlasses, Brand, Name, Description, Type, Image, Quantity, Price, Status));
                if (checkInsert) {
                    url = SUCCESS;
                    session.setAttribute("MESSAGE", "You added successfully " + Name);
                }
            } else {
                request.setAttribute("PRODUCT_ERROR", productError);
            }

        } catch (Exception e) {
            log("Error at InsertNewProductController: " + e.toString());
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
