import { LightningElement } from 'lwc';

export default class ParentComponent extends LightningElement 
{
//@api - 
//1.public decorator-when you have to send data parent to child go with public property.
//2.parent component pass deta & child component responsible accept & display data.
//3. reactive
//4. @api Shubham: --- annotate shubham with @api(Decorator) --in child
    greeting = "Shubham Jadhav"; //property
    userdetails = {
        FName : 'Shubham',
        LName : 'Jadhav',
        Email : 'shubhamcjadhav8889@gmail.com'
    };
}