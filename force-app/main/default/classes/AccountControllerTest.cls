@isTest
private class AccountControllerTest {

    @isTest
    static void testGetAllActiveAccounts() {
        // Create test data
        List<Account> testAccounts = new List<Account>();
        for (Integer i = 0; i < 10; i++) {
            testAccounts.add(new Account(Name = 'Test Account ' + i, Active__c = 'Yes'));
        }
        insert testAccounts;

        List<Account> allActiveAccounts = new List<Account>();
        Test.startTest();
        allActiveAccounts = AccountController.getAllActiveAccounts();
        Test.stopTest();
        // Print the size of the list
        System.debug('Size of allActiveAccounts: ' + allActiveAccounts.size());
        // Assert the size of the list
        System.assertEquals(10, allActiveAccounts.size());
    }

    @isTest
    static void testGetAllInactiveAccounts() {
        // Create test data
        List<Account> testAccounts = new List<Account>();
        for (Integer i = 0; i < 10; i++) {
            testAccounts.add(new Account(Name = 'Test Account ' + i, Active__c = 'No'));
        }
        insert testAccounts;

        List<Account> inactiveAccounts = new List<Account>();
        Test.startTest();
        inactiveAccounts = AccountController.getAllActiveAccounts();
        Test.stopTest();
        // Assert the size of the list
        System.assertEquals(0, inactiveAccounts.size());
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
        System.assertNotEquals(null, allAccounts);
        System.assertEquals(13, allAccounts.size());
    }
}