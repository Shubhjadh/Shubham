trigger ContactTrigger on Contact (Before update,Before Insert) 
{
    if(trigger.isBefore)
    {
        if(trigger.isInsert && trigger.isUpdate)
        {
            //ContactTriggerHandler.Method12345(trigger.new);
        }
    }
}