// File: /Users/vitaliy.sergeychik/repo/vs-sf/scripts/apex/createContacts.apex

Contact dummyContact = new Contact(
    FirstName = 'John',
    LastName = 'Doe',
    Email = 'john.doe@example.com',
    Phone = '123-456-7890'
);

insert dummyContact;

System.debug('Dummy contact created with Id: ' + dummyContact.Id);