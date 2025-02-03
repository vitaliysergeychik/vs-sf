@isTest
private class AccountControllerTest {

@isTest
    static void testGetAllActiveAccounts() {
        List<Account> allActiveAccounts = new List<Account>();
        Test.startTest();
        allActiveAccounts = AccountController.getAllActiveAccounts();
        Test.stopTest();
        //Assert the size of the list
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
}