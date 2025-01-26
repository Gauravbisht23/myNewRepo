trigger DupTrigger on Account (before insert) {
    
    Set<Account> AcList=  new Set<Account>();
    
    for(Account Ac: Trigger.new){
      Aclist.add(Ac);
    }
    
   Set<String> NameList= new Set<String>();
    
   For(Account a: Aclist){
       NameList.add(a.Name);
    }
    
    List<Account> total= [SELECT id , Name from Account where name in :NameList];
  
    for(Account ac1:total){
        for(Account ac2: Aclist){
            if(ac1.name==ac2.name){
                ac2.adderror('Not Possible');
            }
        }
    }

}