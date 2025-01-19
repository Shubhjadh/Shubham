import { LightningElement ,wire,api} from 'lwc';
import AccountName from '@salesforce/schema/Account.Name';
import AccountPhone from '@salesforce/schema/Account.Phone';
import { getRecord } from 'lightning/uiRecordApi';


export default class Jan16Practice extends LightningElement
{
    @api recordid;
    @api objectApiName;
}