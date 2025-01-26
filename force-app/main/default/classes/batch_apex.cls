global class batch_apex implements Database.Batchable<Sobject> {
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
           String query='SELECT id, Name , phone  from Account';
        return Database.getQueryLocator (query);

    }
    
    global void execute(Database.BatchableContext BC, List<Account> scope)
    {
        List<Account > opp= new List<Account>();
        
        
        for (Account o: scope){
            o.phone='2576146';
            opp.add(o);
             system.debug(o.Name);
        }
        system.debug(opp);
        update opp;
        


    }
    
   

      global void finish(Database.BatchableContext BC){
        
                
    }

}