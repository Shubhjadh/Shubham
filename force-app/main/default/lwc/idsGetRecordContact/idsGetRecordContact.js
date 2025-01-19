import { LightningElement ,api,wire} from 'lwc';
import Contact_Name from '@salesforce/schema/Contact.Name';
import Contact_Phone from '@salesforce/schema/Contact.Phone';

import { getFieldValue, getRecord } from 'lightning/uiRecordApi';

export default class IdsGetRecordContact extends LightningElement 
{
    contactname;
    contactphone;
    @api recordId;
    @wire(getRecord,
        {recordId : '$recordId',
            fields : [Contact_Name,Contact_Phone]
        }
    )
    ContactFunction({data,error})
    {
        if(data)
        {
            console.log('data is',data);
            //this.contactname = data.fields.Name.value;
            //this.contactphone = data.fields.Phone.value; 

            this.contactname = getFieldValue(data,Contact_Name);
            this.contactname = getFieldValue(data,Contact_Phone);

        }
        else if(error)
        {
            console.log('error is',error);
        }
    }
}