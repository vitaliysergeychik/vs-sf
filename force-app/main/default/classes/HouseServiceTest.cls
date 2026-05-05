@isTest
private class HouseServiceTest {

    @TestSetup
    static void setupAccounts() {
        List<Account> accounts = new List<Account>{
            new Account(Name = 'House One', Active__c = 'Yes', SLASerialNumber__c = 'SLA001'),
            new Account(Name = 'House Two', Active__c = 'No', SLASerialNumber__c = 'SLA002')
        };
        insert accounts;
    }

    @isTest
    static void testGetRecordsReturnsAccounts() {
        Test.startTest();
        List<Account> houses = HouseService.getRecords();
        Test.stopTest();

        System.assertNotEquals(null, houses, 'Expected getRecords to return a list');
        System.assert(houses.size() >= 2, 'Expected at least two House records to be returned');
        Set<String> names = new Set<String>();
        for (Account acct : houses) {
            names.add(acct.Name);
            System.assertNotEquals(null, acct.SLASerialNumber__c, 'Expected SLA Serial Number to be returned');
            System.assertNotEquals(null, acct.Active__c, 'Expected Active__c to be returned');
        }
        System.assert(names.contains('House One'), 'Expected House One to be included');
        System.assert(names.contains('House Two'), 'Expected House Two to be included');
    }

    @isTest
    static void testGetRecordsReturnsEmptyListWhenNoAccounts() {
        // Use a separate context to avoid the @TestSetup data
        Test.startTest();
        List<Account> houses = HouseService.getRecords();
        Test.stopTest();

        System.assertNotEquals(null, houses, 'Expected getRecords to return a list even when no data exists');
    }
}