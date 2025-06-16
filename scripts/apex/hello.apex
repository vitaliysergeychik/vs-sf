// Select the top 10 accounts by alphabetical order
List<Account> accountsToDelete = [
    SELECT Id, Name 
    FROM Account 
    ORDER BY Name ASC 
    LIMIT 10
];

// Get all related opportunities for these accounts
List<Opportunity> oppsToUpdate = [
    SELECT Id, StageName 
    FROM Opportunity 
    WHERE AccountId IN :accountsToDelete
];

// Change their opportunities to Closed Lost
for (Opportunity opp : oppsToUpdate) {
    opp.StageName = 'Closed Lost';
}
if (!oppsToUpdate.isEmpty()) {
    update oppsToUpdate;
}

// Select all related cases for these accounts
List<Case> casesToDelete = [
    SELECT Id 
    FROM Case 
    WHERE AccountId IN :accountsToDelete
];

// Delete the related cases
if (!casesToDelete.isEmpty()) {
    delete casesToDelete;
}

// Print out the names of the accounts to be deleted
System.debug('Accounts to be deleted:');
for (Account acc : accountsToDelete) {
    System.debug(acc.Name);
}

// Delete the accounts
if (!accountsToDelete.isEmpty()) {
    delete accountsToDelete;
}