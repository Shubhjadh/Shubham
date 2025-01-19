public class OpportunityLineItemTriggerHander
{
    //count of OpportunityLineItem related to Opportunity display the count on Account custom field:
	public static void Method75(list<OpportunityLineItem> Oli)
    {
      set<Id> SetId = new set<Id>();
      map<Id,Integer> Maplist = new map<Id,Integer>();
      list<Account> Accnew = new list<Account>();
        
        //total Opportunitylistitem
      if(!Oli.isEmpty())
        {
            for(OpportunityLineItem Olilist : Oli)
            {
                SetId.add(Olilist.OpportunityId);
            }
        }
        //Ooortno]itylistitem connect with Opportunity(Opp.Accountid,totalcount(oli))
        if(!SetId.isEmpty())
        {
            list<Opportunity> Opplist = [Select Id,AccountId from Opportunity where Id In :SetId];
            if(!Opplist.isEmpty())
            {
                for(Opportunity Opp1 : Opplist)
                {
                    Maplist.put(Opp1.AccountId,0);
                }
            }
            
            
            for(AggregateResult Aggr : [Select count(Id) olis,opportunity.AccountId from OpportunityLineItem
                                       where opportunity.AccountId In : Maplist.Keyset() group by opportunity.AccountId])
            {
                Maplist.put((Id) Aggr.get('Accountid'),(Integer) Aggr.get('olis'));
            }
            
            for(Id Accid : Maplist.Keyset())
            {
                Account Acc = new Account();
                Acc.Id = Accid;
                Acc.NumberOfEmployees = Maplist.get(Accid);
                AccNew.add(Acc);
            }
        }
        
        update AccNew;
        
    }
    
    
    public static void CreateAssetRecord(list<OpportunityLineItem> Oli)
    {
        Set<Id> SetId = new Set<Id>();
        list<Asset> Assetlist = new list<Asset>();
        
        if(!Oli.isEmpty())
        {
            for(OpportunityLineItem Olilist : Oli)
            {
                SetId.add(Olilist.OpportunityId);
            }
        }
        
        if(!SetId.isEmpty())
        {
            list<Opportunity> OppNew = [Select Name,AccountId,id,Account.Name from Opportunity  where Id In :SetId];
            if(!OppNew.isEmpty())
            {
                for(Opportunity Opp1 : OppNew)
                {
                   if(Opp1.AccountId != null)
                   {
                       Asset AssetObj = new Asset();
                       AssetObj.Name = Opp1.Account.Name + '45';
                       AssetObj.AccountId = Opp1.AccountId;
                       Assetlist.add(AssetObj);
                   }
                }
            }
        }
        
        try
        {
              insert Assetlist;
        system.debug('updated succesfully');
        }
        catch(exception e)
        {
            system.debug(e.getMessage());
        }
      
        
        
        
    }
}