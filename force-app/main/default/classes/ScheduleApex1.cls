global class ScheduleApex1 implements Schedulable
{
	global void execute(SchedulableContext ctx)
   {
       
       list<Account> Acc = [Select Name,Id,Phone from Account where Phone != null];
       map<Id,Account> Maplist = new map<Id,Account>();
       list<Contact> Conlist = new list<Contact>();
       
       if(!Acc.isEmpty())
       {
           for(Account Acc1 : Acc)
           {
               Maplist.put(Acc1.Id,Acc1);
           }
       }
       
       if(!Maplist.isEmpty())
       {
           for(Contact Con1 : [Select Name,Phone,AccountId from Contact where AccountId In : Maplist.Keyset()])
           {
               if(Maplist.ContainsKey(Con1.AccountID))
               {
                   Con1.Phone = Maplist.get(Con1.AccountId).Phone;
                   Conlist.add(Con1);
               }
           }
           
           if(!Conlist.isEmpty())
           {
               update Conlist;
           }
       }
   }
}