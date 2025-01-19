import { LightningElement ,api,wire} from 'lwc';
import Account_NAme from '@salesforce/schema/Account.Name';
import Contact_Name from '@salesforce/schema/Contact.Name';
import { getFieldValue, getRecords } from 'lightning/uiRecordApi';

export default class LdsGetRecordsOpp extends LightningElement
{
    output;
    error;
   @wire(getRecords,{
    records : [
        {recordIds : ["001dL00000YgvhWQAR"],
            fields : [Account_NAme]
        },
        {recordIds : ["003dL000009bSONQA2"],
            fields : [Contact_Name]
        }
    ]
   })
   InfoFunction({data,error})
   {
        if(data)
        {
            console.log('Data is Below :',data);
            this.output = data;
            this.error = null;
        }
        else if(error)
        {
            console.log('Error is',error);
            this.error = error;
            this.output = null;

        }
   }
}