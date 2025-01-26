public class WrapperAccount {
    
    public List<WrapperAcc> wrapp{set;get;}
    public List<Account> selectacc{set;get;}
    public WrapperAccount(){
       List <Account> a= [Select id , Name ,phone from Account limit 10];
        wrapp = new List<WrapperAcc>();
        for(account aa:a){
           wrapp.add(new WrapperAcc(aa) );
        }
        
    }    
    public void go(){
     selectacc= new List<Account>();
        for(WrapperAcc w:wrapp){
            if(w.check==true){
            selectacc.add(w.Ac);   
            }
        }
        
    }
    
    

    public class WrapperAcc	{
     public   Account Ac{Set;get;}
        public Boolean check{set;get;}
        
        public WrapperAcc(Account c){
            
            Ac=c;
           check=false; 
        }
        
    }
}