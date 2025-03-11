
package model;


public class Customer {

    private int registrationID;
    private String name;
    private String address;
    private String nic;
    private String phoneNo;
    private int userID;
    
    public Customer(int registrationID, String name, String address, String nic, String phoneNo, int userID) {
        this.registrationID = registrationID;
        this.name = name;
        this.address = address;
        this.nic = nic;
        this.phoneNo = phoneNo;
        this.userID = userID;
    }

    public Customer() {
    }
     

    public int getRegistration_ID(){
        return registrationID;
    }

    public void setRegistrationID(int registrationID) {
        this.registrationID = registrationID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNic() {
        return nic;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public String getPhone_no() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

     public int getUser_ID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    

     


    
    
}
