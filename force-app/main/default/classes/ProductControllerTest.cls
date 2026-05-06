@isTest
private class ProductControllerTest {

    @TestSetup
    static void makeData(){
        // Create test Product Families
        Product_Family__c family1 = new Product_Family__c(Name = 'Family1');
        Product_Family__c family2 = new Product_Family__c(Name = 'Family2');
        insert new List<Product_Family__c>{family1, family2};

        // Create test Products
        List<Product__c> products = new List<Product__c>();
        products.add(new Product__c(Name = 'Product1', MSRP__c = 100, Category__c = 'Mountain', Level__c = 'Beginner', Material__c = 'Aluminum', Product_Family__c = family1.Id));
        products.add(new Product__c(Name = 'Product2', MSRP__c = 200, Category__c = 'Commuter', Level__c = 'Enthusiast', Material__c = 'Carbon', Product_Family__c = family1.Id));
        products.add(new Product__c(Name = 'TestProduct', MSRP__c = 150, Category__c = 'Mountain', Level__c = 'Beginner', Material__c = 'Aluminum', Product_Family__c = family2.Id));
        products.add(new Product__c(Name = 'AnotherProduct', MSRP__c = 250, Category__c = 'Commuter', Level__c = 'Enthusiast', Material__c = 'Carbon', Product_Family__c = family2.Id));
        products.add(new Product__c(Name = 'ExpensiveProduct', MSRP__c = 300, Category__c = 'Mountain', Level__c = 'Beginner', Material__c = 'Aluminum', Product_Family__c = family1.Id));
        insert products;
    }

    @isTest
    static void testGetProductsNoFilters() {
        Test.startTest();
        PagedResult result = ProductController.getProducts(null, 1);
        Test.stopTest();

        System.assertEquals(9, result.pageSize, 'Page size should be 9');
        System.assertEquals(1, result.pageNumber, 'Page number should be 1');
        System.assertEquals(5, result.totalItemCount, 'Total item count should be 5');
        System.assertEquals(5, result.records.size(), 'Records size should be 5');
    }

    @isTest
    static void testGetProductsWithSearchKey() {
        ProductController.Filters filters = new ProductController.Filters();
        filters.searchKey = 'Test';

        Test.startTest();
        PagedResult result = ProductController.getProducts(filters, 1);
        Test.stopTest();

        System.assertEquals(1, result.totalItemCount, 'Should find 1 product with Test in name');
        System.assert(result.records.size() == 1, 'Should return 1 record');
        Product__c prod = (Product__c) result.records[0];
        System.assert(prod.Name.contains('Test'), 'Product name should contain Test');
    }

    @isTest
    static void testGetProductsWithMaxPrice() {
        ProductController.Filters filters = new ProductController.Filters();
        filters.maxPrice = 150;

        Test.startTest();
        PagedResult result = ProductController.getProducts(filters, 1);
        Test.stopTest();

        System.assertEquals(2, result.totalItemCount, 'Should find 2 products with MSRP <= 150');
        for (Object obj : result.records) {
            Product__c prod = (Product__c) obj;
            System.assert(prod.MSRP__c <= 150, 'MSRP should be <= 150');
        }
    }

    @isTest
    static void testGetProductsWithCategories() {
        ProductController.Filters filters = new ProductController.Filters();
        filters.categories = new String[]{'Mountain'};

        Test.startTest();
        PagedResult result = ProductController.getProducts(filters, 1);
        Test.stopTest();

        System.assertEquals(3, result.totalItemCount, 'Should find 3 products in Mountain category');
        for (Object obj : result.records) {
            Product__c prod = (Product__c) obj;
            System.assertEquals('Mountain', prod.Category__c, 'Category should be Mountain');
        }
    }

    @isTest
    static void testGetProductsWithLevels() {
        ProductController.Filters filters = new ProductController.Filters();
        filters.levels = new String[]{'Enthusiast'};

        Test.startTest();
        PagedResult result = ProductController.getProducts(filters, 1);
        Test.stopTest();

        System.assertEquals(2, result.totalItemCount, 'Should find 2 products in Enthusiast level');
        for (Object obj : result.records) {
            Product__c prod = (Product__c) obj;
            System.assertEquals('Enthusiast', prod.Level__c, 'Level should be Enthusiast');
        }
    }

    @isTest
    static void testGetProductsWithMaterials() {
        ProductController.Filters filters = new ProductController.Filters();
        filters.materials = new String[]{'Aluminum'};

        Test.startTest();
        PagedResult result = ProductController.getProducts(filters, 1);
        Test.stopTest();

        System.assertEquals(3, result.totalItemCount, 'Should find 3 products with Aluminum material');
        for (Object obj : result.records) {
            Product__c prod = (Product__c) obj;
            System.assertEquals('Aluminum', prod.Material__c, 'Material should be Aluminum');
        }
    }

    @isTest
    static void testGetProductsPagination() {
        // Insert more products to test pagination
        List<Product__c> moreProducts = new List<Product__c>();
        for (Integer i = 0; i < 10; i++) {
            moreProducts.add(new Product__c(Name = 'ExtraProduct' + i, MSRP__c = 100, Category__c = 'Mountain', Level__c = 'Beginner', Material__c = 'Aluminum', Product_Family__c = [SELECT Id FROM Product_Family__c LIMIT 1].Id));
        }
        insert moreProducts;

        Test.startTest();
        PagedResult result = ProductController.getProducts(null, 2); // Page 2
        Test.stopTest();

        System.assertEquals(2, result.pageNumber, 'Page number should be 2');
        System.assertEquals(9, result.pageSize, 'Page size should be 9');
        System.assertEquals(15, result.totalItemCount, 'Total should be 15');
        System.assertEquals(6, result.records.size(), 'Page 2 should have 6 records (15 total, 9 on page 1)');
    }

    @isTest
    static void testGetSimilarProducts() {
        Product__c product = [SELECT Id, Product_Family__c FROM Product__c LIMIT 1];
        Id familyId = product.Product_Family__c;

        Test.startTest();
        List<Product__c> similar = ProductController.getSimilarProducts(product.Id, familyId);
        Test.stopTest();

        System.assert(similar.size() > 0, 'Should return similar products');
        for (Product__c p : similar) {
            System.assertEquals(familyId, p.Product_Family__c, 'Product should be in the same family');
            System.assertNotEquals(product.Id, p.Id, 'Should not include the original product');
        }
    }
}