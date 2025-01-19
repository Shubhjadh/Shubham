@isTest
public class AccountCreatorTest 
{
  @isTest
    static void testUpdateOpportunityStage() {
        // Create a test account
        Account testAccount = new Account(Name = 'Test Account', CloseAllOpp__c = false);
        insert testAccount;

        // Create related opportunities
        Opportunity opp1 = new Opportunity(Name = 'Opportunity 1', AccountId = testAccount.Id, 
                                            StageName = 'Qualification', Probability = 80, 
                                            CloseDate = Date.today().addDays(30));
        Opportunity opp2 = new Opportunity(Name = 'Opportunity 2', AccountId = testAccount.Id, 
                                            StageName = 'Needs Analysis', Probability = 50, 
                                            CloseDate = Date.today().addDays(30));
        insert new List<Opportunity>{opp1, opp2};

        // Update the account and set the checkbox to true
        testAccount.CloseAllOpp__c = true;
        update testAccount;

        // Query updated opportunities
        List<Opportunity> updatedOpportunities = [SELECT StageName, Probability 
                                                   FROM Opportunity 
                                                   WHERE AccountId = :testAccount.Id];

        // Assert changes
        for (Opportunity opp : updatedOpportunities) {
            if (opp.Probability >= 70) {
                System.assertEquals('Prospecting', opp.StageName, 'Opportunity stage should be updated to "Prospecting".');
            } else {
                System.assertNotEquals('Prospecting', opp.StageName, 'Opportunity stage should not be updated.');
            }
        }
    }
}