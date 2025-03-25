/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Invoice;

/**
 *
 * @author lienm
 */
public class InvoiceDTO {

    private int invoiceID;
    private String userID, fullName,Phone, Gmail, Address;
    private String methodPayment;
    private float totalBill;
    private String Date, Time;

    public InvoiceDTO() {

    }

    public InvoiceDTO(int invoiceID, String userID, String fullName, String Phone, String Gmail, String Address, String methodPayment, float totalBill, String Date, String Time) {
        this.invoiceID = invoiceID;
        this.userID = userID;
        this.fullName = fullName;
        this.Phone = Phone;
        this.Gmail = Gmail;
        this.Address = Address;
        this.methodPayment = methodPayment;
        this.totalBill = totalBill;
        this.Date = Date;
        this.Time = Time;
    }

    public int getInvoiceID() {
        return invoiceID;
    }

    public void setInvoiceID(int invoiceID) {
        this.invoiceID = invoiceID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getGmail() {
        return Gmail;
    }

    public void setGmail(String Gmail) {
        this.Gmail = Gmail;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getMethodPayment() {
        return methodPayment;
    }

    public void setMethodPayment(String methodPayment) {
        this.methodPayment = methodPayment;
    }

    public float getTotalBill() {
        return totalBill;
    }

    public void setTotalBill(float totalBill) {
        this.totalBill = totalBill;
    }

    public String getDate() {
        return Date;
    }

    public void setDate(String Date) {
        this.Date = Date;
    }

    public String getTime() {
        return Time;
    }

    public void setTime(String Time) {
        this.Time = Time;
    }

   
    

}
