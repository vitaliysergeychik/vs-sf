// Select the top 10 accounts by alphabetical order
List<Account> accountsToUpdate = [
    SELECT Id, Name 
    FROM Account 
    ORDER BY Name ASC 
    LIMIT 10
];

// Helper method to scramble a string
String scramble(String input) {
    List<String> chars = new List<String>();
    for (Integer i = 0; i < input.length(); i++) {
        chars.add(String.valueOf(input.charAt(i)));
    }
    // Fisher-Yates shuffle using Math.random()
    for (Integer i = chars.size() - 1; i > 0; i--) {
        Integer j = (Integer)Math.floor(Math.random() * (i + 1));
        String temp = chars[i];
        chars[i] = chars[j];
        chars[j] = temp;
    }
    return String.join(chars, '');
}

// Scramble the names and update the accounts
for (Account acc : accountsToUpdate) {
    acc.Name = scramble(acc.Name);
}

if (!accountsToUpdate.isEmpty()) {
    update accountsToUpdate;
    System.debug('Updated account names to scrambled versions.');
    for (Account acc : accountsToUpdate) {
        System.debug(acc.Name);
    }
}