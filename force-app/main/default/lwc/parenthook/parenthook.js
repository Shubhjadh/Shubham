import { LightningElement } from 'lwc';

export default class Parenthook extends LightningElement 
{
    displaychild = false;
    constructor()
    {
        super();
        console.log('constructor from parent');

    }

    connectedCallback()
    {
        console.log('connectedCallback from parent');
    }

    renderedCallback()
    {
        console.log('renderedCallback from parent');
    }

    errorCallback(error,stack)
    {
        console.log('errorCallback from parent');
    }

    disconnectedCallback()
    {
        console.log('disconnectedCallback from parent');
    }

    changeHandler(event)
    {
        this.displaychild = event.target.checked;
    }
}