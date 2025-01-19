trigger OpportunityLineItemTrigger on OpportunityLineItem (After insert,After delete) 
{
	/*if(trigger.isAfter && (Trigger.isInsert || trigger.isDelete ))
    {
        OpportunityLineItemTriggerHander.Method75(trigger.new);
        
    }*/
    
    if(trigger.isAfter && trigger.isInsert)
    {
        OpportunityLineItemTriggerHander.CreateAssetRecord(trigger.new);
    }
}