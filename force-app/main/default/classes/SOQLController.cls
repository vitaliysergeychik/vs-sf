public with sharing class SOQLController {
    public SOQLController() {
        //
    }
    public String name {
        get { return name;}
        set { name = value;}
    } 
    public PageReference query() {
        String qryString = 'SELECT Id FROM Contact WHERE ' +
            '(IsDeleted = false and Name like \'%' + name + '%\')';
        List<Contact> queryResult = Database.query(qryString);
        System.debug('query result is ' + queryResult);
        return null;
    }
 
    public string getFilter(){
        return 'Name like \'%test%\'';
    }
}
