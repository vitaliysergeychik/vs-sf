public with sharing class OpportunityController {
     
    public static void markOpportunityClosedWon(Id opportunityId) {
            Opportunity opp = [SELECT Id, StageName FROM Opportunity WHERE Id = :opportunityId LIMIT 1];
            opp.StageName = 'Closed Won';
            update opp;
        }

    public static void markOpportunityClosedLost(Id opportunityId) {
            Opportunity opp = [SELECT Id, StageName FROM Opportunity WHERE Id = :opportunityId LIMIT 1];
            opp.StageName = 'Closed Lost';
            update opp;
        }
    
    

}