import { LightningElement } from 'lwc';

export default class AdvanceCalculator extends LightningElement 
{
    numberone;
    numbertwo;
    result = 0;

    changeHandler()
    {
        //retrieving name & Value
        let name = event.target.name;
        let value = event.target.value;

        //or
        //let {name,value} = event.target;

        if(name === 'number1')
        {
            this.numberone = value;
        }
        else if(name === 'number2')
        {
            this.numbertwo = value;
        }

        //commonmethod for (+,-,*,%)
        calculateResult(event)
        {
            let labelelement = event.target.label;
            if(labelelement === 'Add')
            {
                this.result = parseInt(this.numberone) + parseInt(this.numbertwo);
            }
            else if(labelelement === 'Sub')
            {
                this.result = parseInt(this.numberone) - parseInt(this.numbertwo);
            }
            else if(labelelement === 'Mul')
            {
                this.result = parseInt(this.numberone) * parseInt(this.numbertwo);
            }
            else if(labelelement === 'Mul')
            {
                this.result = parseInt(this.numberone) % parseInt(this.numbertwo);
            }
            


        }
    }
}