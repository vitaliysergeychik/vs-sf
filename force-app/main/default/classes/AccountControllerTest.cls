@isTest
private class AccountControllerTest {

    

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

   
}