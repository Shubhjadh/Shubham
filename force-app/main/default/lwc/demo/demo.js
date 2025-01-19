import { LightningElement ,track} from 'lwc';

export default class Demo extends LightningElement {
    greeting = "Hello";
    @track Abc = "welcome";

    Pakistan = "Aatankwadi";
    @track India = "Lovely";

    handleClick(event) 
    {
        this.greeting = "Hello!! Shubham";
        this.Abc = "Hello!! Pooja";
    }
    
    clickMe1(event)
    {
        this.Pakistan = "Bomb";
        this.India = "Sweet";
    }

}