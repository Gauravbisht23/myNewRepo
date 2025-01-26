public class Accountview {
    public list<Account> approvallist{set;get;}
    
    public Accountview(ApexPages.StandardController controller){
        approvallist= [SELECT id ,Name ,phone FROM Account];
    }
}