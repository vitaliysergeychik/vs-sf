public with sharing class NewApexClass {
    public NewApexClass() {

    }

     @AuraEnabled(cacheable=true)
    public static List<Contact> getAllContact() {
        return [SELECT Id, FirstName, LastName, Email FROM Contact];
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactByEmail(String email) {
        return [SELECT Id, FirstName, LastName, Email FROM Contact WHERE Email = :email];
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactsByState(String state) {
        List<Contact> opps = Database.query(
            'SELECT Id, FirstName, LastName, Email FROM Contact WHERE MailingState = ' + state
        );
        return opps;
        
    }

}