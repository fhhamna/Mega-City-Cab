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
    private String status;
    private BigDecimal pricePerKm;
    private int passengers;
    private int suitcases;
    private String transmission;  // Manual or Automatic

    public Cab(int cabID, String model, String status, BigDecimal pricePerKm, int passengers, int suitcases, String transmission) {
        this.cabID = cabID;
        this.model = model;
        this.status = status;
        this.pricePerKm = pricePerKm;
        this.passengers = passengers;
        this.suitcases = suitcases;
        this.transmission = transmission;
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

    public int getPassengers() {
        return passengers;
    }

    public void setPassengers(int passengers) {
        this.passengers = passengers;
    }

    public int getSuitcases() {
        return suitcases;
    }

    public void setSuitcases(int suitcases) {
        this.suitcases = suitcases;
    }

    public String getTransmission() {
        return transmission;
    }

    public void setTransmission(String transmission) {
        this.transmission = transmission;
    }
    
    

}
        
   