import { LightningElement ,wire} from 'lwc';
import AccountInfo from '@salesforce/apex/ContactController.AccountInformation';
const columns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Website', fieldName: 'Website' },
    { label: 'Phone', fieldName: 'Phone', type: 'phone' },
    { label: 'Industry', fieldName: 'Industry'}
];


export default class WireDecorationWithFunction extends LightningElement
{
    accounts;
    error;
    columns=columns;
    @wire(AccountInfo) 
    AccountFunction({data,error})
    {
        if(data)
        {
            let AccountNew = {};
            console.log(data);
            let AccountsN = data.map(currItem => {
                if(!currItem.hasOwnProperty('Industry'))
                {
                    AccountNew = {...currItem,Industry : 'Chemicals'};
                }
                else
                {
                    AccountNew = {...currItem};
                }
                return AccountNew;
            });
            console.log(AccountsN);
            this.accounts = [...AccountsN];
            this.error = null;
        }
        else if(error)
        {
            console.log(error);
            
            thi;s.error = error;
            this.accounts = null;
        }
    }
    
}