import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Loan {
    private double loanAmount; // Amount needed for loan
    private int noOfEMIs; // Months required to clear the loan
    private double interestRate; // Interest rate for the loan
    private String status; // Status of the loan
    private LocalDateTime loanSanctionTime; // Date and time of transaction
    private String loanType; // Type of loan (Car, House, Business)

    // Constructor
    public Loan(String loanType, double loanAmount, int noOfEMIs, LocalDateTime loanSanctionTime) {
        this.loanType = loanType;
        this.loanAmount = loanAmount;
        this.noOfEMIs = noOfEMIs;
        this.loanSanctionTime = loanSanctionTime;
    }               

    // Getter and setter methods
    public double getLoanAmount() {
        return loanAmount;
    }

    public void setLoanAmount(double loanAmount) {
        this.loanAmount = loanAmount;
    }

    public int getNoOfEMIs() {
        return noOfEMIs;
    }

    public void setNoOfEMIs(int noOfEMIs) {
        this.noOfEMIs = noOfEMIs;
    }

    public double getInterestRate() {
        return interestRate;
    }

    public void setInterestRate(double interestRate) {
        this.interestRate = interestRate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public LocalDateTime getLoanSanctionTime() {
        return loanSanctionTime;
    }

    public void setLoanSanctionTime(LocalDateTime loanSanctionTime) {
        this.loanSanctionTime = loanSanctionTime;
    }

    public String getLoanType() {
        return loanType;
    }

    public void setLoanType(String loanType) {
        this.loanType = loanType;
    }

    // toString() method to return loan details in the specified format
    @Override
    public String toString() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");
        return String.format("%-10s %-20s %.2f %.2f%% %-10s",
                loanType,
                loanSanctionTime.format(formatter),
                loanAmount,
                interestRate,
                noOfEMIs,
                status);
    }
}

