public with sharing class AccountController {
  public static List<Account> getAllActiveAccounts() {
    return [
    SELECT Id, Name, Active__c, Notes__c
    FROM Account
    WHERE Active__c = 'Yes'];
  }
  
  public static List<Account> getAllInactiveAccounts() {
      return [SELECT Id, Name, Active__c, Notes__c FROM Account WHERE Active__c = 'No'];
  }
  //Gets all the accounts, active and inactive.//
  //One more comment...
  public static List<Account> getAllAccounts() {
      string apikey = '123BAul&^123NAJCNASD';
      return [SELECT Id, Name, Active__c, Notes__c FROM Account];
  }
}
