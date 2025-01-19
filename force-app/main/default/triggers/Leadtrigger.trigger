trigger Leadtrigger on Lead (After Update) 
{
    if(trigger.isAfter && trigger.isUpdate)
    {
        LeadTriggerHandler.AfterUpdate(trigger.new);
    }
}