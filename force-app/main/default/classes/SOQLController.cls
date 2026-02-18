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
    public void test1() {
		//Bad: getFilter function may return unescaped data (potentially from user input).
		String field1 = getFilter();
		String field2 = 'SELECT Id FROM Account WHERE ';
		Database.query(field2 + field1);
		
		//Good: the function result is cleaned
		String field3 = '\'' + String.escapeSingleQuotes(getFilter()) + '\'';
		String field4 = 'SELECT Id FROM Account WHERE isPublic = true and Id = ';
		Database.query(field4 + field3);
		
		//Good: better yet, use SOQL's built-in variable replacements
		String field5 = '123456';
		String field6 = 'SELECT Id FROM Account WHERE isPublic = true and Id = :field5';
		Database.query(field6);
	}		

    public string getFilter(){
        return 'Name like \'%test%\'';
    }
}