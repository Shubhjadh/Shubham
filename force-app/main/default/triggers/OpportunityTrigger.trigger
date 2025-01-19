trigger OpportunityTrigger on Opportunity (After update)
{
    if(trigger.isAfter && trigger.isUpdate)
    {
        OpportunityTriggerHandler.insertOrUpdateTask(trigger.new,trigger.oldmap);
    }
}