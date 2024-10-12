/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/EmptyTestNGTest.java to edit this template
 */


import static org.testng.Assert.*;
import org.testng.annotations.AfterClass;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;
import java.lang.String;

/**
 * Class: 44542-NN Object Oriented Programming
 *
 * @author Name of the student  Description: Making sure everything works Due:
 * 01/07/2023 I pledge that I have completed the programming assignment
 * independently. I have not copied the code from a student or any source. I
 * have not given my code to any other student and will not share this code with
 * anyone under my circumstances.
 */
public class CustomerNGTest {

    static Customer customer;

    public CustomerNGTest() {
    }

    @BeforeClass
    public static void setUpClass() throws Exception {
    }

    @AfterClass
    public static void tearDownClass() throws Exception {
    }

    @BeforeMethod
    public void setUpMethod() throws Exception {
        customer = new Customer("09/05/1997", "John", "Nicolas", 30000);
    }

    @AfterMethod
    public void tearDownMethod() throws Exception {
        customer = null;
    }

    /**
     * Test of getDob method, of class Customer.
     */
    @Test
    public void testGetDob() {
        System.out.println("getDob");
        String expResult = "09/05/1997";
        String result = customer.getDob();
        assertEquals(result, expResult);

    }

    /**
     * Test of setDob method, of class Customer.
     */
    @Test
    public void testSetDob() {
        System.out.println("setDob");
        String dob = "05/11/1999";
        customer.setDob(dob);
        assertEquals(dob, customer.getDob());
    }

    /**
     * Test of getFirstName method, of class Customer.
     */
    @Test
    public void testGetFirstName() {

        System.out.println("getFirstName");
        String expResult = "John";
        String result = customer.getFirstName();
        assertEquals(result, expResult);
    }

    /**
     * Test of setFirstName method, of class Customer.
     */
    @Test
    public void testSetFirstName() {
        System.out.println("setFirstName");
        String firstName = "Ranbeer";
        customer.setFirstName(firstName);
        assertEquals(firstName, customer.getFirstName());

    }

    /**
     * Test of getLastName method, of class Customer.
     */
    @Test
    public void testGetLastName() {

        System.out.println("getLastName");
        String expResult = "Nicolas";
        String result = customer.getLastName();
        assertEquals(result, expResult);
    }

    /**
     * Test of setLastName method, of class Customer.
     */
    @Test
    public void testSetLastName() {
        System.out.println("setLastName");
        String lastName = "Kapoor";
        customer.setLastName(lastName);
        assertEquals(lastName, customer.getLastName());

    }

    /**
     * Test of getIncome method, of class Customer.
     */
    @Test
    public void testGetIncome() {
        System.out.println("getIncome");
        double expResult = 30000;
        double result = customer.getIncome();
        assertEquals(result, expResult, 0.0);

    }

    /**
     * Test of setIncome method, of class Customer.
     */
    @Test
    public void testSetIncome() {
        System.out.println("setIncome");
        double income = 20000;
        customer.setIncome(income);
        assertEquals(income, customer.getIncome(), 0.0);

    }

    /**
     * Test of toString method, of class Customer.
     */
    @Test
    public void testToString() {
        System.out.println("toString");
        String expResult = "Name: " + customer.getLastName() + ", " + customer.getFirstName() + "\nDate of Birth: " + customer.getDob() + "\nIncome: " + Math.round(customer.getIncome());
        String result = customer.toString();
        assertEquals(result, expResult);

    }

}
