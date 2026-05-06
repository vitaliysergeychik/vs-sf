@isTest
private class ProductRecordInfoControllerTest {

    @TestSetup
    static void setupData() {
        Product_Family__c family = new Product_Family__c(Name = 'TestFamily');
        insert family;

        Product__c product = new Product__c(
            Name = 'TestProduct',
            Product_Family__c = family.Id
        );
        insert product;
    }

    @isTest
    static void testGetRecordInfoReturnsProduct() {
        Test.startTest();
        List<String> result = ProductRecordInfoController.getRecordInfo('TestProduct');
        Test.stopTest();

        System.assertNotEquals(null, result, 'Expected result for product lookup');
        System.assertEquals(2, result.size(), 'Expected two values returned for product lookup');
        System.assertEquals('Product__c', result[1], 'Expected second result to identify Product__c');
        System.assertNotEquals(null, result[0], 'Expected first result to be product Id');
    }

    @isTest
    static void testGetRecordInfoReturnsProductFamily() {
        Test.startTest();
        List<String> result = ProductRecordInfoController.getRecordInfo('TestFamily');
        Test.stopTest();

        System.assertNotEquals(null, result, 'Expected result for product family lookup');
        System.assertEquals(2, result.size(), 'Expected two values returned for family lookup');
        System.assertEquals('Product_Family__c', result[1], 'Expected second result to identify Product_Family__c');
        System.assertNotEquals(null, result[0], 'Expected first result to be family Id');
    }

    @isTest
    static void testGetRecordInfoReturnsNullIfNotFound() {
        Test.startTest();
        List<String> result = ProductRecordInfoController.getRecordInfo('NonExistingName');
        Test.stopTest();

        System.assertEquals(null, result, 'Expected null when no matching record exists');
    }
}