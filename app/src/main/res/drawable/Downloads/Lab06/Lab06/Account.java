import java.time.LocalDateTime;
import java.util.ArrayList;

public class Account {
    private long accountNumber; // Bank Account number
    private Customer customer; // Customer of an account
    private double balance; // Balance on account
    private ArrayList<Loan> loans; // List of all loans on account

    // Constructor
    public Account(long accountNumber, Customer customer, double balance) {
        this.accountNumber = accountNumber;
        this.customer = customer;
        this.balance = balance;
        this.loans = new ArrayList<>();
    }

    // Getter methods
    public long getAccountNumber() {
        return accountNumber;
    }

    public Customer getCustomer() {
        return customer;
    }

    public double getBalance() {
        return balance;
    }

    public ArrayList<Loan> getLoans() {
        return loans;
    }

    // Method to generate statement
    public String generateStatement() {
        StringBuilder statement = new StringBuilder();
        statement.append(customer.toString()).append("\n");
        statement.append("Account Number: ").append(accountNumber).append("\n");
        statement.append("Account balance: $").append(balance).append("\n");
        statement.append("------------------------------------------------------------------------------\n");
        statement.append(String.format("%-10s %-20s %-15s %-10s %-10s %s\n",
                "Loan Type", "Loan Time", "Loan Amount", "Interest Rate", "No of EMI’s", "Status"));
        for (Loan loan : loans) {
            statement.append(loan.toString()).append("\n");
        }
        statement.append("-----------------------------------------------------------\n");
        statement.append("Total EMI per Month: $").append(emiAmount(loans)).append("\n");
        return statement.toString();
    }

    // Method to calculate EMI for a loan
    public double emiCalculator(Loan loan) {
        double principal = loan.getLoanAmount();
        double rate = loan.getInterestRate() / 100 / 12; // Monthly interest rate
        int noOfEMIs = loan.getNoOfEMIs();
        return (principal * rate * Math.pow(1 + rate, noOfEMIs)) / (Math.pow(1 + rate, noOfEMIs) - 1);
    }

    // Method to calculate total EMI payment of all eligible loans in a month
    public double emiAmount(ArrayList<Loan> loans) {
        double totalEMI = 0;
        for (Loan loan : loans) {
            totalEMI += emiCalculator(loan);
        }
        return totalEMI;
    }

    // Method to apply for a loan
    public String applyLoan(Loan loan) {
        if (balance < customer.getIncome() * 0.3) {
            loan.setInterestRate(0);
            loan.setStatus("FAILED");
            return "Insufficient account balance";
        }

        String loanType = loan.getLoanType();
        double income = customer.getIncome();
        double loanAmount = loan.getLoanAmount();
        int noOfEMIs = loan.getNoOfEMIs();

        switch (loanType) {
            case "Car":
                if (income < 25000 || loanAmount > 50000 || noOfEMIs > 365) {
                    loan.setInterestRate(0);
                    loan.setStatus("FAILED");
                    return "low income";
                } else {
                    loan.setInterestRate(5);
                    loan.setStatus("SUCCESS");
                    loans.add(loan);
                    return "loan sanctioned";
                }
            case "House":
                if (income < 50000 || loanAmount > 100000 || noOfEMIs > 60) {
                    loan.setInterestRate(0);
                    loan.setStatus("FAILED");
                    return "low income";
                } else {
                    loan.setInterestRate(10);
                    loan.setStatus("SUCCESS");
                    loans.add(loan);
                    return "loan sanctioned";
                }
            case "Business":
                if (income < 75000 || loanAmount > 150000 || noOfEMIs > 84) {
                    loan.setInterestRate(0);
                    loan.setStatus("FAILED");
                    return "low income";
                } else {
                    loan.setInterestRate(15);
                    loan.setStatus("SUCCESS");
                    loans.add(loan);
                    return "loan sanctioned";
                }
            default:
                return "Invalid loan type";
        }
    }
}

