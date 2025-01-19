import { LightningElement , wire} from 'lwc';
import SearchObj from '@salesforce/apex/customLookuoController.searchRecord';


export default class CustomLookup extends LightningElement 
{
    apiName = 'Account';
    Search1 = 'A';
    @wire (SearchObj, {
        ObjectName : '$apiName',
        SearchText : '$Search1'
    })
    outputFunction ({error,data})
    {
        if(data)
        {
            console.log('Data is',data);
        }
        else if(error)
        {
            console.log('Error',error);
        }
    }
}