import { LightningElement ,wire} from 'lwc';
import ContactInfo from '@salesforce/apex/ContactController.ContactInformation';
const columns = [
    { label: 'Contact FirstName', fieldName: 'FirstName' },
    { label: 'Contact LastName', fieldName: 'LastName'},
    { label: 'ContactPhone', fieldName: 'Phone'},
    { label: 'Account Name', fieldName: 'Account.Name'}
    
];

export default class WireDecoratorContact extends LightningElement
{
    columns = columns;
    @wire(ContactInfo) contacts;
    

}