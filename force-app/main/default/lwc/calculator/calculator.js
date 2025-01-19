import { LightningElement } from 'lwc';

export default class Calculator extends LightningElement 
{
    numberone;
    numbertwo;
    result = 0;
    
    //when we refer any property in method so that time we used .this operator
    changeHandlerNumber1(event) 
    {
        this.numberone = event.target.value;
        console.log('this.numberone',this.numberone);
    }
    changeHandlerNumber2(event)
    {
        this.numbertwo = event.target.value;
    }

    // cretaing 4 method for store 4 differnt handler
    //all method using commomn attribute --event
    addHandler(event)
    {
       this.result = parseInt(this.numberone) + parseInt(this.numbertwo);
    }
    subHandler(event) 
    {
        this.result = parseInt(this.numberone) - parseInt(this.numbertwo);
    }
    mulHandler(event)
    {
        this.result = parseInt(this.numberone) * parseInt(this.numbertwo);
    }
    divHandler(event)
    {
        this.result = parseInt(this.numberone) % parseInt(this.numbertwo);
    }

    
    resetInput() 
    {
        this.numberone = ''; 
        this.numbertwo = ''; 
    }

    
}