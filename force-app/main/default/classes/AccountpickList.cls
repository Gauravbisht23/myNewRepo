public class AccountpickList {
    public string acname{set;get;} 
  public Account accts{set; get;}
  public boolean report{set; get;}
  public List<Account> repoAcc{set; get;}

    public AccountpickList(ApexPages.StandardController stdcontroller) {
report= false;
this.accts=  (Account)stdcontroller.getRecord();
    }
    public List<Selectoption> getindustry(){
     List<Selectoption> acc = new list<Selectoption>();
        acc.add(new selectoption('','--Select--'));
        for(Account a:[Select id,Name from Account]){
            acc.add(new selectoption(a.id,a.Name));
        }
        return acc;
     
    }
    
    public pageReference go(){
        report= true;
        repoAcc= [Select Name ,Phone, industry from Account where Name=:acName];
        return null;
    }
}