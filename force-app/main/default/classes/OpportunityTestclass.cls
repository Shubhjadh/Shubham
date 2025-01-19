@isTest
public class OpportunityTestclass 
{
	@isTest
    public static void OpportunityTest()
    {
        
        Opportunity opp = new Opportunity(Name = 'Test Opportunity', StageName = 'Prospecting', CloseDate = Date.today());
        insert opp;
        
        // Step 2: Update the StageName to trigger Task creation
        opp.StageName = 'Qualification';
        update opp;
        
        // Verify that a Task was created
        Task createdTask = [SELECT Id, Subject, WhatId, Description FROM Task WHERE WhatId = :opp.Id LIMIT 1];
        System.assertEquals('Follow up task on 7th Jan', createdTask.Subject);
        System.assertEquals('Hello user!! Task is created', createdTask.Description);
        
        // Step 3: Update the StageName again to trigger Task update
        opp.StageName = 'Closed Won';
        update opp;
        
        // Verify that the existing Task was updated
        Task updatedTask = [SELECT Id, Subject, WhatId, Description FROM Task WHERE WhatId = :opp.Id LIMIT 1];
        System.assertEquals('Hello user!! Task is updated', updatedTask.Description);
    }
}