import { LightningElement } from 'lwc';

export default class ColorToggleQuery extends LightningElement {
    // Method to handle 'Add' button click - Change text color to red
    handleAdd() {
        const textElement = this.template.querySelector('.text');
        textElement.style.color = 'red';
    }

    // Method to handle 'Remove' button click - Change text color to pink (default)
    handleRemove() {
        const textElement = this.template.querySelector('.text');
        textElement.style.color = 'pink';
    }

    // Method to handle 'Toggle' button click - Change text color to white
    handleToggle() {
        const textElement = this.template.querySelector('.text');
        textElement.style.color = 'white';
    }
}