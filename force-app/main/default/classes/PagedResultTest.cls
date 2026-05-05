@isTest
private class PagedResultTest {

    @isTest
    private static void isEmptyTest() {
        Boolean result = PagedResult.isEmpty('a');
        System.assertEquals(false, result, 'Expected string to not be empty');
    }

    @isTest
    private static void testPageSizeGetSet() {
        PagedResult result = new PagedResult();
        result.pageSize = 25;
        System.assertEquals(25, result.pageSize, 'Expected pageSize getter/setter to work');
    }

    @isTest
    private static void testPageNumberGetSet() {
        PagedResult result = new PagedResult();
        result.pageNumber = 3;
        System.assertEquals(3, result.pageNumber, 'Expected pageNumber getter/setter to work');
    }

    @isTest
    private static void testTotalItemCountGetSet() {
        PagedResult result = new PagedResult();
        result.totalItemCount = 100;
        System.assertEquals(100, result.totalItemCount, 'Expected totalItemCount getter/setter to work');
    }

    @isTest
    private static void testRecordsGetSet() {
        PagedResult result = new PagedResult();
        result.records = new Object[]{'one', 'two'};
        System.assertEquals(2, result.records.size(), 'Expected records getter/setter to work');
        System.assertEquals('one', result.records[0], 'Expected first record value to match');
        System.assertEquals('two', result.records[1], 'Expected second record value to match');
    }
}