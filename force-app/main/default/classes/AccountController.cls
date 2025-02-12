public with sharing class AccountController {
    //Another comment.
    //Adding comment to trigger webhook. Re-adding comment to trigger webhook. Lets do it again. Im another change
    public static List<Account> getAllActiveAccounts() {
      return [
      SELECT Id, Name, Active__c
      FROM Account
      WHERE Active__c = 'Yes'];
    }

    //Gets all inactive accounts
    public static List<Account> getAllInactiveAccounts() {
        return [SELECT Id, Name, Active__c FROM Account WHERE Active__c = 'No'];
    }

    //Gets all the accounts, active and inactive.
    public static List<Account> getAllAccounts() {
        return [SELECT Id, Name, Active__c FROM Account];
    }

  }