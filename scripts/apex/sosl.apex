Contact c = new Contact(LastName = 'Smith');
insert c;

Lead l = new Lead(LastName = 'Smith', Company = 'Acme Corp');
insert l;

List<List<sObject>> results = [FIND 'Smith' IN ALL FIELDS RETURNING Contact(Id, LastName), Lead(Id, LastName)];
System.debug('Search Results: ' + results);