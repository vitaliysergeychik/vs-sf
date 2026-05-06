@isTest
private class AccountControllerTest {
//comment
//another comment
    @isTest
    static void testGetAllInactiveAccounts() {
        // Create test data
        List<Account> testAccounts = new List<Account>();
        for (Integer i = 0; i < 3; i++) {
            testAccounts.add(new Account(Name = 'Test Account ' + i, Active__c = 'No'));
        }
        insert testAccounts;

        List<Account> inactiveAccounts = new List<Account>();
        Test.startTest();
        inactiveAccounts = AccountController.getAllInactiveAccounts();
        Test.stopTest();
        // Assert the size of the list
        System.assertEquals(3, inactiveAccounts.size());
    }

    @isTest
    static void testGetAllAccounts() {
        // Create test data
        List<Account> testAccounts = new List<Account>();
        for (Integer i = 0; i < 13; i++) {
            testAccounts.add(new Account(Name = 'Test Account ' + i));
        }
        insert testAccounts;

        List<Account> allAccounts = new List<Account>();
        Test.startTest();
        allAccounts = AccountController.getAllAccounts();
        Test.stopTest();
        // Assert that allAccounts list is not null and has size 13
        // Assert that the list is not null
        System.assertNotEquals(null, allAccounts);
        System.assertEquals(13, allAccounts.size());
    }
}