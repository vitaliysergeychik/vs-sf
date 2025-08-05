public class StringListTest {
    public StringListTest() {
        // Default constructor
    }

    public List<String> generateStringList(Integer count) {
        List<String> result = new List<String>();
        for (Integer i = 0; i < count; i++) {
            result.add('Test ' + i);
        }
        return result;
    }
}