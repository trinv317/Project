/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Cart;



/**
 *
 * @author lienm
 */
public class OrderDTO {
    private int orderID;
    private String userID,idGlasses,Type;
    private int Quantity;
    private String methodPayment;
    private float totalPrice;
    private String Date;
    public OrderDTO(){
        
    }

    public OrderDTO(int orderID, String userID, String idGlasses, String Type, int Quantity, String methodPayment, float totalPrice, String Date) {
        this.orderID = orderID;
        this.userID = userID;
        this.idGlasses = idGlasses;
        this.Type = Type;
        this.Quantity = Quantity;
        this.methodPayment = methodPayment;
        this.totalPrice = totalPrice;
        this.Date = Date;
    }

    

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getIdGlasses() {
        return idGlasses;
    }

    public void setIdGlasses(String idGlasses) {
        this.idGlasses = idGlasses;
    }

    public String getType() {
        return Type;
    }

    public void setType(String Type) {
        this.Type = Type;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public String getMethodPayment() {
        return methodPayment;
    }

    public void setMethodPayment(String methodPayment) {
        this.methodPayment = methodPayment;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getDate() {
        return Date;
    }

    public void setDate(String Date) {
        this.Date = Date;
    }
    
}
