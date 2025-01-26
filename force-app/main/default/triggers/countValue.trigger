trigger countValue on Account (After update) {
    
    List<Account> acList = new List<Account>();
    //List<Account> acList1 = [SELECT Id,name,Count_no__c FROM Account where Id IN :trigger.newMap.keySet()];


    for(Account acc:[SELECT Id,name,Count_no__c FROM Account where Id IN :trigger.newMap.keySet()]){
        Account oldAcc = Trigger.oldMap.get(acc.Id);
        if(oldAcc.name!=acc.name){
            acc.Count_no__c = acc.Count_no__c != Null ? acc.Count_no__c+1: 1;
            acList.add(acc);
        }
    }
    
    update acList;
    

}