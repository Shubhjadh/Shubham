@istest
public class TestClass 
{
    @isTest
    public static void testPreventContactCreationWithoutAccount() 
    {
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;

        // Create test Opportunity related to the Account
        Opportunity testOpportunity = new Opportunity(
            Name = 'Test Opportunity',
            AccountId = testAccount.Id,
            CloseDate = System.today(),
            StageName = 'Prospecting'
        );
        insert testOpportunity;

        // Create test OpportunityLineItem related to the Opportunity
        Product2 testProduct = new Product2(Name = 'Test Product', IsActive = true);
        insert testProduct;
        
        List<Asset> createdAssets = [SELECT Name, AccountId FROM Asset WHERE AccountId = :testAccount.Id];
        System.assertEquals(1, createdAssets.size(), 'One Asset should be created');
    }
}