public with sharing class OpportunityController {

    public OpportunityController() {
    }

    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getAllOpportunities() {
        return [SELECT Id, Name, StageName, CloseDate FROM Opportunity];
    }

    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunitiesByStage(String stageName) {
        return [SELECT Id, Name, StageName, CloseDate FROM Opportunity WHERE StageName = :stageName];
    }

    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunitiesByCloseDate(Date closeDate) {
        List<Opportunity> opps = Database.query('SELECT Id, Name, StageName, CloseDate FROM Opportunity WHERE CloseDate = ' + closeDate);
        return opps;
        
    }
    
}