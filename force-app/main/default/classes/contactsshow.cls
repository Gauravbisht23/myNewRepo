public class contactsshow {

   

public id adj{set; get;}
    public List<Contact> co{set; get;}
    map<id,List<Contact>> con= new map<id,List<Contact>>();
    public contactsshow(ApexPages.StandardController controller) {
  
    

    }
    public void go(){
        
        List<Account> ac=[SELECT id, (SELECT id , Name , phone FROM CONTACTS) FROM ACCOUNT];
   for(Account a:ac){
        
    con.put(a.id,a.Contacts);
    }
            co=con.get(adj);
        System.debug('kuch' + adj);
           // co=[SELECT id , Name , phone , Accountid FROM contact where accountid=:adj];
        
    }
  
}