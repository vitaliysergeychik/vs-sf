//List<Contact> contacts = [SELECT Id, FirstName, LastName, MailingPostalCode FROM Contact];
//System.debug(contacts);


List<Contact> contacts = ContactSearch.searchForContact('Nedaerk', '94087');
System.debug(contacts);