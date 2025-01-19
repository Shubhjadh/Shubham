import { LightningElement } from 'lwc';

export default class ShubhamJadhav extends LightningElement
 {
    callbackvalue = true;

    constructor()
    {
        super();
        console.log('Hello Shubham');
        console.log('Constructor-call back value is',this.callbackvalue);
        this.callbackvalue = false;
    }

    connectedCallback() 
    {
        console.log('connectedcallback-call back value is',this.callbackvalue);
    }

    renderedCallback()
    {
        console.log('Render call on parent');
    }
 }