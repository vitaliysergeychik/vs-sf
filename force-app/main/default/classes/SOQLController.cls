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
		String field1 = '\'' + String.escapeSingleQuotes(getSomeId()) + '\'';
		String field2 = 'SELECT Id FROM Account WHERE isPublic = true and Id = ';
		Database.query(field2 + field1);
		
		//Good: better yet, use SOQL's built-in variable replacements
		String field1 = getSomeID();
		String field2 = 'SELECT Id FROM Account WHERE isPublic = true and Id = :field1';
		Database.query(field2);
	}		
}
