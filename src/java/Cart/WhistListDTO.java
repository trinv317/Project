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
public class WhistListDTO {
    private String idGlasses,userID,Brand,Name,Description,Type,Image;
    private float Price;
    public WhistListDTO(){
        
    }

    public WhistListDTO(String idGlasses, String userID, String Brand, String Name, String Description, String Type, String Image, float Price) {
        this.idGlasses = idGlasses;
        this.userID = userID;
        this.Brand = Brand;
        this.Name = Name;
        this.Description = Description;
        this.Type = Type;   
        this.Image = Image;
        this.Price = Price;
    }

    public String getIdGlasses() {
        return idGlasses;
    }

    public void setIdGlasses(String idGlasses) {
        this.idGlasses = idGlasses;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getBrand() {
        return Brand;
    }

    public void setBrand(String Brand) {
        this.Brand = Brand;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public String getType() {
        return Type;
    }

    public void setType(String Type) {
        this.Type = Type;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }

    public float getPrice() {
        return Price;
    }

    public void setPrice(float Price) {
        this.Price = Price;
    }
    
}
