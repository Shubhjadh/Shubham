public class CaseTriggerHandler 
{
    /*public static void caseNumberOnAccount(list<Case> Case1)
    {
        map<Id,Case> Maplist = new map<Id,Case>();
        list<Account> Acclist = new list<Account>();
        for(Case case2 : Case1)
        {
            Maplist.put(Case2.Id,Case2);
        }
        
        list<Account> Acc1 = [Select Name,ID from Account Where Id In :Maplist.Keyset()];
        
            for(Account AccNew : Acc1)
            {
                if(Maplist.ContainsKey(AccNew.Id))
                {
					
                    AccNew.Latest_Case_Number__c = Decimal.valueOf(Maplist.get(AccNew.Id).CaseNumber);
                    Acclist.add(AccNew);
                }
            }
        
        if(!Acclist.isEmpty())
        {
            update Acclist;
        }
        
    }*/
    
     public static void updateAccountCaseNumbers(List<Case> cases) {
        // Map to store Account Id and the corresponding latest Case Number
        Map<Id, String> accountCaseNumbers = new Map<Id, String>();

        for (Case cs : cases) {
            if (cs.AccountId != null) {
                accountCaseNumbers.put(cs.AccountId, cs.CaseNumber);
            }
        }

        if (!accountCaseNumbers.isEmpty()) {
            List<Account> accountsToUpdate = new List<Account>();

            for (Id accountId : accountCaseNumbers.keySet()) {
                accountsToUpdate.add(new Account(
                    Id = accountId,
                    Latest_Case_Number__c = Decimal.valueOf(accountCaseNumbers.get(accountId)
                )));
            }

            if (!accountsToUpdate.isEmpty()) {
                update accountsToUpdate;
            }
        }
    }
}