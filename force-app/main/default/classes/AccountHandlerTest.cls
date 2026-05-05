@isTest
private class AccountHandlerTest {

    @isTest
    static void testinsertNewAccount() {
        Account testAcc = AccountHandler.insertNewAccount('Test Account');
        System.debug('Inserted Account Id: ' + testAcc.Id);
        System.assertNotEquals(null, testAcc.Id, 'Account insertion failed, Id is null');
        System.assertEquals('Test Account', testAcc.Name, 'Account name does not match');
    }

    @isTest
    static void testInsertNewAccountFailure(){
        // Simulate failure by passing null name (which is not allowed)
        Account testAcc = AccountHandler.insertNewAccount(null);
        System.debug('Inserted Account: ' + testAcc);
        System.assertEquals(null, testAcc, 'Account insertion should fail and return null');
    }
}