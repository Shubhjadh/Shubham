import { LightningElement } from 'lwc';

export default class Childhook extends LightningElement 
{

    displaychild = false;
    constructor()
    {
        super();
        console.log('constructor from child');
    }

    connectedCallback()
    {
        console.log('connectedCallback from child');
    }

    renderedCallback()
    {
        console.log('renderedCallback from child');
    }

    errorCallback(error,stack)
    {
        console.log('errorCallback from child');
    }

    disconnectedCallback()
    {
        console.log('disconnectedCallback from child');
    }

    
}