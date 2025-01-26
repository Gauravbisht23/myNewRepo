trigger recordupdate on Account (After insert) {
    
   lIST<Account> aLIST = [SELECT id , Name ,AccountNumber from Account ];
    
    List<Account> newlist= new List<Account>();
    
    for(Account ac: trigger.new){
        for( Account acc:alist ){
            if(Ac.Name==Acc.name){
                acc.id=ac.id;
                newlist.add(acc);
                
            }
        }
    }
    
    update newlist;

}