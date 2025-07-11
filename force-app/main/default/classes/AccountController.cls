public with sharing class AccountController {
    //Changing comment to test webhook
    //Does this actually show the changes with the dry run?
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
    public static List<Account> getAllAccounts() {
        return [SELECT Id, Name, Active__c FROM Account];
    }

  }