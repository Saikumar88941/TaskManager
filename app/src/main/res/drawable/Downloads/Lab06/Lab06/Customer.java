import java.text.SimpleDateFormat;
import java.util.Date;

public class Customer {
    private String dob; // Date of birth of customer. (DD/MM/YYYY)
    private String firstName; // First Name of the customer.
    private String lastName; // Last Name of the customer.
    private double income; // The income of the Customer.

    // Augmented constructor with all class attributes
    public Customer(String dob, String firstName, String lastName, double income) {
        this.dob = dob;
        this.firstName = firstName;
        this.lastName = lastName;
        this.income = income;
    }

    // Getter and setter methods for the attributes
    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public double getIncome() {
        return income;
    }

    public void setIncome(double income) {
        this.income = income;
    }

    // toString() method to return customer details in the specified format
    @Override
    public String toString() {
        return "Name: " + lastName + ", " + firstName + "\n" +
               "Date of Birth: " + dob + "\n" +
               "Income: " + income;
    }
}

