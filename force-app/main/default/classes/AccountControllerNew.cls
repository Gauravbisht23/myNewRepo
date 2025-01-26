public with sharing class AccountControllerNew {
    public AccountControllerNew() {

    }
    @AuraEnabled
    public static account getAccountDetails(id accountId){
return [SELECT Name, Phone, Website FROM Account WHERE id =:accountId];
    }
}
