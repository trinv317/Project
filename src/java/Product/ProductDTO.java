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
public class ProductDTO {

    private String idGlasses, Brand, Name, Description, Type, Image;
    private int Quantity, Status;
    private float Price;

    public ProductDTO() {

    }

    public ProductDTO(String idGlasses, String Brand, String Name, String Description, String Type, String Image, int Quantity, float Price, int Status) {
        this.idGlasses = idGlasses;
        this.Brand = Brand;
        this.Name = Name;
        this.Description = Description;
        this.Type = Type;
        this.Image = Image;
        this.Quantity = Quantity;
        this.Price = Price;
        this.Status = Status;
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

    public void setDescription(String Desciption) {
        this.Description = Desciption;
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

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }

    public float getPrice() {
        return Price;
    }

    public void setPrice(float Price) {
        this.Price = Price;
    }

}
