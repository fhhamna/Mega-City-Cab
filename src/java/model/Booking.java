/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;

/**
 *
 * @author User
 */
public class Booking {
    
    private int bookingID;
    private String pickupLocation;
    private String destination;
    private Timestamp bookingDate;
    private String bookingStatus;
    private int registrationID;
    private int cabID;

    public Booking(int bookingID, String pickupLocation, String destination, Timestamp bookingDate, String bookingStatus, int registrationID, int cabID) {
        this.bookingID = bookingID;
        this.pickupLocation = pickupLocation;
        this.destination = destination;
        this.bookingDate = bookingDate;
        this.bookingStatus = bookingStatus;
        this.registrationID = registrationID;
        this.cabID = cabID;
    }

    public int getBookingID() {
        return bookingID;
    }

    public void setBookingID(int bookingID) {
        this.bookingID = bookingID;
    }

    public String getPickupLocation() {
        return pickupLocation;
    }

    public void setPickupLocation(String pickupLocation) {
        this.pickupLocation = pickupLocation;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public Timestamp getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Timestamp bookingDate) {
        this.bookingDate = bookingDate;
    }

    public String getBookingStatus() {
        return bookingStatus;
    }

    public void setBookingStatus(String bookingStatus) {
        this.bookingStatus = bookingStatus;
    }

    public int getRegistrationID() {
        return registrationID;
    }

    public void setRegistrationID(int registrationID) {
        this.registrationID = registrationID;
    }

    public int getCabID() {
        return cabID;
    }

    public void setCabID(int cabID) {
        this.cabID = cabID;
    }
}
