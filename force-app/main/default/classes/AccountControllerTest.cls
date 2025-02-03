@isTest
private class AccountControllerTest {

@isTest
    static void testGetAllActiveAccounts() {
        List<Account> allAccounts = new List<Account>();
        User adminUser = createAdminUser();
        System.runAs(adminUser) {
            Test.startTest();
            allAccounts = AccountController.getAllActiveAccounts();
            Test.stopTest();
        }
        //Assert the size of the list
        System.assertEquals(3, allAccounts.size());
    }
@isTest
    static void testGetAllInactiveAccounts() {
        List<Account> allAccounts = new List<Account>();
        User adminUser = createAdminUser();
        System.runAs(adminUser) {
            Test.startTest();
            allAccounts = AccountController.getAllInactiveAccounts();
            Test.stopTest();
        }
        //Assert the size of the list
        System.assertEquals(3, allAccounts.size());
    }
}