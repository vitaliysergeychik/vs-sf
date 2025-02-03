@isTest
private class AccountControllerTest {

@isTest
    static void testGetAllActiveAccounts() {
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
        List<Account> inactiveAccounts = new List<Account>();
        Test.startTest();
        inactiveAccounts = AccountController.getAllActiveAccounts();
        Test.stopTest();
        //Assert the size of the list
        System.assertEquals(0, inactiveAccounts.size());
    }
@isTest
    static void testGetAllAccounts() {
        List<Account> allAccounts = new List<Account>();
        Test.startTest();
        allAccounts = AccountController.getAllAccounts();
        Test.stopTest();
        // Assert that allAccounts list is not null and has size 13
        System.assertNotEquals(null, allAccounts);
        System.assertEquals(13, allAccounts.size());
    }
}