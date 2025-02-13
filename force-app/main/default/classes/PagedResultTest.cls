@isTest
private class PagedResultTest {

@isTest
    private static void isEmptyTest() {
        Boolean result = PagedResult.isEmpty(' ');
        System.assertEquals(false, result, 'Expected string to not be empty');
    }
}