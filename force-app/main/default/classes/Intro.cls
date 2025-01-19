public class Intro 
{
	Public static void updateRelatedContactPhone(list<Account> Acc,map<Id,Account> oldmap)
    {
        Map<Id,Account> Map1 = new Map<Id,Account>();
        for(Account Acc1 : Acc)
        {
            if(Acc1.Phone != null && Acc1.Phone != oldmap.get(Acc1.Id).Phone)
            {
                Map1.put(Acc1.Id,Acc1);
            }
        }
        
        if(Map1.isEmpty())
        {
            return;
        }
        
        list<Contact> Con = [Select Name,Id,AccountId,Phone from Contact where AccountId IN :Map1.keyset()];
        for(Contact Con1 : Con)
        {
            if(Map1.ContainsKey(Con1.AccountId))
            {
                Con1.Phone = Map1.get(Con1.AccountId).Phone;
            }
        }
    }
}