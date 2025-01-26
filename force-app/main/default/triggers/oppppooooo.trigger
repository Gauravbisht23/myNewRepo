trigger oppppooooo on Opportunity (after insert, after update,after delete,before update){
 //map<id,List<opportunity>> op=new map<id,List<opportunity>>();
    if(trigger.isdelete||(trigger.isupdate &&trigger.isafter) ){
        map<id,integer> op=new map<id,integer>();
    for(Account ac: [SELECT id,  ( SELECT Accountid FROM opportunities  )FROM Account]){
      op.put(ac.Id, ac.opportunities.size());  
    }
    List<Account> a=[SELECT id,  ( SELECT Accountid FROM opportunities  )FROM Account];
     List<Account> accc =new  List<Account>();
    for(opportunity o : trigger.old){
        for(Account acc: a){
            if(acc.id==o.accountid){
                acc.No_of_Childs__c=op.get(o.accountid);
                accc.add(acc);
            }
            
        }
    }
    update accc;
    }
    else{
    map<id,integer> op=new map<id,integer>();
    for(Account ac: [SELECT id,  ( SELECT Accountid FROM opportunities  )FROM Account]){
      op.put(ac.Id, ac.opportunities.size());  
    }
    List<Account> a=[SELECT id,  ( SELECT Accountid FROM opportunities  )FROM Account];
     List<Account> accc =new  List<Account>();
    for(opportunity o : trigger.new){
        for(Account acc: a){
            if(acc.id==o.accountid){
                acc.No_of_Childs__c=op.get(o.accountid);
                accc.add(acc);
            }
            
        }
    }
    update accc;
}}