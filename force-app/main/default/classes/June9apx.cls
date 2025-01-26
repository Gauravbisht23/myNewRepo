public class June9apx {
    public list<Contact> rec{set;get;}
    public string idof{set;get;}
    public contact acct;
    public boolean abc{get;set;}
    public June9apx(ApexPages.StandardController controller) {
        abc= false;
	this.acct = (contact)controller.getRecord();
	
    }
    public void actionspt()
    {
        abc = true;
        system.debug('id==='+acct.AccountID);
        rec = new list<contact>();
        rec = [select name, phone from Contact where Accountid =:acct.AccountID];
    }


}