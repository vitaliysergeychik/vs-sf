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
         filters.categories = new List<String>{'Category 1'};
         filters.levels = new List<String>{'Level 1'};
         filters.materials = new List<String>{'Material 1'};
         
         PagedResult result = ProductController.getProducts(filters, 1);
         Test.stopTest();
         // Assert the results
         System.assertEquals(10, result.totalItemCount);
         System.assertEquals(1, result.pageNumber);
    }
    
}