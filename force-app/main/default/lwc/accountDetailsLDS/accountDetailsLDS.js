import { LightningElement, api, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

const FIELDS= ['Account.Name', 'Account.Phone', 'Account.Website'];

export default class AccountDetailsLDS extends LightningElement {
    @api recordId;
    account;

    @wire(getRecord, {recordId: '$recordId', fields: FIELDS})
    wiredAccount({data,error}){
        if(data){
this.account=data.fields;
        }
        else if(error){
            console.error('Error fetching account details:', error);
        }
    }
}

