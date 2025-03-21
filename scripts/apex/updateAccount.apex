List<Account> accounts = [SELECT Id, Name, Industry FROM Account Name LIMIT 100];

List<String> countries = new List<String>{'USA', 'Germany', 'France', 'Spain', 'England', 'Italy', 'Canada', 'Mexico', 'Brazil', 'Argentina'};
for (Account a : accounts) {
    Integer randomIndex = Math.floor(Math.random() * countries.size()).intValue();
    a.BillingCountry = countries[randomIndex];
    System.debug('Account Name: ' + a.Name + ' Account Id: ' + a.Id + ' Billing Country: ' + a.BillingCountry);
}

List<String> industry = new List<String>{'Textile', 'Other', 'Construction', 'Automotive', 'Healthcare', 'Finance', 'Manufacturing', 'Retail', 'Technology'};
for (Account a : accounts) {
    Integer randomIndex = Math.floor(Math.random() * industry.size()).intValue();
    a.BillingCountry = industry[randomIndex];
    System.debug('Account Name: ' + a.Name + ' Account Id: ' + a.Id + ' Industry: ' + a.Industry);
}


update accounts;


System.debug('-------Update completed for accounts----------------');