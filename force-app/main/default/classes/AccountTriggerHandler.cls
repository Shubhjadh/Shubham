public class AccountTriggerHandler 
{
	/*public static void BeforeInsert(list<Account> Acc)
    {
        for(Account Acc1 : Acc)
        {
            if(Acc1.Type != null && Acc1.Industry == 'Chemicals')
            {
                Acc1.Website = Acc1.type + Acc1.industry + '@45';
            }
        }
    }

    public static void Afterinsert(List<Account> Acc)
    {
        list<Contact> Con = new list<Contact>();

        for(Account Acc1 : Acc)
        {
           if(Acc1.Website != null)
           {
            Contact Con1 = new Contact();
            Con1.FirstName = Acc1.Name;
            Con1.LastName = 'Bhosale';
            Con1.AccountId =  Acc1.Id;
            Con.add(Con1);
           }
            
        }

    
            insert Con;    
        
    }

    public static void BeforeUpdate(list<Account> Acc,map<Id,Account> Oldmap)
    {
        for(Account Acc1 : Acc)
        {
            if(Oldmap != null && Acc1.Website != Oldmap.get(Acc1.Id).Website && 
               Acc1.Phone != Oldmap.get(Acc1.Id).Phone &&
               Acc1.Fax != Oldmap.get(Acc1.Id).Fax)
               {
                Acc1.Rating = 'Warm';
               }
        }
    }

    public static void AfterUpdate(list<Account> Acc,Map<Id,Account> Oldmap)
    {
        map<Id,Account> MapInfo = new map<Id,Account>();
        list<opportunity> OppList = new list<Opportunity>();
        list<opportunity> OppFinal = new list<Opportunity>();

        for(Account Acc1 : Acc)
        {
            if(Oldmap != null && Acc1.Phone != Oldmap.get(Acc1.id).Phone)
            {
                MapInfo.put(Acc1.Id,Acc1);
            }
        }

        OppList = [Select Name,Id,AccountId,Phone__c from Opportunity where AccountId IN :MapInfo.KeySet()];
        for(Opportunity Opp1 : OppList)
        {
            Opportunity Opp = new Opportunity();
            if(MapInfo.ContainsKey(Opp1.AccountId))
            {
                Opp.Id =  Opp1.Id;
                Opp.Phone__c = MapInfo.get(Opp1.AccountId).Phone;
                OppFinal.add(Opp);
            }
        }

        update OppFinal;
    }

    /*if rating is warm then don't allow to delete record
    public static void BeforeDelete(list<Account> Acc)
    {
        for(Account Acc1 : Acc)
        {
            if(Acc1.Rating == 'Warm')
            {
                Acc1.addError('If rating is Warm then we will not deleting record if wants to delete then change rating');
            }
        }
    }

    /*Account rating is updated then updateemployee Phone
    public static void UpdateEmpPosition(list<Account> Acc,Map<Id,Account> Oldmap)
    {
        
        List<Employee__c> employeesToUpdate = new List<Employee__c>();
        Set<Id> EmpList = new Set<Id>();

        for (Account Acc1 : Acc) 
        {
        
            if (Acc1.Rating != oldmap.get(Acc1.Id).Rating) 
            {
                EmpList.add(Acc1.Id);
            }
        }

        for(Employee__c EmpList1 : [SELECT Id, Name, Account__c, Phone__c FROM Employee__c where Account__c  IN :EmpList])
        {
            EmpList1.Phone__c =  '987653345';
            employeesToUpdate.add(EmpList1);
        }

    
        if (!employeesToUpdate.isEmpty()) {
            update employeesToUpdate;
        }
        
        
    }


    /*Accounts Phone & Rating is blank then create related Contact
    public static void CreateCon(list<Account> Acc)
    {
        list<Contact> ConList = new list<Contact>();
        for(Account Acc1 : Acc)
        {
            if(Acc1.Phone == null && Acc1.Rating == null)
            {
                Contact Con1 = new Contact();
                Con1.FirstName = Acc1.Name + 'Ji';
                Con1.LastName = 'Gupta';
                Con1.AccountId =  Acc1.Id;
                ConList.add(Con1);
            }
        }

        if(Acc.Size()>0)
        {
            insert ConList;
        }
    }

    /*Account phone is updated then update contact phone
    public static void updateContact(list<Account> Acc,map<Id,Account> Oldmap)
    {
        list<Account> AccList = new list<Account>();
        Map<Id,Account> MapList = new Map<Id,Account>();
        list<Contact> ConList = new list<Contact>();

        for(Account Acc1 : Acc)
        {
            if(Acc1.Phone != oldmap.get(Acc1.Id).Phone && Oldmap != null)
            {
                AccList.add(Acc1);
                MapList.put(Acc1.Id,Acc1);
            }
        }

        for(Contact Con1 : [Select Name,Id,AccountId from Contact where AccountId In :MapList.KeySet()])
        {
            Contact Con = new Contact();
            if(MapList.ContainsKey(Con1.AccountId))
            {
                Con.Id = Con1.Id;
                Con.Phone = MapList.get(Con1.AccountId).Phone;
                ConList.add(Con);
            }
        }

        Update ConList;
    }
      
    
    
    public static void RealtedContact(list<Account> Acc,Map<Id,Account> Oldmap)
    {
        map<Id,Account> MapList = new map<Id,Account>();
        Set<Id> SetId = new set<Id>();
        list<Contact> ConList = new list<Contact>();

        for(Account Acc1 : Acc)
        {
            if(Oldmap != null && Acc1.Phone != oldmap.get(Acc1.Id).Phone)
            {
                MapList.put(Acc1.Id,Acc1);
                SetId.add(Acc1.Id);
            }
        }

        for(Contact Con1 : [Select Name,AccountId from Contact where AccountId IN :MapList.KeySet()])
        {
            Contact ConL1 = new Contact();
            if(MapList.ContainsKey(ConL1.AccountId))
            {
                ConL1.Id = Con1.Id;
                ConL1.MobilePhone = MapList.get(Con1.AccountId).Phone;
                ConList.add(ConL1);
            }
            

        }

        update ConList;

        for(Contact Con2 :[Select Name,AccountId from Contact where AccountId  =:SetId])
        {

        }
    }

    public static void UpdateRelatedContact1(list<Account> Acc,map<Id,Account> oldmap)
    {
        Mp<Id,Account> MapList = new Mp<Id,Account>();
        list<Contact> Con = new list<Contact>();

        for(Account Acc1 : Acc)
        {
            if(oldmap != null && Acc1.Phone != oldmap.get(Acc1.id).Phone)
            {
                MapList.put(Acc1.Id,Acc1);
            }
        }

        Con = [Select Name,Accountid From Contact where AccountId In :MapList.keySet()];
        for(Contact Con1 : Con)
        {
            if(Maplist.ContainsKey(Con1.AccountId))
            {
                
            }
        }

    }*/

    //Account phone is updatedx then update related contact phone
    /*public static void updateRelatedCon(list<Account> Acc,map<Id,Account> oldmap)
    {
        map<Id,Account> mapId = new map<Id,Account>();
        list<Contact> Conlist = new list<Contact>();

        for(Account Acc1 : Acc)
        {
            if(oldmap != null && Acc1.Phone != oldmap.get(Acc1.Id).Phone)
            {
                MapId.put(Acc1.Id,Acc1);
            }
        }

        for(Contact Con1 : [Select Name,Id,AccountId,Phone from Contact where AccountId In :Mapid.keyset()])
        {
            if(MapId.ContainsKey(Con1.AccountId))
            {
                Contact Con2 = new Contact();
                Con2.Id =  Con1.Id;
                Con2.Phone =  Mapid.get(Con1.AccountId).Phone;
                ConList.add(Con2);

            }
        }

        update ConList;
    }*/
//or   

    /*public static void updateConPhone1(list<Account> Acc,map<Id,Account> oldmap)
    {
        Map<Id,Account> MapInfo = new map<Id,Account>();
        list<Contact> ConList = new list<Contact>();
        for(Account Acc1 : Acc)
        {
            if(Acc1.Phone != null && Acc1.Phone != Oldmap.get(Acc1.Id).Phone)
            {
                MapInfo.put(Acc1.Id,Acc1);
            }
        }

        list<Contact> Con = [Select Name,Id,AccountId,Phone from Contact where AccountId In :MapInfo.KeySet()];
        if(!Con.isEmpty())
        {
            for(Contact Con1 : Con)
            {
                if(MapInfo.ContainsKey(Con1.AccountId))
                {
                    Con1.Phone = MapInfo.get(Con1.Accountid).Phone;
                    Conlist.add(Con1);
                }
            }

            update Conlist;
        }
    }*/

    //Don't allow for creation if duplicated Account (Name)
/*public static void throwErrorOnDuplicateName(List<Account> Acc)
{
    set<String> SetName = new set<String>();
    for(Account Acc1 : Acc)
    {
        if(Acc1.name != null)
        {
            SetName.add(Acc1.Name.toLowerCase());
        }
    }

    map<String,Id> Maplist = new map<String,Id>();
    for(Account oldAcc : [Select Name,Id from Account where Name In :SetName])
    {
        Maplist.put(oldAcc.Name,oldAcc.Id);
    }

    for(Account AccCompair : Acc)
    {
        if(maplist.ContainsKey(AccCompair.Name))
        {
            AccCompair.addError('Error occured');
        }
    }
}   */

/*public static void CreateContact(list<Account> Acc)
{
    map<Id,Account> Maplist  = new map<Id,Account>();
    list<Contact> Conlist = new list<Contact>();
   for(Account Acc1 : Acc)
   {
        if(Acc1.UpdateContact__c == true)
        {
            Maplist.put(Acc1.Id,Acc1);
        }
   }

   for(Contact Con1 : [Select Name,Id,Phone,AccountId from Contact where AccountId In : Maplist.Keyset()])
   {
    if(Maplist.ContainsKey(Con1.AccountId))
    {
        Con1.Phone = Maplist.get(Con1.AccountId).Phone;
        Conlist.add(Con1);
    }
   }

   update Conlist;
}*/

    //Account ralting is updated then on related opp stageName = 'Closed Won' then update to 'closed lost'
    /*public static void UpdateRelatwdOpp(list<Account> Acc)
    {
        map<Id,Account> Maplist = new map<Id,Account>();
        list<Opportunity> Opplist = new list<Opportunity>();
        for(Account Acc1 : Acc)
        {
            Maplist.put(Acc1.Id,Acc1);
        }
        
        for(Opportunity Opp1 : [Select Name,Id,StageName,AccountId,CloseDate from Opportunity where AccountId In :Maplist.Keyset()])
        {
            if(Opp1.StageName != 'Closed Won' && Opp1.CloseDate < system.today()-30)
            {
                Opp1.StageName = 'Closed Lost';
                Opplist.add(Opp1);
                
            }
        }
        
        update Opplist;
    }*/
    

    //Account Contact is updated then send mail to contact related Email
    /*public static void sendMailToRelatedContact(list<Account> Acc,map<id,Account> oldmap)
{
    map<Id,Account> mapNew = new map<Id,Account>();
    List<Messaging.SingleEmailMessage> emailsToSend = new List<Messaging.SingleEmailMessage>();
    
    for(Account Acc1 : Acc)
    {
        if(oldmap != null && Acc1.Phone != oldmap.get(Acc1.Id).phone)
        {
            MapNew.put(Acc1.Id,Acc1);
        }
    }
    
    for(Contact Con1 : [Select Name,AccountId,Email from Contact where AccountId In :Mapnew.KeySet()])
    {
        if(Mapnew.ContainsKey(Con1.AccountId))
        {
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                email.setToAddresses(new String[] { Con1.Email });
                    email.setSubject('Account Phone Number Updated');
                    email.setPlainTextBody(
                        'Dear Contact,\n\nThe phone number for the Account "' + MapNew.get(Con1.Accountid).Name +
                        '" has been updated to: ' + MapNew.get(Con1.Accountid).Phone + '.\n\nBest regards,\nYour Company'
                    );
                    emailsToSend.add(email);
        }
    }
    
    if (!emailsToSend.isEmpty()) 
    {
            Messaging.sendEmail(emailsToSend);
     }
}*/
    
   /* public static void updateAccountSalaryFields(Set<Id> newEmployeeIds, Set<Id> oldEmployeeIds) {
        // Set to store affected Account IDs
        Set<Id> accountIds = new Set<Id>();

        // Get Account IDs from the new Employee records
        if (newEmployeeIds != null) {
            for (Employee__c emp : [SELECT Account__c FROM Employee__c WHERE Id IN :newEmployeeIds]) {
                if (emp.Account__c != null) {
                    accountIds.add(emp.Account__c);
                }
            }
        }

        // Get Account IDs from the old Employee records
        if (oldEmployeeIds != null) {
            for (Employee__c emp : [SELECT Account__c FROM Employee__c WHERE Id IN :oldEmployeeIds]) {
                if (emp.Account__c != null) {
                    accountIds.add(emp.Account__c);
                }
            }
        }

        // Query Accounts and their related Employee salaries
        List<Account> accountsToUpdate = [
            SELECT Id, 
                   (SELECT Salary__c FROM Employees__r)
            FROM Account
            WHERE Id IN :accountIds
        ];

        // Update Min and Max Salary fields for each Account
        for (Account acc : accountsToUpdate) {
            Decimal minSalary = null;
            Decimal maxSalary = null;

            for (Employee__c emp : acc.Employees__r) {
                if (minSalary == null || emp.Salary__c < minSalary) {
                    minSalary = emp.Salary__c;
                }
                if (maxSalary == null || emp.Salary__c > maxSalary) {
                    maxSalary = emp.Salary__c;
                }
            }

            acc.Min_Salary_Con__c = minSalary;
            acc.Max_Salary_Con__c = maxSalary;
        }

        // Perform a bulk update for Accounts
        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
        }
    }*/
    
    /*public static void Method89(list<Account> Acc,map<Id,Account> oldmap)
    {
        set<Id> Ids = new set<Id>();
        list<Opportunity> Opplist = new list<Opportunity>();
        if(!Acc.isEmpty())
        {
            for(Account Acc1 : Acc)
            {
                if(Acc1.CloseAllOpp__c != oldmap.get(Acc1.Id).CloseAllOpp__c)
                {
                    Ids.add(Acc1.Id);
                }
            }
        }
        
        if(!Ids.isEmpty())
        {
            list<Opportunity> OppNew = [Select Name,StageName,AccountId,closeDate,Probability From Opportunity 
                                        where AccountId In : Ids AND StageName != 'Closed Won'
                                        AND Probability >= 70];
            
            for(Opportunity Opp1 : OppNew)
            {
                Opp1.StageName = 'Prospecting';
                Opplist.add(Opp1);
            }
        }
        
        update Opplist;
    }*/
    
    /*
    public static void updateRelatedOppStageName(list<Account> Acc,map<Id,Account> oldmap)
    {
        set<Id> SetId = new set<Id>();
        list<Opportunity> Opplist = new list<Opportunity>();
        if(!Acc.isEmpty())
        {
            for(Account Acc1 : Acc)
            {
                if(Acc1.CloseAllOpp__c == true && oldmap.get(Acc1.Id).CloseAllOpp__c ==  false && oldmap.containsKey(Acc1.Id))
                {
                    SetId.add(Acc1.id);
                }
            }
        }
        
        if(!SetId.isEmpty())
        {
            for(Opportunity Opp1 : [Select Name,StageName,Amount,AccountId,	Probability from Opportunity where AccountId In : SetId AND Probability > 55])
            {
                Opp1.StageName = 'Prospecting';
                Opplist.add(Opp1);
            }
        }
        
        if(!Opplist.isEmpty())
        {
            update Opplist;
        }
    }*/
    
    //If account phone is updated 'inactive' to 'active' then updated related Contact picklist &delete opportunity 
    /*public static void DeleteRelatedOppAndUpdateContact(list<Account> NewAcc,map<Id,Account> oldmap)
    {
        set<Id> AccountIds = new Set<Id>();
        if(!NewAcc.isEmpty())
        {
            for(Account Acc1 : NewAcc)
            {
                if(oldmap != null && Acc1.Status__c == 'Active' && oldmap.get(Acc1.Id).Status__c == 'Inactive')
                {
                    AccountIds.add(Acc1.Id);
                }
            }
        }
        
        list<Contact> Con10 = new list<Contact>();
        if(!AccountIds.isEmpty())
        {
            list<Contact> Conlist = [Select Name,Id,DonotContact__c,AccountId from Contact where AccountId In :AccountIds];
            if(!Conlist.isEmpty())
            {
                for(Contact ConNew : Conlist)
                {
                    ConNew.DonotContact__c = true;
                }
                update Conlist;
            }

            list<opportunity> Opplist = [Select Name,Id,AccountId from Opportunity where AccountId In :AccountIds];           
            if(!Opplist.isEmpty())
            {
                delete Opplist;
            }
            
        }
    }*/

public static void updatedRelatedOppPhone(list<Account> Acc,map<Id,Account> oldmap)
{
    if(!Acc.isEmpty())
    {
        map<id,Account> maplist = new map<id,Account>();
        for(Account Acc1 : Acc)
        {
            Account oldmap1 = oldmap.get(Acc1.Id);
           if(oldmap != null && Acc1.Phone != oldmap1.Phone)
           {
               maplist.put(Acc1.Id,Acc1);
           }
        }
        
        if(!maplist.isEmpty())
        {
            list<Contact> Con1 = [Select Name,Id,AccountId from Contact where AccountId In :Maplist.KeySet()];
            if(!Con1.isEmpty())
            {
                for(Contact Conlist : Con1)
                {
                    //
                }
            }
        }
    }
}

}