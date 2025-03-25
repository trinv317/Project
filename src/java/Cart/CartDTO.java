/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Cart;

import Product.ProductDTO;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author lienm
 */
public class CartDTO {

    private Map<String, ProductDTO> cart;

    public CartDTO() {
    }

    public CartDTO(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }

    public Map<String, ProductDTO> getCart() {
        return cart;
    }
    
    public void setCart(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }

    public boolean add(ProductDTO product) {
        boolean check = false;
        try {
            if (this.cart == null) {
                this.cart = new HashMap<>();
            }
            if (this.cart.containsKey(product.getIdGlasses())) {
                int currentQuantity = this.cart.get(product.getIdGlasses()).getQuantity();
                product.setQuantity(currentQuantity + product.getQuantity());
            }
            this.cart.put(product.getIdGlasses(), product);
            check = true;
        } catch (Exception e) {
        }

        return check;
    }

    public boolean change(String idGlasses, ProductDTO product) {
        boolean check = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(idGlasses)) {
                    this.cart.replace(idGlasses, product);
                    check = true;
                }
            }
        } catch (Exception e) {
        }
        return check;
    }
    public boolean remove(String idGlasses) {
        boolean check = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(idGlasses)) {
                    this.cart.remove(idGlasses);
                    check = true;
                }
            }
        } catch (Exception e) {
        }
        return check;
    }

}
