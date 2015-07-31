/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

/**
 *
 * @author Hiren Patel
 */
public class Transaction {
    int transactionId;
    String transactionDesc;
    int transactionAmount;
    String transactionDate;
    String transactionFlow;
    int accountId;
    int categoryId;
    String userEmail;

    Transaction(int transactionId, String transactionDesc,String transactionDate, int transactionAmount,int accountId,  String transactionFlow,int categoryId,  String userEmail) {
 
        this.transactionId=transactionId;
        this.transactionDesc=transactionDesc;
        this.transactionDate=transactionDate;
        this.transactionAmount=transactionAmount;
        this.accountId=accountId;
        this.transactionFlow=transactionFlow;
        this.categoryId=categoryId;
        this.userEmail=userEmail;
        
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }
    

    public int getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(int transactionId) {
        this.transactionId = transactionId;
    }

    public String getTransactionDesc() {
        return transactionDesc;
    }

    public void setTransactionDesc(String transactionDesc) {
        this.transactionDesc = transactionDesc;
    }

    public int getTransactionAmount() {
        return transactionAmount;
    }

    public void setTransactionAmount(int transactionAmount) {
        this.transactionAmount = transactionAmount;
    }

    public String getTransactionDate() {
        return transactionDate;
    }

    public void setTransactionDate(String transactionDate) {
        this.transactionDate = transactionDate;
    }

    public String getTransactionFlow() {
        return transactionFlow;
    }

    public void setTransactionFlow(String transactionFlow) {
        this.transactionFlow = transactionFlow;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }
    
    
    
}
