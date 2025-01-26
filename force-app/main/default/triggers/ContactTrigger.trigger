trigger ContactTrigger on contact (before insert, before update) {
/*if(trigger.isbefore){

    set<id> uniqid=new set<id>();
    for (contact con: [Select id,name, gauravbisht__IsPrimary__c, account.id from contact]){
        if(con.gauravbisht__IsPrimary__c==true){
        uniqid.add(con.account.id);

    }
}
    for(contact newCon:trigger.new){
    if(newCon.gauravbisht__IsPrimary__c==true){
        if(uniqid.contains(newCon.account.id)){
            newCon.addError(' con not primary ');
        }
    }
    }



}*/
if(trigger.isbefore){
set<id> accountIdSet = new set<id>();
map<id,Contact> accountIdContactMap = new map<id,Contact>();
for(Contact contactObj:trigger.new){

    if(contactObj.gauravbisht__IsPrimary__c==true && contactObj.AccountID!=null){
    
    accountIdSet.add(contactObj.AccountID);
    
    }
    
    }
    
    if(accountIdSet!=null && accountIdSet.size()>0){
    
    //Preparation of map accountIdContactMap for existing primary contact
    
    for(Contact contobj: [select id, gauravbisht__IsPrimary__c, AccountId from Contact
    
    where AccountId in: accountIdSet and gauravbisht__IsPrimary__c=true]){
    
    accountIdContactMap.put(contobj.AccountId, contobj);
    
    }
    
    //validation starts
    
    for(Contact contactObj:trigger.new){
    
    if(contactObj.gauravbisht__IsPrimary__c==true && contactObj.AccountID!=null
    
    && accountIdContactMap.get(contactObj.AccountId)!=null){
    
    contactObj.addError('You can\'t create more than one primary contact.');
    
    }
    
}
    }
    
}

}