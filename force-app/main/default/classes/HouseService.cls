public with sharing class HouseService {
    @AuraEnabled(cacheable=true)
    public static List<Account> getRecords() {
            // Create a list of House records from a SOQL query
            List<Account> lstHouses = [
                SELECT Id, Name, Active__c, SLASerialNumber__c FROM Account
                ];
                  return lstHouses;
        }
}