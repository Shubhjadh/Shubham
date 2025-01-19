import { LightningElement } from 'lwc';

export default class NameCobintion extends LightningElement 
{
    name1 = "";
    name2 = "";
    result = "";

    changeHandler1(event)
    {
        this.name1 = event.target.value;
    }

    changeHandler2(event)
    {
        this.name2 = event.target.value;
    }

    handleClick(event)
    {
        this.result = `${this.name1}  ${this.name2}`;
    }

    

}