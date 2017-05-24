/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author luan.nt
 */
public class Cart implements java.io.Serializable{

    private HashMap<Integer, CartItem> cartItems;

    public Cart() {
        cartItems = new HashMap<>();
    }

    public Cart(HashMap<Integer, CartItem> cartItems) {
        this.cartItems = cartItems;
    }

    public HashMap<Integer, CartItem> getCartItems() {
        return cartItems;
    }

    public void setCartItems(HashMap<Integer, CartItem> cartItems) {
        this.cartItems = cartItems;
    }

    public void insertToCart(int key, CartItem item) {
        boolean bln = cartItems.containsKey(key);
        if (bln) {
            int quantity_old = item.getQuantity();
            item.setQuantity(quantity_old + cartItems.get(key).getQuantity());
            cartItems.put(item.getProduct().getProductId(), item);
        } else {
            cartItems.put(item.getProduct().getProductId(), item);
        }
    }

    public void removeToCart(int product) {
        boolean bln = cartItems.containsKey(product);
        if (bln) {
            cartItems.remove(product);
        }
    }

    public int countItem() {
        int count = 0;
        count = cartItems.size();
        return count;
    }

    public int total() {
        int count = 0;
        for (Map.Entry<Integer, CartItem> list : cartItems.entrySet()) {
            count += list.getValue().getProduct().getUnitPrice()* list.getValue().getQuantity();
        }
        return count;
    }
}
