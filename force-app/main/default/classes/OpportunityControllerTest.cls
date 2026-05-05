@isTest
private class OpportunityControllerTest {

    @TestSetup
    static void setupOpportunities() {
        List<Opportunity> opps = new List<Opportunity>{
            new Opportunity(Name = 'Opportunity One', StageName = 'Prospecting', CloseDate = Date.today().addDays(30)),
            new Opportunity(Name = 'Opportunity Two', StageName = 'Qualification', CloseDate = Date.today().addDays(45)),
            new Opportunity(Name = 'Opportunity Three', StageName = 'Prospecting', CloseDate = Date.today().addDays(60))
        };
        insert opps;
    }

    @isTest
    static void testConstructorCreatesInstance() {
        OpportunityController controller = new OpportunityController();
        System.assertNotEquals(null, controller, 'Expected OpportunityController constructor to create an instance');
    }

    @isTest
    static void testGetAllOpportunities() {
        Test.startTest();
        List<Opportunity> opportunities = OpportunityController.getAllOpportunities();
        Test.stopTest();

        System.assertNotEquals(null, opportunities, 'Expected getAllOpportunities to return a list');
        System.assert(opportunities.size() >= 3, 'Expected at least three opportunities returned');
        Set<String> names = new Set<String>();
        for (Opportunity opp : opportunities) {
            names.add(opp.Name);
            System.assertNotEquals(null, opp.StageName, 'Expected StageName to be returned');
            System.assertNotEquals(null, opp.CloseDate, 'Expected CloseDate to be returned');
        }
        System.assert(names.contains('Opportunity One'), 'Expected Opportunity One to be included');
        System.assert(names.contains('Opportunity Two'), 'Expected Opportunity Two to be included');
        System.assert(names.contains('Opportunity Three'), 'Expected Opportunity Three to be included');
    }

    @isTest
    static void testGetOpportunitiesByStageReturnsMatches() {
        Test.startTest();
        List<Opportunity> opportunities = OpportunityController.getOpportunitiesByStage('Prospecting');
        Test.stopTest();

        System.assertEquals(2, opportunities.size(), 'Expected two opportunities with the Prospecting stage');
        for (Opportunity opp : opportunities) {
            System.assertEquals('Prospecting', opp.StageName, 'Expected opportunity stage to match the requested filter');
        }
    }

    @isTest
    static void testGetOpportunitiesByStageReturnsNoMatches() {
        Test.startTest();
        List<Opportunity> opportunities = OpportunityController.getOpportunitiesByStage('Closed Won');
        Test.stopTest();

        System.assertEquals(0, opportunities.size(), 'Expected no opportunities returned for a stage with no matching records');
    }
}