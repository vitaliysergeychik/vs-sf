public with sharing class WF_TestClass {
    public WF_TestClass() {
        return [
        SELECT Id, Name, Active__c
        FROM Account
        WHERE Active__c = 'Yes'];
    }

    //Another comment. Changing one comment to test incremental build.
  //Changing one class to test inc build.//
  //adding a comment
  //adding another comment
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
  //Gets all the accounts, active and inactive.//
  public static List<Account> getAllAccounts() {
      return [SELECT Id, Name, Active__c, Credit_Card__c FROM Account];
  }
}