import { LightningElement,wire } from 'lwc';
import Account_Obj from '@salesforce/schema/Account';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';

export default class LdsGetObjectInfo extends LightningElement 
{
    accountInfo;
    error;
    @wire(getObjectInfo,{objectApiName : Account_Obj})
    accountfunction({data,error})
    {
        if(data)
        {
            console.log('Account data is ---',data);
            this.accountInfo = data;
            this.error = null;
        }
        else if(error)
        {
            console.log('Error is ---',error);
            this.accountInfo = null;
            this.error = error;
        }
    }
}