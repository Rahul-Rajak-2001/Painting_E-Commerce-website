/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package image;
public class CartItem {
    private String paintingName;
    private int quantity;
    private double total;
    private String image; // Assuming you also need the image for display purposes

    public CartItem(String paintingName, int quantity, double total, String image) {
        this.paintingName = paintingName;
        this.quantity = quantity;
        this.total = total;
        this.image = image;
    }

    // Getters and setters
    public String getPaintingName() {
        return paintingName;
    }

    public void setPaintingName(String paintingName) {
        this.paintingName = paintingName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
