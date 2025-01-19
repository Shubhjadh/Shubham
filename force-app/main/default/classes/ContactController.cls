public with sharing class ContactController 
{
    @AuraEnabled(cacheable=true)
    public static list<Account> AccountInformation()
    {
        return [Select Name,Id,Phone,Website,
                Industry from Account where Website != null with USER_MODE];
    }
}