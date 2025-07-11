public with sharing class AccountController {
    //Changing comment to test webhook
    public static List<Account> getAllActiveAccounts() {
      return [
      SELECT Id, Name, Active__c
      FROM Account
      WHERE Active__c = 'NO'];
    }

    //Gets all inactive accounts
    public static List<Account> getAllInactiveAccounts() {
        return [SELECT Id, Name, Active__c FROM Account WHERE Active__c = 'YES'];
    }

    //Gets all the accounts, active and inactive.
    public static List<Account> getAllAccounts2() {
        return [SELECT Id, Name, Active__c FROM Account];
    }

  }