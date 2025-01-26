public with sharing class FormController {
    @AuraEnabled
    public static void saveFormData(Map<String, String> data) {
        // Example: Map the form data to a Salesforce object (e.g., Contact)
        Contact newContact = new Contact(
            FirstName = data.get('firstName'),
            LastName = data.get('lastName'),
            Email = data.get('email')
            //Age__c = Integer.valueOf(data.get('age')) // Assuming 'Age__c' is a custom field
        );

        insert newContact;
    }
}