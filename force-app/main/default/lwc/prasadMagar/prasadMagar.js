import { LightningElement } from 'lwc';

export default class PrasadMagar extends LightningElement
{
    constructor()
    {
        super();
        console.log('Hello Prasad');
    }

    connectedCallback() 
    {
        console.log('childconnectedcallback-call back value is',this.callbackvalue);
    }

    renderedCallback()
    {
        console.log('Render call on child');
    }
}