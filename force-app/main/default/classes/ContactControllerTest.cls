@isTest
private class ContactControllerTest {

    @isTest
    static void testContactController(){
        ContactController controller = new ContactController();
        System.assertNotEquals(null, controller);
    }

    @isTest
    static void testGetAllContact() {
        List<Contact> allContacts = new List<Contact>();
        List<Contact> contactsToInsert = new List<Contact>();
        for (Integer i = 1; i <= 10; i++) {
            contactsToInsert.add(new Contact(
                FirstName = 'TestFirst' + i,
                LastName = 'TestLast' + i,
                Email = 'test' + i + '@example.com'
            ));
        }
        insert contactsToInsert;
        Test.startTest();
        allContacts = ContactController.getAllContact();
        Test.stopTest();
        // Assert the size of the list
        System.assertEquals(10, allContacts.size());
    }

    @isTest
    static void testGetContactByEmail() {
        List<Contact> allContacts = new List<Contact>();
        List<Contact> contactsToInsert = new List<Contact>();
        for (Integer i = 1; i <= 10; i++) {
            contactsToInsert.add(new Contact(
                FirstName = 'TestFirst' + i,
                LastName = 'TestLast' + i,
                Email = 'test' + i + '@example.com'
            ));
        }
        insert contactsToInsert;
        Test.startTest();
        allContacts = ContactController.getContactByEmail('test1@example.com');
        Test.stopTest();
        // Assert the size of the list
        System.assertEquals(1, allContacts.size());
        System.assertEquals(allContacts[0].Email, 'test1@example.com');
    }

    @isTest
    static void testGetContactsByState(){
        List<Contact> maContacts = new List<Contact>();
        List<Contact> contactsToInsert = new List<Contact>();
        for (Integer i = 1; i <= 5; i++) {
            contactsToInsert.add(new Contact(
                FirstName = 'TestFirst' + i,
                LastName = 'TestLast' + i,
                Email = 'test' + i + '@example.com',
                MailingState = 'CA'
            ));
        }
        for (Integer j = 6; j <= 10; j++) {
            contactsToInsert.add(new Contact(
                FirstName = 'TestFirst' + j,
                LastName = 'TestLast' + j,
                Email = 'test' + j + '@example.com',
                MailingState = 'MA'
            ));
        }
        insert contactsToInsert;
        Test.startTest();
        maContacts = ContactController.getContactsByState('MA');
        Test.stopTest();
        // Assert the size of the list
        System.debug(maContacts);
        System.assertEquals(maContacts[0].MailingState, 'MA');
        System.assertEquals(maContacts.size(), 5);
    }
}