import { LightningElement, wire } from 'lwc';
import AccountInfo from '@salesforce/apex/AccountDeatails.AccountInfo'; 
const columns = [
    { label: 'Account Name', fieldName: 'Name'},
    { label: 'Account Industry', fieldName: 'website'},
    { label: 'Account Phone', fieldName: 'phone'},
    { label: 'Account Rating', fieldName: 'Rating'}  
];

export default class WireDecoratorProperty extends LightningElement 
{
    columns = columns;
    @wire(AccountInfo) accounts;

}