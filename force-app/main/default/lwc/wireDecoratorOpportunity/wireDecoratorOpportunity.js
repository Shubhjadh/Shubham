import { LightningElement,wire } from 'lwc';
import OpportunityInfo from '@salesforce/apex/OpportunityDetails.OpportunityInformation';
const columns = [
    { label: 'Opportunity Name', fieldName: 'Name' },
    { label: 'StageName', fieldName: 'StageName' },
    { label: 'Phone', fieldName: 'Phone__c', type: 'phone' }
    
];

export default class WireDecoratorOpportunity extends LightningElement 
{
    opportunities;
    error;
    columns=columns;
    @wire(OpportunityInfo) 
    OpportunityFunction({data,error})
    {
        if(data)
        {
            let OpportunityNew = {};   
            let OpportunityList = data.map(currItem =>
            {
                if(!currItem.hasOwnProperty('Phone__c'))
                {
                    OpportunityNew = {...currItem,Phone__c : '11111111111'};
                }
                else
                {
                    OpportunityNew = {...currItem};
                }
                return OpportunityNew;
            });
            console.log(OpportunityList);
            this.opportunities = [...OpportunityList];
            this.error = null;

        }
        else if(error)
        {
            this.error = error;
            this.opportunities = null;
        }
    }
}