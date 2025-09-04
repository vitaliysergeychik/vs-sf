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
   static void testGetAllAccounts(){
    //Create test data
    List<Account> testAccounts = new List<Account>();
    for (Integer i = 0; i < 5; i++) {
        testAccounts.add(new Account(Name = 'Active Account ' + i, Active__c = 'Yes'));
    }
    for (Integer j = 0; j < 4; j++) {
        testAccounts.add(new Account(Name = 'Inactive Account ' + j, Active__c = 'No'));
    }
    insert testAccounts;
    testAccounts = AccountController.getAllAccounts();
    System.debug('Size of allAccounts: ' + testAccounts.size());
    System.assertEquals(9, testAccounts.size());
   }
}