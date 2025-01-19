public class Practice 
{
   /*Create Opportunity on Account where createdDate is this month
   public static void Method1()
   {
       list<Account> Acc = [SELECT Id, CreatedDate, Name FROM Account where CreatedDate = THIS_MONTH];
       list<opportunity> Opp = new list<Opportunity>();
       for(Account Acc1 : Acc)
       {
           Opportunity Opp1 = new Opportunity();
           Opp1.Name = Acc1.Name;
            Opp1.CloseDate = system.today().addDays(30);
           opp1.stageName = 'Prospecting';
           Opp.add(Opp1);
               
       }
       
       insert Opp;
   }*/

   /*Update phone no. of those Account record createdDate is this month
   public static void Method2()
   {
    list<Account> Acc = [SELECT Id, Name,phone, CreatedDate FROM Account  where CreatedDate = THIS_MONTH];

    if(!Acc.isEmpty())
    {
        for(Account Acc1 : Acc)
        {
            Acc1.phone = '9689968889';
        }
    }

    if(Acc.size() > 0)
    {
        update Acc;
    }


   }*/

   /*update opportunity discription as per stagename('Value Proposition' OR StageName = 'Closed Won' AND Recordtype = Demo1 Record type' )
   Public static void Method3()
   {
    list<Opportunity> Opp = [Select Name,StageName,Description,CreatedDate,RecordType.Name from Opportunity 
                        where CreatedDate = THIS_WEEK AND (StageName = 'Value Proposition' OR StageName = 'Closed Won') 
                        AND RecordType.Name = 'Demo1 Record type'];

    if(!Opp.isEmpty())
    {
        for(Opportunity Opp1 : Opp)
        {
            if(Opp1.StageName == 'Value Proposition')
            {
                Opp1.Description = 'Opportunity Description updated to'+ Opp1.stageName;
            }
            else if(Opp1.StageName == 'Closed Won')
            {
                Opp1.Description = 'Opportunity Description updated to'+ Opp1.stageName;
            }
        }
    } 
    
    if(Opp.size()> 0)
    {
        update Opp;
    }
   }*/

   /*TOTAL NO. OF COUNT OF CONTACTS ON ACCOUNT(TOTAL_CONTCACT__C)
   public static void Method4()
   {

    /PARENT TO CHILD RELATIONSHIP
    list<Account> Acc = [Select Name,ID,createdDate,(Select Name from Contacts) 
                        from Account where createdDate = LAST_WEEK];
    
    
    for(Account Acc1 : Acc)
    {
        Acc1.Total_Contact__c =  Acc1.Contacts.size();
    }

    update Acc;
   }*/

   /*If conatact phone is blank then update Account phone as contact phone
   public static void Method6()
   {

   child - parent relationship
    list<Contact> Con = [Select NAme,Id,Phone,Account.Name,Account.phone 
                        from Contact where AccountId != null AND Phone = null];

    for(Contact Con1 : Con)
    {
        if(Con1.Phone == null)
        {
            Con1.Phone =  Con1.Account.Phone;
        }
    }

    update Con;
   }*/

   /*public static void Method7()
   {
    list<Account> Acc = [select Name,Total_salary__c ,(select Name,Salary__c from Employees__r where Account__c != null)
                        from Account];

    if(!Acc.isEmpty())
    {
        for(Account Acc1 : Acc)
        {
            Decimal TotalSal = 0;
            for(Employee__c Emp : Acc1.Employees__r)
            {
                TotalSal = TotalSal + Emp.Salary__c;
            }
            Acc1.Total_salary__c = TotalSal;
        }

    }

    update Acc;

    
    }*/

    /*Query on account where Account Rating os 'Hot' then related opportunity StageName = 'Value Proposition' AND
    Account Rating os 'Warm' then related opportunity StageName = 'Id. Decision Makers'
    public static void Method8()
    {
        list<Account> Acc = [Select Name,Id,Rating,
                            (Select Name,StageName,AccountId From opportunities where AccountId != null)
                            From Account where Rating IN ('Hot','Warm')];

        List<Opportunity> Opp = new list<opportunity>();


        if(!Acc.isEmpty())
        {
            for(Account Acc1 : Acc)
            {
                if(Acc1.Rating == 'Hot')
                {
                    for(Opportunity Opp1 : Acc1.opportunities)
                    {
                        Opp1.StageName = 'Value Proposition';
                        Opp.add(Opp1);
                    }
                }
                else if(Acc1.Rating == 'Warm')
                {
                    for(Opportunity Opp2 : Acc1.opportunities)
                    {
                        Opp2.StageName = 'Id. Decision Makers';
                        Opp.add(Opp2);
                    } 
                }
            }
        }

        update Opp;
    }*/

    /*if Contact Email != null then update all opportunity email = Contact Mail
    public static void Method9()
    {
        list<Contact> Con = [Select Name,Email,(Select Name,Email__c  from Opportunities 
        where Name = 'Pooja' OR AccountId != null) from Contact where Name = 'kdf'];
        list<opportunity> Opp = new list<opportunity>();

        for(Contact Con1 : Con)
        {
            if(Con1.Email != null)
            {
                for(Opportunity Opp1 : Con1.opportunities)
                {
                    Opp1.Email__c =  Con1.Email;
                    Opp.add(Opp1);
                }
            }
        }


        update Opp;
    }*/

/*Account parentId id is not null then craete Contact on Account
   public static void Method10()
   {
    list<Account> Acc = [Select Name,Website,parentId From Account where parentId != null];
    list<Contact> Con = new list<Contact>();

    if(!Acc.isEmpty())
    {
        for(Account Acc1 : Acc)
        {
            if(Acc1.parentId != null)
            {
                Contact Con1 = new Contact();
                Con1.FirstName = Acc1.Name;
                Con1.LAstName = 'venkata';
                Con1.AccountId = Acc1.Id;
                Con.add(Con1);
            }
        }

        insert Con;
    }
   }*/

   /* Create Class on Account where Related contact phone = Account phone & if contact are not there then create contact
   public static void method11()
   {
    list<Account> Acc = [SELECT Id, Name, Type, Phone, Industry,(SELECT Id, Name, Salary__c, Account__c, Position__c 
                        FROM Employees__r where Account__c != null),(Select Name,Phone from Contacts)
                        FROM Account Where industry IN ('Electronics','Consulting','Energy','Chemicals')];
    list<Contact> Con = new list<Contact>();

    if(!Acc.isEmpty())
    {
        for(Account Acc1 : Acc)
        {
            if(!Acc1.Contacts.isEmpty())
            {
                for(Contact Con1 : Acc1.Contacts)
                {
                    Con1.Phone = '9689214731';
                    Con.add(Con1);
                }
                
            }
            else if(Acc1.contacts.isEmpty())
            {
                for(Account Acc2 : Acc)
                {
                    Contact Con1 = new Contact();
                    Con1.FirstName = Acc2.Name;
                    Con1.LAstName = 'Jadhav';
                    Con1.AccountId =  Acc2.Id;
                    Con1.Phone = Acc2.Phone;
                    Con.add(Con1);
                }
            }
            
        }

        if(Acc.Size()>0)
        {
            upsert Con;
        }

    }
}  */

/*update total salary field on account s=using related employs total salary
public static void method12()
{
    list<Account> Acc = [Select Name,Total_salary__c,(Select Name,salary__c from Employees__r ) from Account where Name like 'Bhar%'];
    for(Account Acc1 : Acc)
    {
        Decimal totalSal = 0;
        for(Employee__c Emp : Acc1.Employees__r)
        {
            totalSal = totalSal+ Emp.salary__c;
        }
        
        Acc1.Total_salary__c = TotalSal;
        
    }

    update Acc;

    
}*/

/*update contact phone as account phone using 2 method:1 & 2
public static void method13()
{
                    using list
    list<Account> Acc = [Select Phone,(Select Phone from Contacts) from Account];
    list<Contact> ConList = new list<Contact>();
    1)for(Account Acc1 : Acc)
    {
        for(Contact Con1 : Acc1.Contacts)
        {
            Con1.phone = Acc1.Phone;
            Conlist.add(Con1);
        }
        update ConList;
    }

    2)if(!Acc.isEmpty())
    {
        for(Account Acc1 : Acc)
        {
            if(!Acc1.Contacts.isEmpty())
            {
                for(Contact Con1 : Acc1.Contacts)
                {
                    Contact Conlist = new Contact();
                    ConList.id = Con1.Id;
                    Conlist.Phone =  Acc1.Phone;
                    Con.add(ConList);
                }
}*/

public static void Method14()
{
    list<Account> Acc = new list<Account>();
    list<Contact> ConList = new list<Contact>();
    map<Id,Account> MapList = new map<Id,Account>();
    list<Contact> Con10 = new list<Contact>();
    for(Account Acc1 : Acc)
    {
        MapList.put(Acc1.Id,Acc1);
    }

    ConList = [Select FirstName,LastName,ID,AccountId from Contact where AccountID In :MapList.KeySet()];
    for(Contact Con1 : ConList)
    {
        if(MapList.ContainsKey(Con1.AccountID))
        {
            Contact ConName = new Contact();
            ConName.Id = Con1.Id;
            ConName.Phone = MapList.get(Con1.AccountId).Phone;
            Con10.add(ConName);
        }
    }

    Update Con10;
}

public static void Method15()
{
    list<Account> Acc = [Select Name,id,Phone from Account where CreatedDate = Last_Week];
    if(!Acc.isEmpty())
    {
        for(Account Acc1 : Acc)
        {
            Acc1.phone = '9689968889';
        }
    }
    update Acc;
}
}