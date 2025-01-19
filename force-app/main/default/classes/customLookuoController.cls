public with sharing class customLookuoController
{
    @AuraEnabled(cacheable=true)
    public static list<sObject> searchRecord(String ObjectName,String SearchText)
        {
            list<sObject> sObjectList = new list<sObject>();
            if(string.isNotBlank(SearchText))
            {
                string Key = '%'+SearchText+'%';
                string queryString = 'Select Name,Id from' + ObjectName + 'where Name like : key';
                sObjectList = database.query(queryString,AccessLevel.USER_MODE);
            }
            return sObjectList;
        }
    
}