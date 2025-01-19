public class Llmn 
{
   /* Create apex classon accout where Account phone  is updated then update related Contact & opportunity Phone*/
     public static void Method1()
     {
      list<Account> Acc = [Select Name,Id,Phone,(Select Name,Phone from Contacts),
                           (Select Name,Phone__c from Opportunities) from Account where Phone != null];
      
      list<Contact> Con = new list<Contact>();
      list<opportunity> opp = new list<opportunity>();
      
      if(!Acc.isEmpty())
      {
         for(Account Acc1 : Acc)
         {
            if(Acc1.contacts.size() > 0)
            {
                  for(Contact Con1 : Acc1.Contacts)
                  {
                     Con1.Phone = Acc1.Phone;
                     Con.add(Con1);
                  }
            }

            if(Acc1.Opportunities.size()>0)
            {
               for(Opportunity Opp1 : Acc1.Opportunities)
               {
                  Opp1.Phone__c = Acc1.Phone;
                  Opp.add(Opp1);
               }
            }
         }

         try
         {
            if(!Con.isEmpty())
            {
               update Con;
            }

            if(!Opp.isEmpty())
            {
               update Opp;
            }
         }
         catch(DmlException e) 
         {
            system.debug(e.getMessage());
         }

      }
     }

     public static void Method2()
     {
      list<Account> Acc = [Select Name,Id,Phone,rating,(Select Name,Description from Contacts),
                           (Select Name,Description from Opportunities) from Account where rating != null];

      list<Contact> Con = new list<Contact>();
      list<Opportunity> Opp = new list<Opportunity>();

      if(!Acc.isEmpty())
      {
         for(Account Acc1 : Acc)
         {
               if(Acc1.Contacts.isEmpty())
               {
                  Contact ConList = new Contact();
                  ConList.FirstName = 'Bella';
                  ConList.LastName = 'Games';
                  ConList.AccountId = Acc1.Id;
                  ConList.Description =  Acc1.rating;
                  Con.add(ConList);
                  
               }
               else
               {
                  for(Contact Con1 : Acc1.Contacts)
                  {
                     Con1.Description =  Acc1.rating;
                     Con.add(Con1);
                  }
               }


               if(Acc1.Opportunities.isEmpty())
               {
                  Opportunity OppList = new  Opportunity();
                  OppList.Name = 'Bella';
                  OppList.AccountId = Acc1.Id;
                  OppList.Description =  Acc1.rating;
                  Opp.add(OppList);
                  
               }
               else
               {
                  for(Opportunity Opp1 : Acc1.Opportunities)
                  {
                     Opp1.Description =  Acc1.rating;
                     Opp.add(Opp1);
                  }
               }
            
         }

         upsert Con;
         upsert Opp;
      }
   }

      

      public static void Method4()
      {
         List<Task> Task1 = new list<Task>();
         list<Opportunity> Opp = [Select Name,Id,OwnerId from Opportunity where Name like '%ex%'];
         if(Opp.Size()>0)
         {
            for(Opportunity Opp1 : Opp)
            {
               Task T1 = new Task();
               T1.Subject = 'Task is created when Opportunity name like %ex%';
               T1.Priority = 'Low';
               T1.WhatId = Opp1.Id;
               T1.OwnerId =  Opp1.OwnerId;
               Task1.add(T1);
            }
            insert Task1;
         }
      }

      public static void updatedRelatedContact()
      {
         list<Account> Acc = new list<Account>();
         set<Id> SetId = new set<Id>();
         for(Account Acc1 : Acc)
         {
            if(Acc1.Website != null)
            {
               SetId.add(Acc1.Id);
            }
         }

         list<Contact> Con =  [Select  Name,AccountId,Fax from Contact where AccountId In :SetId];
         list<Contact> Con12 = new list<Contact>(); 
      
            if(!Con.isEmpty())
            {
               {
                  Contact ConList1 = new Contact();
                  for(Contact Con1 : Con)
                  {
                     
                     ConList1.Id = Con1.Id;
                     ConList1.Fax = Con1.Account.Website;
                     Con12.add(Conlist1);
                  }
               }
               
            }
            else if(Con.isEmpty())
            {
               for(Account Acc2 : Acc)
               {
                  Contact NewCon = new Contact();
                  NewCon.accountId =  Acc2.id;
                  NewCon.Fax = Acc2.Website;
                  Con12.add(NewCon);
               }
            }

            upsert Con12;

         }

         public static void Methods()
         {
            list<Account> Acc = [Select Name,Id,Website,(Select Name,Fax from Contacts) from Account where website != null];
            if(!Acc.isEmpty())
            {
               for(Account Acc1 : Acc)
               {
                  if(Acc1.Contacts.size()>0)
                  {
                     for(Contact Con1 : Acc1.Contacts)
                     {
                        
                     }

                  }
                  else if(Acc1.Contacts.size()>0)
                  {

                  }
               }
            }

         }
    
    public static void UpdateRealtedCon(list<Account> Acc)
    {
        set<id> Setid = new set<Id>();
        for(Account Acc1 : Acc)
        {
            if(Acc1.Website != null)
            {
                setid.add(Acc1.id);
            }
        }
        
        list<Contact> Con = [Select FirstName,Id,AccountId from Contact where AccountId In :setId];
        for(Contact Con1 : Con)
        {
            
        }
    }
    
    public void Method50()
    {
        list<list<sObject>> L1 = [FIND 'Piyusha' IN ALL FIELDS RETURNING Account(NAme),Contact(Name)];
        list<Account> Acc = new list<Account>();
        list<Contact> Con = new list<Contact>();
        
        Acc = (list<Account>) L1[0];
        Con = (list<Contact>) L1[1];
        
        for(Account Acc1 : Acc)
        {
            system.debug('Account NAme '+ Acc1.Name);
        }
        
        for(Contact Con1 : Con)
        {
            system.debug('Contact Name'+ Con1.Name);
        }
    }
        

}