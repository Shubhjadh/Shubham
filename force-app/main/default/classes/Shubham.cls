public class Shubham 
{
    public static void UpdateRelatwdOpp(list<Account> Acc,Map<Id,Account> oldmap)
    {
        Map<id,Account> Maplist = new Map<id,Account>();
        list<Opportunity> OppNew = new list<Opportunity>();
        for(Account Acc1 : Acc)
        {
            if(Acc1.Rating != oldmap.get(Acc1.id).Rating && oldmap != null)
            {
                Maplist.put(Acc1.Id,Acc1);
            }
        }
        
        for(Opportunity Opp1 : [Select Name,ID,AccountId,StageName from Opportunity where AccountId =:Maplist.Keyset()])
        {
            if(Maplist.ContainsKey(Opp1.AccountId))
            {
                if(Opp1.StageName == 'Prospecting')
                {
                    Opp1.StageName = 'Qualification';
                }
                else
                {
                    Opp1.StageName = 'Perception Analysis';
                }
                OppNew.add(Opp1);
            }
        }
        
        update OppNew;
    }
}