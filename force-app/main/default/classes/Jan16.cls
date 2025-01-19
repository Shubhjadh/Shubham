public with sharing class Jan16 
{
   @AuraEnabled(Cacheable=true)
   public static list<Account> AccountInformation()
   {
      return [Select Name,Id,Phone,rating from Account where rating != null AND Name like 'Test%' With USER_MODE];
   }
}