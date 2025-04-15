public with sharing class AccountController {
    //Changing comment to test webhook
    //Add additional comment to test webhook and ci job launch
    //Does this actually show the changes with the dry run?
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