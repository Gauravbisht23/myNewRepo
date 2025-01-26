public class AccForDemoWrapperApx 
{
 public Account acc;   
 public string typee;
 public List<wrapAccount> wrapAccountList {get; set;}
  public List<wrapAccount> Demofinal {get; set;}   
 //public List<Account> finallist{get;set;}
 public list<Account> selectedAcc{get;set;}   
 public string name{get; set;}
 public list <Account> accname{get; set;} 
 public list<Account> acTobeAdded =  new list <Account>();    
    public list<selectOption> b1;
    
 public AccForDemoWrapperApx(ApexPages.StandardSetController std)
 {
     Acc=(account)std.getRecord();
 }
    
    public list<SelectOption> getTypee()
    {
        b1=new list<SelectOption>();
        b1.add(new SelectOption('','--None--'));
        Account []t=[select name,type from account];
        for(Account t1:t)
        {
            b1.add(new SelectOption(t1.name,t1.name));
        }
        return b1;
    }
    public void go()
    {
       wrapAccountList = new list <wrapAccount>(); 
       accname = new list<Account>();
       accname=[select name,type from account where type= :acc.Type];  
       integer i=0; 
       for(account records : accname)
        {            
            wrapAccountList.add(new wrapAccount(records));
            //i++;            
        } 
    }
    
    public class wrapAccount
    {
        public list<account> accname{get;set;}
        public account acc {get; set;}
        public integer i{get; set;}
        public Boolean selected {get; set;}
        public string name{get;set;}
        public wrapAccount(account a) 
        {
            acc = a;
            selected = false;
            this.name=a.Name;
            //this.i=i;
        }
    }
    
    public void addToList()
    {
       // finallist= new list<Account>();
       selectedAcc= new list<Account>();
        demoFinal= new list<wrapAccount>();
        acTobeAdded=[select name,type from account where type= :acc.Type];
        for(wrapAccount wa : wrapAccountList)
        {
            if(wa.selected==true)
            {
                selectedAcc.add(wa.acc);
            }
        }
        for(Account a : selectedAcc)
        {
            demoFinal.add(new wrapAccount(a));
        }
    }
}