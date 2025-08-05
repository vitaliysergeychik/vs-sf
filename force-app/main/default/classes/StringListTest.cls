public with sharing class StringListTest {
    public StringListTest(Integer numberOfStr) {
        List<string> myList = new List<string>();
        for (Integer x = 0; x < numberOfStr; x++){
            myList.add('Test ' + x);
        }
        return myList;
    }
}