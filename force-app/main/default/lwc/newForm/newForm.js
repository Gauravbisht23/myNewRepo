import { LightningElement } from 'lwc';
import saveFormData from '@salesforce/apex/FormController.saveFormData';
export default class NewForm extends LightningElement {
    handleSubmit() {
        // Retrieve all input fields
        const inputs = this.template.querySelectorAll('lightning-input');
        const formData = {};

        // Extract name and value from each input
        inputs.forEach(input => {
            formData[input.name] = input.value;
        });

        // Call Apex method to save data
        saveFormData({ data: formData })
            .then(() => {
                console.log('Data submitted successfully');
                this.resetForm(); // Optional: reset the form after successful submission
            })
            .catch(error => {
                console.error('Error submitting data:', error);
            });
    }

    resetForm() {
        this.template.querySelectorAll('lightning-input').forEach(input => {
            input.value = '';
        });
    }
}