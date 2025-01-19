public class OpportunityTriggerHandler
{
    //When Opportunity StagenMA eis updated then check task if task is there 
    //then update task description else create task
	public static void insertOrUpdateTask(list<Opportunity> Opp,map<Id,Opportunity> oldmap)
    {
        set<Id> SetId = new Set<Id>();
        map<Id,Task> Maplist = new map<Id,Task>();
        list<Task> UpdateTask = new list<Task>();
        list<Task> InsertTask = new list<Task>();
        
        if(!Opp.isEmpty())
        {
            for(Opportunity Opplist : Opp)
            {
                if(oldmap != null && Opplist.StageName != oldmap.get(Opplist.Id).StageName)
                {
                    SetId.add(Opplist.Id);
                }
            }
        }
        
        list<Task> Task1 = [SELECT Id, WhatId, Subject, Description, Status FROM Task where WhatId IN :SetId];
        if(!Task1.isEmpty())
        {
            for(Task Tasks : Task1)
            {
                Maplist.put(Tasks.whatId,Tasks);
            }
        }
        
        if(!Opp.isEmpty())
        {
            for(Opportunity Opp1 : Opp)
            {
            	    
                if(Maplist.ContainsKey(Opp1.Id))
                {
                    Task T1;
                    T1.WhatId = Opp1.id; //T1 =  Maplist.get(Opp1.id); 
                    T1.Description = 'Hello user!! Task is updated';
                    UpdateTask.add(T1);
                }
                else
                {
                    Task Task2 = new Task();
                    Task2.WhatId = Opp1.Id;
                    Task2.Subject = 'Follow up task on 7th Jan';
                    Task2.Description = 'Hello user!! Task is created';
                    InsertTask.add(Task2);
                }
            }
        }
        
        update UpdateTask;
        insert InsertTask;
    }
}