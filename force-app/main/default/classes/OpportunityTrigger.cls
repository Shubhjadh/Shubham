public class OpportunityTrigger 
{
    //If Opportunity Stage is updated Then Crete task on Opportunity
    public static void CreateTask(list<opportunity> Opp)
    {
        list<Task> Task1 = new list<Task>();
        for(Opportunity Opp1 : Opp)
        {
            if(Opp1.StageName == 'Prospecting')
            {
                Task T1 = new Task();
                T1.Subject = 'Task is created when Opportunity Stage is update to Prospecting';
                T1.Priority = 'Low';
                T1.WhatId = Opp1.Id;
                T1.OwnerId =  Opp1.OwnerId;
                Task1.add(T1);

            }
        }

        if(!Task1.isEmpty())
        {
            insert Task1;
        }

    }

   
public static void Method12(list<Opportunity> Opp,map<Id,Opportunity> oldmap)
{
    list<task> Task1 = new list<task>();
    for(Opportunity Opp1 : Opp)
    {
        if(Opp1.StageName != oldmap.get(Opp1.Id).StageName)
        {

            //if StageName = 	'Id. Decision Makers' & OldStage = 'Perception Analysis' or StageName = 	'Id. Decision Makers' & OldStage = 'Perception Analysis'
            //https://www.youtube.com/watch?v=rQ6JvCvCr1w&list=PLEKSN4V4WEnLERCMYfvLAfg6cYTSI4hc0&index=29
            // After update
            if((Opp1.StageName == '	Id. Decision Makers' && oldmap.get(Opp1.Id).StageName == 'Perception Analysis') ||
            (Opp1.StageName == 'Prospecting' && oldmap.get(Opp1.Id).StageName == 'Perception Analysis'))
            {
                Task TaskNew = new Task();
                TaskNew.Subject = 'Follow up on Opportunity Stage Change';
                TaskNew.Description = 'The Opportunity stage has been updated to: ' + Opp1.StageName;
                TaskNew.Status = 'Not Started';
                TaskNew.Priority = 'Normal';
                TaskNew.WhatId = Opp1.Id;
                TaskNew.OwnerId = Opp1.OwnerId;
                TaskNew.ActivityDate = Date.today().addDays(1);
                Task1.add(TaskNew);
            }
        }
        
        if(Task1.isEmpty())
        {
            insert Task1;
        }
    }
}

//check highest salary in Opportunity & then show highest salary opportunity Name on related Account  
/*public static void updateOnAccount(list<Opportunity> Opp,map<Id,Opportunity> oldmap)
{
    set<Id> parentId = new Set<Id>();
    list<Account> AccNew = new list<Account>();
    if(!opp.isEmpty())
    {
        for(Opportunity Opp1 : Opp)
        {
            if(oldmap != null)
            {
                if(oldmap.get(Opp1.Id).AccountId != Opp1.AccountId)
                {
                    ParentId.add(oldmap.get(Opp1.Id).AccountId);
                    ParentId.add(Opp1.AccountId);
                }
                else
                {
                    ParentId.add(Opp1.AccountId);
                }
            }
            else
            {
                ParentId.add(Opp1.AccountId);
            }
        }
    }
    
    list<Account> Acclist = [select Id,Name,Description,(Select Name,Salary__c from opportunities where Salary__c != null order by Salary__c Desc) 
                             from Account where Id In :ParentId];
    for(Account Acc1 : Acclist)
    {
        if(Acc1.opportunities.isEmpty())
        {
            Acc1.Description = Acc1.opportunities[0].Name;
             AccNew.add(Acc1);
        }
        else
        {
            Acc1.Description = '';
             AccNew.add(Acc1);
        }
    }
    
    update AccNew;
} */  
}