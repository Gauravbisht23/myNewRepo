public class wrappp {
    Public List<wrapcon> wrap{set;get;}
    Public List<Account> Acc{set;get;}
    
    public wrappp(){
        Acc=new List<Account>();
        Acc=[SELECT id ,name from Account limit 10 ];
       
        
        wrap= new List<wrapcon>();
        system.debug(Acc);
        for(account a: Acc){
           
           wrap.add(new wrapcon (a) );
          
                }
        
        system.debug('wrap'+wrap);
        
    }
 
    
    
         
         public class wrapcon{
        public account ac{set;get;}
        public contact con{set;get;}
        public boolean selected{set;get;}
        
        public wrapcon(account a){
            ac=a;
            selected= false;
            
        }
          public wrapcon(contact c){
            con=c;
            selected= false;
            
        }
    }
    
    public void go(){
        List<account> s= new List<account>();
        
            for(wrapcon w:wrap){
                if(w.selected==true){
                    s.add(w.ac);
                
            }
        }
        set<id> sss= new set<id>();
        for(Account a:s){
        sss.add(a.id);}
        
        List<Contact> cn= [Select id , accountid , name from contact where account.id  =: sss Limit 20];
        
        for(contact c:cn){
             wrap.add(new wrapcon (c) );
        }
      
    }
}