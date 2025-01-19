import { LightningElement ,api} from 'lwc';

export default class LdsDynamicRecordAndObject extends LightningElement
{
    @api recordId;
    @api objectApiName;
}