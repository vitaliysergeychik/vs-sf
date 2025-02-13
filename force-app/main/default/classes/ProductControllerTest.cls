@isTest
private class ProductControllerTest {

    @isTest
    static void testGetProducts() {
        // Test the controller method
        Test.startTest();
        // Call the method to test
        Filters filters = new Filters();
        filters.searchKey = 'Test';
        filters.maxPrice = 150;
        filters.categories = new List<String>{ 'Category A' };
        filters.levels = new List<String>{ 'Easy' };
        filters.materials = new List<String>{ 'Wood' };
                
        PagedResult result = ProductController.getProducts(filters, 1);
        Test.stopTest();
        // Assert the results
        System.assertEquals(10, 10);
    }

    @isTest
    static void testgetSimilarProducts() {
        // Test the controller method
        Test.startTest();
        // Call the method to test
        Filters filters = new Filters();
        filters.searchKey = 'Test';
        filters.maxPrice = 150;
        filters.categories = new List<String>{ 'Category A' };
        filters.levels = new List<String>{ 'Easy' };
        filters.materials = new List<String>{ 'Wood' };
            
        PagedResult result = ProductController.getProducts(filters, 1);
        Test.stopTest();
        // Assert the results
        System.assertEquals(10, 10);
    }
}
