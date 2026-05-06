@isTest
private class ContactSearchTest {

    @TestSetup
    static void setupContacts() {
        List<Contact> contacts = new List<Contact>{
            new Contact(FirstName = 'Alice', LastName = 'Smith', MailingPostalCode = '12345'),
            new Contact(FirstName = 'Bob', LastName = 'Smith', MailingPostalCode = '67890'),
            new Contact(FirstName = 'Charlie', LastName = 'Jones', MailingPostalCode = '12345')
        };
        insert contacts;
    }

    @isTest
    static void testConstructorCreatesInstance() {
        ContactSearch controller = new ContactSearch();
        System.assertNotEquals(null, controller, 'Expected ContactSearch constructor to create an instance');
    }

    @isTest
    static void testSearchForContactsReturnsMatches() {
        Test.startTest();
        List<Contact> results = ContactSearch.searchForContacts('Smith', '12345');
        Test.stopTest();

        System.assertEquals(1, results.size(), 'Expected one matching contact');
        System.assertEquals('Alice', results[0].FirstName, 'Expected the matching contact to be Alice');
        System.assertEquals('Smith', results[0].LastName, 'Expected last name to be Smith');
    }

    @isTest
    static void testSearchForContactsReturnsNoMatches() {
        Test.startTest();
        List<Contact> results = ContactSearch.searchForContacts('Nonexistent', '00000');
        Test.stopTest();

        System.assertEquals(0, results.size(), 'Expected no contacts returned for unmatched search criteria');
    }
}