trigger Conadd on Account (before insert,before Update) {
    
    List<id> acc= New List <id>();
    
    for (account a: trigger.new){
        acc.add(a.id);
    }
    
  list<contact> con= [SELECT Name , id , MailingAddress From contact where Accountid in: acc ];
    
    for(Contact c: con){
        for(Account ac:trigger.new){
            if(c.Accountid ==ac.id){
                c.MailingStreet = ac.BillingStreet;
                c.MailingCity = ac.BillingCity;
                c.MailingState = ac.BillingState;
                c.MailingPostalCode = ac.BillingPostalCode;
                c.MailingCountry = ac.BillingCountry;
                
            }
        }
    }

}