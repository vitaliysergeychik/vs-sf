@isTest
private class OlderAccountsUtilityTest {

    @isTest
    static void testUpdateOlderAccounts() {
        // Create test Accounts
        List<Account> testAccounts = new List<Account>();
        for (Integer i = 0; i < 7; i++) {
            testAccounts.add(new Account(Name = 'Test Account ' + i));
        }
        insert testAccounts;

        // Set CreatedDate to control the order (oldest first)
        Test.setCreatedDate(testAccounts[0].Id, DateTime.newInstance(2020, 1, 1));
        Test.setCreatedDate(testAccounts[1].Id, DateTime.newInstance(2020, 1, 2));
        Test.setCreatedDate(testAccounts[2].Id, DateTime.newInstance(2020, 1, 3));
        Test.setCreatedDate(testAccounts[3].Id, DateTime.newInstance(2020, 1, 4));
        Test.setCreatedDate(testAccounts[4].Id, DateTime.newInstance(2020, 1, 5));
        Test.setCreatedDate(testAccounts[5].Id, DateTime.newInstance(2020, 1, 6));
        Test.setCreatedDate(testAccounts[6].Id, DateTime.newInstance(2020, 1, 7));

        // Call the method
        Test.startTest();
        OlderAccountsUtility.updateOlderAccounts();
        Test.stopTest();

        // Query back the accounts ordered by CreatedDate
        List<Account> updatedAccounts = [SELECT Id, Name, Description FROM Account WHERE Id IN :testAccounts ORDER BY CreatedDate ASC];

        // Assert the first 5 have Description 'Heritage Account'
        for (Integer i = 0; i < 5; i++) {
            System.assertEquals('Heritage Account', updatedAccounts[i].Description, 'Account ' + i + ' should have Heritage Account description');
        }

        // Assert the remaining 2 do not
        for (Integer i = 5; i < 7; i++) {
            System.assertNotEquals('Heritage Account', updatedAccounts[i].Description, 'Account ' + i + ' should not have Heritage Account description');
        }
    }
}