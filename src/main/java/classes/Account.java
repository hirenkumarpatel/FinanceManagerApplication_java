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

/*
Account Class
*/
public class Account {
    int accountId;
    String accountName;
    String accountDate;
    int accountAmount;

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public void setAccountDate(String accountDate) {
        this.accountDate = accountDate;
    }

    public void setAccountAmount(int accountAmount) {
        this.accountAmount = accountAmount;
    }

    public int getAccountId() {
        return accountId;
    }

    public String getAccountName() {
        return accountName;
    }

    public String getAccountDate() {
        return accountDate;
    }

    public int getAccountAmount() {
        return accountAmount;
    }
    
}
