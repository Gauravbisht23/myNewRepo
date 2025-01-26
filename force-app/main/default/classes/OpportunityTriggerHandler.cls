public with sharing class OpportunityTriggerHandler {
    public static void beforeInsert(List <Opportunity> oppList) {
        For (opportunity opp: oppList ) {
            if(opp.Amount==null || opp.Amount <50000){
                opp.StageName='Prospecting';
            }else if (opp.Amount >= 50000 && opp.Amount < 250000){
                opp.StageName='Negotiation/Review';
            } else if (opp.Amount> 250000) {
                opp.StageName='Closed Won';
            }
        }
    }

    public static void beforInsertBill(List<opportunity> newOpportunityList){


       for(opportunity opp:newOpportunityList){
            if(opp.Account.BillingAddress==null){
                opp.addError('Please update the Billing Address in the Related Account Record');
            
            }
        }
       /* Set<Id> accountIds = new Set<Id>();

for (Opportunity opp: newOpportunityList) {

if (opp.AccountId != null) {

    accountIds.add(opp.AccountId);

}
    }
    // Query the Accounts to check for Billing Address information

Map<Id, Account> accountMap= new Map<Id, Account>(

[SELECT Id, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry

FROM Account WHERE Id IN :accountIds]);
//Loop through Opportunities to validate the associated Account's Billing Address

for (Opportunity opp: newOpportunityList) {

if (opp.AccountId != null && accountMap.containsKey(opp.AccountId)) {

Account acc= accountMap.get(opp.AccountId);

if (String.isBlank(acc.BillingStreet) && String.isBlank(acc.BillingCity) && String.isBlank(acc.BillingState) && String.isBlank(acc.BillingPostalCode) && String.isBlank(acc.BillingCountry)) {

opp.addError('The associated Account must have a Billing Address before creating an Opportunity.');

}
}


    } */
}
}