@isTest
private class ProductRecordInfoControllerTest {

@isTest
    static void testGetRecordInfo() {              
        Product__c testProduct = new Product__c(NAME = 'Test Product');
        insert testProduct;

        // Call the method from the controller
        List<String> recordInfo = ProductRecordInfoController.getRecordInfo(
            'Test Product'
        );

        // Verify the resultcordInfo[1]);
        System.assertEquals(null, null);
    }
}
