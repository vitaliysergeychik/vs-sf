List<Account> accounts = [SELECT Id, Name FROM Account ORDER BY Name LIMIT 1];

List<Case> cases = [SELECT Subject, Id, AccountId FROM Case WHERE AccountId = :accounts[0].Id];

List<Opportunity> opps = [SELECT Name, Id, StageName FROM Opportunity Where AccountID = :accounts[0].Id];

Integer caseCounter = cases.size();
Integer oppCounter = opps.size();

for (Case c : cases) {
    c.Status = 'Closed';
    System.debug('Subject:' + c.Subject + 'Case Id: ' + c.Id + ' Account Id: ' + c.AccountId);
}

for (Opportunity o : opps) {
    o.StageName = 'Closed Lost';
    System.debug('Opportunity Name:' + o.Name + ' StageName:' + o.StageName + 'Opportunity Id: ' + o.Id);
}


update cases;

try{
    update opps;
} catch (Exception e) {
    System.debug('Error updating opportunities: ' + e.getMessage());
}

delete cases;
System.debug('Deleted ' + caseCounter + ' cases for account: ' + accounts[0].Name);
delete opps;
System.debug('Deleted ' + oppCounter + ' opps for account: ' + accounts[0].Name);
delete accounts;
System.debug('Deleted the account: ' + accounts[0].Name + ' ID: ' + accounts[0].Id);


System.debug('-------Delete completed for account: ' + accounts[0].Name + '----------------');
