public with sharing class ContactSearch {
    public ContactSearch() {

    }

    public static List<Contact> searchForContact(string LastName, string postalCode){
        List<Contact> matchedContacts = [SELECT Id, FirstName, LastName 
                                         FROM Contact
                                         WHERE LastName = :LastName AND MailingPostalCode = :postalCode];
        return matchedContacts;
    }
}