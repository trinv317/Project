/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

/**
 *
 * @author lienm
 */
public class UserError {
    private String userID,fullName,Password,roleID,Phone,Gmail,Address,Confirm;
    public UserError(){
        this.userID="";
        this.fullName="";
        this.Password="";
        this.roleID="";
        this.Phone="";
        this.Gmail="";
        this.Address="";
        this.Confirm="";
    }

    public UserError(String userID, String fullName, String Password, String roleID, String Phone, String Gmail, String Address, String Confirm) {
        this.userID = userID;
        this.fullName = fullName;
        this.Password = Password;
        this.roleID = roleID;
        this.Phone = Phone;
        this.Gmail = Gmail;
        this.Address = Address;
        this.Confirm = Confirm;
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

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
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

    public String getConfirm() {
        return Confirm;
    }

    public void setConfirm(String Confirm) {
        this.Confirm = Confirm;
    }

   
   
}
