trigger AccountTrigger on Account(After update) 
{
    if(trigger.isAfter && trigger.isupdate)
    {
        AccountTriggerHandler.DeleteRelatedOppAndUpdateContact(trigger.new,trigger.oldmap);
    }
}