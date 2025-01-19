trigger CaseTrigger on Case (before insert,After insert,Before update,After update) 
{
    if(trigger.isBefore)
    {
        if(trigger.isUpdate)
        {
            CaseTriggerHandler.updateAccountCaseNumbers(trigger.new);
        }
    }
}