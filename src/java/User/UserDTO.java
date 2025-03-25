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
public class UserDTO {
    private String userID,fullName,Password,roleID,Phone,Gmail,Address;
    public UserDTO(){
        
    }

    public UserDTO(String userID, String fullName, String Password, String roleID, String Phone, String Gmail, String Address) {
        this.userID = userID;
        this.fullName = fullName;
        this.Password = Password;
        this.roleID = roleID;
        this.Phone = Phone;
        this.Gmail = Gmail;
        this.Address = Address;
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

    
    
}
