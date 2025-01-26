trigger Opppppp on Opportunity (after insert) {
    


 if(trigger.isinsert){

    if(trigger.isBefore)
    OpportunityTriggerHandler.beforInsertBill(trigger.new);

    List<Account> ac=[Select id, phone from Account];
    List<Account> acc= new List<Account>();
    for(opportunity u: trigger.new){
        for(Account a: ac){
            if(u.accountid==a.id){
               a.phone=u.phone__c; 
                acc.add(a);
            }
        }
    }
    update acc;
    
    
    
map<id,List<opportunity>> op=new map<id,List<opportunity>>();
    
        
    for(Account acon: [SELECT id,  ( SELECT Accountid FROM opportunities  )FROM Account]){
      op.put(acon.Id, acon.opportunities);  
    }
    
    List<Account> accha= [SELECT id ,phone FROM Account];
     List<opportunity> oppp=new List<opportunity>();
    for(Account a1:accha){
        for(opportunity pp: op.get(a1.id) ){
            if(a1.id==pp.accountid){
             //   if(a1.phone!=null){
                pp.phone__c=a1.phone;
              //      }
                oppp.add(pp);
            } 
        }
    }
    update oppp;
}

}