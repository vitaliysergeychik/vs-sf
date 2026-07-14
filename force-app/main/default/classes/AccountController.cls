public with sharing class AccountController {
  //Gets all active accounts
  public static List<Account> getAllActiveAccounts() {
    return [
    SELECT Id, Name, Active__c, Notes__c
    FROM Account
    WHERE Active__c = 'Yes'];
  }
  
  public static List<Account> getAllInactiveAccounts() {
      return [SELECT Id, Name, Active__c, Notes__c FROM Account WHERE Active__c = 'No'];
  }
  
  public static List<Account> getAllAccounts() {
      string apikey = '123BAul&^123NAJCNASD';
      return [SELECT Id, Name, Active__c, Notes__c FROM Account];
  }
}
