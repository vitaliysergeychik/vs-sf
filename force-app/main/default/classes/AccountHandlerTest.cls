@isTest
private class AccountHandlerTest {

    @isTest
    static void testinsertNewAccount() {
        Account testAcc = AccountHandler.insertNewAccount('Test Account');
        System.debug('Inserted Account Id: ' + testAcc.Id);
        System.assertNotEquals(null, testAcc.Id, 'Account insertion failed, Id is null');
        System.assertEquals('Test Account', testAcc.Name, 'Account name does not match');
    }
}