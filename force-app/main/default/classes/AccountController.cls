public with sharing class AccountController {
  //test
  public static List<Account> getAllActiveAccounts() {
    return [
    SELECT Id, Name, Active__c
    FROM Account
    WHERE Active__c = 'Yes'];
  }
  
  public static List<Account> getAllInactiveAccounts() {
      return [SELECT Id, Name, Active__c FROM Account WHERE Active__c = 'No'];
  }
  
  public static List<Account> getAllAccounts() {
      List<List<sObject>> searchResults = ContactAndLeadSearch.searchContactsAndLeads('Vitaliy');
      return [SELECT Id, Name, Active__c, Credit_Card__c FROM Account];
  }
}