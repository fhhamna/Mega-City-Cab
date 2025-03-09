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
public class Cab {
    private int cabID;
    private String model;
    private String numberPlateNo;
    private String status;
    private BigDecimal pricePerKm;

    public Cab(int cabID, String model, String numberPlateNo, String status, BigDecimal pricePerKm) {
        this.cabID = cabID;
        this.model = model;
        this.numberPlateNo = numberPlateNo;
        this.status = status;
        this.pricePerKm = pricePerKm;
    }
    
    public Cab(String model, String numberPlateNo, String status, BigDecimal pricePerKm) {
        this.model = model;
        this.numberPlateNo = numberPlateNo;
        this.status = status;
        this.pricePerKm = pricePerKm;
    }

    public int getCabID() {
        return cabID;
    }

    public void setCabID(int cabID) {
        this.cabID = cabID;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getNumberPlateNo() {
        return numberPlateNo;
    }

    public void setNumberPlateNo(String numberPlateNo) {
        this.numberPlateNo = numberPlateNo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public BigDecimal getPricePerKm() {
        return pricePerKm;
    }

    public void setPricePerKm(BigDecimal pricePerKm) {
        this.pricePerKm = pricePerKm;
    }
    
    
}
