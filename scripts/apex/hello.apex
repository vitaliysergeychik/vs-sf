// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

String searchTerm = 'Smith';
List<List<sObject>> myList = ContactAndLeadSearch.searchContactsAndLeads(searchTerm);
System.debug('==============================Search Results=========================== ' );
System.debug(myList);
System.debug('=======================================================================' );