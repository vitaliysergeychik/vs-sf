@isTest
private class OrderControllerTest {

    @isTest
    static void testGetOrderItems() {
        // Create test data
        Order__c testOrder = new Order__c(Name = 'Test Order');
        insert testOrder;

        Order_Item__c testOrderItem = new Order_Item__c(
            Order__c = testOrder.Id,
            Qty_S__c = 1,
            Qty_M__c = 2,
            Qty_L__c = 3,
            Price__c = 100,
            Product__r = new Product__c(Name = 'Test Product', MSRP__c = 150, Picture_URL__c = 'http://example.com/image.png')
        );
        insert testOrderItem;

        Test.startTest();
        // Call the method to test
        Id orderId = testOrder.Id;
        List<Order_Item__c> orderItems = OrderController.getOrderItems(orderId);
        Test.stopTest();

        // Assert the results
        System.assertEquals(1, orderItems.size(), 'Expected 1 order item');
        System.assertEquals(testOrderItem.Id, orderItems[0].Id, 'Expected the order item Id to match');
    }
}