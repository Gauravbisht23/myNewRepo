// JS File - dynamicForm.js
import { LightningElement, track } from 'lwc';
 
export default class DynamicForm extends LightningElement {
    @track selectedFormType = '';
    @track showNameField = false;
    @track showEmailField = false;
    // Add similar tracking variables for other fields
 
    formTypeOptions = [
        { label: 'Select Form Type', value: '' },
        { label: 'Name', value: 'name' },
        { label: 'Email', value: 'email' },
        // Add options for other fields
    ];
 
    handleFormTypeChange(event) {
        this.selectedFormType = event.detail.value;
        this.showNameField = this.selectedFormType === 'name';
        this.showEmailField = this.selectedFormType === 'email';
        // Update similar variables for other fields
    }
}