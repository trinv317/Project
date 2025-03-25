/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Product;

/**
 *
 * @author lienm
 */
public class ProductError {

    private String idGlasses, Brand, Name, Description, Type, Image, Quantity, Status, Price;

    public ProductError() {
        this.idGlasses = "";
        this.Brand = "";
        this.Name = "";
        this.Description = "";
        this.Type = "";
        this.Image = "";
        this.Quantity = "";
        this.Status = "";
        this.Price = "";
    }

    public ProductError(String idGlasses, String Brand, String Name, String Description, String Type, String Image, String Quantity, String Status, String Price) {
        this.idGlasses = idGlasses;
        this.Brand = Brand;
        this.Name = Name;
        this.Description = Description;
        this.Type = Type;
        this.Image = Image;
        this.Quantity = Quantity;
        this.Status = Status;
        this.Price = Price;
    }

    public String getIdGlasses() {
        return idGlasses;
    }

    public void setIdGlasses(String idGlasses) {
        this.idGlasses = idGlasses;
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

    public String getQuantity() {
        return Quantity;
    }

    public void setQuantity(String Quantity) {
        this.Quantity = Quantity;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public String getPrice() {
        return Price;
    }

    public void setPrice(String Price) {
        this.Price = Price;
    }
    
}
