public with sharing class ContactAndLeadSearch {

    public static List<List<sObject>> searchContactsAndLeads(string searchTerm) {
        List<List<sObject>> searchResults = [FIND :searchTerm IN ALL FIELDS RETURNING
            Contact(Id, Name, Email, Phone LIMIT 10),
            Lead(Id, Name, Company, Email, Phone LIMIT 10)
        ];
        return searchResults;
    }
}
