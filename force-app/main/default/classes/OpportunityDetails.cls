public with sharing class OpportunityDetails 
{
    @AuraEnabled(cacheable=true)
    public static list<Opportunity> OpportunityInformation()
    {
        return [select Name,Id,StageName,Phone__c from Opportunity
                 With USER_MODE];
    }
}