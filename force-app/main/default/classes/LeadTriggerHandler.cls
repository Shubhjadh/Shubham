public class LeadTriggerHandler 
{
	public static void AfterUpdate(list<Lead> LeadRec)
    {
        set<Id> AccountId = new Set<Id>();
        set<Id> ContactId = new Set<Id>();
        set<Id> OpportunityId = new Set<Id>();
        if(!LeadRec.isEmpty())
        {
            for(Lead L1 : LeadRec)
            {
                if(L1.IsConverted)
                {
                    if(L1.ConvertedAccountId != null)
                    {
                        AccountId.add(L1.ConvertedAccountId);
                    }
                    if(L1.ConvertedContactId != null)
                    {
                        ContactId.add(L1.ConvertedContactId);
                    }
                    if(L1.ConvertedOpportunityId != null)
                    {
                        OpportunityId.add(L1.ConvertedOpportunityId);
                    }
                }
            }
        }
            
            list<Account> AccUpdate = new list<Account>();
            if(!AccountId.isEmpty())
            {
                for(Account Acc1 : [Select Name,Id,Phone from Account where Id In :AccountId])
                {
                    Acc1.Phone = '9689968889';
                    AccUpdate.add(Acc1);
                }
            }
            
            list<Contact> ConUpdate = new list<Contact>();
            if(!ContactId.isEmpty())
            {
                for(Contact Con1 : [Select Name,Id,Fax from Contact where Id In :ContactId])
                {
                    Con1.Fax = Con1.Name + '@8889';
                    ConUpdate.add(Con1);
                }
            }
            
            list<opportunity> OppUpdate = new list<Opportunity>();
            if(!OpportunityId.isEmpty())
            {
                for(Opportunity Opp1 : [Select Name,StageName,Id from Opportunity where Id In :OpportunityId])
                {
                    Opp1.StageName = 'Prospecting';
                    OppUpdate.add(Opp1);
                }
            }
        
        if(!AccUpdate.isEmpty())
        {
            update AccUpdate;
        }
        if(!ConUpdate.isEmpty())
        {
            update ConUpdate;
        }
        if(!OppUpdate.isEmpty())
        {
            update OppUpdate;
        }
        }
    
}