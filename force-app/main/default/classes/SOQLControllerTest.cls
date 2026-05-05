
@isTest
private class SOQLControllerTest {

    @TestSetup
    static void makeData(){
        // Create test Contacts
        List<Contact> contacts = new List<Contact>();
        contacts.add(new Contact(FirstName='Test', LastName='User1'));
        contacts.add(new Contact(FirstName='Test', LastName='User2'));
        contacts.add(new Contact(FirstName='Other', LastName='User'));
        insert contacts;
    }

    @isTest
    static void testQueryMethod() {
        // Test the query method
        SOQLController controller = new SOQLController();
        controller.name = 'Test';
        Test.startTest();
        PageReference result = controller.query();
        Test.stopTest();
        // Since query() returns null, assert that
        System.assertEquals(null, result, 'Query method should return null');
        // To verify the query, we can check if debug was called, but in unit test, perhaps just ensure no exception
    }

    @isTest
    static void testNameProperty() {
        // Test getter and setter for name property
        SOQLController controller = new SOQLController();
        controller.name = 'Sample Name';
        System.assertEquals('Sample Name', controller.name, 'Name property getter should return set value');
    }

    @isTest
    static void testGetFilterMethod() {
        // Test getFilter method
        SOQLController controller = new SOQLController();
        String filter = controller.getFilter();
        System.assertEquals('Name like \'%test%\'', filter, 'getFilter should return the expected string');
    }
}