public class BatchableApex implements Database.batchable<sObject>
{
    public static database.queryLocator start(Database.BatchableContext bc)
    {
        return database.getQuerylocator([SELECT Id, Name, 
       	(SELECT Id, Name, StageName, Phone__c 
        FROM Opportunities 
        WHERE Id != null)
FROM Contact
WHERE Id IN (SELECT ContactId FROM Opportunity WHERE ContactId != null)]);
    }
    
    public void execute(Database.BatchableContext bc,list<contact> Conlist)
    {
        
    }
    
    public void finish(Database.BatchableContext bc)
    {
        
    }
}