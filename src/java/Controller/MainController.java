/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

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
public class MainController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ERROR = "error.jsp";
    private static final String HOME = "home.jsp";
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "loginController";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "logoutController";
    private static final String REGISTER = "Register";
    private static final String REGISTER_CONTROLLER = "registerController";
    private static final String SEARCH_HOME = "searchHome";
    private static final String SEARCHPRODUCT_CONTROLLER = "searchProductController";
    private static final String SEARCH_PRODUCT_USER = "search";
    private static final String SEARCH_PRODUCT_USER_CONTROLLER = "searchProductUserController";
    private static final String SEARCH_ADMIN = "searchAD";
    private static final String SEARCHUSER_CONTROLLER = "searchUserController";
    private static final String SHOP_HOME = "productHome.jsp";
    private static final String SEARCHPRODUCT_CONTROLLER1 = "searchProductController";
    private static final String UPDATE_USER = "Update";
    private static final String UPDATEUSERCONTROLLER = "updateUserController";
    private static final String AddToCart = "AddToCart";
    private static final String Add_to_cart_CONTROLLER = "addToCartController";
    private static final String DELETE_USER = "Delete";
    private static final String DELETEUSERCONTROLLER = "deleteUserController";
    private static final String UPDATE_PRODUCT = "UpdateProduct";
    private static final String UPDATEPRODUCTCONTROLLER = "updateProductController";
    private static final String DeleteProduct = "DeleteProduct";
    private static final String DeleteProductController = "deleteProductController";
    private static final String CHANGE_QUANTITY = "Change Quantity";
    private static final String CHANGE_QUANTITY_CONTROLLER = "changeQuantityController";
    private static final String REMOVE_PRODUCT = "Remove Product";
    private static final String REMOVE_PRODUCT__CONTROLLER = "deleteProductCartController";
    private static final String AddToOrder = "Add To Order";
    private static final String Add_to_Order_CONTROLLER = "addToOrderController";
    private static final String DeleteOrder = "deleteOrder";
    private static final String DeleteOrderController = "deleteOrderController";
    private static final String InsertInvoice = "checkOut";
    private static final String InsertInvoiceController = "insertInvoiceController";
    private static final String InsertWhistList = "whistList";
    private static final String InsertWhistListController = "insertToWhistListController";
    private static final String InsertNewProduct = "addNewProduct";
    private static final String InsertNewProductController = "insertNewProductController";    
    private static final String SearchMinMax="SearchMinMax";
    private static final String SearchMinMaxController="searchMinMaxController";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = HOME;
        try {
            String action = request.getParameter("action");
            if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            } else if (REGISTER.equals(action)) {
                url = REGISTER_CONTROLLER;
            } else if (SEARCH_HOME.equals(action)) {
                url = SEARCHPRODUCT_CONTROLLER;
            } else if (SHOP_HOME.equals(action)) {
                url = SEARCHPRODUCT_CONTROLLER1;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            } else if (UPDATE_USER.equals(action)) {
                url = UPDATEUSERCONTROLLER;
            } else if (AddToCart.equals(action)) {
                url = Add_to_cart_CONTROLLER;
            } else if (SEARCH_ADMIN.equals(action)) {
                url = SEARCHUSER_CONTROLLER;
            } else if (DELETE_USER.equals(action)) {
                url = DELETEUSERCONTROLLER;
            } else if (UPDATEPRODUCTCONTROLLER.equals(action)) {
                url = UPDATEPRODUCTCONTROLLER;
            } else if (CHANGE_QUANTITY.equals(action)) {
                url = CHANGE_QUANTITY_CONTROLLER;
            } else if (REMOVE_PRODUCT.equals(action)) {
                url = REMOVE_PRODUCT__CONTROLLER;
            } else if (AddToOrder.equals(action)) {
                url = Add_to_Order_CONTROLLER;
            } else if (DeleteOrder.equals(action)) {
                url = DeleteOrderController;
            } else if (InsertInvoice.equals(action)) {
                url = InsertInvoiceController;
            } else if (DeleteProduct.equals(action)) {
                url = DeleteProductController;
            } else if (UPDATE_PRODUCT.equals(action)) {
                url = UPDATEPRODUCTCONTROLLER;
            } else if (SEARCH_PRODUCT_USER.equals(action)) {
                url = SEARCH_PRODUCT_USER_CONTROLLER;
            }else if(InsertNewProduct.equals(action)){
                url=InsertNewProductController;
            }
            else if(InsertWhistList.equals(action)){
                url=InsertWhistListController;
            }else if(SearchMinMax.equals(action)){
                url=SearchMinMaxController;
            } 
            else {
                request.setAttribute("ERROR", "Your action not support");
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
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
