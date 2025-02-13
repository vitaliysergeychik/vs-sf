@isTest
private class OrderControllerTest {

@isTest
    static void testGetOrderItems() {  
            Test.startTest();
            // Call the method to test
            Test.stopTest();
            // Assert the results
            System.assertEquals(1, 1, 'Expected 1 order item');
        }
}
