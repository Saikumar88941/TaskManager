

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.File;
import java.io.FileNotFoundException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Scanner;

/**
 * The driver class to test all the classes
 *
 * @author 
 */
public class BankDriver {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws FileNotFoundException {
        // TODO code application logic here
			//Note: (i). You can create any variables required within the main method but not as global/instance variables.
			//      (ii). The dates times provided for the transaction times are in yyyy-MM-dd HH:mm:ss
			// 1. Create an arraylist of Accounts and name it as accounts to store the list of accounts
			ArrayList<Account> accounts = new ArrayList<>();
			// 2. Create a scanner object and name it as sc to read the input from keyboard
			//   while (iterate) {  
				// 3. Read the values account type, first name, last name, date of birth and income from the input file
				// 4. Create an Customer object.
                                // 5. Create an Account object.
				// 6. Print full name of the customer.
				// 7. while(Iterate){
				//     a. Read loan and a create loan object by initalizing the multiple argument constructor.
				//       b. verify customer account balance and income conditions.
				//     b. call Appplyloan() method on account object.
                                //     c. Print appropiate message upon completing each loan based on return value of above conditions.
                                          //if applyloan returns "loan sanction" print "staus was success with loan sanction statement(see the output for correct statement)".
                                          //else print "status was Failed with return value from above condition 
				// 	}
				// 10. Add Account object to accounts Arraylist.
			// } 
			try (Scanner scanner = new Scanner(new File("inputFile"))) {
				while (scanner.hasNextLine()) {
					String line = scanner.nextLine();
					if (line.equals("newAccount")) {
						// Read account details
						String name = scanner.nextLine();
						String dobString = scanner.nextLine();
						double income = Double.parseDouble(scanner.nextLine());
						long accountNumber = Long.parseLong(scanner.nextLine());
						double balance = Double.parseDouble(scanner.nextLine());
	
						// Parse Date of Birth
						DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
						LocalDateTime dob = LocalDateTime.parse(dobString, formatter);
	
						// Create Customer object
						String[] nameParts = name.split(" ");
						String firstName = nameParts[0];
						String lastName = nameParts[1];
						Customer customer = new Customer(dob, firstName, lastName, income);
	
						// Create Account object
						Account account = new Account(accountNumber, customer, balance);
	
						// Print full name of the customer
						System.out.println("Full Name of the Customer: " + customer.getFullName());
	
						// Read and process loans
						while (scanner.hasNextLine()) {
							String loanLine = scanner.nextLine();
							if (loanLine.isEmpty()) {
								break; // End of loans for this account
							}
							String[] loanParts = loanLine.split(" ");
							if (loanParts.length == 4) {
								String loanType = loanParts[0];
								LocalDateTime loanSanctionTime = LocalDateTime.parse(loanParts[1] + " " + loanParts[2], formatter);
								double loanAmount = Double.parseDouble(loanParts[3]);
								int noOfEMIs = Integer.parseInt(loanParts[4]);
	
								// Create Loan object
								Loan loan = new Loan(loanType, loanAmount, noOfEMIs, loanSanctionTime);
	
								// Verify customer account balance and income conditions
								String loanStatus = account.applyLoan(loan);
	
								// Print appropriate message based on loan status
								if (loanStatus.equals("loan sanctioned")) {
									System.out.println("Status was success with loan sanction statement: " + loan.toString());
								} else {
									System.out.println("Status was failed with return value: " + loanStatus);
								}
							}
						}
	
						// Add Account object to accounts ArrayList
						accounts.add(account);
					}
				}
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
        // Print "Invoke emiAmount() on Account objects"
        // 11(a). For each Account from accounts, invoke emiAccount() method onAccount objects
		// 11(b). Print emi amount of each account per month.
			System.out.println("Invoke emiAmount() on Account objects");
			for (Account account : accounts) {
				double emiAmount = account.emiAmount(account.getLoans());
				System.out.println("EMI amount for Account " + account.getAccountNumber() + " per month: $" + emiAmount);
			}


		// Print "Invoke generateStatement() on all objects in accounts ArrayList"
		// 12. Invoke generateStatement() method on all objects in accounts ArrayList and print all account statements
			System.out.println("Invoke generateStatement() on all objects in accounts ArrayList");
			for (Account account : accounts) {
				System.out.println("Account Statement for Account Number: " + account.getAccountNumber());
				System.out.println(account.generateStatement());
			}
		
    }

}
