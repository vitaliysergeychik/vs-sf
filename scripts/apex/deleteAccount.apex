List<Account> accounts = [SELECT Id, Name FROM Account LIMIT 1];

List<Case> cases = [SELECT Id, AccountId FROM Case WHERE AccountId = :accounts[0].Id];

for (Account acc : accounts) {
        delete acc;
}
