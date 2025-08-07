//List<Contact> contacts = [SELECT Id, FirstName, LastName, MailingPostalCode FROM Contact];
//System.debug(contacts);

string LastName = 'Nedaerk';
string postalCode = '94087';

List<Contact> matchedContacts = [SELECT Id, FirstName, LastName 
                                         FROM Contact
                                         WHERE LastName = :LastName AND MailingPostalCode = :postalCode];
System.debug(matchedContacts);