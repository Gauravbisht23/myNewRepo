public with Sharing class LgAccount {

    @AuraEnabled
    public static List<Account> AccRec(){
        return [SELECT Id, name, industry, Type, NumberOfEmployees, TickerSymbol, Phone FROM Account ORDER BY createdDate ASC Limit 10];
    }
}