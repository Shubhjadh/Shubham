import { LightningElement ,api,wire} from 'lwc';
import Account_Name from '@salesforce/schema/Account.Name';
import Account_Rating from '@salesforce/schema/Account.Rating';
import Account_Phone from '@salesforce/schema/Account.Phone';
import Account_Website from '@salesforce/schema/Account.Website';
import { getFieldValue, getRecord } from 'lightning/uiRecordApi';

export default class IdsgetRecordDrmo extends LightningElement
{
    AccountName;
    AccountPhone;
    AccountRating;
    AccountWebsite;
    @api recordId;
    @wire(getRecord,{
        recordId : '$recordId',
        fields : [Account_Name,Account_Rating,Account_Phone,Account_Website]
    })
    AccountFunction({data,error})
    {
        if(data)
        {
            console.log('Data is ',data);
            this.AccountName = data.fields.Name.value;
            this.AccountPhone = data.fields.Phone.value;
            this.AccountRating = data.fields.Rating.value;
            this.AccountWebsite = getFieldValue(data,Account_Website);
            console.log('AccountName',AccountName);
            console.log('AccountPhone',AccountPhone);

        }
        else if('Error is',error);
        {
            console.log('Error is',error);
        }
    }
}