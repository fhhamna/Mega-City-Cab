/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.math.BigDecimal;

/**
 *
 * @author User
 */
public class Billing {
    private int billID;
    private BigDecimal totalAmount;
    private BigDecimal tax;
    private BigDecimal discount;
    private BigDecimal finalAmount;
    private String status;
    private int bookingID;

    public Billing(int bookingID, BigDecimal totalAmount, BigDecimal tax, BigDecimal discount, BigDecimal finalAmount, String status) {
        this.bookingID = bookingID;
        this.totalAmount = totalAmount;
        this.tax = tax;
        this.discount = discount;
        this.finalAmount = finalAmount;
        this.status = status;
        
    }

    public Billing(int bookingID1, double totalAmount1, double tax1, double discount1, double finalAmount1, String pending)
    {
    }

    
        public int getBookingID() {
        return bookingID;
    }

    public void setBookingID(int bookingID) {
        this.bookingID = bookingID;
    }
    

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }

    public BigDecimal getTax() {
        return tax;
    }

    public void setTax(BigDecimal tax) {
        this.tax = tax;
    }

    public BigDecimal getDiscount() {
        return discount;
    }

    public void setDiscount(BigDecimal discount) {
        this.discount = discount;
    }

    public BigDecimal getFinalAmount() {
        return finalAmount;
    }

    public void setFinalAmount(BigDecimal finalAmount) {
        this.finalAmount = finalAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

public int getBillID() {
        return billID;
    }

    public void setBillID(int billID) {
        this.billID = billID;
    }

    
    
}
