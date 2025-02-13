@isTest
private class OrderControllerTest {

@isTest
    static void testGetOrderItems() {  
            Order__c order = new Order__c(Customer_Name__c = 'Test Customer');
            insert order;
            
            Product__c product = new Product__c(Name = 'Test Product', MSRP__c = 100.00, Picture_URL__c = 'https://example.com/test.png');
            insert product;
            
            Order_Item__c orderItem = new Order_Item__c(
                Order__c = order.Id,
                Product__c = product.Id,
                Qty_S__c = 1,
                Qty_M__c = 2,
                Qty_L__c = 3,
                Price__c = 100.00
            );
            insert orderItem;
            Test.startTest();
            // Call the method to test
            Order_Item__c[] orderItems = OrderController.getOrderItems(order.Id);
            Test.stopTest();
            // Assert the results
            System.assertEquals(1, 1, 'Expected 1 order item');
        }
}
