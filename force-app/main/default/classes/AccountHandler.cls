public with sharing class AccountHandler {
    public AccountHandler() {

    }

    public static Account insertNewAccount(String name){
        try{
            Account newAccount = new Account(Name = name);
            insert newAccount;
            return newAccount;
        } catch (Exception e) {
            System.debug('Error inserting account: ' + e.getMessage());
            return null;
        }
    }
}