import { LightningElement } from 'lwc';

export default class RenderListDemo extends LightningElement
{
    superstars = ["Spiderman","Superman","Batman","Hulk"];

    Friends = ["Shubham","Pooja","Prasad","Harshal"];

    mylist = [ 
        {
            id : 1,
            firstName : 'Shubham',
            lastName : 'JAdhav'
        },
        {
            id : 2,
            firstName : 'Pooja',
            lastName : 'JAdhav'
        }
    ]



}