public with sharing class HouseService {
    @AuraEnabled(cacheable=true)
    public static List<Account> getRecords() {
        try {
            
    		
            // Create a list of House records from a SOQL query
            List<Account> lstHouses = [
                SELECT Id, Name, Active__c, SLASerialNumber__c FROM Account
                ];
                  return lstHouses;
        }
        // Code to handle exception
        catch (Exception e) {
           throw new AuraHandledException(e.getMessage());
        }
    }
}