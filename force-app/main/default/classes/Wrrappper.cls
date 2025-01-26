public class Wrrappper {
    public list<WrapperNew> accc{get;set;}
    
    public Wrrappper(){
        list<WrapperNew>  accc= new List<WrapperNew>();
        Contact an= [SELECT id, Name, Accountid from Contact where Account.id!=null];
        for(Account a: [select Id, Name,BillingState, Website, Phone from Account limit 10]) {

 List<Contact> child = [select Id, Name from Contact where AccountId = :a.Id];

 accc.add(new WrapperNew(a,child));
  }
        
    }
    
    
    
    public class WrapperNew{
        public Account acc {get; set;}
  public List<Contact> con {get; set;}
        
        
        public wrapperNew(Account a, List<Contact> c){
            a=acc;
             c= con;
        }
    }
        
        

}