Account acct = [SELECT Id FROM Account WHERE Name = 'SFDC Computing' LIMIT 1];
List<Contact> contacts = [SELECT Id, FirstName, LastName, Email, Department FROM Contact WHERE AccountId = :acct.Id];

for (Contact c : contacts) {
    System.debug('Contact: ' + c.FirstName + ' ' + c.LastName + ', Department: ' + c.Department);
}