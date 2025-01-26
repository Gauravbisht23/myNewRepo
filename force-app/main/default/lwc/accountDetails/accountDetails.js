import { LightningElement,api, wire } from 'lwc';
import getAccountDetails from '@salesforce/apex/AccountControllerNew.getAccountDetails'

export default class AccountDetails extends LightningElement {
    @api recordId;
    account;

    connectedCallback(){
        this.fetchAccountDetails();
    }

    fetchAccountDetails(){
        getAccountDetails({accountId: this.recordId})
        .then((data) => {
            this.account= data;
            console.log('data',data);
        } )
        .catch((error) => {
            console.error('Error fetching account details:',error);
        });

       
    }


}

