public with sharing class AccountDeatails
 {
    @AuraEnabled(cacheable=true)  //enable clieny side caching  ,@AuraEnabled --method should be @AuraEnabled
    public Static list<Account> AccountInfo()    //method must be public or globle & Static
    {
        return [Select Name,Id,Phone,Industry,Rating 
                from Account where Rating != null with USER_MODE]; //user_mode -using apex for security  purpose
    }
}