public class ContactTriggerHandler 
{
    /*Public static void BeforeInsert(List<Contact> ConList)
    {
        // Create a set to store the Account IDs being processed
    Set<Id> accountIds = new Set<Id>();
    

    // Collect the Account IDs from the incoming Contact records
    for (Contact c : ConList) {
        if (c.AccountId != null) {
            accountIds.add(c.AccountId);
        }
    }

    // Query existing contacts related to those Account IDs
    Map<Id, Integer> accountContactCount = new Map<Id, Integer>();
    for (AggregateResult ar : [
        SELECT AccountId, COUNT(Id) totalCount
        FROM Contact
        WHERE AccountId IN :accountIds
        GROUP BY AccountId
    ]) {
        accountContactCount.put((Id)ar.get('AccountId'), (Integer)ar.get('totalCount'));
    }

    // Check each Contact being inserted
    for (Contact c : ConList) {
        if (c.AccountId != null) {
            // Get the current count of related contacts
            Integer currentCount = accountContactCount.get(c.AccountId);
            if (currentCount == null) {
                currentCount = 0; // No existing contacts
            }
            // If there are already 2 contacts, add an error
            if (currentCount >= 2) {
                c.addError('You cannot add more than 2 contacts to this account.');
            }
        }
    }
    }*/

    /*Not allow creation of contact if Related account is not there 
    public static void errorOnCon(list<Contact> Con)
    {
        for(Contact ConList : Con)
        {
            if(ConList.AccountId == Null)
            {
                ConList.addError('we are able to create record because Parent Account is not there');
            }
        }
    }*/
    
    /*public static void Method2(list<Contact> Conma)
    {
        Map<Id,Contact> MapList = new Map<id,Contact>();
    for(Contact Con1 : Conma)
    {
        MapList.put(Con1.Id,Con1);
    }
    
    if(!MapList.isEmpty())
    {
        list<Opportunity> OppList = [Select Name,Id,AccountId from Opportunity where AccountId IN :MapList.KeySet()];
        list<Opportunity> OppFinal = new list<Opportunity>();
        for(Opportunity Opp1 : OppList)
        {
            if(MapList.ContainsKey(Opp1.Accountid))
            {
                Opp1.Email__c =  MapList.get(Opp1.AccountId).Email;
                OppFinal.add(Opp1);
            }
            
        }
        
        update OppFinal;
    }
    }*/
    
    /*public static void Method1(list<Contact> Con)
    {
        list<Contact> ExistingCon = [Select LastName,Id,Phone,Email from Contact];
        for(Contact Conlist : Con)
        {
            for(Contact TotalCon : ExistingCon)
            {
                if(Conlist.Lastname == TotalCon.LastName && Conlist.Email == TotalCon.Email && Conlist.Phone == TotalCon.Phone)
                {
                    Conlist.addError('Duplicate Found');
                }
            }
        }
    }*/
    
   /*public static void Method12345(list<Contact> Con)
   {
       set<Id> AccID = new set<Id>();
       for(Contact Con1 : Con)
       {
           if(Con1.AccountID != null)
           {
               AccId.add(Con1.AccountId);
           }
       }
       
       map<ID,Integer> Maplist = new map<ID,Integer>();
      list<AggregateResult> ContactCounts = [Select count(Id) ContactCount,AccountId from Contact Where AccountId In :AccID group by AccountId];
      for(AggregateResult Aggres : ContactCounts)
      {
          Maplist.put((Id)Aggres.get('AccountId'), (Integer)Aggres.get('contactCount'));
      }
       
       for(Contact ConNew : Con)
       {
           if(ConNew.AccountId != null && Maplist.get(ConNew.AccountId) > 2)
           {
               ConNew.addError('Not allowed');
           }
       }
   }*/
    
    public static void ContactValue(list<Contact> Con1)
    {
        set<Id> SetId = new set<Id>();
        if(!Con1.isEmpty())
        {
            for(Contact ConNew : Con1)
            {
                SetId.add(ConNew.AccountId);
            }
        }
        
        if(!SetId.isEmpty())
        {
            list<Account> Acc1 = [Select Name,Id from Account where Id IN :SetId];
            for(Account Acc2 : Acc1)
            {
                
            }
        }
    }
    
}